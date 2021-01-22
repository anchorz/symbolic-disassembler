                                      1         .module blocks
                                      2         .include 'platform.s'
                           000000     1 z9001                           =       0
                           000001     2 z1013                           =       1
                                      3 ;
                                      4 ; z1013 specific constants
                                      5 ;
                           00001F     6 CURSR_CHAR                      =       0x001F ; B Code-Zwischenspeicher fuer OUTCH
                           00002B     7 CURSR                           =       0x002B ; W aktuelle Cursorposition
                           00EC00     8 BWS                             =       0xec00
                                      9 
                           000000    10 OUTCH                           =       0x00
                           000001    11 INCH                            =       0x01
                           000002    12 PRST7                           =       0x02
                           000005    13 INLIN                           =       0x05
                                     14 
                           00000C    15 VK_CLS                          =       0x0c
                           00000D    16 VK_ENTER                        =       0x0d
                           000008    17 VK_LEFT                         =       0x08
                           000009    18 VK_RIGHT                        =       0x09
                           00000B    19 VK_UP                           =       0x0b
                           00000A    20 VK_DOWN                         =       0x0a
                                     21 ;
                                     22 ; platform specific constants
                                     23 ;
                           000000    24 FG_BLACK                        =       0x00
                           000020    25 FG_GREEN                        =       0x20
                           000060    26 FG_CYAN                         =       0x60
                           000000    27 BG_BLACK                        =       0x00
                           000002    28 BG_GREEN                        =       0x02
                           000003    29 BG_YELLOW                       =       0x03
                           000063    30 FRAME_COLOR                     =       FG_CYAN+BG_YELLOW
                           000002    31 STONE_COLOR                     =       FG_BLACK+BG_GREEN
                           000002    32 RED_STONE_COLOR                 =       FG_BLACK+BG_GREEN
                           0000C2    33 SELC                            =       0xc2
                           0000C3    34 SELCR                           =       0xc3
                           000020    35 SCREEN_WIDTH                    =       32
                           000020    36 SCREEN_HEIGHT                   =       32
                           00001A    37 POSY_INPUT_LINE                 =       26
                           000011    38 POSX_INPUT_LINE                 =       17
                           00000E    39 INPUT_LINE_size                 =       14
                           00EE5B    40 POSITION_MOVES                  =       BWS+18*SCREEN_WIDTH+27
                           00EE91    41 POSITION_SUCCESS                =       BWS+20*SCREEN_WIDTH+17
                           00EDE2    42 POSITION_FIELD                  =       BWS+15*SCREEN_WIDTH+2
                           00EDD8    43 POSITION_LEVEL                  =       BWS+14*SCREEN_WIDTH+24
                           00EE1B    44 POSITION_PUZZEL                 =       BWS+16*SCREEN_WIDTH+27
                           00EF51    45 POSITION_INPUT_LINE             =       BWS+POSY_INPUT_LINE*SCREEN_WIDTH+POSX_INPUT_LINE
                                     46 
                                     47 .macro CURSOR_DISABLE
                                     48         call    cursor_disable
                                     49 .endm
                                     50 
                                     51 .macro STONE_GFX
                                     52 waag2:
                                     53         .db     0x02,0x04
                                     54         .db     0xc1,0x9e,0x9e,0x89
                                     55         .db     0x88,0xf8,0xf8,0xc8
                                     56 waag3:
                                     57         .db     0x02,0x06
                                     58         .db     0xc1,0x9e,0x9e,0x9e,0x9e,0x89
                                     59         .db     0x88,0xf8,0xf8,0xf8,0xf8,0xc8
                                     60 senk2:
                                     61         .db     0x04,0x02
                                     62         .db     0xc1,0x89
                                     63         .db     0x9f,0xc0
                                     64         .db     0x9f,0xc0
                                     65         .db     0x88,0xc8
                                     66 senk3:
                                     67         .db     0x06,0x02
                                     68         .db     0xc1,0x89
                                     69         .db     0x9f,0xc0
                                     70         .db     0x9f,0xc0
                                     71         .db     0x9f,0xc0
                                     72         .db     0x9f,0xc0
                                     73         .db     0x88,0xc8
                                     74 red2:
                                     75         .db     0x02,0x04
                                     76         .db     0xff,0xff,0xff,0xff
                                     77         .db     0xff,0xff,0xff,0xff
                                     78 .endm
                                     79 
                                     80 .macro UP_INCH
                                     81         rst     0x20
                                     82         .db     INCH
                                     83 .endm
                                     84 
                                     85 .macro UP_OUTCH
                                     86         rst     0x20
                                     87         .db     OUTCH
                                     88 .endm
                                     89 
                                     90 .macro  SYS_EXIT
                                     91         rst     0x20
                                     92         .db     PRST7
                                     93         .ascii  'BLOCKs - FREE THE STONE -'
                                     94         .db     0x8d
                                     95         rst     0x38
                                     96 .endm
                                     97 
                                     98 .macro  CALL_OUTA
                                     99         rst     0x20
                                    100         .db     OUTCH
                                    101 .endm
                                    102 
                                    103 .macro  INPUT_LINE
                                    104         call    inline
                                    105 .endm
                                    106 
                                    107 .macro  SET_CURSOR ADR
                                    108         push    hl
                                    109         ld      hl,#ADR
                                    110         ld      (CURSR),hl
                                    111         pop     hl
                                    112 .endm
                                    113 
                                    114 .macro ROLL_SMALL_WIN
                                    115         call    cls_small_window
                                    116 .endm
                                    117 
                                    118 
                                    119 .macro  TXT_ERROR
                                    120         .asciz  'ER'
                                    121 .endm
                                    122 
                                    123 .macro MAIN_PIC
                                    124         .ascii  '                                '
                                    125         .ascii  '                                '
                                    126 
                                    127         .db     0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e
                                    128         .db     0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e
                                    129         
                                    130         .db     0x20,0xA8,0xA9,0x20,0xA1,0x20,0xA8,0xA9,0xA8,0xA0,0xA1,0xA1,0x20,0xA8,0xA0,0x20
                                    131         .db     0x20,0x56,0x50,0x4F,0x48,0x4C,0x45,0x52,0x53,0x20,0x20,0x32,0x30,0x32,0x30,0x20
                                    132         
                                    133         .db     0x20,0xA3,0xA2,0xA9,0xA1,0x20,0xA1,0xA1,0xA1,0x20,0xA3,0xA2,0xA9,0xA7,0xA9,0x20
                                    134         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    135 
                                    136         .db     0x20,0xA7,0xA0,0xAA,0xA7,0xA0,0xA7,0xAA,0xA7,0xA0,0xA1,0x20,0xA1,0xA0,0xAA,0x20
                                    137         .db     0x2D,0x46,0x52,0x45,0x45,0x20,0x54,0x48,0x45,0x20,0x53,0x54,0x4F,0x4E,0x45,0x2D
                                    138         
                                    139         .db     0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8
                                    140         .db     0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8
                                    141 
                                    142         .ascii  '                                '
                                    143         .ascii  '                                '
                                    144         .ascii  '                                '
                                    145         .ascii  ' E,S,D,X select    e,s,d,x move '
                                    146         .ascii  '       <SPACE> toggle           '
                                    147         .ascii  '                                '
                                    148         .ascii  '                                '
                                    149 
                                    150         .db     0x20,0xBC,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xBD,0x20
                                    151         .db     0x20,0x4C,0x65,0x76,0x65,0x6C,0x20,0x20,0x42,0x65,0x67,0x69,0x6E,0x6E,0x65,0x72
                                    152         
                                    153         .db     0x20,0xB4,0xC1,0x9E,0x9E,0x9E,0x9E,0x89,0x20,0x20,0x20,0x20,0xC1,0x89,0xB5,0x20
                                    154         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    155         
                                    156         .db     0x20,0xB4,0x88,0xF8,0xF8,0xF8,0xF8,0xC8,0x20,0x20,0x20,0x20,0x9F,0xC0,0xB5,0x20
                                    157         .db     0x20,0x50,0x75,0x7A,0x7A,0x6C,0x65,0x20,0x20,0x20,0x20,0x30,0x30,0x30,0x30,0x31
                                    158         
                                    159         .db     0x20,0xB4,0x20,0x20,0x20,0x20,0xC1,0x89,0x20,0x20,0x20,0x20,0x9F,0xC0,0xB5,0x20
                                    160         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    161         
                                    162         .db     0x20,0xB4,0x20,0x20,0x20,0x20,0x9F,0xC0,0x20,0x20,0x20,0x20,0x9F,0xC0,0xB5,0x20
                                    163         .db     0x20,0x4D,0x6F,0x76,0x65,0x73,0x20,0x20,0x20,0x20,0x20,0x30,0x30,0x30,0x30,0x30
                                    164         
                                    165         .db     0x20,0xB4,0xC3,0xFF,0xFF,0xFF,0x9F,0xC0,0x20,0x20,0x20,0x20,0x9F,0xC0,0x20,0x20
                                    166         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    167         
                                    168         .db     0x20,0xB4,0xFF,0xFF,0xFF,0xFF,0x9F,0xC0,0x20,0x20,0x20,0x20,0x88,0xC8,0x20,0x20
                                    169         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    170         
                                    171         .db     0x20,0xB4,0xC1,0x89,0x20,0x20,0x9F,0xC0,0x20,0x20,0xC1,0x9E,0x9E,0x89,0xB5,0x20
                                    172         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    173         
                                    174         .db     0x20,0xB4,0x9F,0xC0,0x20,0x20,0x88,0xC8,0x20,0x20,0x88,0xF8,0xF8,0xC8,0xB5,0x20
                                    175         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    176         
                                    177         .db     0x20,0xB4,0x9F,0xC0,0x20,0x20,0x20,0x20,0x20,0x20,0xC1,0x89,0x20,0x20,0xB5,0x20
                                    178         .ascii  ' Code/Reset/Quit'
                                    179         
                                    180         .db     0x20,0xB4,0x88,0xC8,0x20,0x20,0x20,0x20,0x20,0x20,0x9F,0xC0,0x20,0x20,0xB5,0x20
                                    181         .db     0x20,0xee,0x20,0x20,0x20,0x20,0xee,0x20,0x20,0x20,0x20,0x20,0xee,0x20,0x20,0x20
                                    182         
                                    183         .db     0x20,0xB4,0xC1,0x9E,0x9E,0x9E,0x9E,0x89,0x20,0x20,0x9F,0xC0,0x20,0x20,0xB5,0x20
                                    184         .db     0xA8,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA9
                                    185         
                                    186         .db     0x20,0xB4,0x88,0xF8,0xF8,0xF8,0xF8,0xC8,0x20,0x20,0x88,0xC8,0x20,0x20,0xB5,0x20
                                    187         .db     0xA1,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xA1
                                    188         
                                    189         .db     0x20,0xBB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xBA,0x20
                                    190         .db     0xA7,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xAA
                                    191         .ascii  '                                '
                                    192         .ascii  '                                '
                                    193         .ascii  '                                '
                                    194         .ascii  '                                '
                                    195 
                                    196 .endm
                                    197 
                                    198 .macro CLS_SMALL_WINDOW
                                    199         call    cls_small_window
                                    200 .endm
                                    201 
                                    202 .macro CLS_FULL_WINDOW
                                    203         ld      a,#VK_CLS
                                    204         rst     0x20
                                    205         .db     OUTCH
                                    206 .endm
                                    207 
                                    208 .macro DECOMP
                                    209 decomp:
                                    210         ld      de,#BWS
                                    211         ld      bc,#SCREEN_WIDTH*SCREEN_HEIGHT
                                    212         ldir
                                    213         ret
                                    214 .endm
                                    215 
                                    216 .macro PUT_A_COLORED
                                    217         ld      (hl),a
                                    218 .endm
                                    219 
                                    220 .macro SET_STONE_COLOR
                                    221 .endm
                                    222 
                                    223 .macro SET_NORMAL_STONE_COLOR
                                    224 .endm
                                    225 
                                    226 .macro SET_RED_STONE_COLOR
                                    227 .endm
                                      3         
                                      4         .globl _main
                                      5 ; 
                                      6 ; constant
                                      7 ; 
                           00000C     8 FIELD_SIZE                       = 0x0c
                           0000FF     9 FIELD_END                        = 0xff
                           000004    10 STONE_RECT_size                  = 0x04
                           000000    11 EMPTY                            = 0x00
                           000000    12 HORIZONTAL                       = 0x00
                           000001    13 VERTICAL                         = 0x01
                           000001    14 DECODE_END                       = 0x01
                           000002    15 SIZE2                            = 0x02
                           000003    16 MAX_LEVEL                        = 0x03
                           00000F    17 MASK_LOWER_NIBBLE                = 0x0f
                           00001C    18 MASK_LEVEL_CODE                  = 0x1c
                           0000C0    19 MASK_UPPER_BITS                  = 0xc0
                           000003    20 MASK_LOWER_BITS                  = 0x03
                           00003F    21 MASK_CAPITAL_LETTERS             = 0x3f
                           0000FF    22 MINIMUM_DISTANCE                 = 0xff
                                     23 
                           000204    24 POS_END_42                       = 0x0204
                           000008    25 cmd_size                         = 0x0008
                           000009    26 vers_size                        = 0x0009
                           0001AA    27 mainpic_size                     = 0x01aa
                           000002    28 txt_prompt_size                  = 0x0002
                           000008    29 Level0_size                      = 0x0008
                           000008    30 Level1_size                      = 0x0008
                           000008    31 Level2_size                      = 0x0008
                           000008    32 Level3_size                      = 0x0008
                           00000F    33 geschafft_size                   = 0x000f
                           000006    34 qtab_size                        = 0x0006
                           00000A    35 waag2_size                       = 0x000a
                           00000E    36 waag3_size                       = 0x000e
                           00000A    37 senk2_size                       = 0x000a
                           00000E    38 senk3_size                       = 0x000e
                           00000A    39 red2_size                        = 0x000a
                           003169    40 puzzles_size                     = 0x3169
                           000024    41 field_size                       = 0x0024
                                     42 
                                     43         .globl  sadr
                                     44 
      000100                         45 sadr:
      000100                         46 _main:
      000100 C3 0D 01         [10]   47         jp      start
      000103                         48 cmd:
      000103 42 4C 4F 43 4B 53 20    49         .ascii  'BLOCKS  '
             20
      00010B                         50 cmd_end_marker:
      00010B 00 00                   51         .dw     0x0000
      00010D                         52 start:
      00000D                         53         CURSOR_DISABLE
      00010D CD 65 3C         [17]    1         call    cursor_disable
      000110 21 C2 01         [10]   54         ld      hl,#mainpic
      000113 CD C2 05         [17]   55         call    decomp
      000116 CD B9 01         [17]   56         call    smallwindw
      000119 3E 00            [ 7]   57         ld      a,#0
      00011B 32 78 3D         [13]   58         ld      (level),a
      00011E 32 52 3D         [13]   59         ld      (hidden),a
      000121 32 53 3D         [13]   60         ld      (toggled),a
      000124 21 00 00         [10]   61         ld      hl,#0
      000127 22 79 3D         [16]   62         ld      (puzzle),hl
      00012A CD 55 06         [17]   63         call    reset
      00012D                         64 mainloop:
      00002D                         65         CURSOR_DISABLE
      00012D CD 65 3C         [17]    1         call    cursor_disable
      000030                         66         UP_INCH
      000130 E7               [11]    1         rst     0x20
      000131 01                       2         .db     INCH
      000132 FE 51            [ 7]   67         cp      #'Q'
      000134 28 1E            [12]   68         jr      z,ende
      000136 21 7D 01         [10]   69         ld      hl,#kdo
      000139 01 1A 00         [10]   70         ld      bc,#kdotab-kdo
      00013C ED B1            [21]   71         cpir
      00013E 20 ED            [12]   72         jr      nz,mainloop
      000140 3E 19            [ 7]   73         ld      a,#kdotab-kdo-1
      000142 91               [ 4]   74         sub     c
      000143 CB 3F            [ 8]   75         srl     a
      000145 87               [ 4]   76         add     a,a
      000146 21 97 01         [10]   77         ld      hl,#kdotab
      000149 4F               [ 4]   78         ld      c,a
      00014A 09               [11]   79         add     hl,bc
      00014B 5E               [ 7]   80         ld      e,(hl)
      00014C 23               [ 6]   81         inc     hl
      00014D 56               [ 7]   82         ld      d,(hl)
      00014E 21 2D 01         [10]   83         ld      hl,#mainloop
      000151 E5               [11]   84         push    hl
      000152 D5               [11]   85         push    de
      000153 C9               [10]   86         ret
      000154                         87 ende:
      000154 CD BD 01         [17]   88         call    fullwindw
      000057                         89         SYS_EXIT
      000157 E7               [11]    1         rst     0x20
      000158 02                       2         .db     PRST7
      000159 42 4C 4F 43 4B 73 20     3         .ascii  'BLOCKs - FREE THE STONE -'
             2D 20 46 52 45 45 20
             54 48 45 20 53 54 4F
             4E 45 20 2D
      000172 8D                       4         .db     0x8d
      000173 FF               [11]    5         rst     0x38
      000174                         90 vers:
      000174 31 2F 31 35 2F 32 30    91         .ascii  '1/15/2021'
             32 31
      00017D                         92 kdo:
      00017D 43                      93         .db     'C'
                           000001    94 .if  eq,z9001
      00017E 63                      95         .db     'c'
                           000000    96 .else
                                     97         .db     0
                                     98 .endif
      00017F 52                      99         .db     'R'
                           000001   100 .if  eq,z9001
      000180 72                     101         .db     'r'
                           000000   102 .else
                                    103         .db     0
                                    104 .endif
      000181 45 0B                  105         .db     'E',VK_UP
      000183 53 08                  106         .db     'S',VK_LEFT
      000185 44 09                  107         .db     'D',VK_RIGHT
      000187 58 0A                  108         .db     'X',VK_DOWN
      000189 65 00                  109         .db     'e',0x00
      00018B 73 00                  110         .db     's',0x00
      00018D 64 00                  111         .db     'd',0x00
      00018F 78 00                  112         .db     'x',0x00
      000191 41 61                  113         .db     'A','a'
      000193 20 0D                  114         .db     ' ',VK_ENTER
                           000001   115 .if  eq,z9001
      000195 4E 6E                  116         .db     'N','n'
                                    117 .endif
      000197                        118 kdotab:
      000197 CB 05                  119         .dw     codeinp
      000199 55 06                  120         .dw     reset
      00019B FD 06                  121         .dw     cu_up
      00019D 3D 07                  122         .dw     cu_left
      00019F 5D 07                  123         .dw     cu_right
      0001A1 1D 07                  124         .dw     cu_down
      0001A3 D2 07                  125         .dw     move_up
      0001A5 1B 08                  126         .dw     move_left
      0001A7 3E 08                  127         .dw     move_right
      0001A9 F5 07                  128         .dw     move_down
      0001AB B6 07                  129         .dw     next_stone
      0001AD B1 01                  130         .dw     toggle
                           000001   131 .if  eq,z9001        
      0001AF B3 06                  132         .dw     solved
                                    133 .endif
      0001B1                        134 toggle:
      0001B1 3A 53 3D         [13]  135         ld      a,(toggled)
      0001B4 2F               [ 4]  136         cpl
      0001B5 32 53 3D         [13]  137         ld      (toggled),a
      0001B8 C9               [10]  138         ret
      0001B9                        139 smallwindw:
      0000B9                        140         CLS_SMALL_WINDOW
      0001B9 CD B4 3C         [17]    1         call    cls_small_window
      0001BC C9               [10]  141         ret
      0001BD                        142 fullwindw:
      0000BD                        143         CLS_FULL_WINDOW
      0001BD 3E 0C            [ 7]    1         ld      a,#VK_CLS
      0001BF E7               [11]    2         rst     0x20
      0001C0 00                       3         .db     OUTCH
      0001C1 C9               [10]  144         ret
      0001C2                        145 mainpic:
      0000C2                        146         MAIN_PIC
      0001C2 20 20 20 20 20 20 20     1         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      0001E2 20 20 20 20 20 20 20     2         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
                                      3 
      000202 9E 9E 9E 9E 9E 9E 9E     4         .db     0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e
             9E 9E 9E 9E 9E 9E 9E
             9E 9E
      000212 9E 9E 9E 9E 9E 9E 9E     5         .db     0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e
             9E 9E 9E 9E 9E 9E 9E
             9E 9E
                                      6         
      000222 20 A8 A9 20 A1 20 A8     7         .db     0x20,0xA8,0xA9,0x20,0xA1,0x20,0xA8,0xA9,0xA8,0xA0,0xA1,0xA1,0x20,0xA8,0xA0,0x20
             A9 A8 A0 A1 A1 20 A8
             A0 20
      000232 20 56 50 4F 48 4C 45     8         .db     0x20,0x56,0x50,0x4F,0x48,0x4C,0x45,0x52,0x53,0x20,0x20,0x32,0x30,0x32,0x30,0x20
             52 53 20 20 32 30 32
             30 20
                                      9         
      000242 20 A3 A2 A9 A1 20 A1    10         .db     0x20,0xA3,0xA2,0xA9,0xA1,0x20,0xA1,0xA1,0xA1,0x20,0xA3,0xA2,0xA9,0xA7,0xA9,0x20
             A1 A1 20 A3 A2 A9 A7
             A9 20
      000252 20 20 20 20 20 20 20    11         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     12 
      000262 20 A7 A0 AA A7 A0 A7    13         .db     0x20,0xA7,0xA0,0xAA,0xA7,0xA0,0xA7,0xAA,0xA7,0xA0,0xA1,0x20,0xA1,0xA0,0xAA,0x20
             AA A7 A0 A1 20 A1 A0
             AA 20
      000272 2D 46 52 45 45 20 54    14         .db     0x2D,0x46,0x52,0x45,0x45,0x20,0x54,0x48,0x45,0x20,0x53,0x54,0x4F,0x4E,0x45,0x2D
             48 45 20 53 54 4F 4E
             45 2D
                                     15         
      000282 F8 F8 F8 F8 F8 F8 F8    16         .db     0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8
             F8 F8 F8 F8 F8 F8 F8
             F8 F8
      000292 F8 F8 F8 F8 F8 F8 F8    17         .db     0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8,0xF8
             F8 F8 F8 F8 F8 F8 F8
             F8 F8
                                     18 
      0002A2 20 20 20 20 20 20 20    19         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      0002C2 20 20 20 20 20 20 20    20         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      0002E2 20 20 20 20 20 20 20    21         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000302 20 45 2C 53 2C 44 2C    22         .ascii  ' E,S,D,X select    e,s,d,x move '
             58 20 73 65 6C 65 63
             74 20 20 20 20 65 2C
             73 2C 64 2C 78 20 6D
             6F 76 65 20
      000322 20 20 20 20 20 20 20    23         .ascii  '       <SPACE> toggle           '
             3C 53 50 41 43 45 3E
             20 74 6F 67 67 6C 65
             20 20 20 20 20 20 20
             20 20 20 20
      000342 20 20 20 20 20 20 20    24         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000362 20 20 20 20 20 20 20    25         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
                                     26 
      000382 20 BC B6 B6 B6 B6 B6    27         .db     0x20,0xBC,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xB6,0xBD,0x20
             B6 B6 B6 B6 B6 B6 B6
             BD 20
      000392 20 4C 65 76 65 6C 20    28         .db     0x20,0x4C,0x65,0x76,0x65,0x6C,0x20,0x20,0x42,0x65,0x67,0x69,0x6E,0x6E,0x65,0x72
             20 42 65 67 69 6E 6E
             65 72
                                     29         
      0003A2 20 B4 C1 9E 9E 9E 9E    30         .db     0x20,0xB4,0xC1,0x9E,0x9E,0x9E,0x9E,0x89,0x20,0x20,0x20,0x20,0xC1,0x89,0xB5,0x20
             89 20 20 20 20 C1 89
             B5 20
      0003B2 20 20 20 20 20 20 20    31         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     32         
      0003C2 20 B4 88 F8 F8 F8 F8    33         .db     0x20,0xB4,0x88,0xF8,0xF8,0xF8,0xF8,0xC8,0x20,0x20,0x20,0x20,0x9F,0xC0,0xB5,0x20
             C8 20 20 20 20 9F C0
             B5 20
      0003D2 20 50 75 7A 7A 6C 65    34         .db     0x20,0x50,0x75,0x7A,0x7A,0x6C,0x65,0x20,0x20,0x20,0x20,0x30,0x30,0x30,0x30,0x31
             20 20 20 20 30 30 30
             30 31
                                     35         
      0003E2 20 B4 20 20 20 20 C1    36         .db     0x20,0xB4,0x20,0x20,0x20,0x20,0xC1,0x89,0x20,0x20,0x20,0x20,0x9F,0xC0,0xB5,0x20
             89 20 20 20 20 9F C0
             B5 20
      0003F2 20 20 20 20 20 20 20    37         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     38         
      000402 20 B4 20 20 20 20 9F    39         .db     0x20,0xB4,0x20,0x20,0x20,0x20,0x9F,0xC0,0x20,0x20,0x20,0x20,0x9F,0xC0,0xB5,0x20
             C0 20 20 20 20 9F C0
             B5 20
      000412 20 4D 6F 76 65 73 20    40         .db     0x20,0x4D,0x6F,0x76,0x65,0x73,0x20,0x20,0x20,0x20,0x20,0x30,0x30,0x30,0x30,0x30
             20 20 20 20 30 30 30
             30 30
                                     41         
      000422 20 B4 C3 FF FF FF 9F    42         .db     0x20,0xB4,0xC3,0xFF,0xFF,0xFF,0x9F,0xC0,0x20,0x20,0x20,0x20,0x9F,0xC0,0x20,0x20
             C0 20 20 20 20 9F C0
             20 20
      000432 20 20 20 20 20 20 20    43         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     44         
      000442 20 B4 FF FF FF FF 9F    45         .db     0x20,0xB4,0xFF,0xFF,0xFF,0xFF,0x9F,0xC0,0x20,0x20,0x20,0x20,0x88,0xC8,0x20,0x20
             C0 20 20 20 20 88 C8
             20 20
      000452 20 20 20 20 20 20 20    46         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     47         
      000462 20 B4 C1 89 20 20 9F    48         .db     0x20,0xB4,0xC1,0x89,0x20,0x20,0x9F,0xC0,0x20,0x20,0xC1,0x9E,0x9E,0x89,0xB5,0x20
             C0 20 20 C1 9E 9E 89
             B5 20
      000472 20 20 20 20 20 20 20    49         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     50         
      000482 20 B4 9F C0 20 20 88    51         .db     0x20,0xB4,0x9F,0xC0,0x20,0x20,0x88,0xC8,0x20,0x20,0x88,0xF8,0xF8,0xC8,0xB5,0x20
             C8 20 20 88 F8 F8 C8
             B5 20
      000492 20 20 20 20 20 20 20    52         .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20
                                     53         
      0004A2 20 B4 9F C0 20 20 20    54         .db     0x20,0xB4,0x9F,0xC0,0x20,0x20,0x20,0x20,0x20,0x20,0xC1,0x89,0x20,0x20,0xB5,0x20
             20 20 20 C1 89 20 20
             B5 20
      0004B2 20 43 6F 64 65 2F 52    55         .ascii  ' Code/Reset/Quit'
             65 73 65 74 2F 51 75
             69 74
                                     56         
      0004C2 20 B4 88 C8 20 20 20    57         .db     0x20,0xB4,0x88,0xC8,0x20,0x20,0x20,0x20,0x20,0x20,0x9F,0xC0,0x20,0x20,0xB5,0x20
             20 20 20 9F C0 20 20
             B5 20
      0004D2 20 EE 20 20 20 20 EE    58         .db     0x20,0xee,0x20,0x20,0x20,0x20,0xee,0x20,0x20,0x20,0x20,0x20,0xee,0x20,0x20,0x20
             20 20 20 20 20 EE 20
             20 20
                                     59         
      0004E2 20 B4 C1 9E 9E 9E 9E    60         .db     0x20,0xB4,0xC1,0x9E,0x9E,0x9E,0x9E,0x89,0x20,0x20,0x9F,0xC0,0x20,0x20,0xB5,0x20
             89 20 20 9F C0 20 20
             B5 20
      0004F2 A8 A0 A0 A0 A0 A0 A0    61         .db     0xA8,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA9
             A0 A0 A0 A0 A0 A0 A0
             A0 A9
                                     62         
      000502 20 B4 88 F8 F8 F8 F8    63         .db     0x20,0xB4,0x88,0xF8,0xF8,0xF8,0xF8,0xC8,0x20,0x20,0x88,0xC8,0x20,0x20,0xB5,0x20
             C8 20 20 88 C8 20 20
             B5 20
      000512 A1 20 20 20 20 20 20    64         .db     0xA1,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xA1
             20 20 20 20 20 20 20
             20 A1
                                     65         
      000522 20 BB FB FB FB FB FB    66         .db     0x20,0xBB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xFB,0xBA,0x20
             FB FB FB FB FB FB FB
             BA 20
      000532 A7 A0 A0 A0 A0 A0 A0    67         .db     0xA7,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xA0,0xAA
             A0 A0 A0 A0 A0 A0 A0
             A0 AA
      000542 20 20 20 20 20 20 20    68         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000562 20 20 20 20 20 20 20    69         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000582 20 20 20 20 20 20 20    70         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      0005A2 20 20 20 20 20 20 20    71         .ascii  '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
                                     72 
      0005C2                        147         DECOMP
      0004C2                          1 decomp:
      0005C2 11 00 EC         [10]    2         ld      de,#BWS
      0005C5 01 00 04         [10]    3         ld      bc,#SCREEN_WIDTH*SCREEN_HEIGHT
      0005C8 ED B0            [21]    4         ldir
      0005CA C9               [10]    5         ret
      0005CB                        148 codeinp:
      0005CB CD C4 0A         [17]  149         call    prnst0
      0005CE                        150 txt_prompt:
      0005CE 3E 00                  151         .asciz  '>'
      0005D0                        152 ret_from_prnst0:
      0005D0 11 D1 3C         [10]  153         ld      de,#CONBU
      0005D3 3E 0A            [ 7]  154         ld      a,#10
      0005D5 12               [ 7]  155         ld      (de),a
      0004D6                        156         INPUT_LINE
      0005D6 CD 71 3C         [17]    1         call    inline
      0005D9 DA 55 06         [10]  157         jp      c,reset
      0005DC 13               [ 6]  158         inc     de
      0005DD 1A               [ 7]  159         ld      a,(de)
      0005DE FE 00            [ 7]  160         cp      #EMPTY
      0005E0 CA 55 06         [10]  161         jp      z,reset
      0005E3 21 D3 3C         [10]  162         ld      hl,#CONBU+2
      0005E6 7E               [ 7]  163         ld      a,(hl)
      0005E7 FE 76            [ 7]  164         cp      #'v'
      0005E9 20 0B            [12]  165         jr      nz,sp0
      0005EB 23               [ 6]  166         inc     hl
      0005EC 7E               [ 7]  167         ld      a,(hl)
      0005ED FE 70            [ 7]  168         cp      #'p'
      0005EF 20 05            [12]  169         jr      nz,sp0
      0005F1 32 52 3D         [13]  170         ld      (hidden),a
      0005F4 18 D5            [12]  171         jr      codeinp
      0005F6                        172 sp0:
      0005F6 3A 52 3D         [13]  173         ld      a,(hidden)
      0005F9 FE 70            [ 7]  174         cp      #'p'
      0005FB 20 1C            [12]  175         jr      nz,sp1
      0005FD 21 D3 3C         [10]  176         ld      hl,#CONBU+2
      000600 7E               [ 7]  177         ld      a,(hl)
      000601 FE 30            [ 7]  178         cp      #'0'
      000603 20 14            [12]  179         jr      nz,sp1
      000605 CD E1 0A         [17]  180         call    atoh
      000608 38 3A            [12]  181         jr      c,s2
      00060A 4F               [ 4]  182         ld      c,a
      00060B CD E1 0A         [17]  183         call    atoh
      00060E 38 34            [12]  184         jr      c,s2
      000610 57               [ 4]  185         ld      d,a
      000611 CD E1 0A         [17]  186         call    atoh
      000614 38 2E            [12]  187         jr      c,s2
      000616 5F               [ 4]  188         ld      e,a
      000617 18 08            [12]  189         jr      sp2
      000619                        190 sp1:
      000619 21 D3 3C         [10]  191         ld      hl,#CONBU+2
      00061C CD DA 08         [17]  192         call    decode
      00061F 38 23            [12]  193         jr      c,s2
      000621                        194 sp2:
      000621 79               [ 4]  195         ld      a,c
      000622 FE 04            [ 7]  196         cp      #MAX_LEVEL+1
      000624 30 1E            [12]  197         jr      nc,s2
      000626 41               [ 4]  198         ld      b,c
      000627 04               [ 4]  199         inc     b
      000628 21 F2 0A         [10]  200         ld      hl,#lvl0cnt-2
      00062B                        201 sp2a:
      00062B 23               [ 6]  202         inc     hl
      00062C 23               [ 6]  203         inc     hl
      00062D 10 FC            [13]  204         djnz    sp2a
      00062F 7E               [ 7]  205         ld      a,(hl)
      000630 23               [ 6]  206         inc     hl
      000631 66               [ 7]  207         ld      h,(hl)
      000632 6F               [ 4]  208         ld      l,a
      000633 B7               [ 4]  209         or      a
      000634 2B               [ 6]  210         dec     hl
      000635 ED 52            [15]  211         sbc     hl,de
      000637 38 0B            [12]  212         jr      c,s2
      000639 79               [ 4]  213         ld      a,c
      00063A 32 78 3D         [13]  214         ld      (level),a
      00063D ED 53 79 3D      [20]  215         ld      (puzzle),de
      000641 C3 55 06         [10]  216         jp      reset
      000644                        217 s2:
      000544                        218         SET_CURSOR POSITION_INPUT_LINE
      000644 E5               [11]    1         push    hl
      000645 21 51 EF         [10]    2         ld      hl,#POSITION_INPUT_LINE
      000648 22 2B 00         [16]    3         ld      (CURSR),hl
      00064B E1               [10]    4         pop     hl
      00064C CD C4 0A         [17]  219         call    prnst0
      00054F                        220         TXT_ERROR
      00064F 45 52 00                 1         .asciz  'ER'
      000652 C3 CB 05         [10]  221         jp      codeinp
      000655                        222 reset:
      000655 3A 78 3D         [13]  223         ld      a,(level)
      000658 4F               [ 4]  224         ld      c,a
      000659 ED 5B 79 3D      [20]  225         ld      de,(puzzle)
      00065D CD 08 09         [17]  226         call    getpuzzle
      000660 CD 29 09         [17]  227         call    unpack
      000663 21 FF FF         [10]  228         ld      hl,#-1
      000666 22 7B 3D         [16]  229         ld      (moves),hl
      000669 21 82 3D         [10]  230         ld      hl,#stones
      00066C 22 7F 3D         [16]  231         ld      (custone),hl
      00066F CD 69 09         [17]  232         call    show_mv
      000672 3A 78 3D         [13]  233         ld      a,(level)
      000675 47               [ 4]  234         ld      b,a
      000676 04               [ 4]  235         inc     b
      000677 11 08 00         [10]  236         ld      de,#Level0_size
      00067A 21 8B 06         [10]  237         ld      hl,#Level0-Level0_size
      00067D                        238 res1:
      00067D 19               [11]  239         add     hl,de
      00067E 10 FD            [13]  240         djnz    res1
      000680 01 08 00         [10]  241         ld      bc,#Level0_size
      000683 11 D8 ED         [10]  242         ld      de,#POSITION_LEVEL
      000686 ED B0            [21]  243         ldir
      000688 11 1B EE         [10]  244         ld      de,#POSITION_PUZZEL
      00068B 2A 79 3D         [16]  245         ld      hl,(puzzle)
      00068E 23               [ 6]  246         inc     hl
      00068F CD 96 0A         [17]  247         call    hlkon
      000692 C9               [10]  248         ret
      000693                        249 Level0:
      000693 42 65 67 69 6E 6E 65   250         .ascii  'Beginner'
             72
      00069B                        251 Level1:
      00069B 49 6E 74 65 72 6D 65   252         .ascii  'Intermed'
             64
      0006A3                        253 Level2:
      0006A3 41 64 76 61 6E 63 65   254         .ascii  'Advanced'
             64
      0006AB                        255 Level3:
      0006AB 20 20 45 78 70 65 72   256         .ascii  '  Expert'
             74
      0006B3                        257 solved:
      0006B3 21 D4 06         [10]  258         ld      hl,#geschafft
      0006B6 11 91 EE         [10]  259         ld      de,#POSITION_SUCCESS
      0006B9 01 0F 00         [10]  260         ld      bc,#geschafft_size
      0006BC ED B0            [21]  261         ldir
      0005BE                        262         UP_INCH
      0006BE E7               [11]    1         rst     0x20
      0006BF 01                       2         .db     INCH
      0006C0 CD 7C 08         [17]  263         call    nextpuzzle
      0006C3 CD 55 06         [17]  264         call    reset
                                    265         ;       löscht das aktuelle Fenster, sprich das Kleine!
                                    266         ;       und, das ist wichtig, setzt den Cursor wieder auf den Anfang
      0005C6                        267         ROLL_SMALL_WIN
      0006C6 CD B4 3C         [17]    1         call    cls_small_window
      0006C9 3A 78 3D         [13]  268         ld      a,(level)
      0006CC 4F               [ 4]  269         ld      c,a
      0006CD ED 5B 79 3D      [20]  270         ld      de,(puzzle)
      0006D1 C3 AE 08         [10]  271         jp      encode
      0006D4                        272 geschafft:
      0006D4 2A 20 53 20 4F 20 4C   273         .ascii  '* S O L V E D *'
             20 56 20 45 20 44 20
             2A
      0006E3                        274 cu_init:
      0006E3 FD 2A 7F 3D      [20]  275         ld      iy,(custone)
      0006E7 FD 5E 00         [19]  276         ld      e,0(iy)
      0006EA FD 56 01         [19]  277         ld      d,1(iy)
      0006ED 0E FF            [ 7]  278         ld      c,#MINIMUM_DISTANCE
      0006EF D9               [ 4]  279         exx
      0006F0 01 04 00         [10]  280         ld      bc,#STONE_RECT_size
      0006F3 D9               [ 4]  281         exx
      0006F4 DD 21 82 3D      [14]  282         ld      ix,#stones
      0006F8 3A 53 3D         [13]  283         ld      a,(toggled)
      0006FB B7               [ 4]  284         or      a
      0006FC C9               [10]  285         ret
      0006FD                        286 cu_up:
      0006FD CD E3 06         [17]  287         call    cu_init
      000700 C2 D2 07         [10]  288         jp      nz,move_up
      000703                        289 cu_up1:
      000703 DD 7E 01         [19]  290         ld      a,1(ix)
      000706 BA               [ 4]  291         cp      d
      000707 DC 7D 07         [17]  292         call    c,calc_distance
      00070A D9               [ 4]  293         exx
      00070B DD 09            [15]  294         add     ix,bc
      00070D D9               [ 4]  295         exx
      00070E DD 7E 00         [19]  296         ld      a,0(ix)
      000711 FE FF            [ 7]  297         cp      #FIELD_END
      000713 20 EE            [12]  298         jr      nz,cu_up1
      000715 FD 22 7F 3D      [20]  299         ld      (custone),iy
      000719 CD 76 09         [17]  300         call    show
      00071C C9               [10]  301         ret
      00071D                        302 cu_down:
      00071D CD E3 06         [17]  303         call    cu_init
      000720 C2 F5 07         [10]  304         jp      nz,move_down
      000723                        305 cu_down1:
      000723 7A               [ 4]  306         ld      a,d
      000724 DD BE 01         [19]  307         cp      1(ix)
      000727 DC 7D 07         [17]  308         call    c,calc_distance
      00072A D9               [ 4]  309         exx
      00072B DD 09            [15]  310         add     ix,bc
      00072D D9               [ 4]  311         exx
      00072E DD 7E 00         [19]  312         ld      a,0(ix)
      000731 FE FF            [ 7]  313         cp      #FIELD_END
      000733 20 EE            [12]  314         jr      nz,cu_down1
      000735 FD 22 7F 3D      [20]  315         ld      (custone),iy
      000739 CD 76 09         [17]  316         call    show
      00073C C9               [10]  317         ret
      00073D                        318 cu_left:
      00073D CD E3 06         [17]  319         call    cu_init
      000740 C2 1B 08         [10]  320         jp      nz,move_left
      000743                        321 cu_left1:
      000743 DD 7E 00         [19]  322         ld      a,0(ix)
      000746 BB               [ 4]  323         cp      e
      000747 DC 7D 07         [17]  324         call    c,calc_distance
      00074A D9               [ 4]  325         exx
      00074B DD 09            [15]  326         add     ix,bc
      00074D D9               [ 4]  327         exx
      00074E DD 7E 00         [19]  328         ld      a,0(ix)
      000751 FE FF            [ 7]  329         cp      #FIELD_END
      000753 20 EE            [12]  330         jr      nz,cu_left1
      000755 FD 22 7F 3D      [20]  331         ld      (custone),iy
      000759 CD 76 09         [17]  332         call    show
      00075C C9               [10]  333         ret
      00075D                        334 cu_right:
      00075D CD E3 06         [17]  335         call    cu_init
      000760 C2 3E 08         [10]  336         jp      nz,move_right
      000763                        337 cu_right1:
      000763 7B               [ 4]  338         ld      a,e
      000764 DD BE 00         [19]  339         cp      0(ix)
      000767 DC 7D 07         [17]  340         call    c,calc_distance
      00076A D9               [ 4]  341         exx
      00076B DD 09            [15]  342         add     ix,bc
      00076D D9               [ 4]  343         exx
      00076E DD 7E 00         [19]  344         ld      a,0(ix)
      000771 FE FF            [ 7]  345         cp      #FIELD_END
      000773 20 EE            [12]  346         jr      nz,cu_right1
      000775 FD 22 7F 3D      [20]  347         ld      (custone),iy
      000779 CD 76 09         [17]  348         call    show
      00077C C9               [10]  349         ret
      00077D                        350 calc_distance:
      00077D C5               [11]  351         push    bc
      00077E DD 7E 00         [19]  352         ld      a,0(ix)
      000781 43               [ 4]  353         ld      b,e
      000782 90               [ 4]  354         sub     b
      000783 F2 88 07         [10]  355         jp      p,calc_distance1
      000786 ED 44            [ 8]  356         neg
      000788                        357 calc_distance1:
      000788 21 AF 07         [10]  358         ld      hl,#qtab
      00078B 4F               [ 4]  359         ld      c,a
      00078C 06 00            [ 7]  360         ld      b,#0
      00078E 09               [11]  361         add     hl,bc
      00078F 7E               [ 7]  362         ld      a,(hl)
      000790 F5               [11]  363         push    af
      000791 DD 7E 01         [19]  364         ld      a,1(ix)
      000794 42               [ 4]  365         ld      b,d
      000795 90               [ 4]  366         sub     b
      000796 F2 9B 07         [10]  367         jp      p,calc_distance2
      000799 ED 44            [ 8]  368         neg
      00079B                        369 calc_distance2:
      00079B 21 AF 07         [10]  370         ld      hl,#qtab
      00079E 4F               [ 4]  371         ld      c,a
      00079F 06 00            [ 7]  372         ld      b,#0
      0007A1 09               [11]  373         add     hl,bc
      0007A2 7E               [ 7]  374         ld      a,(hl)
      0007A3 C1               [10]  375         pop     bc
      0007A4 80               [ 4]  376         add     a,b
      0007A5 C1               [10]  377         pop     bc
      0007A6 C8               [11]  378         ret     z
      0007A7 B9               [ 4]  379         cp      c
      0007A8 D0               [11]  380         ret     nc
      0007A9 4F               [ 4]  381         ld      c,a
      0007AA DD E5            [15]  382         push    ix
      0007AC FD E1            [14]  383         pop     iy
      0007AE C9               [10]  384         ret
      0007AF                        385 qtab:
      0007AF 00 01 04 09 10 19      386         .db     0x00,0x01,0x04,0x09,0x10,0x19
                                    387 ; unchecked data source
      0007B5 C9                     388         .db     0xc9
      0007B6                        389 next_stone:
      0007B6 DD 2A 7F 3D      [20]  390         ld      ix,(custone)
      0007BA 01 04 00         [10]  391         ld      bc,#STONE_RECT_size
      0007BD DD 09            [15]  392         add     ix,bc
      0007BF DD 7E 00         [19]  393         ld      a,0(ix)
      0007C2 FE FF            [ 7]  394         cp      #FIELD_END
      0007C4 20 04            [12]  395         jr      nz,next_stone1
      0007C6 DD 21 82 3D      [14]  396         ld      ix,#stones
      0007CA                        397 next_stone1:
      0007CA DD 22 7F 3D      [20]  398         ld      (custone),ix
      0007CE CD 76 09         [17]  399         call    show
      0007D1 C9               [10]  400         ret
      0007D2                        401 move_up:
      0007D2 DD 2A 7F 3D      [20]  402         ld      ix,(custone)
      0007D6 DD 7E 02         [19]  403         ld      a,2(ix)
      0007D9 FE 00            [ 7]  404         cp      #HORIZONTAL
      0007DB C0               [11]  405         ret     nz
      0007DC DD 7E 01         [19]  406         ld      a,1(ix)
      0007DF FE 00            [ 7]  407         cp      #0
      0007E1 C8               [11]  408         ret     z
      0007E2 3D               [ 4]  409         dec     a
      0007E3 DD 5E 00         [19]  410         ld      e,0(ix)
      0007E6 57               [ 4]  411         ld      d,a
      0007E7 CD D2 09         [17]  412         call    calc_pos0
      0007EA 7E               [ 7]  413         ld      a,(hl)
      0007EB FE 20            [ 7]  414         cp      #' '
      0007ED C0               [11]  415         ret     nz
      0007EE DD 35 01         [23]  416         dec     1(ix)
      0007F1 CD 69 09         [17]  417         call    show_mv
      0007F4 C9               [10]  418         ret
      0007F5                        419 move_down:
      0007F5 DD 2A 7F 3D      [20]  420         ld      ix,(custone)
      0007F9 DD 7E 02         [19]  421         ld      a,2(ix)
      0007FC FE 00            [ 7]  422         cp      #HORIZONTAL
      0007FE C0               [11]  423         ret     nz
      0007FF DD 7E 01         [19]  424         ld      a,1(ix)
      000802 DD 46 03         [19]  425         ld      b,3(ix)
      000805 80               [ 4]  426         add     a,b
      000806 FE 06            [ 7]  427         cp      #FIELD_SIZE/2
      000808 D0               [11]  428         ret     nc
      000809 DD 5E 00         [19]  429         ld      e,0(ix)
      00080C 57               [ 4]  430         ld      d,a
      00080D CD D2 09         [17]  431         call    calc_pos0
      000810 7E               [ 7]  432         ld      a,(hl)
      000811 FE 20            [ 7]  433         cp      #' '
      000813 C0               [11]  434         ret     nz
      000814 DD 34 01         [23]  435         inc     1(ix)
      000817 CD 69 09         [17]  436         call    show_mv
      00081A C9               [10]  437         ret
      00081B                        438 move_left:
      00081B DD 2A 7F 3D      [20]  439         ld      ix,(custone)
      00081F DD 7E 02         [19]  440         ld      a,2(ix)
      000822 FE 01            [ 7]  441         cp      #VERTICAL
      000824 C0               [11]  442         ret     nz
      000825 DD 7E 00         [19]  443         ld      a,0(ix)
      000828 FE 00            [ 7]  444         cp      #0
      00082A C8               [11]  445         ret     z
      00082B 3D               [ 4]  446         dec     a
      00082C 5F               [ 4]  447         ld      e,a
      00082D DD 56 01         [19]  448         ld      d,1(ix)
      000830 CD D2 09         [17]  449         call    calc_pos0
      000833 7E               [ 7]  450         ld      a,(hl)
      000834 FE 20            [ 7]  451         cp      #' '
      000836 C0               [11]  452         ret     nz
      000837 DD 35 00         [23]  453         dec     0(ix)
      00083A CD 69 09         [17]  454         call    show_mv
      00083D C9               [10]  455         ret
      00083E                        456 move_right:
      00083E 21 82 3D         [10]  457         ld      hl,#stones
      000841 ED 5B 7F 3D      [20]  458         ld      de,(custone)
      000845 B7               [ 4]  459         or      a
      000846 ED 52            [15]  460         sbc     hl,de
      000848 20 0C            [12]  461         jr      nz,mv_right0
      00084A 2A 82 3D         [16]  462         ld      hl,(stones)
      00084D 11 04 02         [10]  463         ld      de,#POS_END_42
      000850 B7               [ 4]  464         or      a
      000851 ED 52            [15]  465         sbc     hl,de
      000853 CA B3 06         [10]  466         jp      z,solved
      000856                        467 mv_right0:
      000856 DD 2A 7F 3D      [20]  468         ld      ix,(custone)
      00085A DD 7E 02         [19]  469         ld      a,2(ix)
      00085D FE 01            [ 7]  470         cp      #VERTICAL
      00085F C0               [11]  471         ret     nz
      000860 DD 7E 00         [19]  472         ld      a,0(ix)
      000863 DD 46 03         [19]  473         ld      b,3(ix)
      000866 80               [ 4]  474         add     a,b
      000867 FE 06            [ 7]  475         cp      #FIELD_SIZE/2
      000869 D0               [11]  476         ret     nc
      00086A 5F               [ 4]  477         ld      e,a
      00086B DD 56 01         [19]  478         ld      d,1(ix)
      00086E CD D2 09         [17]  479         call    calc_pos0
      000871 7E               [ 7]  480         ld      a,(hl)
      000872 FE 20            [ 7]  481         cp      #' '
      000874 C0               [11]  482         ret     nz
      000875 DD 34 00         [23]  483         inc     0(ix)
      000878 CD 69 09         [17]  484         call    show_mv
      00087B C9               [10]  485         ret
      00087C                        486 nextpuzzle:
      00087C 3A 78 3D         [13]  487         ld      a,(level)
      00087F 47               [ 4]  488         ld      b,a
      000880 04               [ 4]  489         inc     b
      000881 21 F2 0A         [10]  490         ld      hl,#lvl0cnt-2
      000884                        491 np1:
      000884 23               [ 6]  492         inc     hl
      000885 23               [ 6]  493         inc     hl
      000886 10 FC            [13]  494         djnz    np1
      000888 7E               [ 7]  495         ld      a,(hl)
      000889 23               [ 6]  496         inc     hl
      00088A 66               [ 7]  497         ld      h,(hl)
      00088B 6F               [ 4]  498         ld      l,a
      00088C 2B               [ 6]  499         dec     hl
      00088D ED 5B 79 3D      [20]  500         ld      de,(puzzle)
      000891 13               [ 6]  501         inc     de
      000892 B7               [ 4]  502         or      a
      000893 ED 52            [15]  503         sbc     hl,de
      000895 38 05            [12]  504         jr      c,np2
      000897 ED 53 79 3D      [20]  505         ld      (puzzle),de
      00089B C9               [10]  506         ret
      00089C                        507 np2:
      00089C 3A 78 3D         [13]  508         ld      a,(level)
      00089F FE 03            [ 7]  509         cp      #MAX_LEVEL
      0008A1 C8               [11]  510         ret     z
      0008A2 3C               [ 4]  511         inc     a
      0008A3 32 78 3D         [13]  512         ld      (level),a
      0008A6 11 00 00         [10]  513         ld      de,#0
      0008A9 ED 53 79 3D      [20]  514         ld      (puzzle),de
      0008AD C9               [10]  515         ret
      0008AE                        516 encode:
      0008AE ED 5F            [ 9]  517         ld      a,r
      0008B0 E6 1C            [ 7]  518         and     #MASK_LEVEL_CODE
      0008B2 81               [ 4]  519         add     a,c
      0008B3 C6 41            [ 7]  520         add     a,#'A'
      0008B5 FE 5B            [ 7]  521         cp      #'Z'+1
      0008B7 30 F5            [12]  522         jr      nc,encode
      0008B9 67               [ 4]  523         ld      h,a
      0007BA                        524         CALL_OUTA
      0008BA E7               [11]    1         rst     0x20
      0008BB 00                       2         .db     OUTCH
      0008BC 7C               [ 4]  525         ld      a,h
      0008BD 87               [ 4]  526         add     a,a
      0008BE 82               [ 4]  527         add     a,d
      0008BF 83               [ 4]  528         add     a,e
      0008C0 C6 8E            [ 7]  529         add     a,#142
      0008C2 CD 80 0A         [17]  530         call    outhx
      0008C5 62               [ 4]  531         ld      h,d
      0008C6 6B               [ 4]  532         ld      l,e
      0008C7 29               [11]  533         add     hl,hl
      0008C8 29               [11]  534         add     hl,hl
      0008C9 ED 5F            [ 9]  535         ld      a,r
      0008CB 87               [ 4]  536         add     a,a
      0008CC E6 C0            [ 7]  537         and     #MASK_UPPER_BITS
      0008CE 84               [ 4]  538         add     a,h
      0008CF 67               [ 4]  539         ld      h,a
      0008D0 ED 5F            [ 9]  540         ld      a,r
      0008D2 E6 03            [ 7]  541         and     #MASK_LOWER_BITS
      0008D4 85               [ 4]  542         add     a,l
      0008D5 6F               [ 4]  543         ld      l,a
      0008D6 CD 7B 0A         [17]  544         call    OUTHL
      0008D9 C9               [10]  545         ret
      0008DA                        546 decode:
      0008DA 4E               [ 7]  547         ld      c,(hl)
      0008DB 23               [ 6]  548         inc     hl
      0008DC CD E1 0A         [17]  549         call    atoh
      0008DF D8               [11]  550         ret     c
      0008E0 32 51 3D         [13]  551         ld      (prfsum),a
      0008E3 CD E1 0A         [17]  552         call    atoh
      0008E6 D8               [11]  553         ret     c
      0008E7 E6 3F            [ 7]  554         and     #MASK_CAPITAL_LETTERS
      0008E9 57               [ 4]  555         ld      d,a
      0008EA CD E1 0A         [17]  556         call    atoh
      0008ED D8               [11]  557         ret     c
      0008EE 5F               [ 4]  558         ld      e,a
      0008EF CB 3A            [ 8]  559         srl     d
      0008F1 CB 1B            [ 8]  560         rr      e
      0008F3 CB 3A            [ 8]  561         srl     d
      0008F5 CB 1B            [ 8]  562         rr      e
      0008F7 79               [ 4]  563         ld      a,c
      0008F8 87               [ 4]  564         add     a,a
      0008F9 82               [ 4]  565         add     a,d
      0008FA 83               [ 4]  566         add     a,e
      0008FB C6 8E            [ 7]  567         add     a,#142
      0008FD 21 51 3D         [10]  568         ld      hl,#prfsum
      000900 BE               [ 7]  569         cp      (hl)
      000901 D8               [11]  570         ret     c
      000902 79               [ 4]  571         ld      a,c
      000903 3D               [ 4]  572         dec     a
      000904 E6 03            [ 7]  573         and     #3
      000906 4F               [ 4]  574         ld      c,a
      000907 C9               [10]  575         ret
      000908                        576 getpuzzle:
      000908 21 F4 0A         [10]  577         ld      hl,#lvl0cnt
      00090B                        578 gp2:
      00090B 79               [ 4]  579         ld      a,c
      00090C B7               [ 4]  580         or      a
      00090D 28 0D            [12]  581         jr      z,gp1
      00090F 7E               [ 7]  582         ld      a,(hl)
      000910 23               [ 6]  583         inc     hl
      000911 46               [ 7]  584         ld      b,(hl)
      000912 23               [ 6]  585         inc     hl
      000913 E5               [11]  586         push    hl
      000914 6F               [ 4]  587         ld      l,a
      000915 60               [ 4]  588         ld      h,b
      000916 19               [11]  589         add     hl,de
      000917 EB               [ 4]  590         ex      de,hl
      000918 E1               [10]  591         pop     hl
      000919 0D               [ 4]  592         dec     c
      00091A 18 EF            [12]  593         jr      gp2
      00091C                        594 gp1:
      00091C 21 FC 0A         [10]  595         ld      hl,#puzzles
      00091F                        596 gp3:
      00091F 7A               [ 4]  597         ld      a,d
      000920 B3               [ 4]  598         or      e
      000921 C8               [11]  599         ret     z
      000922 3E FF            [ 7]  600         ld      a,#FIELD_END
      000924 ED B1            [21]  601         cpir
      000926 1B               [ 6]  602         dec     de
      000927 18 F6            [12]  603         jr      gp3
      000929                        604 unpack:
      000929 22 7D 3D         [16]  605         ld      (pptr),hl
      00092C 06 00            [ 7]  606         ld      b,#0
      00092E 11 82 3D         [10]  607         ld      de,#stones
      000931                        608 unp2:
      000931 7E               [ 7]  609         ld      a,(hl)
      000932 23               [ 6]  610         inc     hl
      000933 FE FF            [ 7]  611         cp      #FIELD_END
      000935 28 2E            [12]  612         jr      z,unp1
      000937 04               [ 4]  613         inc     b
      000938 4F               [ 4]  614         ld      c,a
      000939 3E 00            [ 7]  615         ld      a,#0
      00093B CB 11            [ 8]  616         rl      c
      00093D 17               [ 4]  617         rla
      00093E CB 11            [ 8]  618         rl      c
      000940 17               [ 4]  619         rla
      000941 CB 11            [ 8]  620         rl      c
      000943 17               [ 4]  621         rla
      000944 12               [ 7]  622         ld      (de),a
      000945 13               [ 6]  623         inc     de
      000946 3E 00            [ 7]  624         ld      a,#0
      000948 CB 11            [ 8]  625         rl      c
      00094A 17               [ 4]  626         rla
      00094B CB 11            [ 8]  627         rl      c
      00094D 17               [ 4]  628         rla
      00094E CB 11            [ 8]  629         rl      c
      000950 17               [ 4]  630         rla
      000951 12               [ 7]  631         ld      (de),a
      000952 13               [ 6]  632         inc     de
      000953 3E 00            [ 7]  633         ld      a,#0
      000955 CB 11            [ 8]  634         rl      c
      000957 17               [ 4]  635         rla
      000958 12               [ 7]  636         ld      (de),a
      000959 13               [ 6]  637         inc     de
      00095A 3E 00            [ 7]  638         ld      a,#0
      00095C CB 11            [ 8]  639         rl      c
      00095E 17               [ 4]  640         rla
      00095F C6 02            [ 7]  641         add     a,#SIZE2
      000961 12               [ 7]  642         ld      (de),a
      000962 13               [ 6]  643         inc     de
      000963 18 CC            [12]  644         jr      unp2
      000965                        645 unp1:
      000965 3E FF            [ 7]  646         ld      a,#FIELD_END
      000967 12               [ 7]  647         ld      (de),a
      000968 C9               [10]  648         ret
      000969                        649 show_mv:
      000969 2A 7B 3D         [16]  650         ld      hl,(moves)
      00096C 23               [ 6]  651         inc     hl
      00096D 22 7B 3D         [16]  652         ld      (moves),hl
      000970 11 5B EE         [10]  653         ld      de,#POSITION_MOVES
      000973 CD 96 0A         [17]  654         call    hlkon
      000976                        655 show:
      000976 06 10            [ 7]  656         ld      b,#geschafft_size+1
      000978 3E 20            [ 7]  657         ld      a,#' '
      00097A 21 91 EE         [10]  658         ld      hl,#POSITION_SUCCESS
      00097D                        659 show0:
      00097D 77               [ 7]  660         ld      (hl),a
      00097E 23               [ 6]  661         inc     hl
      00097F 10 FC            [13]  662         djnz    show0
      000981 21 E2 ED         [10]  663         ld      hl,#POSITION_FIELD
      000984 11 14 00         [10]  664         ld      de,#SCREEN_WIDTH-FIELD_SIZE
      000987 3E 20            [ 7]  665         ld      a,#' '
      000989 08               [ 4]  666         ex      af,af'
      00098A 3E 63            [ 7]  667         ld      a,#FRAME_COLOR
      00098C 08               [ 4]  668         ex      af,af'
      00098D 0E 0C            [ 7]  669         ld      c,#FIELD_SIZE
      00098F                        670 show2:
      00098F 06 0C            [ 7]  671         ld      b,#FIELD_SIZE
      000991                        672 show1:
      000891                        673         PUT_A_COLORED
      000991 77               [ 7]    1         ld      (hl),a
      000992 23               [ 6]  674         inc     hl
      000993 10 FC            [13]  675         djnz    show1
      000995 19               [11]  676         add     hl,de
      000996 0D               [ 4]  677         dec     c
      000997 20 F6            [12]  678         jr      nz,show2
      000999 3E 00            [ 7]  679         ld      a,#0
      00099B 32 81 3D         [13]  680         ld      (pcnt),a
      00099E DD 21 82 3D      [14]  681         ld      ix,#stones
      0009A2                        682 show3:
      0009A2 CD 1A 0A         [17]  683         call    show_stone
      0009A5 11 04 00         [10]  684         ld      de,#STONE_RECT_size
      0009A8 DD 19            [15]  685         add     ix,de
      0009AA DD 7E 00         [19]  686         ld      a,0(ix)
      0009AD FE FF            [ 7]  687         cp      #FIELD_END
      0009AF 20 F1            [12]  688         jr      nz,show3
      0009B1 DD 2A 7F 3D      [20]  689         ld      ix,(custone)
      0009B5 CD CC 09         [17]  690         call    calc_pos
      0009B8 E5               [11]  691         push    hl
      0009B9 21 82 3D         [10]  692         ld      hl,#stones
      0009BC ED 5B 7F 3D      [20]  693         ld      de,(custone)
      0009C0 B7               [ 4]  694         or      a
      0009C1 ED 52            [15]  695         sbc     hl,de
      0009C3 E1               [10]  696         pop     hl
      0009C4 3E C2            [ 7]  697         ld      a,#SELC
      0009C6 20 02            [12]  698         jr      nz,showcu1
      0009C8 3E C3            [ 7]  699         ld      a,#SELCR
      0009CA                        700 showcu1:
      0009CA 77               [ 7]  701         ld      (hl),a
      0009CB C9               [10]  702         ret
      0009CC                        703 calc_pos:
      0009CC DD 5E 00         [19]  704         ld      e,0(ix)
      0009CF DD 56 01         [19]  705         ld      d,1(ix)
      0009D2                        706 calc_pos0:
      0009D2 21 A2 ED         [10]  707         ld      hl,#POSITION_FIELD-2*SCREEN_WIDTH
      0009D5 01 40 00         [10]  708         ld      bc,#2*SCREEN_WIDTH
      0009D8 14               [ 4]  709         inc     d
      0009D9                        710 calc_pos1:
      0009D9 09               [11]  711         add     hl,bc
      0009DA 15               [ 4]  712         dec     d
      0009DB 20 FC            [12]  713         jr      nz,calc_pos1
      0009DD 19               [11]  714         add     hl,de
      0009DE 19               [11]  715         add     hl,de
      0009DF C9               [10]  716         ret
      0009E0                        717         STONE_GFX
      0008E0                          1 waag2:
      0009E0 02 04                    2         .db     0x02,0x04
      0009E2 C1 9E 9E 89              3         .db     0xc1,0x9e,0x9e,0x89
      0009E6 88 F8 F8 C8              4         .db     0x88,0xf8,0xf8,0xc8
      0009EA                          5 waag3:
      0009EA 02 06                    6         .db     0x02,0x06
      0009EC C1 9E 9E 9E 9E 89        7         .db     0xc1,0x9e,0x9e,0x9e,0x9e,0x89
      0009F2 88 F8 F8 F8 F8 C8        8         .db     0x88,0xf8,0xf8,0xf8,0xf8,0xc8
      0009F8                          9 senk2:
      0009F8 04 02                   10         .db     0x04,0x02
      0009FA C1 89                   11         .db     0xc1,0x89
      0009FC 9F C0                   12         .db     0x9f,0xc0
      0009FE 9F C0                   13         .db     0x9f,0xc0
      000A00 88 C8                   14         .db     0x88,0xc8
      000A02                         15 senk3:
      000A02 06 02                   16         .db     0x06,0x02
      000A04 C1 89                   17         .db     0xc1,0x89
      000A06 9F C0                   18         .db     0x9f,0xc0
      000A08 9F C0                   19         .db     0x9f,0xc0
      000A0A 9F C0                   20         .db     0x9f,0xc0
      000A0C 9F C0                   21         .db     0x9f,0xc0
      000A0E 88 C8                   22         .db     0x88,0xc8
      000A10                         23 red2:
      000A10 02 04                   24         .db     0x02,0x04
      000A12 FF FF FF FF             25         .db     0xff,0xff,0xff,0xff
      000A16 FF FF FF FF             26         .db     0xff,0xff,0xff,0xff
      000A1A                        718 show_stone:
      000A1A CD CC 09         [17]  719         call    calc_pos
      000A1D 01 20 00         [10]  720         ld      bc,#SCREEN_WIDTH
      000A20 E5               [11]  721         push    hl
      000A21 D9               [ 4]  722         exx
      000A22 E1               [10]  723         pop     hl
      000923                        724         SET_NORMAL_STONE_COLOR
      000A23 3A 81 3D         [13]  725         ld      a,(pcnt)
      000A26 B7               [ 4]  726         or      a
      000A27 20 09            [12]  727         jr      nz,show_stone1
      000A29 11 10 0A         [10]  728         ld      de,#red2
      000A2C 3C               [ 4]  729         inc     a
      000A2D 32 81 3D         [13]  730         ld      (pcnt),a
      000930                        731         SET_RED_STONE_COLOR
      000A30 18 24            [12]  732         jr      draw
      000A32                        733 show_stone1:
      000A32 DD 7E 02         [19]  734         ld      a,2(ix)
      000A35 B7               [ 4]  735         or      a
      000A36 28 0F            [12]  736         jr      z,senk
      000A38 DD 7E 03         [19]  737         ld      a,3(ix)
      000A3B FE 02            [ 7]  738         cp      #SIZE2
      000A3D 11 E0 09         [10]  739         ld      de,#waag2
      000A40 28 14            [12]  740         jr      z,draw
      000A42 11 EA 09         [10]  741         ld      de,#waag3
      000A45 18 0F            [12]  742         jr      draw
      000A47                        743 senk:
      000A47 DD 7E 03         [19]  744         ld      a,3(ix)
      000A4A FE 02            [ 7]  745         cp      #SIZE2
      000A4C 11 F8 09         [10]  746         ld      de,#senk2
      000A4F 28 05            [12]  747         jr      z,draw
      000A51 11 02 0A         [10]  748         ld      de,#senk3
      000A54 18 00            [12]  749         jr      draw
      000A56                        750 draw:
      000A56 1A               [ 7]  751         ld      a,(de)
      000A57 4F               [ 4]  752         ld      c,a
      000A58 13               [ 6]  753         inc     de
      000A59 1A               [ 7]  754         ld      a,(de)
      000A5A 47               [ 4]  755         ld      b,a
      000A5B 13               [ 6]  756         inc     de
      000A5C                        757 draw2:
      000A5C C5               [11]  758         push    bc
      000A5D                        759 draw1:
      000A5D 1A               [ 7]  760         ld      a,(de)
      000A5E 77               [ 7]  761         ld      (hl),a
      00095F                        762         SET_STONE_COLOR
      000A5F 23               [ 6]  763         inc     hl
      000A60 13               [ 6]  764         inc     de
      000A61 10 FA            [13]  765         djnz    draw1
      000A63 D9               [ 4]  766         exx
      000A64 09               [11]  767         add     hl,bc
      000A65 E5               [11]  768         push    hl
      000A66 D9               [ 4]  769         exx
      000A67 E1               [10]  770         pop     hl
      000A68 C1               [10]  771         pop     bc
      000A69 0D               [ 4]  772         dec     c
      000A6A 20 F0            [12]  773         jr      nz,draw2
      000A6C C9               [10]  774         ret
                                    775 ;COOUT:
                                    776 ; unchecked data source
      000A6D 7E FE 20 30 02 3E 20   777         .db     0x7e,0xfe,0x20,0x30,0x02,0x3e,0x20,0xcd ;~~ 0.> M
             CD
      000A75 05 F3 23 10 F3 C9      778         .db     0x05,0xf3,0x23,0x10,0xf3,0xc9           ;.s#.sI
      000A7B                        779 OUTHL:
      000A7B 7C               [ 4]  780         ld      a,h
      000A7C CD 80 0A         [17]  781         call    outhx
      000A7F 7D               [ 4]  782         ld      a,l
      000A80                        783 outhx:
      000A80 F5               [11]  784         push    af
      000A81 07               [ 4]  785         rlca
      000A82 07               [ 4]  786         rlca
      000A83 07               [ 4]  787         rlca
      000A84 07               [ 4]  788         rlca
      000A85 CD 89 0A         [17]  789         call    OUTH1
      000A88 F1               [10]  790         pop     af
      000A89                        791 OUTH1:
      000A89 E6 0F            [ 7]  792         and     #MASK_LOWER_NIBBLE
      000A8B C6 30            [ 7]  793         add     a,#'0'
      000A8D FE 3A            [ 7]  794         cp      #'9'+1
      000A8F 38 02            [12]  795         jr      c,OUTH2
      000A91 C6 07            [ 7]  796         add     a,#'F'-'A'+2
      000A93                        797 OUTH2:
      000993                        798         CALL_OUTA
      000A93 E7               [11]    1         rst     0x20
      000A94 00                       2         .db     OUTCH
      000A95 C9               [10]  799         ret
      000A96                        800 hlkon:
      000A96 C5               [11]  801         push    bc
      000A97 D5               [11]  802         push    de
      000A98 E5               [11]  803         push    hl
      000A99 01 F0 D8         [10]  804         ld      bc,#-10000
      000A9C CD B9 0A         [17]  805         call    Num1
      000A9F 01 18 FC         [10]  806         ld      bc,#-1000
      000AA2 CD B9 0A         [17]  807         call    Num1
      000AA5 01 9C FF         [10]  808         ld      bc,#-100
      000AA8 CD B9 0A         [17]  809         call    Num1
      000AAB 0E F6            [ 7]  810         ld      c,#-10
      000AAD CD B9 0A         [17]  811         call    Num1
      000AB0 0E FF            [ 7]  812         ld      c,#-1
      000AB2 CD B9 0A         [17]  813         call    Num1
      000AB5 E1               [10]  814         pop     hl
      000AB6 D1               [10]  815         pop     de
      000AB7 C1               [10]  816         pop     bc
      000AB8 C9               [10]  817         ret
      000AB9                        818 Num1:
      000AB9 3E 2F            [ 7]  819         ld      a,#'0'-1
      000ABB                        820 Num2:
      000ABB 3C               [ 4]  821         inc     a
      000ABC 09               [11]  822         add     hl,bc
      000ABD 38 FC            [12]  823         jr      c,Num2
      000ABF ED 42            [15]  824         sbc     hl,bc
      000AC1 12               [ 7]  825         ld      (de),a
      000AC2 13               [ 6]  826         inc     de
      000AC3 C9               [10]  827         ret
      000AC4                        828 prnst0:
      000AC4 E3               [19]  829         ex      (sp),hl
      000AC5                        830 PRS1:
      000AC5 7E               [ 7]  831         ld      a,(hl)
      000AC6 23               [ 6]  832         inc     hl
      000AC7 B7               [ 4]  833         or      a
      000AC8 28 04            [12]  834         jr      z,PRS2
      0009CA                        835         CALL_OUTA
      000ACA E7               [11]    1         rst     0x20
      000ACB 00                       2         .db     OUTCH
      000ACC 18 F7            [12]  836         jr      PRS1
      000ACE                        837 PRS2:
      000ACE E3               [19]  838         ex      (sp),hl
      000ACF C9               [10]  839         ret
      000AD0                        840 CNVBN:
      000AD0 D6 30            [ 7]  841         sub     #'0'
      000AD2 D8               [11]  842         ret     c
      000AD3 FE 0A            [ 7]  843         cp      #10
      000AD5 3F               [ 4]  844         ccf
      000AD6 D0               [11]  845         ret     nc
      000AD7 FE 11            [ 7]  846         cp      #'A'-'0'
      000AD9 D8               [11]  847         ret     c
      000ADA FE 17            [ 7]  848         cp      #'F'-'0'+1
      000ADC 3F               [ 4]  849         ccf
      000ADD D8               [11]  850         ret     c
      000ADE D6 07            [ 7]  851         sub     #'F'-'A'+2
      000AE0 C9               [10]  852         ret
      000AE1                        853 atoh:
      000AE1 7E               [ 7]  854         ld      a,(hl)
      000AE2 23               [ 6]  855         inc     hl
      000AE3 CD D0 0A         [17]  856         call    CNVBN
      000AE6 D8               [11]  857         ret     c
      000AE7 17               [ 4]  858         rla
      000AE8 17               [ 4]  859         rla
      000AE9 17               [ 4]  860         rla
      000AEA 17               [ 4]  861         rla
      000AEB 47               [ 4]  862         ld      b,a
      000AEC 7E               [ 7]  863         ld      a,(hl)
      000AED 23               [ 6]  864         inc     hl
      000AEE CD D0 0A         [17]  865         call    CNVBN
      000AF1 D8               [11]  866         ret     c
      000AF2 80               [ 4]  867         add     a,b
      000AF3 C9               [10]  868         ret
      000AF4                        869 lvl0cnt:
      000AF4 90 01                  870         .db     0x90,0x01
      000AF6                        871 lvl1cnt:
      000AF6 2C 01                  872         .db     0x2c,0x01
      000AF8                        873 lvl2cnt:
      000AF8 C8 00                  874         .db     0xc8,0x00
      000AFA                        875 lvl3cnt:
      000AFA 64 00                  876         .db     0x64,0x00
      000AFC                        877 puzzles:
      000AFC 0A 03 8E 17 0C 45 90   878         .db     0x0a,0x03,0x8e,0x17,0x0c,0x45,0x90,0xa1 ;.....E.!
             A1
      000B04 FF 0A 0E 56 30 44 4C   879         .db     0xff,0x0a,0x0e,0x56,0x30,0x44,0x4c,0x65 ;...V0DLe
             65
      000B0C 85 FF 0A 22 62 13 00   880         .db     0x85,0xff,0x0a,0x22,0x62,0x13,0x00,0x44 ;..."b..D
             44
      000B14 69 89 FF 0A 0E 52 56   881         .db     0x69,0x89,0xff,0x0a,0x0e,0x52,0x56,0x30 ;i....RV0
             30
      000B1C 65 85 A4 FF 0A 82 4F   882         .db     0x65,0x85,0xa4,0xff,0x0a,0x82,0x4f,0x52 ;e.$...OR
             52
      000B24 2C 41 90 A5 FF 0A 82   883         .db     0x2c,0x41,0x90,0xa5,0xff,0x0a,0x82,0x52 ;,A.%...R
             52
      000B2C 2C 41 61 84 8C FF 0A   884         .db     0x2c,0x41,0x61,0x84,0x8c,0xff,0x0a,0x0f ;,Aa.....
             0F
      000B34 52 56 00 30 60 68 A9   885         .db     0x52,0x56,0x00,0x30,0x60,0x68,0xa9,0xff ;RV.0`h).
             FF
      000B3C 0A 27 8E 13 48 69 A4   886         .db     0x0a,0x27,0x8e,0x13,0x48,0x69,0xa4,0xb0 ;.'..Hi$0
             B0
      000B44 FF 2A 03 26 86 6E 17   887         .db     0xff,0x2a,0x03,0x26,0x86,0x6e,0x17,0x05 ;.*.&.n..
             05
      000B4C 4C 61 90 A9 FF 4A 23   888         .db     0x4c,0x61,0x90,0xa9,0xff,0x4a,0x23,0x27 ;La.).J#'
             27
      000B54 4E 92 17 00 29 70 85   889         .db     0x4e,0x92,0x17,0x00,0x29,0x70,0x85,0xff ;N...)p..
             FF
      000B5C 2A 0E 4E 73 76 04 30   890         .db     0x2a,0x0e,0x4e,0x73,0x76,0x04,0x30,0x50 ;*.Nsv.0P
             50
      000B64 64 85 A4 FF 0A 42 27   891         .db     0x64,0x85,0xa4,0xff,0x0a,0x42,0x27,0x0e ;d.$..B'.
             0E
      000B6C 57 00 30 69 84 8C A4   892         .db     0x57,0x00,0x30,0x69,0x84,0x8c,0xa4,0xac ;W.0i..$,
             AC
      000B74 FF 4A 22 26 4E 16 76   893         .db     0xff,0x4a,0x22,0x26,0x4e,0x16,0x76,0x29 ;.J"&N.v)
             29
      000B7C 50 60 85 AD FF 2A 02   894         .db     0x50,0x60,0x85,0xad,0xff,0x2a,0x02,0x66 ;P`.-.*.f
             66
      000B84 0E 12 16 56 04 40 68   895         .db     0x0e,0x12,0x16,0x56,0x04,0x40,0x68,0x88 ;...V.@h.
             88
      000B8C 90 A0 A8 FF 0A 02 42   896         .db     0x90,0xa0,0xa8,0xff,0x0a,0x02,0x42,0x0f ;. (...B.
             0F
      000B94 92 44 69 80 88 A0 A8   897         .db     0x92,0x44,0x69,0x80,0x88,0xa0,0xa8,0xff ;.Di.. (.
             FF
      000B9C 0A 0E 52 10 30 40 48   898         .db     0x0a,0x0e,0x52,0x10,0x30,0x40,0x48,0x60 ;..R.0@H`
             60
      000BA4 68 89 A4 FF 0A 22 62   899         .db     0x68,0x89,0xa4,0xff,0x0a,0x22,0x62,0x46 ;h.$.."bF
             46
      000BAC 8E 72 36 76 00 10 2C   900         .db     0x8e,0x72,0x36,0x76,0x00,0x10,0x2c,0x49 ;.r6v..,I
             49
      000BB4 68 84 B0 FF 6A 06 0E   901         .db     0x68,0x84,0xb0,0xff,0x6a,0x06,0x0e,0x32 ;h.0.j..2
             32
      000BBC 92 36 10 45 6C A0 A8   902         .db     0x92,0x36,0x10,0x45,0x6c,0xa0,0xa8,0xff ;.6.El (.
             FF
      000BC4 2A 22 82 0E 4E 72 77   903         .db     0x2a,0x22,0x82,0x0e,0x4e,0x72,0x77,0x50 ;*"..NrwP
             50
      000BCC 60 88 A4 AC FF 6A 02   904         .db     0x60,0x88,0xa4,0xac,0xff,0x6a,0x02,0x42 ;`.$,.j.B
             42
      000BD4 26 66 92 77 04 0C 29   905         .db     0x26,0x66,0x92,0x77,0x04,0x0c,0x29,0x48 ;&f.w..)H
             48
      000BDC 50 6C A1 FF 2A 22 62   906         .db     0x50,0x6c,0xa1,0xff,0x2a,0x22,0x62,0x0e ;Pl!.*"b.
             0E
      000BE4 92 16 01 4C 64 6C 88   907         .db     0x92,0x16,0x01,0x4c,0x64,0x6c,0x88,0xa1 ;...Ldl.!
             A1
      000BEC FF 0A 47 52 36 76 10   908         .db     0xff,0x0a,0x47,0x52,0x36,0x76,0x10,0x20 ;..GR6v. 
             20
      000BF4 48 68 89 A0 A8 FF 6A   909         .db     0x48,0x68,0x89,0xa0,0xa8,0xff,0x6a,0x22 ;Hh. (.j"
             22
      000BFC 82 67 0E 52 57 00 10   910         .db     0x82,0x67,0x0e,0x52,0x57,0x00,0x10,0x30 ;.g.RW..0
             30
      000C04 45 8C A8 B0 FF 2A 02   911         .db     0x45,0x8c,0xa8,0xb0,0xff,0x2a,0x02,0x42 ;E.(0.*.B
             42
      000C0C 27 8E 92 96 04 68 70   912         .db     0x27,0x8e,0x92,0x96,0x04,0x68,0x70,0x80 ;'....hp.
             80
      000C14 A1 FF 4A 6E 17 21 4C   913         .db     0xa1,0xff,0x4a,0x6e,0x17,0x21,0x4c,0x70 ;!.Jn.!Lp
             70
      000C1C 81 A4 AC FF 0A 22 62   914         .db     0x81,0xa4,0xac,0xff,0x0a,0x22,0x62,0x67 ;.$,.."bg
             67
      000C24 0F 12 52 00 68 8C A9   915         .db     0x0f,0x12,0x52,0x00,0x68,0x8c,0xa9,0xff ;..R.h.).
             FF
      000C2C 0A 62 66 4E 17 00 0C   916         .db     0x0a,0x62,0x66,0x4e,0x17,0x00,0x0c,0x20 ;.bfN... 
             20
      000C34 41 70 88 90 AD FF 2A   917         .db     0x41,0x70,0x88,0x90,0xad,0xff,0x2a,0x02 ;Ap..-.*.
             02
      000C3C 42 27 8E 73 16 04 0C   918         .db     0x42,0x27,0x8e,0x73,0x16,0x04,0x0c,0x2c ;B'.s...,
             2C
      000C44 68 80 A1 FF 0A 22 62   919         .db     0x68,0x80,0xa1,0xff,0x0a,0x22,0x62,0x46 ;h.!.."bF
             46
      000C4C 0E 6E 13 00 48 70 84   920         .db     0x0e,0x6e,0x13,0x00,0x48,0x70,0x84,0xa0 ;.n..Hp. 
             A0
      000C54 FF 4A 22 82 0E 4E 96   921         .db     0xff,0x4a,0x22,0x82,0x0e,0x4e,0x96,0x50 ;.J"..N.P
             50
      000C5C 60 70 85 FF 0A 6E 56   922         .db     0x60,0x70,0x85,0xff,0x0a,0x6e,0x56,0x10 ;`p...nV.
             10
      000C64 30 44 4C 61 84 90 A5   923         .db     0x30,0x44,0x4c,0x61,0x84,0x90,0xa5,0xff ;0DLa..%.
             FF
      000C6C 0A 02 42 4F 92 96 0D   924         .db     0x0a,0x02,0x42,0x4f,0x92,0x96,0x0d,0x64 ;..BO...d
             64
      000C74 70 81 A1 FF 0A 42 82   925         .db     0x70,0x81,0xa1,0xff,0x0a,0x42,0x82,0x86 ;p.!..B..
             86
      000C7C 0F 16 56 00 20 65 88   926         .db     0x0f,0x16,0x56,0x00,0x20,0x65,0x88,0x90 ;..V. e..
             90
      000C84 A8 B0 FF 4A 22 62 06   927         .db     0xa8,0xb0,0xff,0x4a,0x22,0x62,0x06,0x46 ;(0.J"b.F
             46
      000C8C 92 16 09 28 50 6C 85   928         .db     0x92,0x16,0x09,0x28,0x50,0x6c,0x85,0xa0 ;...(Pl. 
             A0
      000C94 FF 4A 22 82 8E 72 17   929         .db     0xff,0x4a,0x22,0x82,0x8e,0x72,0x17,0x00 ;.J"..r..
             00
      000C9C 08 25 4C 60 84 B0 FF   930         .db     0x08,0x25,0x4c,0x60,0x84,0xb0,0xff,0x2a ;.%L`.0.*
             2A
      000CA4 43 26 0E 4E 73 77 50   931         .db     0x43,0x26,0x0e,0x4e,0x73,0x77,0x50,0x85 ;C&.NswP.
             85
      000CAC A0 A8 FF 0A 22 62 67   932         .db     0xa0,0xa8,0xff,0x0a,0x22,0x62,0x67,0x52 ; (.."bgR
             52
      000CB4 56 96 00 30 44 89 A9   933         .db     0x56,0x96,0x00,0x30,0x44,0x89,0xa9,0xff ;V..0D.).
             FF
      000CBC 2A 02 8E 52 57 08 10   934         .db     0x2a,0x02,0x8e,0x52,0x57,0x08,0x10,0x30 ;*..RW..0
             30
      000CC4 60 68 81 FF 2A 63 0F   935         .db     0x60,0x68,0x81,0xff,0x2a,0x63,0x0f,0x76 ;`h..*c.v
             76
      000CCC 10 40 65 84 8C A4 FF   936         .db     0x10,0x40,0x65,0x84,0x8c,0xa4,0xff,0x4a ;.@e..$.J
             4A
      000CD4 02 06 72 76 08 10 28   937         .db     0x02,0x06,0x72,0x76,0x08,0x10,0x28,0x4c ;..rv..(L
             4C
      000CDC 60 81 A0 FF 0A 23 0E   938         .db     0x60,0x81,0xa0,0xff,0x0a,0x23,0x0e,0x92 ;`. ..#..
             92
      000CE4 36 76 00 10 45 64 6C   939         .db     0x36,0x76,0x00,0x10,0x45,0x64,0x6c,0x80 ;6v..Edl.
             80
      000CEC FF 2A 02 62 4E 8E 92   940         .db     0xff,0x2a,0x02,0x62,0x4e,0x8e,0x92,0x16 ;.*.bN...
             16
      000CF4 04 0C 2C 40 70 84 A1   941         .db     0x04,0x0c,0x2c,0x40,0x70,0x84,0xa1,0xff ;..,@p.!.
             FF
      000CFC 0A 03 06 46 6E 52 17   942         .db     0x0a,0x03,0x06,0x46,0x6e,0x52,0x17,0x2c ;...FnR.,
             2C
      000D04 48 81 FF 4A 03 92 17   943         .db     0x48,0x81,0xff,0x4a,0x03,0x92,0x17,0x05 ;H..J....
             05
      000D0C 4C 6D 81 A1 FF 0A 22   944         .db     0x4c,0x6d,0x81,0xa1,0xff,0x0a,0x22,0x82 ;Lm.!..".
             82
      000D14 67 72 56 96 10 30 44   945         .db     0x67,0x72,0x56,0x96,0x10,0x30,0x44,0x4c ;grV..0DL
             4C
      000D1C 68 AC FF 0A 82 13 17   946         .db     0x68,0xac,0xff,0x0a,0x82,0x13,0x17,0x40 ;h,.....@
             40
      000D24 48 8C A4 AC FF 0A 42   947         .db     0x48,0x8c,0xa4,0xac,0xff,0x0a,0x42,0x0e ;H.$,..B.
             0E
      000D2C 36 76 00 10 20 45 64   948         .db     0x36,0x76,0x00,0x10,0x20,0x45,0x64,0x6c ;6v.. Edl
             6C
      000D34 80 FF 2A 02 42 06 6F   949         .db     0x80,0xff,0x2a,0x02,0x42,0x06,0x6f,0x96 ;..*.B.o.
             96
      000D3C 08 10 2D 70 80 A1 FF   950         .db     0x08,0x10,0x2d,0x70,0x80,0xa1,0xff,0x6a ;..-p.!.j
             6A
      000D44 22 82 07 32 09 48 60   951         .db     0x22,0x82,0x07,0x32,0x09,0x48,0x60,0xa4 ;"..2.H`$
             A4
      000D4C AC FF 0A 63 06 66 2E   952         .db     0xac,0xff,0x0a,0x63,0x06,0x66,0x2e,0x32 ;,..c.f.2
             32
      000D54 16 0C 41 69 8C A4 FF   953         .db     0x16,0x0c,0x41,0x69,0x8c,0xa4,0xff,0x0a ;..Ai.$..
             0A
      000D5C 82 06 6E 92 17 40 48   954         .db     0x82,0x06,0x6e,0x92,0x17,0x40,0x48,0x60 ;..n..@H`
             60
      000D64 70 84 A5 FF 2A 43 26   955         .db     0x70,0x84,0xa5,0xff,0x2a,0x43,0x26,0x0f ;p.%.*C&.
             0F
      000D6C 73 77 01 50 85 A5 FF   956         .db     0x73,0x77,0x01,0x50,0x85,0xa5,0xff,0x2a ;sw.P.%.*
             2A
      000D74 62 66 2E 8E 53 57 04   957         .db     0x62,0x66,0x2e,0x8e,0x53,0x57,0x04,0x0c ;bf..SW..
             0C
      000D7C 30 40 68 A4 B0 FF 2A   958         .db     0x30,0x40,0x68,0xa4,0xb0,0xff,0x2a,0x22 ;0@h$0.*"
             22
      000D84 62 86 8E 52 01 2C 65   959         .db     0x62,0x86,0x8e,0x52,0x01,0x2c,0x65,0x90 ;b..R.,e.
             90
      000D8C B0 FF 0A 06 46 8E 73   960         .db     0xb0,0xff,0x0a,0x06,0x46,0x8e,0x73,0x76 ;0...F.sv
             76
      000D94 48 50 68 A0 FF 0A 03   961         .db     0x48,0x50,0x68,0xa0,0xff,0x0a,0x03,0x26 ;HPh ...&
             26
      000D9C 86 72 77 30 48 50 61   962         .db     0x86,0x72,0x77,0x30,0x48,0x50,0x61,0xac ;.rw0HPa,
             AC
      000DA4 FF 4A 0E 92 36 21 40   963         .db     0xff,0x4a,0x0e,0x92,0x36,0x21,0x40,0x4c ;.J..6!@L
             4C
      000DAC 70 84 A5 FF 0A 62 26   964         .db     0x70,0x84,0xa5,0xff,0x0a,0x62,0x26,0x86 ;p.%..b&.
             86
      000DB4 52 16 56 00 0C 2C 48   965         .db     0x52,0x16,0x56,0x00,0x0c,0x2c,0x48,0x65 ;R.V..,He
             65
      000DBC 8C AC FF 0A 03 52 92   966         .db     0x8c,0xac,0xff,0x0a,0x03,0x52,0x92,0x17 ;.,...R..
             17
      000DC4 0C 44 60 80 A0 A8 FF   967         .db     0x0c,0x44,0x60,0x80,0xa0,0xa8,0xff,0x0a ;.D`. (..
             0A
      000DCC 03 2F 96 0D 60 70 84   968         .db     0x03,0x2f,0x96,0x0d,0x60,0x70,0x84,0xa1 ;./..`p.!
             A1
      000DD4 FF 6A 03 86 6E 92 96   969         .db     0xff,0x6a,0x03,0x86,0x6e,0x92,0x96,0x04 ;.j..n...
             04
      000DDC 0C 24 45 60 70 A8 FF   970         .db     0x0c,0x24,0x45,0x60,0x70,0xa8,0xff,0x4a ;.$E`p(.J
             4A
      000DE4 02 0F 92 04 10 24 50   971         .db     0x02,0x0f,0x92,0x04,0x10,0x24,0x50,0x6d ;.....$Pm
             6D
      000DEC 80 A0 A8 FF 0A 42 27   972         .db     0x80,0xa0,0xa8,0xff,0x0a,0x42,0x27,0x8e ;. (..B'.
             8E
      000DF4 92 17 00 0C 6D 81 FF   973         .db     0x92,0x17,0x00,0x0c,0x6d,0x81,0xff,0x0a ;....m...
             0A
      000DFC 82 8E 53 56 0D 2D 40   974         .db     0x82,0x8e,0x53,0x56,0x0d,0x2d,0x40,0x48 ;..SV.-@H
             48
      000E04 60 84 A4 B0 FF 0A 02   975         .db     0x60,0x84,0xa4,0xb0,0xff,0x0a,0x02,0x42 ;`.$0...B
             42
      000E0C 27 8E 32 56 0D 48 69   976         .db     0x27,0x8e,0x32,0x56,0x0d,0x48,0x69,0x80 ;'.2V.Hi.
             80
      000E14 B0 FF 2A 02 62 66 8E   977         .db     0xb0,0xff,0x2a,0x02,0x62,0x66,0x8e,0x73 ;0.*.bf.s
             73
      000E1C 56 04 2D 40 4C 68 A1   978         .db     0x56,0x04,0x2d,0x40,0x4c,0x68,0xa1,0xff ;V.-@Lh!.
             FF
      000E24 6A 23 0F 92 36 76 00   979         .db     0x6a,0x23,0x0f,0x92,0x36,0x76,0x00,0x44 ;j#..6v.D
             44
      000E2C 6C 80 A5 FF 0A 03 06   980         .db     0x6c,0x80,0xa5,0xff,0x0a,0x03,0x06,0x4e ;l.%....N
             4E
      000E34 8E 53 16 56 2C 44 A1   981         .db     0x8e,0x53,0x16,0x56,0x2c,0x44,0xa1,0xff ;.S.V,D!.
             FF
      000E3C 0A 22 46 6E 13 36 00   982         .db     0x0a,0x22,0x46,0x6e,0x13,0x36,0x00,0x48 ;."Fn.6.H
             48
      000E44 70 81 FF 0A 23 86 6E   983         .db     0x70,0x81,0xff,0x0a,0x23,0x86,0x6e,0x17 ;p...#.n.
             17
      000E4C 00 0C 45 64 70 90 AD   984         .db     0x00,0x0c,0x45,0x64,0x70,0x90,0xad,0xff ;..Edp.-.
             FF
      000E54 2A 63 06 2F 32 96 40   985         .db     0x2a,0x63,0x06,0x2f,0x32,0x96,0x40,0x64 ;*c./2.@d
             64
      000E5C 70 84 8C A5 FF 0A 02   986         .db     0x70,0x84,0x8c,0xa5,0xff,0x0a,0x02,0x42 ;p..%...B
             42
      000E64 26 6F 32 92 0C 48 70   987         .db     0x26,0x6f,0x32,0x92,0x0c,0x48,0x70,0x80 ;&o2..Hp.
             80
      000E6C A1 FF 0A 82 0E 53 00   988         .db     0xa1,0xff,0x0a,0x82,0x0e,0x53,0x00,0x30 ;!....S.0
             30
      000E74 40 48 60 A4 AC FF 0A   989         .db     0x40,0x48,0x60,0xa4,0xac,0xff,0x0a,0x42 ;@H`$,..B
             42
      000E7C 6F 16 56 00 20 44 4C   990         .db     0x6f,0x16,0x56,0x00,0x20,0x44,0x4c,0x64 ;o.V. DLd
             64
      000E84 90 A0 FF 2A 63 86 2E   991         .db     0x90,0xa0,0xff,0x2a,0x63,0x86,0x2e,0x16 ;. .*c...
             16
      000E8C 04 0C 40 64 6C 88 90   992         .db     0x04,0x0c,0x40,0x64,0x6c,0x88,0x90,0xa8 ;..@dl..(
             A8
      000E94 FF 0A 22 0E 4E 13 00   993         .db     0xff,0x0a,0x22,0x0e,0x4e,0x13,0x00,0x44 ;..".N..D
             44
      000E9C 80 88 A1 FF 2A 42 6E   994         .db     0x80,0x88,0xa1,0xff,0x2a,0x42,0x6e,0x17 ;..!.*Bn.
             17
      000EA4 01 20 2C 4C 64 70 80   995         .db     0x01,0x20,0x2c,0x4c,0x64,0x70,0x80,0xa0 ;. ,Ldp. 
             A0
      000EAC FF 2A 46 2E 73 20 30   996         .db     0xff,0x2a,0x46,0x2e,0x73,0x20,0x30,0x50 ;.*F.s 0P
             50
      000EB4 68 80 A1 FF 0A 42 82   997         .db     0x68,0x80,0xa1,0xff,0x0a,0x42,0x82,0x46 ;h.!..B.F
             46
      000EBC 32 00 0C 20 48 69 84   998         .db     0x32,0x00,0x0c,0x20,0x48,0x69,0x84,0xa4 ;2.. Hi.$
             A4
      000EC4 FF 0A 23 06 0E 4E 32   999         .db     0xff,0x0a,0x23,0x06,0x0e,0x4e,0x32,0x72 ;..#..N2r
             72
      000ECC 36 76 10 64 85 A4 FF  1000         .db     0x36,0x76,0x10,0x64,0x85,0xa4,0xff,0x0a ;6v.d.$..
             0A
      000ED4 23 8E 33 36 00 0C 45  1001         .db     0x23,0x8e,0x33,0x36,0x00,0x0c,0x45,0x90 ;#.36..E.
             90
      000EDC A1 FF 2A 23 26 66 8E  1002         .db     0xa1,0xff,0x2a,0x23,0x26,0x66,0x8e,0x12 ;!.*#&f..
             12
      000EE4 52 16 56 00 08 68 A1  1003         .db     0x52,0x16,0x56,0x00,0x08,0x68,0xa1,0xff ;R.V..h!.
             FF
      000EEC 0A 42 6F 36 0D 20 45  1004         .db     0x0a,0x42,0x6f,0x36,0x0d,0x20,0x45,0x64 ;.Bo6. Ed
             64
      000EF4 90 FF 0A 82 0F 53 56  1005         .db     0x90,0xff,0x0a,0x82,0x0f,0x53,0x56,0x96 ;.....SV.
             96
      000EFC 00 30 41 60 A5 FF 0A  1006         .db     0x00,0x30,0x41,0x60,0xa5,0xff,0x0a,0x63 ;.0A`%..c
             63
      000F04 0F 52 56 96 30 41 68  1007         .db     0x0f,0x52,0x56,0x96,0x30,0x41,0x68,0x88 ;.RV.0Ah.
             88
      000F0C A4 AC FF 4A 02 06 92  1008         .db     0xa4,0xac,0xff,0x4a,0x02,0x06,0x92,0x08 ;$,.J....
             08
      000F14 10 28 30 40 6C 84 A1  1009         .db     0x10,0x28,0x30,0x40,0x6c,0x84,0xa1,0xff ;.(0@l.!.
             FF
      000F1C 2A 63 0E 4E 04 30 40  1010         .db     0x2a,0x63,0x0e,0x4e,0x04,0x30,0x40,0x64 ;*c.N.0@d
             64
      000F24 70 85 A5 FF 4A 73 16  1011         .db     0x70,0x85,0xa5,0xff,0x4a,0x73,0x16,0x76 ;p.%.Js.v
             76
      000F2C 04 21 50 81 A1 FF 0A  1012         .db     0x04,0x21,0x50,0x81,0xa1,0xff,0x0a,0x02 ;.!P.!...
             02
      000F34 42 06 2F 52 37 0D 64  1013         .db     0x42,0x06,0x2f,0x52,0x37,0x0d,0x64,0x80 ;B./R7.d.
             80
      000F3C 88 FF 0A 82 86 2F 16  1014         .db     0x88,0xff,0x0a,0x82,0x86,0x2f,0x16,0x00 ;...../..
             00
      000F44 0C 41 60 A9 FF 0A 66  1015         .db     0x0c,0x41,0x60,0xa9,0xff,0x0a,0x66,0x8e ;.A`)..f.
             8E
      000F4C 53 57 00 0C 2D 41 68  1016         .db     0x53,0x57,0x00,0x0c,0x2d,0x41,0x68,0xa1 ;SW..-Ah!
             A1
      000F54 FF 0A 23 6F 32 92 17  1017         .db     0xff,0x0a,0x23,0x6f,0x32,0x92,0x17,0x00 ;..#o2...
             00
      000F5C 45 70 80 A0 FF 0A 82  1018         .db     0x45,0x70,0x80,0xa0,0xff,0x0a,0x82,0x86 ;Ep. ....
             86
      000F64 4E 53 0C 2C 41 88 A8  1019         .db     0x4e,0x53,0x0c,0x2c,0x41,0x88,0xa8,0xb0 ;NS.,A.(0
             B0
      000F6C FF 0A 52 36 0C 2C 41  1020         .db     0xff,0x0a,0x52,0x36,0x0c,0x2c,0x41,0x61 ;..R6.,Aa
             61
      000F74 84 A4 AC FF 0A 62 86  1021         .db     0x84,0xa4,0xac,0xff,0x0a,0x62,0x86,0x33 ;.$,..b.3
             33
      000F7C 0D 40 48 64 8C A9 FF  1022         .db     0x0d,0x40,0x48,0x64,0x8c,0xa9,0xff,0x2a ;.@Hd.).*
             2A
      000F84 82 06 4E 8E 76 08 2C  1023         .db     0x82,0x06,0x4e,0x8e,0x76,0x08,0x2c,0x40 ;..N.v.,@
             40
      000F8C 50 61 84 B0 FF 0A 22  1024         .db     0x50,0x61,0x84,0xb0,0xff,0x0a,0x22,0x62 ;Pa.0.."b
             62
      000F94 6F 13 16 56 00 48 64  1025         .db     0x6f,0x13,0x16,0x56,0x00,0x48,0x64,0x90 ;o..V.Hd.
             90
      000F9C B0 FF 2A 0F 76 04 20  1026         .db     0xb0,0xff,0x2a,0x0f,0x76,0x04,0x20,0x50 ;0.*.v. P
             50
      000FA4 64 6C 85 A5 FF 0A 23  1027         .db     0x64,0x6c,0x85,0xa5,0xff,0x0a,0x23,0x6f ;dl.%..#o
             6F
      000FAC 32 00 0C 45 70 80 A0  1028         .db     0x32,0x00,0x0c,0x45,0x70,0x80,0xa0,0xb0 ;2..Ep. 0
             B0
      000FB4 FF 0A 22 62 2E 8E 12  1029         .db     0xff,0x0a,0x22,0x62,0x2e,0x8e,0x12,0x52 ;.."b...R
             52
      000FBC 00 65 90 A0 FF 4A 42  1030         .db     0x00,0x65,0x90,0xa0,0xff,0x4a,0x42,0x82 ;.e. .JB.
             82
      000FC4 47 12 77 20 28 4D A4  1031         .db     0x47,0x12,0x77,0x20,0x28,0x4d,0xa4,0xac ;G.w (M$,
             AC
      000FCC FF 0A 63 86 6E 53 00  1032         .db     0xff,0x0a,0x63,0x86,0x6e,0x53,0x00,0x2c ;..c.nS.,
             2C
      000FD4 48 64 A8 B0 FF 6A 02  1033         .db     0x48,0x64,0xa8,0xb0,0xff,0x6a,0x02,0x42 ;Hd(0.j.B
             42
      000FDC 8E 36 76 0D 25 44 6C  1034         .db     0x8e,0x36,0x76,0x0d,0x25,0x44,0x6c,0x80 ;.6v.%Dl.
             80
      000FE4 A1 FF 2A 0F 16 76 01  1035         .db     0xa1,0xff,0x2a,0x0f,0x16,0x76,0x01,0x50 ;!.*..v.P
             50
      000FEC 64 6C 85 FF 2A 22 86  1036         .db     0x64,0x6c,0x85,0xff,0x2a,0x22,0x86,0x2f ;dl..*"./
             2F
      000FF4 12 72 77 50 61 AC FF  1037         .db     0x12,0x72,0x77,0x50,0x61,0xac,0xff,0x0a ;.rwPa,..
             0A
      000FFC 02 0F 52 56 10 30 60  1038         .db     0x02,0x0f,0x52,0x56,0x10,0x30,0x60,0x68 ;..RV.0`h
             68
      001004 A1 FF 2A 42 2E 73 77  1039         .db     0xa1,0xff,0x2a,0x42,0x2e,0x73,0x77,0x04 ;!.*B.sw.
             04
      00100C 20 30 50 64 80 A0 FF  1040         .db     0x20,0x30,0x50,0x64,0x80,0xa0,0xff,0x0a ; 0Pd. ..
             0A
      001014 42 6F 32 92 57 00 0C  1041         .db     0x42,0x6f,0x32,0x92,0x57,0x00,0x0c,0x20 ;Bo2.W.. 
             20
      00101C 48 64 81 A1 FF 0A 66  1042         .db     0x48,0x64,0x81,0xa1,0xff,0x0a,0x66,0x0f ;Hd.!..f.
             0F
      001024 73 77 30 44 68 A0 A8  1043         .db     0x73,0x77,0x30,0x44,0x68,0xa0,0xa8,0xff ;sw0Dh (.
             FF
      00102C 0A 22 62 27 8E 52 16  1044         .db     0x0a,0x22,0x62,0x27,0x8e,0x52,0x16,0x56 ;."b'.R.V
             56
      001034 00 2C 48 68 84 B0 FF  1045         .db     0x00,0x2c,0x48,0x68,0x84,0xb0,0xff,0x2a ;.,Hh.0.*
             2A
      00103C 63 4F 56 96 00 08 2D  1046         .db     0x63,0x4f,0x56,0x96,0x00,0x08,0x2d,0x40 ;cOV...-@
             40
      001044 64 A5 FF 2A 0F 72 76  1047         .db     0x64,0xa5,0xff,0x2a,0x0f,0x72,0x76,0x01 ;d%.*.rv.
             01
      00104C 50 60 68 A5 FF 2A 06  1048         .db     0x50,0x60,0x68,0xa5,0xff,0x2a,0x06,0x4f ;P`h%.*.O
             4F
      001054 92 36 08 10 2C 40 70  1049         .db     0x92,0x36,0x08,0x10,0x2c,0x40,0x70,0xa5 ;.6..,@p%
             A5
      00105C FF 4A 82 26 0F 73 77  1050         .db     0xff,0x4a,0x82,0x26,0x0f,0x73,0x77,0x00 ;.J.&.sw.
             00
      001064 30 50 60 84 A5 FF 2A  1051         .db     0x30,0x50,0x60,0x84,0xa5,0xff,0x2a,0x23 ;0P`.%.*#
             23
      00106C 46 2F 92 50 70 85 A0  1052         .db     0x46,0x2f,0x92,0x50,0x70,0x85,0xa0,0xa8 ;F/.Pp. (
             A8
      001074 FF 4A 42 82 0E 72 00  1053         .db     0xff,0x4a,0x42,0x82,0x0e,0x72,0x00,0x21 ;.JB..r.!
             21
      00107C 4C 85 A5 FF 0A 43 47  1054         .db     0x4c,0x85,0xa5,0xff,0x0a,0x43,0x47,0x0e ;L.%..CG.
             0E
      001084 53 20 30 48 88 A4 AC  1055         .db     0x53,0x20,0x30,0x48,0x88,0xa4,0xac,0xff ;S 0H.$,.
             FF
      00108C 0A 03 06 4F 92 0D 2C  1056         .db     0x0a,0x03,0x06,0x4f,0x92,0x0d,0x2c,0x70 ;...O..,p
             70
      001094 81 A4 FF 6A 82 16 76  1057         .db     0x81,0xa4,0xff,0x6a,0x82,0x16,0x76,0x21 ;.$.j..v!
             21
      00109C 44 50 60 6C A8 B0 FF  1058         .db     0x44,0x50,0x60,0x6c,0xa8,0xb0,0xff,0x2a ;DP`l(0.*
             2A
      0010A4 03 06 86 0E 37 10 4C  1059         .db     0x03,0x06,0x86,0x0e,0x37,0x10,0x4c,0x61 ;....7.La
             61
      0010AC 88 A8 B0 FF 4A 62 06  1060         .db     0x88,0xa8,0xb0,0xff,0x4a,0x62,0x06,0x52 ;.(0.Jb.R
             52
      0010B4 92 08 29 40 84 A1 FF  1061         .db     0x92,0x08,0x29,0x40,0x84,0xa1,0xff,0x0a ;..)@.!..
             0A
      0010BC 03 8E 57 2D 44 4C 81  1062         .db     0x03,0x8e,0x57,0x2d,0x44,0x4c,0x81,0xb0 ;..W-DL.0
             B0
      0010C4 FF 0A 42 6F 32 0D 20  1063         .db     0xff,0x0a,0x42,0x6f,0x32,0x0d,0x20,0x45 ;..Bo2. E
             45
      0010CC 90 A1 FF 6A 42 82 0E  1064         .db     0x90,0xa1,0xff,0x6a,0x42,0x82,0x0e,0x6e ;.!.jB..n
             6E
      0010D4 32 36 96 01 45 70 A5  1065         .db     0x32,0x36,0x96,0x01,0x45,0x70,0xa5,0xff ;26..Ep%.
             FF
      0010DC 0A 22 26 32 72 00 0C  1066         .db     0x0a,0x22,0x26,0x32,0x72,0x00,0x0c,0x48 ;."&2r..H
             48
      0010E4 60 68 A0 FF 0A 82 06  1067         .db     0x60,0x68,0xa0,0xff,0x0a,0x82,0x06,0x8e ;`h .....
             8E
      0010EC 53 16 56 0C 2C 40 48  1068         .db     0x53,0x16,0x56,0x0c,0x2c,0x40,0x48,0x60 ;S.V.,@H`
             60
      0010F4 84 A4 B0 FF 0A 42 82  1069         .db     0x84,0xa4,0xb0,0xff,0x0a,0x42,0x82,0x86 ;.$0..B..
             86
      0010FC 16 56 20 45 65 88 90  1070         .db     0x16,0x56,0x20,0x45,0x65,0x88,0x90,0xa8 ;.V Ee..(
             A8
      001104 B0 FF 4A 82 0F 52 92  1071         .db     0xb0,0xff,0x4a,0x82,0x0f,0x52,0x92,0x56 ;0.J..R.V
             56
      00110C 96 30 60 85 FF 0A 47  1072         .db     0x96,0x30,0x60,0x85,0xff,0x0a,0x47,0x0f ;.0`...G.
             0F
      001114 52 56 00 30 68 88 90  1073         .db     0x52,0x56,0x00,0x30,0x68,0x88,0x90,0xa9 ;RV.0h..)
             A9
      00111C FF 0A 62 06 2E 6E 33  1074         .db     0xff,0x0a,0x62,0x06,0x2e,0x6e,0x33,0x16 ;..b..n3.
             16
      001124 0C 41 90 A9 FF 2A 42  1075         .db     0x0c,0x41,0x90,0xa9,0xff,0x2a,0x42,0x27 ;.A.).*B'
             27
      00112C 8E 92 17 4C 69 81 A1  1076         .db     0x8e,0x92,0x17,0x4c,0x69,0x81,0xa1,0xff ;...Li.!.
             FF
      001134 0A 03 06 2E 37 0D 44  1077         .db     0x0a,0x03,0x06,0x2e,0x37,0x0d,0x44,0x60 ;....7.D`
             60
      00113C 68 FF 0A 42 66 32 00  1078         .db     0x68,0xff,0x0a,0x42,0x66,0x32,0x00,0x0c ;h..Bf2..
             0C
      001144 20 45 6C 8C A4 AC FF  1079         .db     0x20,0x45,0x6c,0x8c,0xa4,0xac,0xff,0x0a ; El.$,..
             0A
      00114C 42 82 46 86 12 72 16  1080         .db     0x42,0x82,0x46,0x86,0x12,0x72,0x16,0x56 ;B.F..r.V
             56
      001154 00 20 49 68 88 AC FF  1081         .db     0x00,0x20,0x49,0x68,0x88,0xac,0xff,0x4a ;. Ih.,.J
             4A
      00115C 2E 73 16 76 00 08 21  1082         .db     0x2e,0x73,0x16,0x76,0x00,0x08,0x21,0x50 ;.s.v..!P
             50
      001164 85 A4 FF 0A 03 06 0E  1083         .db     0x85,0xa4,0xff,0x0a,0x03,0x06,0x0e,0x8e ;.$......
             8E
      00116C 52 56 30 45 60 90 A0  1084         .db     0x52,0x56,0x30,0x45,0x60,0x90,0xa0,0xff ;RV0E`. .
             FF
      001174 2A 66 92 17 40 4C 6D  1085         .db     0x2a,0x66,0x92,0x17,0x40,0x4c,0x6d,0x88 ;*f..@Lm.
             88
      00117C A1 FF 2A 43 86 6E 76  1086         .db     0xa1,0xff,0x2a,0x43,0x86,0x6e,0x76,0x01 ;!.*C.nv.
             01
      001184 20 2C 4D 64 A8 B0 FF  1087         .db     0x20,0x2c,0x4d,0x64,0xa8,0xb0,0xff,0x0a ; ,Md(0..
             0A
      00118C 22 62 8E 53 56 96 00  1088         .db     0x22,0x62,0x8e,0x53,0x56,0x96,0x00,0x30 ;"b.SV..0
             30
      001194 44 68 A1 FF 0A 43 8E  1089         .db     0x44,0x68,0xa1,0xff,0x0a,0x43,0x8e,0x32 ;Dh!..C.2
             32
      00119C 16 56 00 20 45 68 84  1090         .db     0x16,0x56,0x00,0x20,0x45,0x68,0x84,0x90 ;.V. Eh..
             90
      0011A4 A0 FF 0A 43 92 0C 20  1091         .db     0xa0,0xff,0x0a,0x43,0x92,0x0c,0x20,0x44 ; ..C.. D
             44
      0011AC 4C 6C 84 A0 A8 FF 0A  1092         .db     0x4c,0x6c,0x84,0xa0,0xa8,0xff,0x0a,0x47 ;Ll. (..G
             47
      0011B4 0F 12 52 16 00 68 8C  1093         .db     0x0f,0x12,0x52,0x16,0x00,0x68,0x8c,0xa9 ;..R..h.)
             A9
      0011BC FF 6A 22 2E 12 96 00  1094         .db     0xff,0x6a,0x22,0x2e,0x12,0x96,0x00,0x08 ;.j".....
             08
      0011C4 24 44 50 6D 8C A1 FF  1095         .db     0x24,0x44,0x50,0x6d,0x8c,0xa1,0xff,0x4a ;$DPm.!.J
             4A
      0011CC 03 06 73 57 28 4C 81  1096         .db     0x03,0x06,0x73,0x57,0x28,0x4c,0x81,0xa0 ;..sW(L. 
             A0
      0011D4 A8 FF 6A 22 86 4F 12  1097         .db     0xa8,0xff,0x6a,0x22,0x86,0x4f,0x12,0x16 ;(.j".O..
             16
      0011DC 56 00 08 44 60 90 A8  1098         .db     0x56,0x00,0x08,0x44,0x60,0x90,0xa8,0xb0 ;V..D`.(0
             B0
      0011E4 FF 0A 22 62 8E 56 00  1099         .db     0xff,0x0a,0x22,0x62,0x8e,0x56,0x00,0x2d ;.."b.V.-
             2D
      0011EC 48 65 90 A0 FF 2A 43  1100         .db     0x48,0x65,0x90,0xa0,0xff,0x2a,0x43,0x2e ;He. .*C.
             2E
      0011F4 73 77 04 0C 20 50 64  1101         .db     0x73,0x77,0x04,0x0c,0x20,0x50,0x64,0x88 ;sw.. Pd.
             88
      0011FC A0 FF 0A 03 6E 52 92  1102         .db     0xa0,0xff,0x0a,0x03,0x6e,0x52,0x92,0x76 ; ...nR.v
             76
      001204 0D 2C 48 81 A1 FF 6A  1103         .db     0x0d,0x2c,0x48,0x81,0xa1,0xff,0x6a,0x02 ;.,H.!.j.
             02
      00120C 82 66 2E 6E 32 92 36  1104         .db     0x82,0x66,0x2e,0x6e,0x32,0x92,0x36,0x96 ;.f.n2.6.
             96
      001214 41 70 A5 FF 4A 02 46  1105         .db     0x41,0x70,0xa5,0xff,0x4a,0x02,0x46,0x0f ;Ap%.J.F.
             0F
      00121C 32 92 96 10 24 6C 80  1106         .db     0x32,0x92,0x96,0x10,0x24,0x6c,0x80,0xa1 ;2...$l.!
             A1
      001224 FF 0A 22 2E 6E 52 92  1107         .db     0xff,0x0a,0x22,0x2e,0x6e,0x52,0x92,0x56 ;..".nR.V
             56
      00122C 96 0D 30 44 84 A5 FF  1108         .db     0x96,0x0d,0x30,0x44,0x84,0xa5,0xff,0x4a ;..0D.%.J
             4A
      001234 03 6E 17 05 4C 70 81  1109         .db     0x03,0x6e,0x17,0x05,0x4c,0x70,0x81,0xa5 ;.n..Lp.%
             A5
      00123C FF 6A 42 0F 32 96 00  1110         .db     0xff,0x6a,0x42,0x0f,0x32,0x96,0x00,0x10 ;.jB.2...
             10
      001244 20 44 6D 80 A1 FF 2A  1111         .db     0x20,0x44,0x6d,0x80,0xa1,0xff,0x2a,0x22 ; Dm.!.*"
             22
      00124C 07 4E 72 16 08 2C 50  1112         .db     0x07,0x4e,0x72,0x16,0x08,0x2c,0x50,0x85 ;.Nr..,P.
             85
      001254 FF 0A 42 8E 32 72 16  1113         .db     0xff,0x0a,0x42,0x8e,0x32,0x72,0x16,0x56 ;..B.2r.V
             56
      00125C 20 48 65 80 B0 FF 0A  1114         .db     0x20,0x48,0x65,0x80,0xb0,0xff,0x0a,0x43 ; He.0..C
             43
      001264 47 0E 32 72 10 20 48  1115         .db     0x47,0x0e,0x32,0x72,0x10,0x20,0x48,0x68 ;G.2r. Hh
             68
      00126C 88 FF 2A 02 2E 73 16  1116         .db     0x88,0xff,0x2a,0x02,0x2e,0x73,0x16,0x04 ;..*..s..
             04
      001274 0C 50 65 80 A0 A8 FF  1117         .db     0x0c,0x50,0x65,0x80,0xa0,0xa8,0xff,0x4a ;.Pe. (.J
             4A
      00127C 02 42 06 46 4F 92 96  1118         .db     0x02,0x42,0x06,0x46,0x4f,0x92,0x96,0x08 ;.B.FO...
             08
      001284 10 28 70 80 A1 FF 0A  1119         .db     0x10,0x28,0x70,0x80,0xa1,0xff,0x0a,0x62 ;.(p.!..b
             62
      00128C 8E 32 37 0D 20 40 48  1120         .db     0x8e,0x32,0x37,0x0d,0x20,0x40,0x48,0x64 ;.27. @Hd
             64
      001294 6C 84 A0 FF 0A 63 4E  1121         .db     0x6c,0x84,0xa0,0xff,0x0a,0x63,0x4e,0x53 ;l. ..cNS
             53
      00129C 57 0D 2D 41 64 88 A9  1122         .db     0x57,0x0d,0x2d,0x41,0x64,0x88,0xa9,0xff ;W.-Ad.).
             FF
      0012A4 4A 02 86 0E 92 37 04  1123         .db     0x4a,0x02,0x86,0x0e,0x92,0x37,0x04,0x10 ;J....7..
             10
      0012AC 24 60 6C 88 FF 0A 63  1124         .db     0x24,0x60,0x6c,0x88,0xff,0x0a,0x63,0x86 ;$`l...c.
             86
      0012B4 2E 16 0C 41 64 6C 88  1125         .db     0x2e,0x16,0x0c,0x41,0x64,0x6c,0x88,0x90 ;...Adl..
             90
      0012BC A8 FF 0A 42 27 6E 13  1126         .db     0xa8,0xff,0x0a,0x42,0x27,0x6e,0x13,0x16 ;(..B'n..
             16
      0012C4 96 00 48 70 84 A5 FF  1127         .db     0x96,0x00,0x48,0x70,0x84,0xa5,0xff,0x4a ;..Hp.%.J
             4A
      0012CC 02 82 06 4F 52 16 56  1128         .db     0x02,0x82,0x06,0x4f,0x52,0x16,0x56,0x09 ;...OR.V.
             09
      0012D4 29 40 84 A5 FF 4A 0E  1129         .db     0x29,0x40,0x84,0xa5,0xff,0x4a,0x0e,0x72 ;)@.%.J.r
             72
      0012DC 36 76 21 4C 60 85 A4  1130         .db     0x36,0x76,0x21,0x4c,0x60,0x85,0xa4,0xb0 ;6v!L`.$0
             B0
      0012E4 FF 0A 82 06 0F 32 92  1131         .db     0xff,0x0a,0x82,0x06,0x0f,0x32,0x92,0x36 ;.....2.6
             36
      0012EC 96 41 88 A5 FF 0A 43  1132         .db     0x96,0x41,0x88,0xa5,0xff,0x0a,0x43,0x46 ;.A.%..CF
             46
      0012F4 0E 52 92 77 00 10 20  1133         .db     0x0e,0x52,0x92,0x77,0x00,0x10,0x20,0x30 ;.R.w.. 0
             30
      0012FC 48 84 A1 FF 0A 23 46  1134         .db     0x48,0x84,0xa1,0xff,0x0a,0x23,0x46,0x2f ;H.!..#F/
             2F
      001304 16 96 00 0C 70 81 A4  1135         .db     0x16,0x96,0x00,0x0c,0x70,0x81,0xa4,0xff ;....p.$.
             FF
      00130C 0A 22 82 86 16 56 00  1136         .db     0x0a,0x22,0x82,0x86,0x16,0x56,0x00,0x45 ;."...V.E
             45
      001314 61 88 90 A8 B0 FF 2A  1137         .db     0x61,0x88,0x90,0xa8,0xb0,0xff,0x2a,0x02 ;a..(0.*.
             02
      00131C 82 67 2E 6E 13 96 05  1138         .db     0x82,0x67,0x2e,0x6e,0x13,0x96,0x05,0x40 ;.g.n...@
             40
      001324 70 A9 FF 2A 22 26 4E  1139         .db     0x70,0xa9,0xff,0x2a,0x22,0x26,0x4e,0x73 ;p).*"&Ns
             73
      00132C 77 2C 50 64 85 A1 FF  1140         .db     0x77,0x2c,0x50,0x64,0x85,0xa1,0xff,0x2a ;w,Pd.!.*
             2A
      001334 42 82 0F 72 20 50 68  1141         .db     0x42,0x82,0x0f,0x72,0x20,0x50,0x68,0x88 ;B..r Ph.
             88
      00133C A4 AC FF 0A 62 2E 6E  1142         .db     0xa4,0xac,0xff,0x0a,0x62,0x2e,0x6e,0x16 ;$,..b.n.
             16
      001344 0C 41 70 90 A5 FF 0A  1143         .db     0x0c,0x41,0x70,0x90,0xa5,0xff,0x0a,0x82 ;.Ap.%...
             82
      00134C 26 72 77 48 50 60 68  1144         .db     0x26,0x72,0x77,0x48,0x50,0x60,0x68,0x85 ;&rwHP`h.
             85
      001354 A4 AC FF 0A 23 6E 52  1145         .db     0xa4,0xac,0xff,0x0a,0x23,0x6e,0x52,0x92 ;$,..#nR.
             92
      00135C 00 0C 48 81 A0 A8 FF  1146         .db     0x00,0x0c,0x48,0x81,0xa0,0xa8,0xff,0x0a ;..H. (..
             0A
      001364 82 8E 53 2D 40 48 60  1147         .db     0x82,0x8e,0x53,0x2d,0x40,0x48,0x60,0xa4 ;..S-@H`$
             A4
      00136C B0 FF 2A 02 67 2E 96  1148         .db     0xb0,0xff,0x2a,0x02,0x67,0x2e,0x96,0x05 ;0.*.g...
             05
      001374 40 50 6D 89 A9 FF 0A  1149         .db     0x40,0x50,0x6d,0x89,0xa9,0xff,0x0a,0x03 ;@Pm.)...
             03
      00137C 07 8E 57 2D 48 81 A4  1150         .db     0x07,0x8e,0x57,0x2d,0x48,0x81,0xa4,0xb0 ;..W-H.$0
             B0
      001384 FF 4A 22 0E 73 17 24  1151         .db     0xff,0x4a,0x22,0x0e,0x73,0x17,0x24,0x4c ;.J".s.$L
             4C
      00138C 60 80 88 A1 FF 0A 66  1152         .db     0x60,0x80,0x88,0xa1,0xff,0x0a,0x66,0x0e ;`..!..f.
             0E
      001394 00 20 44 4C 68 70 A0  1153         .db     0x00,0x20,0x44,0x4c,0x68,0x70,0xa0,0xa8 ;. DLhp (
             A8
      00139C FF 2A 62 8E 12 52 16  1154         .db     0xff,0x2a,0x62,0x8e,0x12,0x52,0x16,0x56 ;.*b..R.V
             56
      0013A4 01 40 65 90 A0 FF 2A  1155         .db     0x01,0x40,0x65,0x90,0xa0,0xff,0x2a,0x03 ;.@e. .*.
             03
      0013AC 06 46 72 56 96 30 4C  1156         .db     0x06,0x46,0x72,0x56,0x96,0x30,0x4c,0x81 ;.FrV.0L.
             81
      0013B4 A0 A8 FF 0A 22 62 4E  1157         .db     0xa0,0xa8,0xff,0x0a,0x22,0x62,0x4e,0x92 ; (.."bN.
             92
      0013BC 36 96 0D 2C 70 85 A1  1158         .db     0x36,0x96,0x0d,0x2c,0x70,0x85,0xa1,0xff ;6..,p.!.
             FF
      0013C4 0A 22 62 26 0F 16 76  1159         .db     0x0a,0x22,0x62,0x26,0x0f,0x16,0x76,0x00 ;."b&..v.
             00
      0013CC 50 85 A4 FF 0A 66 2E  1160         .db     0x50,0x85,0xa4,0xff,0x0a,0x66,0x2e,0x00 ;P.$..f..
             00
      0013D4 0C 20 41 68 70 A0 A8  1161         .db     0x0c,0x20,0x41,0x68,0x70,0xa0,0xa8,0xff ;. Ahp (.
             FF
      0013DC 2A 22 82 26 86 6E 17  1162         .db     0x2a,0x22,0x82,0x26,0x86,0x6e,0x17,0x01 ;*".&.n..
             01
      0013E4 2C 4C 60 90 A8 B0 FF  1163         .db     0x2c,0x4c,0x60,0x90,0xa8,0xb0,0xff,0x0a ;,L`.(0..
             0A
      0013EC 42 46 8E 20 49 69 81  1164         .db     0x42,0x46,0x8e,0x20,0x49,0x69,0x81,0xa1 ;BF. Ii.!
             A1
      0013F4 FF 0A 62 66 2F 96 0C  1165         .db     0xff,0x0a,0x62,0x66,0x2f,0x96,0x0c,0x20 ;..bf/.. 
             20
      0013FC 30 41 70 88 A0 FF 0A  1166         .db     0x30,0x41,0x70,0x88,0xa0,0xff,0x0a,0x03 ;0Ap. ...
             03
      001404 66 92 17 44 4C 6D 88  1167         .db     0x66,0x92,0x17,0x44,0x4c,0x6d,0x88,0xa1 ;f..DLm.!
             A1
      00140C FF 0A 23 86 2F 12 77  1168         .db     0xff,0x0a,0x23,0x86,0x2f,0x12,0x77,0x00 ;..#./.w.
             00
      001414 50 64 88 A9 FF 0A 0E  1169         .db     0x50,0x64,0x88,0xa9,0xff,0x0a,0x0e,0x52 ;Pd.)...R
             52
      00141C 56 30 44 60 68 84 8C  1170         .db     0x56,0x30,0x44,0x60,0x68,0x84,0x8c,0xa9 ;V0D`h..)
             A9
      001424 FF 0A 02 52 57 0D 30  1171         .db     0xff,0x0a,0x02,0x52,0x57,0x0d,0x30,0x61 ;...RW.0a
             61
      00142C 89 A9 FF 0A 06 46 0E  1172         .db     0x89,0xa9,0xff,0x0a,0x06,0x46,0x0e,0x32 ;.)...F.2
             32
      001434 92 56 96 10 48 6C 80  1173         .db     0x92,0x56,0x96,0x10,0x48,0x6c,0x80,0xa1 ;.V..Hl.!
             A1
      00143C FF 0A 22 62 27 6E 33  1174         .db     0xff,0x0a,0x22,0x62,0x27,0x6e,0x33,0x16 ;.."b'n3.
             16
      001444 56 00 0C 48 90 FF 0A  1175         .db     0x56,0x00,0x0c,0x48,0x90,0xff,0x0a,0x42 ;V..H...B
             42
      00144C 82 37 0D 20 45 64 88  1176         .db     0x82,0x37,0x0d,0x20,0x45,0x64,0x88,0x90 ;.7. Ed..
             90
      001454 AD FF 0A 06 46 8E 13  1177         .db     0xad,0xff,0x0a,0x06,0x46,0x8e,0x13,0x16 ;-...F...
             16
      00145C 56 48 81 A4 B0 FF 4A  1178         .db     0x56,0x48,0x81,0xa4,0xb0,0xff,0x4a,0x22 ;VH.$0.J"
             22
      001464 0E 73 16 01 24 4C 85  1179         .db     0x0e,0x73,0x16,0x01,0x24,0x4c,0x85,0xa0 ;.s..$L. 
             A0
      00146C A8 FF 0A 22 82 46 8E  1180         .db     0xa8,0xff,0x0a,0x22,0x82,0x46,0x8e,0x72 ;(..".F.r
             72
      001474 57 00 2D 49 68 84 B0  1181         .db     0x57,0x00,0x2d,0x49,0x68,0x84,0xb0,0xff ;W.-Ih.0.
             FF
      00147C 4A 22 82 26 0E 4E 01  1182         .db     0x4a,0x22,0x82,0x26,0x0e,0x4e,0x01,0x50 ;J".&.N.P
             50
      001484 60 84 8C A5 FF 0A 63  1183         .db     0x60,0x84,0x8c,0xa5,0xff,0x0a,0x63,0x0f ;`..%..c.
             0F
      00148C 52 56 96 00 10 30 41  1184         .db     0x52,0x56,0x96,0x00,0x10,0x30,0x41,0x68 ;RV...0Ah
             68
      001494 A4 AC FF 0A 02 42 06  1185         .db     0xa4,0xac,0xff,0x0a,0x02,0x42,0x06,0x46 ;$,...B.F
             46
      00149C 8E 32 72 37 0D 68 80  1186         .db     0x8e,0x32,0x72,0x37,0x0d,0x68,0x80,0xa1 ;.2r7.h.!
             A1
      0014A4 FF 4A 02 0E 6E 72 36  1187         .db     0xff,0x4a,0x02,0x0e,0x6e,0x72,0x36,0x04 ;.J..nr6.
             04
      0014AC 10 24 4C 60 81 FF 2A  1188         .db     0x10,0x24,0x4c,0x60,0x81,0xff,0x2a,0x02 ;.$L`..*.
             02
      0014B4 2F 72 16 76 04 0C 50  1189         .db     0x2f,0x72,0x16,0x76,0x04,0x0c,0x50,0x61 ;/r.v..Pa
             61
      0014BC A4 FF 0A 03 67 6E 52  1190         .db     0xa4,0xff,0x0a,0x03,0x67,0x6e,0x52,0x17 ;$...gnR.
             17
      0014C4 2C 45 90 AD FF 0A 22  1191         .db     0x2c,0x45,0x90,0xad,0xff,0x0a,0x22,0x26 ;,E.-.."&
             26
      0014CC 86 0E 33 36 76 10 48  1192         .db     0x86,0x0e,0x33,0x36,0x76,0x10,0x48,0x61 ;..36v.Ha
             61
      0014D4 88 A8 B0 FF 0A 42 6F  1193         .db     0x88,0xa8,0xb0,0xff,0x0a,0x42,0x6f,0x13 ;.(0..Bo.
             13
      0014DC 36 20 45 64 80 B0 FF  1194         .db     0x36,0x20,0x45,0x64,0x80,0xb0,0xff,0x4a ;6 Ed.0.J
             4A
      0014E4 82 12 16 56 00 21 60  1195         .db     0x82,0x12,0x16,0x56,0x00,0x21,0x60,0x88 ;...V.!`.
             88
      0014EC 90 AD FF 0A 63 46 86  1196         .db     0x90,0xad,0xff,0x0a,0x63,0x46,0x86,0x2f ;.-..cF./
             2F
      0014F4 77 00 0C 20 50 A9 FF  1197         .db     0x77,0x00,0x0c,0x20,0x50,0xa9,0xff,0x0a ;w.. P)..
             0A
      0014FC 07 96 10 48 50 61 81  1198         .db     0x07,0x96,0x10,0x48,0x50,0x61,0x81,0xa0 ;...HPa. 
             A0
      001504 A8 FF 0A 46 0F 72 00  1199         .db     0xa8,0xff,0x0a,0x46,0x0f,0x72,0x00,0x20 ;(..F.r. 
             20
      00150C 50 68 85 A4 FF 4A 62  1200         .db     0x50,0x68,0x85,0xa4,0xff,0x4a,0x62,0x4e ;Ph.$.JbN
             4E
      001514 36 96 04 20 28 40 70  1201         .db     0x36,0x96,0x04,0x20,0x28,0x40,0x70,0x85 ;6.. (@p.
             85
      00151C A5 FF 0A 03 2E 6E 73  1202         .db     0xa5,0xff,0x0a,0x03,0x2e,0x6e,0x73,0x56 ;%....nsV
             56
      001524 0D 44 61 A0 A8 FF 2A  1203         .db     0x0d,0x44,0x61,0xa0,0xa8,0xff,0x2a,0x42 ;.Da (.*B
             42
      00152C 82 46 86 0E 12 52 37  1204         .db     0x82,0x46,0x86,0x0e,0x12,0x52,0x37,0x01 ;.F...R7.
             01
      001534 20 68 8C FF 0A 82 06  1205         .db     0x20,0x68,0x8c,0xff,0x0a,0x82,0x06,0x6e ; h.....n
             6E
      00153C 13 40 48 70 A4 AC FF  1206         .db     0x13,0x40,0x48,0x70,0xa4,0xac,0xff,0x4a ;.@Hp$,.J
             4A
      001544 82 0E 4E 13 96 24 40  1207         .db     0x82,0x0e,0x4e,0x13,0x96,0x24,0x40,0x60 ;..N..$@`
             60
      00154C 70 85 A8 FF 6A 06 46  1208         .db     0x70,0x85,0xa8,0xff,0x6a,0x06,0x46,0x32 ;p.(.j.F2
             32
      001554 96 0C 28 48 6D 80 A1  1209         .db     0x96,0x0c,0x28,0x48,0x6d,0x80,0xa1,0xff ;..(Hm.!.
             FF
      00155C 4A 23 06 46 4F 92 96  1210         .db     0x4a,0x23,0x06,0x46,0x4f,0x92,0x96,0x08 ;J#.FO...
             08
      001564 10 28 70 80 A1 FF 2A  1211         .db     0x10,0x28,0x70,0x80,0xa1,0xff,0x2a,0x63 ;.(p.!.*c
             63
      00156C 0F 32 37 40 64 6C 84  1212         .db     0x0f,0x32,0x37,0x40,0x64,0x6c,0x84,0x8c ;.27@dl..
             8C
      001574 A5 FF 4A 22 82 06 0E  1213         .db     0xa5,0xff,0x4a,0x22,0x82,0x06,0x0e,0x4e ;%.J"...N
             4E
      00157C 12 96 60 70 85 A8 FF  1214         .db     0x12,0x96,0x60,0x70,0x85,0xa8,0xff,0x0a ;..`p.(..
             0A
      001584 63 32 36 76 10 20 41  1215         .db     0x63,0x32,0x36,0x76,0x10,0x20,0x41,0x6c ;c26v. Al
             6C
      00158C 8C A4 AC FF 2A 62 6F  1216         .db     0x8c,0xa4,0xac,0xff,0x2a,0x62,0x6f,0x12 ;.$,.*bo.
             12
      001594 17 01 40 4C 64 A0 B0  1217         .db     0x17,0x01,0x40,0x4c,0x64,0xa0,0xb0,0xff ;..@Ld 0.
             FF
      00159C 4A 02 42 26 72 16 76  1218         .db     0x4a,0x02,0x42,0x26,0x72,0x16,0x76,0x05 ;J.B&r.v.
             05
      0015A4 29 50 81 AD FF 0A 63  1219         .db     0x29,0x50,0x81,0xad,0xff,0x0a,0x63,0x86 ;)P.-..c.
             86
      0015AC 32 36 76 10 20 41 6C  1220         .db     0x32,0x36,0x76,0x10,0x20,0x41,0x6c,0x8c ;26v. Al.
             8C
      0015B4 A8 B0 FF 0A 42 86 8E  1221         .db     0xa8,0xb0,0xff,0x0a,0x42,0x86,0x8e,0x52 ;(0..B..R
             52
      0015BC 16 56 00 2C 65 B0 FF  1222         .db     0x16,0x56,0x00,0x2c,0x65,0xb0,0xff,0x2a ;.V.,e0.*
             2A
      0015C4 03 86 4E 16 04 2C 50  1223         .db     0x03,0x86,0x4e,0x16,0x04,0x2c,0x50,0x61 ;..N..,Pa
             61
      0015CC 88 A8 B0 FF 4A 02 86  1224         .db     0x88,0xa8,0xb0,0xff,0x4a,0x02,0x86,0x0e ;.(0.J...
             0E
      0015D4 92 37 24 40 60 6C 88  1225         .db     0x92,0x37,0x24,0x40,0x60,0x6c,0x88,0xff ;.7$@`l..
             FF
      0015DC 0A 22 16 56 00 44 4C  1226         .db     0x0a,0x22,0x16,0x56,0x00,0x44,0x4c,0x60 ;.".V.DL`
             60
      0015E4 68 80 88 A4 FF 0A 42  1227         .db     0x68,0x80,0x88,0xa4,0xff,0x0a,0x42,0x0e ;h..$..B.
             0E
      0015EC 6E 73 20 44 4C 64 80  1228         .db     0x6e,0x73,0x20,0x44,0x4c,0x64,0x80,0xa0 ;ns DLd. 
             A0
      0015F4 FF 0A 03 86 6E 52 17  1229         .db     0xff,0x0a,0x03,0x86,0x6e,0x52,0x17,0x2c ;....nR.,
             2C
      0015FC 45 60 90 A8 B0 FF 0A  1230         .db     0x45,0x60,0x90,0xa8,0xb0,0xff,0x0a,0x22 ;E`.(0.."
             22
      001604 6F 52 16 00 0C 2C 45  1231         .db     0x6f,0x52,0x16,0x00,0x0c,0x2c,0x45,0x90 ;oR...,E.
             90
      00160C A1 FF 0A 22 62 86 53  1232         .db     0xa1,0xff,0x0a,0x22,0x62,0x86,0x53,0x00 ;!.."b.S.
             00
      001614 2C 45 64 A9 FF 0A 06  1233         .db     0x2c,0x45,0x64,0xa9,0xff,0x0a,0x06,0x46 ;,Ed)...F
             46
      00161C 0F 77 10 69 A0 A8 FF  1234         .db     0x0f,0x77,0x10,0x69,0xa0,0xa8,0xff,0x4a ;.w.i (.J
             4A
      001624 02 62 67 92 17 05 40  1235         .db     0x02,0x62,0x67,0x92,0x17,0x05,0x40,0x6d ;.bg...@m
             6D
      00162C 88 A8 FF 0A 42 0F 16  1236         .db     0x88,0xa8,0xff,0x0a,0x42,0x0f,0x16,0x00 ;.(..B...
             00
      001634 20 44 50 64 6C 80 88  1237         .db     0x20,0x44,0x50,0x64,0x6c,0x80,0x88,0xff ; DPdl...
             FF
      00163C 0A 22 0E 8E 56 00 30  1238         .db     0x0a,0x22,0x0e,0x8e,0x56,0x00,0x30,0x44 ;."..V.0D
             44
      001644 4C 60 68 80 B0 FF 2A  1239         .db     0x4c,0x60,0x68,0x80,0xb0,0xff,0x2a,0x02 ;L`h.0.*.
             02
      00164C 52 04 2C 40 60 68 80  1240         .db     0x52,0x04,0x2c,0x40,0x60,0x68,0x80,0xa1 ;R.,@`h.!
             A1
      001654 FF 4A 02 46 4E 92 16  1241         .db     0xff,0x4a,0x02,0x46,0x4e,0x92,0x16,0x24 ;.J.FN..$
             24
      00165C 2C 70 85 FF 4A 02 0E  1242         .db     0x2c,0x70,0x85,0xff,0x4a,0x02,0x0e,0x92 ;,p..J...
             92
      001664 04 24 60 6C A1 FF 2A  1243         .db     0x04,0x24,0x60,0x6c,0xa1,0xff,0x2a,0x02 ;.$`l!.*.
             02
      00166C 42 27 8E 53 16 04 0C  1244         .db     0x42,0x27,0x8e,0x53,0x16,0x04,0x0c,0x2c ;B'.S...,
             2C
      001674 68 80 A0 FF 0A 46 0F  1245         .db     0x68,0x80,0xa0,0xff,0x0a,0x46,0x0f,0x53 ;h. ..F.S
             53
      00167C 57 10 20 68 81 A0 A8  1246         .db     0x57,0x10,0x20,0x68,0x81,0xa0,0xa8,0xff ;W. h. (.
             FF
      001684 2A 63 0F 57 40 64 84  1247         .db     0x2a,0x63,0x0f,0x57,0x40,0x64,0x84,0x8c ;*c.W@d..
             8C
      00168C A5 FF 2A 02 07 73 36  1248         .db     0xa5,0xff,0x2a,0x02,0x07,0x73,0x36,0x76 ;%.*..s6v
             76
      001694 08 10 4C 81 A0 FF 4A  1249         .db     0x08,0x10,0x4c,0x81,0xa0,0xff,0x4a,0x82 ;..L. .J.
             82
      00169C 0F 16 76 04 24 50 60  1250         .db     0x0f,0x16,0x76,0x04,0x24,0x50,0x60,0x6c ;..v.$P`l
             6C
      0016A4 85 A8 FF 0A 22 82 27  1251         .db     0x85,0xa8,0xff,0x0a,0x22,0x82,0x27,0x0e ;.(..".'.
             0E
      0016AC 8E 12 37 00 49 68 84  1252         .db     0x8e,0x12,0x37,0x00,0x49,0x68,0x84,0xb0 ;..7.Ih.0
             B0
      0016B4 FF 2A 43 6F 20 2C 4D  1253         .db     0xff,0x2a,0x43,0x6f,0x20,0x2c,0x4d,0x64 ;.*Co ,Md
             64
      0016BC 84 90 A0 B0 FF 6A 22  1254         .db     0x84,0x90,0xa0,0xb0,0xff,0x6a,0x22,0x86 ;.. 0.j".
             86
      0016C4 17 25 44 4C 60 8D A8  1255         .db     0x17,0x25,0x44,0x4c,0x60,0x8d,0xa8,0xb0 ;.%DL`.(0
             B0
      0016CC FF 2A 42 46 17 01 20  1256         .db     0xff,0x2a,0x42,0x46,0x17,0x01,0x20,0x68 ;.*BF.. h
             68
      0016D4 70 80 88 A0 FF 4A 26  1257         .db     0x70,0x80,0x88,0xa0,0xff,0x4a,0x26,0x6e ;p.. .J&n
             6E
      0016DC 57 04 0C 28 30 4C 81  1258         .db     0x57,0x04,0x0c,0x28,0x30,0x4c,0x81,0xff ;W..(0L..
             FF
      0016E4 6A 02 27 0E 52 56 96  1259         .db     0x6a,0x02,0x27,0x0e,0x52,0x56,0x96,0x04 ;j.'.RV..
             04
      0016EC 10 30 48 80 A1 FF 2A  1260         .db     0x10,0x30,0x48,0x80,0xa1,0xff,0x2a,0x63 ;.0H.!.*c
             63
      0016F4 06 2E 6E 17 08 40 70  1261         .db     0x06,0x2e,0x6e,0x17,0x08,0x40,0x70,0x84 ;..n..@p.
             84
      0016FC 90 A5 FF 0A 03 26 6F  1262         .db     0x90,0xa5,0xff,0x0a,0x03,0x26,0x6f,0x57 ;.%...&oW
             57
      001704 0D 2D 49 60 80 B0 FF  1263         .db     0x0d,0x2d,0x49,0x60,0x80,0xb0,0xff,0x0a ;.-I`.0..
             0A
      00170C 82 06 4E 8E 52 16 2C  1264         .db     0x82,0x06,0x4e,0x8e,0x52,0x16,0x2c,0x41 ;..N.R.,A
             41
      001714 60 90 A4 B0 FF 4A 46  1265         .db     0x60,0x90,0xa4,0xb0,0xff,0x4a,0x46,0x92 ;`.$0.JF.
             92
      00171C 36 76 0D 21 6C 81 A1  1266         .db     0x36,0x76,0x0d,0x21,0x6c,0x81,0xa1,0xff ;6v.!l.!.
             FF
      001724 4A 22 82 4E 73 76 25  1267         .db     0x4a,0x22,0x82,0x4e,0x73,0x76,0x25,0x50 ;J".Nsv%P
             50
      00172C 60 85 A5 FF 0A 42 46  1268         .db     0x60,0x85,0xa5,0xff,0x0a,0x42,0x46,0x20 ;`.%..BF 
             20
      001734 68 70 80 88 A0 FF 0A  1269         .db     0x68,0x70,0x80,0x88,0xa0,0xff,0x0a,0x62 ;hp.. ..b
             62
      00173C 66 4E 8E 16 0C 2C 41  1270         .db     0x66,0x4e,0x8e,0x16,0x0c,0x2c,0x41,0x90 ;fN...,A.
             90
      001744 A4 B0 FF 6A 22 86 12  1271         .db     0xa4,0xb0,0xff,0x6a,0x22,0x86,0x12,0x52 ;$0.j"..R
             52
      00174C 16 01 44 60 8C A8 B0  1272         .db     0x16,0x01,0x44,0x60,0x8c,0xa8,0xb0,0xff ;..D`.(0.
             FF
      001754 0A 06 0E 4E 52 92 56  1273         .db     0x0a,0x06,0x0e,0x4e,0x52,0x92,0x56,0x96 ;...NR.V.
             96
      00175C 10 30 85 A4 FF 0A 22  1274         .db     0x10,0x30,0x85,0xa4,0xff,0x0a,0x22,0x26 ;.0.$.."&
             26
      001764 66 0E 53 00 30 48 68  1275         .db     0x66,0x0e,0x53,0x00,0x30,0x48,0x68,0x88 ;f.S.0Hh.
             88
      00176C A0 FF 0A 82 86 13 20  1276         .db     0xa0,0xff,0x0a,0x82,0x86,0x13,0x20,0x41 ; ..... A
             41
      001774 8C A8 B0 FF 0A 42 82  1277         .db     0x8c,0xa8,0xb0,0xff,0x0a,0x42,0x82,0x4e ;.(0..B.N
             4E
      00177C 32 16 0C 20 44 70 89  1278         .db     0x32,0x16,0x0c,0x20,0x44,0x70,0x89,0xff ;2.. Dp..
             FF
      001784 0A 42 82 06 86 4F 36  1279         .db     0x0a,0x42,0x82,0x06,0x86,0x4f,0x36,0x96 ;.B...O6.
             96
      00178C 10 2C 44 70 A9 FF 0A  1280         .db     0x10,0x2c,0x44,0x70,0xa9,0xff,0x0a,0x02 ;.,Dp)...
             02
      001794 42 8E 52 92 36 76 0C  1281         .db     0x42,0x8e,0x52,0x92,0x36,0x76,0x0c,0x2c ;B.R.6v.,
             2C
      00179C 48 68 81 A1 FF 2A 02  1282         .db     0x48,0x68,0x81,0xa1,0xff,0x2a,0x02,0x62 ;Hh.!.*.b
             62
      0017A4 2F 12 96 40 50 70 85  1283         .db     0x2f,0x12,0x96,0x40,0x50,0x70,0x85,0xa4 ;/..@Pp.$
             A4
      0017AC AC FF 0A 42 16 20 44  1284         .db     0xac,0xff,0x0a,0x42,0x16,0x20,0x44,0x4c ;,..B. DL
             4C
      0017B4 64 6C 80 A0 A8 FF 4A  1285         .db     0x64,0x6c,0x80,0xa0,0xa8,0xff,0x4a,0x02 ;dl. (.J.
             02
      0017BC 06 92 36 08 10 29 4C  1286         .db     0x06,0x92,0x36,0x08,0x10,0x29,0x4c,0x70 ;..6..)Lp
             70
      0017C4 81 A0 FF 4A 82 0F 53  1287         .db     0x81,0xa0,0xff,0x4a,0x82,0x0f,0x53,0x56 ;. .J..SV
             56
      0017CC 96 30 60 85 A4 FF 0A  1288         .db     0x96,0x30,0x60,0x85,0xa4,0xff,0x0a,0x43 ;.0`.$..C
             43
      0017D4 67 32 0D 20 45 6C 8C  1289         .db     0x67,0x32,0x0d,0x20,0x45,0x6c,0x8c,0xa9 ;g2. El.)
             A9
      0017DC FF 0A 42 0E 20 44 4C  1290         .db     0xff,0x0a,0x42,0x0e,0x20,0x44,0x4c,0x80 ;..B. DL.
             80
      0017E4 88 A0 A8 FF 0A 63 2E  1291         .db     0x88,0xa0,0xa8,0xff,0x0a,0x63,0x2e,0x53 ;. (..c.S
             53
      0017EC 57 00 0C 30 41 68 A4  1292         .db     0x57,0x00,0x0c,0x30,0x41,0x68,0xa4,0xac ;W..0Ah$,
             AC
      0017F4 FF 0A 23 8E 33 00 0C  1293         .db     0xff,0x0a,0x23,0x8e,0x33,0x00,0x0c,0x45 ;..#.3..E
             45
      0017FC 68 90 A0 FF 4A 02 0F  1294         .db     0x68,0x90,0xa0,0xff,0x4a,0x02,0x0f,0x92 ;h. .J...
             92
      001804 37 24 60 6C 80 A1 FF  1295         .db     0x37,0x24,0x60,0x6c,0x80,0xa1,0xff,0x4a ;7$`l.!.J
             4A
      00180C 2F 72 16 00 08 21 50  1296         .db     0x2f,0x72,0x16,0x00,0x08,0x21,0x50,0x85 ;/r...!P.
             85
      001814 A4 FF 0A 22 66 2E 73  1297         .db     0xa4,0xff,0x0a,0x22,0x66,0x2e,0x73,0x56 ;$.."f.sV
             56
      00181C 96 0D 30 44 68 88 A1  1298         .db     0x96,0x0d,0x30,0x44,0x68,0x88,0xa1,0xff ;..0Dh.!.
             FF
      001824 0A 43 0E 32 72 36 10  1299         .db     0x0a,0x43,0x0e,0x32,0x72,0x36,0x10,0x20 ;.C.2r6. 
             20
      00182C 44 64 88 A0 FF 0A 82  1300         .db     0x44,0x64,0x88,0xa0,0xff,0x0a,0x82,0x2f ;Dd. .../
             2F
      001834 52 57 0D 20 30 41 88  1301         .db     0x52,0x57,0x0d,0x20,0x30,0x41,0x88,0xa5 ;RW. 0A.%
             A5
      00183C FF 0A 03 06 2E 77 0D  1302         .db     0xff,0x0a,0x03,0x06,0x2e,0x77,0x0d,0x44 ;.....w.D
             44
      001844 60 68 A0 FF 2A 63 06  1303         .db     0x60,0x68,0xa0,0xff,0x2a,0x63,0x06,0x86 ;`h .*c..
             86
      00184C 52 56 96 08 10 2D 40  1304         .db     0x52,0x56,0x96,0x08,0x10,0x2d,0x40,0x64 ;RV...-@d
             64
      001854 A9 FF 2A 02 42 26 6E  1305         .db     0xa9,0xff,0x2a,0x02,0x42,0x26,0x6e,0x92 ;).*.B&n.
             92
      00185C 36 96 04 4C 70 81 A4  1306         .db     0x36,0x96,0x04,0x4c,0x70,0x81,0xa4,0xff ;6..Lp.$.
             FF
      001864 6A 03 06 66 2E 92 77  1307         .db     0x6a,0x03,0x06,0x66,0x2e,0x92,0x77,0x09 ;j..f..w.
             09
      00186C 30 44 6C A1 FF 2A 02  1308         .db     0x30,0x44,0x6c,0xa1,0xff,0x2a,0x02,0x42 ;0Dl!.*.B
             42
      001874 07 73 16 56 09 4C 64  1309         .db     0x07,0x73,0x16,0x56,0x09,0x4c,0x64,0x80 ;.s.V.Ld.
             80
      00187C FF 4A 42 06 46 4F 36  1310         .db     0xff,0x4a,0x42,0x06,0x46,0x4f,0x36,0x96 ;.JB.FO6.
             96
      001884 08 10 70 81 FF 0A 42  1311         .db     0x08,0x10,0x70,0x81,0xff,0x0a,0x42,0x0f ;..p...B.
             0F
      00188C 53 56 10 20 44 65 81  1312         .db     0x53,0x56,0x10,0x20,0x44,0x65,0x81,0xa0 ;SV. De. 
             A0
      001894 A8 FF 4A 0F 72 16 76  1313         .db     0xa8,0xff,0x4a,0x0f,0x72,0x16,0x76,0x01 ;(.J.r.v.
             01
      00189C 24 50 85 FF 0A 42 0E  1314         .db     0x24,0x50,0x85,0xff,0x0a,0x42,0x0e,0x00 ;$P...B..
             00
      0018A4 10 20 44 64 6C 80 88  1315         .db     0x10,0x20,0x44,0x64,0x6c,0x80,0x88,0xa0 ;. Ddl.. 
             A0
      0018AC FF 0A 82 2E 8E 16 0C  1316         .db     0xff,0x0a,0x82,0x2e,0x8e,0x16,0x0c,0x41 ;.......A
             41
      0018B4 60 68 90 A4 FF 0A 22  1317         .db     0x60,0x68,0x90,0xa4,0xff,0x0a,0x22,0x76 ;`h.$.."v
             76
      0018BC 00 2D 48 50 60 68 81  1318         .db     0x00,0x2d,0x48,0x50,0x60,0x68,0x81,0xa0 ;.-HP`h. 
             A0
      0018C4 A8 FF 0A 23 67 52 57  1319         .db     0xa8,0xff,0x0a,0x23,0x67,0x52,0x57,0x00 ;(..#gRW.
             00
      0018CC 0C 2D 45 68 8C AD FF  1320         .db     0x0c,0x2d,0x45,0x68,0x8c,0xad,0xff,0x0a ;.-Eh.-..
             0A
      0018D4 23 0E 4E 53 57 00 30  1321         .db     0x23,0x0e,0x4e,0x53,0x57,0x00,0x30,0x64 ;#.NSW.0d
             64
      0018DC 85 A5 FF 0A 43 0E 6E  1322         .db     0x85,0xa5,0xff,0x0a,0x43,0x0e,0x6e,0x32 ;.%..C.n2
             32
      0018E4 17 20 45 90 A0 A8 FF  1323         .db     0x17,0x20,0x45,0x90,0xa0,0xa8,0xff,0x2a ;. E. (.*
             2A
      0018EC 63 0E 4E 04 10 20 40  1324         .db     0x63,0x0e,0x4e,0x04,0x10,0x20,0x40,0x64 ;c.N.. @d
             64
      0018F4 84 8C A5 FF 6A 02 42  1325         .db     0x84,0x8c,0xa5,0xff,0x6a,0x02,0x42,0x27 ;..%.j.B'
             27
      0018FC 0E 6E 92 17 04 48 70  1326         .db     0x0e,0x6e,0x92,0x17,0x04,0x48,0x70,0xa5 ;.n...Hp%
             A5
      001904 FF 2A 22 62 0F 73 77  1327         .db     0xff,0x2a,0x22,0x62,0x0f,0x73,0x77,0x50 ;.*"b.swP
             50
      00190C 85 A5 FF 4A 82 0E 16  1328         .db     0x85,0xa5,0xff,0x4a,0x82,0x0e,0x16,0x56 ;.%.J...V
             56
      001914 01 21 60 88 90 AD FF  1329         .db     0x01,0x21,0x60,0x88,0x90,0xad,0xff,0x2a ;.!`..-.*
             2A
      00191C 42 82 2E 8E 12 52 16  1330         .db     0x42,0x82,0x2e,0x8e,0x12,0x52,0x16,0x56 ;B....R.V
             56
      001924 05 20 68 90 B0 FF 2A  1331         .db     0x05,0x20,0x68,0x90,0xb0,0xff,0x2a,0x02 ;. h.0.*.
             02
      00192C 42 07 2E 52 92 56 96  1332         .db     0x42,0x07,0x2e,0x52,0x92,0x56,0x96,0x08 ;B..R.V..
             08
      001934 10 30 81 FF 0A 03 66  1333         .db     0x10,0x30,0x81,0xff,0x0a,0x03,0x66,0x6f ;.0....fo
             6F
      00193C 36 0D 2C 45 90 A0 FF  1334         .db     0x36,0x0d,0x2c,0x45,0x90,0xa0,0xff,0x2a ;6.,E. .*
             2A
      001944 42 0E 92 77 01 20 4D  1335         .db     0x42,0x0e,0x92,0x77,0x01,0x20,0x4d,0x64 ;B..w. Md
             64
      00194C 6C A0 FF 0A 22 62 46  1336         .db     0x6c,0xa0,0xff,0x0a,0x22,0x62,0x46,0x86 ;l .."bF.
             86
      001954 53 77 00 2C 48 88 A9  1337         .db     0x53,0x77,0x00,0x2c,0x48,0x88,0xa9,0xff ;Sw.,H.).
             FF
      00195C 2A 02 42 06 86 2F 72  1338         .db     0x2a,0x02,0x42,0x06,0x86,0x2f,0x72,0x16 ;*.B../r.
             16
      001964 76 09 50 64 88 AC FF  1339         .db     0x76,0x09,0x50,0x64,0x88,0xac,0xff,0x0a ;v.Pd.,..
             0A
      00196C 02 42 52 2C 45 64 81  1340         .db     0x02,0x42,0x52,0x2c,0x45,0x64,0x81,0xa0 ;.BR,Ed. 
             A0
      001974 FF 0A 42 46 0F 57 10  1341         .db     0xff,0x0a,0x42,0x46,0x0f,0x57,0x10,0x20 ;..BF.W. 
             20
      00197C 69 81 A0 A8 FF 6A 22  1342         .db     0x69,0x81,0xa0,0xa8,0xff,0x6a,0x22,0x86 ;i. (.j".
             86
      001984 0F 76 01 30 44 50 60  1343         .db     0x0f,0x76,0x01,0x30,0x44,0x50,0x60,0x8c ;.v.0DP`.
             8C
      00198C A8 B0 FF 0A 22 62 0F  1344         .db     0xa8,0xb0,0xff,0x0a,0x22,0x62,0x0f,0x92 ;(0.."b..
             92
      001994 44 50 65 88 A0 FF 2A  1345         .db     0x44,0x50,0x65,0x88,0xa0,0xff,0x2a,0x66 ;DPe. .*f
             66
      00199C 8E 92 36 40 4C 68 70  1346         .db     0x8e,0x92,0x36,0x40,0x4c,0x68,0x70,0xa1 ;..6@Lhp!
             A1
      0019A4 FF 2A 02 42 6F 12 36  1347         .db     0xff,0x2a,0x02,0x42,0x6f,0x12,0x36,0x05 ;.*.Bo.6.
             05
      0019AC 4C 64 80 90 A1 FF 4A  1348         .db     0x4c,0x64,0x80,0x90,0xa1,0xff,0x4a,0x03 ;Ld..!.J.
             03
      0019B4 73 04 24 2C 4C 81 A0  1349         .db     0x73,0x04,0x24,0x2c,0x4c,0x81,0xa0,0xa8 ;s.$,L. (
             A8
      0019BC FF 4A 06 46 12 96 28  1350         .db     0xff,0x4a,0x06,0x46,0x12,0x96,0x28,0x4d ;.J.F..(M
             4D
      0019C4 70 81 A0 A8 FF 2A 62  1351         .db     0x70,0x81,0xa0,0xa8,0xff,0x2a,0x62,0x2e ;p. (.*b.
             2E
      0019CC 8E 32 16 56 04 0C 20  1352         .db     0x8e,0x32,0x16,0x56,0x04,0x0c,0x20,0x40 ;.2.V.. @
             40
      0019D4 65 84 B0 FF 2A 62 66  1353         .db     0x65,0x84,0xb0,0xff,0x2a,0x62,0x66,0x52 ;e.0.*bfR
             52
      0019DC 92 16 56 01 2C 40 68  1354         .db     0x92,0x16,0x56,0x01,0x2c,0x40,0x68,0xa0 ;..V.,@h 
             A0
      0019E4 A8 FF 0A 03 92 17 0C  1355         .db     0xa8,0xff,0x0a,0x03,0x92,0x17,0x0c,0x44 ;(......D
             44
      0019EC 4C 80 A0 A8 FF 0A 42  1356         .db     0x4c,0x80,0xa0,0xa8,0xff,0x0a,0x42,0x26 ;L. (..B&
             26
      0019F4 6F 92 17 00 0C 2C 49  1357         .db     0x6f,0x92,0x17,0x00,0x0c,0x2c,0x49,0x64 ;o....,Id
             64
      0019FC 84 A1 FF 0A 42 82 46  1358         .db     0x84,0xa1,0xff,0x0a,0x42,0x82,0x46,0x86 ;.!..B.F.
             86
      001A04 12 72 36 00 20 49 68  1359         .db     0x12,0x72,0x36,0x00,0x20,0x49,0x68,0x88 ;.r6. Ih.
             88
      001A0C AC FF 2A 03 72 56 04  1360         .db     0xac,0xff,0x2a,0x03,0x72,0x56,0x04,0x0c ;,.*.rV..
             0C
      001A14 30 4C 61 81 A1 FF 0A  1361         .db     0x30,0x4c,0x61,0x81,0xa1,0xff,0x0a,0x82 ;0La.!...
             82
      001A1C 4F 00 0C 2D 41 60 70  1362         .db     0x4f,0x00,0x0c,0x2d,0x41,0x60,0x70,0x84 ;O..-A`p.
             84
      001A24 90 A5 FF 0A 02 07 0E  1363         .db     0x90,0xa5,0xff,0x0a,0x02,0x07,0x0e,0x32 ;.%.....2
             32
      001A2C 57 10 48 84 8C A4 B0  1364         .db     0x57,0x10,0x48,0x84,0x8c,0xa4,0xb0,0xff ;W.H..$0.
             FF
      001A34 4A 03 86 2F 13 05 60  1365         .db     0x4a,0x03,0x86,0x2f,0x13,0x05,0x60,0x70 ;J../..`p
             70
      001A3C 88 90 A9 FF 0A 23 6E  1366         .db     0x88,0x90,0xa9,0xff,0x0a,0x23,0x6e,0x13 ;..)..#n.
             13
      001A44 17 00 45 70 90 A0 FF  1367         .db     0x17,0x00,0x45,0x70,0x90,0xa0,0xff,0x2a ;..Ep. .*
             2A
      001A4C 63 4E 53 56 01 2D 40  1368         .db     0x63,0x4e,0x53,0x56,0x01,0x2d,0x40,0x64 ;cNSV.-@d
             64
      001A54 84 A4 AC FF 0A 23 06  1369         .db     0x84,0xa4,0xac,0xff,0x0a,0x23,0x06,0x46 ;.$,..#.F
             46
      001A5C 8E 32 72 16 56 0C 68  1370         .db     0x8e,0x32,0x72,0x16,0x56,0x0c,0x68,0x80 ;.2r.V.h.
             80
      001A64 A1 FF 0A 02 42 06 6E  1371         .db     0xa1,0xff,0x0a,0x02,0x42,0x06,0x6e,0x32 ;!...B.n2
             32
      001A6C 17 45 64 80 90 AD FF  1372         .db     0x17,0x45,0x64,0x80,0x90,0xad,0xff,0x4a ;.Ed..-.J
             4A
      001A74 02 06 32 92 77 08 10  1373         .db     0x02,0x06,0x32,0x92,0x77,0x08,0x10,0x28 ;..2.w..(
             28
      001A7C 40 6C A1 FF 2A 43 06  1374         .db     0x40,0x6c,0xa1,0xff,0x2a,0x43,0x06,0x2f ;@l!.*C./
             2F
      001A84 72 76 08 50 85 A5 FF  1375         .db     0x72,0x76,0x08,0x50,0x85,0xa5,0xff,0x4a ;rv.P.%.J
             4A
      001A8C 42 82 0E 92 16 00 21  1376         .db     0x42,0x82,0x0e,0x92,0x16,0x00,0x21,0x6c ;B.....!l
             6C
      001A94 88 A5 FF 2A 03 06 46  1377         .db     0x88,0xa5,0xff,0x2a,0x03,0x06,0x46,0x72 ;.%.*..Fr
             72
      001A9C 16 09 50 81 A0 A8 FF  1378         .db     0x16,0x09,0x50,0x81,0xa0,0xa8,0xff,0x2a ;..P. (.*
             2A
      001AA4 02 42 2E 8E 53 16 04  1379         .db     0x02,0x42,0x2e,0x8e,0x53,0x16,0x04,0x0c ;.B..S...
             0C
      001AAC 65 80 A0 B0 FF 0A 26  1380         .db     0x65,0x80,0xa0,0xb0,0xff,0x0a,0x26,0x66 ;e. 0..&f
             66
      001AB4 0E 52 57 00 30 48 68  1381         .db     0x0e,0x52,0x57,0x00,0x30,0x48,0x68,0x8c ;.RW.0Hh.
             8C
      001ABC AD FF 2A 43 0F 73 77  1382         .db     0xad,0xff,0x2a,0x43,0x0f,0x73,0x77,0x50 ;-.*C.swP
             50
      001AC4 68 85 A8 FF 4A 02 42  1383         .db     0x68,0x85,0xa8,0xff,0x4a,0x02,0x42,0x07 ;h.(.J.B.
             07
      001ACC 12 96 08 28 6D 81 A0  1384         .db     0x12,0x96,0x08,0x28,0x6d,0x81,0xa0,0xa8 ;...(m. (
             A8
      001AD4 FF 2A 43 4F 16 76 01  1385         .db     0xff,0x2a,0x43,0x4f,0x16,0x76,0x01,0x20 ;.*CO.v. 
             20
      001ADC 2C 50 64 A0 FF 0A 22  1386         .db     0x2c,0x50,0x64,0xa0,0xff,0x0a,0x22,0x62 ;,Pd .."b
             62
      001AE4 0E 6E 33 37 00 10 45  1387         .db     0x0e,0x6e,0x33,0x37,0x00,0x10,0x45,0x84 ;.n37..E.
             84
      001AEC A9 FF 2A 62 06 2F 72  1388         .db     0xa9,0xff,0x2a,0x62,0x06,0x2f,0x72,0x56 ;).*b./rV
             56
      001AF4 96 08 10 30 85 A4 FF  1389         .db     0x96,0x08,0x10,0x30,0x85,0xa4,0xff,0x0a ;...0.$..
             0A
      001AFC 42 82 46 32 37 00 10  1390         .db     0x42,0x82,0x46,0x32,0x37,0x00,0x10,0x20 ;B.F27.. 
             20
      001B04 48 69 84 FF 0A 02 62  1391         .db     0x48,0x69,0x84,0xff,0x0a,0x02,0x62,0x86 ;Hi....b.
             86
      001B0C 33 0C 40 48 64 A9 FF  1392         .db     0x33,0x0c,0x40,0x48,0x64,0xa9,0xff,0x0a ;3.@Hd)..
             0A
      001B14 22 53 96 00 2D 44 64  1393         .db     0x22,0x53,0x96,0x00,0x2d,0x44,0x64,0x80 ;"S..-Dd.
             80
      001B1C 88 A9 FF 0A 23 66 8E  1394         .db     0x88,0xa9,0xff,0x0a,0x23,0x66,0x8e,0x33 ;.)..#f.3
             33
      001B24 36 00 0C 45 68 B0 FF  1395         .db     0x36,0x00,0x0c,0x45,0x68,0xb0,0xff,0x2a ;6..Eh0.*
             2A
      001B2C 42 06 2E 6E 92 96 08  1396         .db     0x42,0x06,0x2e,0x6e,0x92,0x96,0x08,0x10 ;B..n....
             10
      001B34 64 70 81 A5 FF 2A 63  1397         .db     0x64,0x70,0x81,0xa5,0xff,0x2a,0x63,0x8e ;dp.%.*c.
             8E
      001B3C 52 17 01 20 2C 40 68  1398         .db     0x52,0x17,0x01,0x20,0x2c,0x40,0x68,0x90 ;R.. ,@h.
             90
      001B44 FF 0A 63 32 36 0D 20  1399         .db     0xff,0x0a,0x63,0x32,0x36,0x0d,0x20,0x41 ;..c26. A
             41
      001B4C 6C 8C A4 AC FF 0A 86  1400         .db     0x6c,0x8c,0xa4,0xac,0xff,0x0a,0x86,0x53 ;l.$,...S
             53
      001B54 57 00 2D 40 48 88 A9  1401         .db     0x57,0x00,0x2d,0x40,0x48,0x88,0xa9,0xff ;W.-@H.).
             FF
      001B5C 0A 22 62 26 86 6E 17  1402         .db     0x0a,0x22,0x62,0x26,0x86,0x6e,0x17,0x0c ;."b&.n..
             0C
      001B64 49 64 70 90 AD FF 2A  1403         .db     0x49,0x64,0x70,0x90,0xad,0xff,0x2a,0x43 ;Idp.-.*C
             43
      001B6C 46 0E 73 16 56 01 20  1404         .db     0x46,0x0e,0x73,0x16,0x56,0x01,0x20,0x4c ;F.s.V. L
             4C
      001B74 68 A0 FF 0A 06 46 8E  1405         .db     0x68,0xa0,0xff,0x0a,0x06,0x46,0x8e,0x56 ;h ...F.V
             56
      001B7C 96 2D 68 81 A1 FF 4A  1406         .db     0x96,0x2d,0x68,0x81,0xa1,0xff,0x4a,0x03 ;.-h.!.J.
             03
      001B84 6E 72 17 04 24 2C 4C  1407         .db     0x6e,0x72,0x17,0x04,0x24,0x2c,0x4c,0x81 ;nr..$,L.
             81
      001B8C A1 FF 0A 03 07 6E 36  1408         .db     0xa1,0xff,0x0a,0x03,0x07,0x6e,0x36,0x76 ;!....n6v
             76
      001B94 0D 48 60 81 A1 FF 0A  1409         .db     0x0d,0x48,0x60,0x81,0xa1,0xff,0x0a,0x66 ;.H`.!..f
             66
      001B9C 32 0C 40 48 69 A0 A8  1410         .db     0x32,0x0c,0x40,0x48,0x69,0xa0,0xa8,0xff ;2.@Hi (.
             FF
      001BA4 0A 42 0E 00 20 64 6C  1411         .db     0x0a,0x42,0x0e,0x00,0x20,0x64,0x6c,0x80 ;.B.. dl.
             80
      001BAC 88 A0 A8 FF 4A 03 46  1412         .db     0x88,0xa0,0xa8,0xff,0x4a,0x03,0x46,0x8e ;. (.J.F.
             8E
      001BB4 12 36 76 05 25 4C 6C  1413         .db     0x12,0x36,0x76,0x05,0x25,0x4c,0x6c,0x81 ;.6v.%Ll.
             81
      001BBC A1 FF 0A 22 26 86 6E  1414         .db     0xa1,0xff,0x0a,0x22,0x26,0x86,0x6e,0x17 ;!.."&.n.
             17
      001BC4 0C 49 64 70 90 AD FF  1415         .db     0x0c,0x49,0x64,0x70,0x90,0xad,0xff,0x0a ;.Idp.-..
             0A
      001BCC 22 26 52 92 57 00 0C  1416         .db     0x22,0x26,0x52,0x92,0x57,0x00,0x0c,0x2d ;"&R.W..-
             2D
      001BD4 48 60 80 A0 FF 0A 03  1417         .db     0x48,0x60,0x80,0xa0,0xff,0x0a,0x03,0x07 ;H`. ....
             07
      001BDC 0E 52 57 10 48 60 80  1418         .db     0x0e,0x52,0x57,0x10,0x48,0x60,0x80,0x8c ;.RW.H`..
             8C
      001BE4 A1 FF 0A 42 0E 73 16  1419         .db     0xa1,0xff,0x0a,0x42,0x0e,0x73,0x16,0x56 ;!..B.s.V
             56
      001BEC 00 20 44 4C 64 80 FF  1420         .db     0x00,0x20,0x44,0x4c,0x64,0x80,0xff,0x0a ;. DLd...
             0A
      001BF4 02 42 06 0E 6E 92 36  1421         .db     0x02,0x42,0x06,0x0e,0x6e,0x92,0x36,0x96 ;.B..n.6.
             96
      001BFC 44 4C 64 70 80 A0 FF  1422         .db     0x44,0x4c,0x64,0x70,0x80,0xa0,0xff,0x2a ;DLdp. .*
             2A
      001C04 63 2E 8E 32 16 04 0C  1423         .db     0x63,0x2e,0x8e,0x32,0x16,0x04,0x0c,0x40 ;c..2...@
             40
      001C0C 69 84 B0 FF 0A 02 62  1424         .db     0x69,0x84,0xb0,0xff,0x0a,0x02,0x62,0x8e ;i.0...b.
             8E
      001C14 53 56 96 30 40 48 68  1425         .db     0x53,0x56,0x96,0x30,0x40,0x48,0x68,0xa1 ;SV.0@Hh!
             A1
      001C1C FF 0A 46 86 0E 53 00  1426         .db     0xff,0x0a,0x46,0x86,0x0e,0x53,0x00,0x10 ;..F..S..
             10
      001C24 30 48 88 A9 FF 0A 82  1427         .db     0x30,0x48,0x88,0xa9,0xff,0x0a,0x82,0x6e ;0H.)...n
             6E
      001C2C 13 16 96 00 20 40 48  1428         .db     0x13,0x16,0x96,0x00,0x20,0x40,0x48,0x70 ;.... @Hp
             70
      001C34 A5 FF 0A 42 86 8E 52  1429         .db     0xa5,0xff,0x0a,0x42,0x86,0x8e,0x52,0x16 ;%..B..R.
             16
      001C3C 56 00 0C 2C 65 90 FF  1430         .db     0x56,0x00,0x0c,0x2c,0x65,0x90,0xff,0x0a ;V..,e...
             0A
      001C44 22 62 26 53 16 00 2C  1431         .db     0x22,0x62,0x26,0x53,0x16,0x00,0x2c,0x48 ;"b&S..,H
             48
      001C4C 64 84 FF 0A 43 92 16  1432         .db     0x64,0x84,0xff,0x0a,0x43,0x92,0x16,0x20 ;d...C.. 
             20
      001C54 44 4C 6C A0 A8 FF 0A  1433         .db     0x44,0x4c,0x6c,0xa0,0xa8,0xff,0x0a,0x63 ;DLl (..c
             63
      001C5C 86 2E 6E 32 00 0C 41  1434         .db     0x86,0x2e,0x6e,0x32,0x00,0x0c,0x41,0x70 ;..n2..Ap
             70
      001C64 A9 FF 0A 22 6E 52 36  1435         .db     0xa9,0xff,0x0a,0x22,0x6e,0x52,0x36,0x00 ;).."nR6.
             00
      001C6C 0C 2C 45 61 90 FF 0A  1436         .db     0x0c,0x2c,0x45,0x61,0x90,0xff,0x0a,0x42 ;.,Ea...B
             42
      001C74 66 32 17 0C 20 45 68  1437         .db     0x66,0x32,0x17,0x0c,0x20,0x45,0x68,0x70 ;f2.. Ehp
             70
      001C7C A1 FF 0A 42 82 47 8E  1438         .db     0xa1,0xff,0x0a,0x42,0x82,0x47,0x8e,0x52 ;!..B.G.R
             52
      001C84 20 2C 48 90 A4 FF 4A  1439         .db     0x20,0x2c,0x48,0x90,0xa4,0xff,0x4a,0x82 ; ,H.$.J.
             82
      001C8C 06 16 56 08 29 60 88  1440         .db     0x06,0x16,0x56,0x08,0x29,0x60,0x88,0x90 ;..V.)`..
             90
      001C94 AD FF 4A 46 0E 92 36  1441         .db     0xad,0xff,0x4a,0x46,0x0e,0x92,0x36,0x76 ;-.JF..6v
             76
      001C9C 00 10 21 6C A5 FF 0A  1442         .db     0x00,0x10,0x21,0x6c,0xa5,0xff,0x0a,0x82 ;..!l%...
             82
      001CA4 07 2E 6E 77 0D 50 60  1443         .db     0x07,0x2e,0x6e,0x77,0x0d,0x50,0x60,0x84 ;..nw.P`.
             84
      001CAC A5 FF 0A 07 8E 33 0C  1444         .db     0xa5,0xff,0x0a,0x07,0x8e,0x33,0x0c,0x48 ;%....3.H
             48
      001CB4 81 A4 B0 FF 2A 62 0F  1445         .db     0x81,0xa4,0xb0,0xff,0x2a,0x62,0x0f,0x72 ;.$0.*b.r
             72
      001CBC 16 76 01 50 85 FF 2A  1446         .db     0x16,0x76,0x01,0x50,0x85,0xff,0x2a,0x8e ;.v.P..*.
             8E
      001CC4 72 16 01 40 50 60 68  1447         .db     0x72,0x16,0x01,0x40,0x50,0x60,0x68,0x84 ;r..@P`h.
             84
      001CCC B0 FF 0A 43 86 4F 92  1448         .db     0xb0,0xff,0x0a,0x43,0x86,0x4f,0x92,0x16 ;0..C.O..
             16
      001CD4 0C 20 2C 44 50 64 A8  1449         .db     0x0c,0x20,0x2c,0x44,0x50,0x64,0xa8,0xff ;. ,DPd(.
             FF
      001CDC 0A 42 0F 37 20 44 64  1450         .db     0x0a,0x42,0x0f,0x37,0x20,0x44,0x64,0x6c ;.B.7 Ddl
             6C
      001CE4 80 88 A1 FF 2A 62 92  1451         .db     0x80,0x88,0xa1,0xff,0x2a,0x62,0x92,0x16 ;..!.*b..
             16
      001CEC 56 01 40 64 6C 85 A0  1452         .db     0x56,0x01,0x40,0x64,0x6c,0x85,0xa0,0xa8 ;V.@dl. (
             A8
      001CF4 FF 0A 42 27 8E 53 96  1453         .db     0xff,0x0a,0x42,0x27,0x8e,0x53,0x96,0x00 ;..B'.S..
             00
      001CFC 0C 2D 48 68 A1 FF 0A  1454         .db     0x0c,0x2d,0x48,0x68,0xa1,0xff,0x0a,0x43 ;.-Hh!..C
             43
      001D04 67 2E 76 0D 20 44 50  1455         .db     0x67,0x2e,0x76,0x0d,0x20,0x44,0x50,0x68 ;g.v. DPh
             68
      001D0C 89 A8 B0 FF 4A 06 46  1456         .db     0x89,0xa8,0xb0,0xff,0x4a,0x06,0x46,0x4e ;.(0.J.FN
             4E
      001D14 92 16 08 28 70 85 A8  1457         .db     0x92,0x16,0x08,0x28,0x70,0x85,0xa8,0xff ;...(p.(.
             FF
      001D1C 0A 02 42 32 36 76 10  1458         .db     0x0a,0x02,0x42,0x32,0x36,0x76,0x10,0x45 ;..B26v.E
             45
      001D24 6C 80 A0 A8 FF 4A 22  1459         .db     0x6c,0x80,0xa0,0xa8,0xff,0x4a,0x22,0x82 ;l. (.J".
             82
      001D2C 26 4E 77 00 08 29 50  1460         .db     0x26,0x4e,0x77,0x00,0x08,0x29,0x50,0x60 ;&Nw..)P`
             60
      001D34 88 A4 AC FF 2A 42 82  1461         .db     0x88,0xa4,0xac,0xff,0x2a,0x42,0x82,0x46 ;.$,.*B.F
             46
      001D3C 86 0E 72 36 76 01 20  1462         .db     0x86,0x0e,0x72,0x36,0x76,0x01,0x20,0x4c ;..r6v. L
             4C
      001D44 68 88 FF 4A 62 0E 17  1463         .db     0x68,0x88,0xff,0x4a,0x62,0x0e,0x17,0x01 ;h..Jb...
             01
      001D4C 24 40 6D 84 8C A0 A8  1464         .db     0x24,0x40,0x6d,0x84,0x8c,0xa0,0xa8,0xff ;$@m.. (.
             FF
      001D54 0A 0E 4E 52 92 96 00  1465         .db     0x0a,0x0e,0x4e,0x52,0x92,0x96,0x00,0x30 ;..NR...0
             30
      001D5C 44 64 84 A5 FF 2A 82  1466         .db     0x44,0x64,0x84,0xa5,0xff,0x2a,0x82,0x0e ;Dd.%.*..
             0E
      001D64 4E 53 76 30 40 60 85  1467         .db     0x4e,0x53,0x76,0x30,0x40,0x60,0x85,0xa4 ;NSv0@`.$
             A4
      001D6C AC FF 4A 07 4E 76 08  1468         .db     0xac,0xff,0x4a,0x07,0x4e,0x76,0x08,0x10 ;,.J.Nv..
             10
      001D74 29 50 60 85 A5 FF 2A  1469         .db     0x29,0x50,0x60,0x85,0xa5,0xff,0x2a,0x03 ;)P`.%.*.
             03
      001D7C 6F 16 56 04 4C 61 90  1470         .db     0x6f,0x16,0x56,0x04,0x4c,0x61,0x90,0xa4 ;o.V.La.$
             A4
      001D84 B0 FF 0A 42 82 46 86  1471         .db     0xb0,0xff,0x0a,0x42,0x82,0x46,0x86,0x2e ;0..B.F..
             2E
      001D8C 76 20 50 68 89 A8 B0  1472         .db     0x76,0x20,0x50,0x68,0x89,0xa8,0xb0,0xff ;v Ph.(0.
             FF
      001D94 0A 03 06 2E 6E 73 16  1473         .db     0x0a,0x03,0x06,0x2e,0x6e,0x73,0x16,0x0c ;....ns..
             0C
      001D9C 50 81 FF 0A 02 42 0E  1474         .db     0x50,0x81,0xff,0x0a,0x02,0x42,0x0e,0x8e ;P....B..
             8E
      001DA4 36 10 44 4C 65 80 FF  1475         .db     0x36,0x10,0x44,0x4c,0x65,0x80,0xff,0x0a ;6.DLe...
             0A
      001DAC 02 42 06 8E 33 16 56  1476         .db     0x02,0x42,0x06,0x8e,0x33,0x16,0x56,0x0c ;.B..3.V.
             0C
      001DB4 65 80 90 A0 FF 0A 62  1477         .db     0x65,0x80,0x90,0xa0,0xff,0x0a,0x62,0x46 ;e.. ..bF
             46
      001DBC 86 52 16 00 0C 20 2C  1478         .db     0x86,0x52,0x16,0x00,0x0c,0x20,0x2c,0x48 ;.R... ,H
             48
      001DC4 8C A8 B0 FF 2A 42 0E  1479         .db     0x8c,0xa8,0xb0,0xff,0x2a,0x42,0x0e,0x6e ;.(0.*B.n
             6E
      001DCC 92 96 20 4D 64 70 80  1480         .db     0x92,0x96,0x20,0x4d,0x64,0x70,0x80,0xa0 ;.. Mdp. 
             A0
      001DD4 FF 0A 23 86 2F 76 0C  1481         .db     0xff,0x0a,0x23,0x86,0x2f,0x76,0x0c,0x50 ;..#./v.P
             50
      001DDC 64 89 A8 FF 0A 62 66  1482         .db     0x64,0x89,0xa8,0xff,0x0a,0x62,0x66,0x13 ;d.(..bf.
             13
      001DE4 17 00 20 40 48 68 8C  1483         .db     0x17,0x00,0x20,0x40,0x48,0x68,0x8c,0xff ;.. @Hh..
             FF
      001DEC 4A 63 16 56 04 21 40  1484         .db     0x4a,0x63,0x16,0x56,0x04,0x21,0x40,0x6c ;Jc.V.!@l
             6C
      001DF4 88 90 AD FF 0A 03 06  1485         .db     0x88,0x90,0xad,0xff,0x0a,0x03,0x06,0x46 ;..-....F
             46
      001DFC 8E 36 76 0D 48 68 81  1486         .db     0x8e,0x36,0x76,0x0d,0x48,0x68,0x81,0xa4 ;.6v.Hh.$
             A4
      001E04 FF 0A 23 46 0F 73 96  1487         .db     0xff,0x0a,0x23,0x46,0x0f,0x73,0x96,0x00 ;..#F.s..
             00
      001E0C 30 50 68 A5 FF 2A 22  1488         .db     0x30,0x50,0x68,0xa5,0xff,0x2a,0x22,0x62 ;0Ph%.*"b
             62
      001E14 26 86 0E 72 16 01 4C  1489         .db     0x26,0x86,0x0e,0x72,0x16,0x01,0x4c,0x65 ;&..r..Le
             65
      001E1C A8 B0 FF 2A 06 46 8E  1490         .db     0xa8,0xb0,0xff,0x2a,0x06,0x46,0x8e,0x17 ;(0.*.F..
             17
      001E24 2C 4C 81 A4 B0 FF 0A  1491         .db     0x2c,0x4c,0x81,0xa4,0xb0,0xff,0x0a,0x02 ;,L.$0...
             02
      001E2C 07 6E 56 96 2D 48 81  1492         .db     0x07,0x6e,0x56,0x96,0x2d,0x48,0x81,0xa0 ;.nV.-H. 
             A0
      001E34 A8 FF 2A 02 27 0E 73  1493         .db     0xa8,0xff,0x2a,0x02,0x27,0x0e,0x73,0x56 ;(.*.'.sV
             56
      001E3C 96 04 30 4C 68 A0 FF  1494         .db     0x96,0x04,0x30,0x4c,0x68,0xa0,0xff,0x0a ;..0Lh ..
             0A
      001E44 42 8E 32 16 56 20 45  1495         .db     0x42,0x8e,0x32,0x16,0x56,0x20,0x45,0x65 ;B.2.V Ee
             65
      001E4C 80 90 A0 B0 FF 0A 82  1496         .db     0x80,0x90,0xa0,0xb0,0xff,0x0a,0x82,0x86 ;.. 0....
             86
      001E54 2F 16 56 0C 20 41 60  1497         .db     0x2f,0x16,0x56,0x0c,0x20,0x41,0x60,0xad ;/.V. A`-
             AD
      001E5C FF 0A 43 47 0E 36 10  1498         .db     0xff,0x0a,0x43,0x47,0x0e,0x36,0x10,0x20 ;..CG.6. 
             20
      001E64 49 6D 88 A1 FF 2A 03  1499         .db     0x49,0x6d,0x88,0xa1,0xff,0x2a,0x03,0x06 ;Im.!.*..
             06
      001E6C 4E 73 77 08 50 61 81  1500         .db     0x4e,0x73,0x77,0x08,0x50,0x61,0x81,0xa0 ;Nsw.Pa. 
             A0
      001E74 A8 FF 2A 63 86 52 36  1501         .db     0xa8,0xff,0x2a,0x63,0x86,0x52,0x36,0x76 ;(.*c.R6v
             76
      001E7C 04 2C 40 64 89 AC FF  1502         .db     0x04,0x2c,0x40,0x64,0x89,0xac,0xff,0x0a ;.,@d.,..
             0A
      001E84 23 27 2E 92 16 00 50  1503         .db     0x23,0x27,0x2e,0x92,0x16,0x00,0x50,0x6d ;#'....Pm
             6D
      001E8C A1 FF 0A 43 2F 92 96  1504         .db     0xa1,0xff,0x0a,0x43,0x2f,0x92,0x96,0x0c ;!..C/...
             0C
      001E94 20 44 50 70 88 A0 A8  1505         .db     0x20,0x44,0x50,0x70,0x88,0xa0,0xa8,0xff ; DPp. (.
             FF
      001E9C 4A 22 82 07 72 16 96  1506         .db     0x4a,0x22,0x82,0x07,0x72,0x16,0x96,0x09 ;J"..r...
             09
      001EA4 28 50 85 A4 AC FF 2A  1507         .db     0x28,0x50,0x85,0xa4,0xac,0xff,0x2a,0x43 ;(P.$,.*C
             43
      001EAC 06 46 2E 72 16 08 50  1508         .db     0x06,0x46,0x2e,0x72,0x16,0x08,0x50,0x85 ;.F.r..P.
             85
      001EB4 A0 A8 FF 0A 02 06 46  1509         .db     0xa0,0xa8,0xff,0x0a,0x02,0x06,0x46,0x8e ; (....F.
             8E
      001EBC 56 96 0D 2D 48 68 81  1510         .db     0x56,0x96,0x0d,0x2d,0x48,0x68,0x81,0xa0 ;V..-Hh. 
             A0
      001EC4 FF 2A 82 0E 57 01 30  1511         .db     0xff,0x2a,0x82,0x0e,0x57,0x01,0x30,0x40 ;.*..W.0@
             40
      001ECC 4C 61 88 A8 B0 FF 6A  1512         .db     0x4c,0x61,0x88,0xa8,0xb0,0xff,0x6a,0x22 ;La.(0.j"
             22
      001ED4 92 77 00 24 44 4C 60  1513         .db     0x92,0x77,0x00,0x24,0x44,0x4c,0x60,0x6c ;.w.$DL`l
             6C
      001EDC A1 FF 4A 42 82 46 0E  1514         .db     0xa1,0xff,0x4a,0x42,0x82,0x46,0x0e,0x92 ;!.JB.F..
             92
      001EE4 16 00 21 4C 70 88 A5  1515         .db     0x16,0x00,0x21,0x4c,0x70,0x88,0xa5,0xff ;..!Lp.%.
             FF
      001EEC 0A 03 0E 92 37 10 44  1516         .db     0x0a,0x03,0x0e,0x92,0x37,0x10,0x44,0x4c ;....7.DL
             4C
      001EF4 81 A0 A8 FF 2A 0E 72  1517         .db     0x81,0xa0,0xa8,0xff,0x2a,0x0e,0x72,0x76 ;. (.*.rv
             76
      001EFC 04 30 4D 65 85 A4 FF  1518         .db     0x04,0x30,0x4d,0x65,0x85,0xa4,0xff,0x0a ;.0Me.$..
             0A
      001F04 23 4E 96 00 0C 2D 44  1519         .db     0x23,0x4e,0x96,0x00,0x0c,0x2d,0x44,0x70 ;#N...-Dp
             70
      001F0C 80 88 A0 FF 2A 02 07  1520         .db     0x80,0x88,0xa0,0xff,0x2a,0x02,0x07,0x6e ;.. .*..n
             6E
      001F14 72 37 08 10 4C 81 A8  1521         .db     0x72,0x37,0x08,0x10,0x4c,0x81,0xa8,0xb0 ;r7..L.(0
             B0
      001F1C FF 0A 23 8E 32 37 00  1522         .db     0xff,0x0a,0x23,0x8e,0x32,0x37,0x00,0x45 ;..#.27.E
             45
      001F24 64 6C 90 A1 FF 0A 42  1523         .db     0x64,0x6c,0x90,0xa1,0xff,0x0a,0x42,0x82 ;dl.!..B.
             82
      001F2C 46 0E 6E 13 17 00 48  1524         .db     0x46,0x0e,0x6e,0x13,0x17,0x00,0x48,0x70 ;F.n...Hp
             70
      001F34 84 A5 FF 0A 43 4E 92  1525         .db     0x84,0xa5,0xff,0x0a,0x43,0x4e,0x92,0x16 ;.%..CN..
             16
      001F3C 0C 20 2C 50 85 A0 FF  1526         .db     0x0c,0x20,0x2c,0x50,0x85,0xa0,0xff,0x2a ;. ,P. .*
             2A
      001F44 63 4E 16 76 01 2C 40  1527         .db     0x63,0x4e,0x16,0x76,0x01,0x2c,0x40,0x50 ;cN.v.,@P
             50
      001F4C 64 A5 FF 0A 86 6E 33  1528         .db     0x64,0xa5,0xff,0x0a,0x86,0x6e,0x33,0x16 ;d%...n3.
             16
      001F54 56 0C 45 60 90 A9 FF  1529         .db     0x56,0x0c,0x45,0x60,0x90,0xa9,0xff,0x6a ;V.E`.).j
             6A
      001F5C 02 82 66 2E 92 37 0D  1530         .db     0x02,0x82,0x66,0x2e,0x92,0x37,0x0d,0x24 ;..f..7.$
             24
      001F64 41 6C A5 FF 6A 23 0F  1531         .db     0x41,0x6c,0xa5,0xff,0x6a,0x23,0x0f,0x92 ;Al%.j#..
             92
      001F6C 77 01 30 44 6C A1 FF  1532         .db     0x77,0x01,0x30,0x44,0x6c,0xa1,0xff,0x0a ;w.0Dl!..
             0A
      001F74 02 42 06 32 36 0C 45  1533         .db     0x02,0x42,0x06,0x32,0x36,0x0c,0x45,0x64 ;.B.26.Ed
             64
      001F7C 6C 80 A0 FF 0A 22 62  1534         .db     0x6c,0x80,0xa0,0xff,0x0a,0x22,0x62,0x0e ;l. .."b.
             0E
      001F84 4E 72 16 00 50 85 A4  1535         .db     0x4e,0x72,0x16,0x00,0x50,0x85,0xa4,0xff ;Nr..P.$.
             FF
      001F8C 2A 63 06 8E 12 52 16  1536         .db     0x2a,0x63,0x06,0x8e,0x12,0x52,0x16,0x56 ;*c...R.V
             56
      001F94 08 40 68 90 FF 4A 42  1537         .db     0x08,0x40,0x68,0x90,0xff,0x4a,0x42,0x82 ;.@h..JB.
             82
      001F9C 0E 92 37 10 21 6C 88  1538         .db     0x0e,0x92,0x37,0x10,0x21,0x6c,0x88,0xa5 ;..7.!l.%
             A5
      001FA4 FF 0A 03 06 32 72 16  1539         .db     0xff,0x0a,0x03,0x06,0x32,0x72,0x16,0x56 ;....2r.V
             56
      001FAC 0C 44 60 68 A0 FF 0A  1540         .db     0x0c,0x44,0x60,0x68,0xa0,0xff,0x0a,0x03 ;.D`h ...
             03
      001FB4 8E 52 37 10 45 60 68  1541         .db     0x8e,0x52,0x37,0x10,0x45,0x60,0x68,0x90 ;.R7.E`h.
             90
      001FBC A0 FF 0A 22 62 27 0E  1542         .db     0xa0,0xff,0x0a,0x22,0x62,0x27,0x0e,0x56 ; .."b'.V
             56
      001FC4 96 00 10 30 68 85 FF  1543         .db     0x96,0x00,0x10,0x30,0x68,0x85,0xff,0x0a ;...0h...
             0A
      001FCC 02 8E 52 56 96 0D 30  1544         .db     0x02,0x8e,0x52,0x56,0x96,0x0d,0x30,0x60 ;..RV..0`
             60
      001FD4 68 81 A0 FF 0A 23 46  1545         .db     0x68,0x81,0xa0,0xff,0x0a,0x23,0x46,0x8e ;h. ..#F.
             8E
      001FDC 13 16 56 00 48 68 81  1546         .db     0x13,0x16,0x56,0x00,0x48,0x68,0x81,0xa4 ;..V.Hh.$
             A4
      001FE4 B0 FF 4A 02 0F 92 96  1547         .db     0xb0,0xff,0x4a,0x02,0x0f,0x92,0x96,0x24 ;0.J....$
             24
      001FEC 40 50 6D A0 A8 FF 0A  1548         .db     0x40,0x50,0x6d,0xa0,0xa8,0xff,0x0a,0x42 ;@Pm (..B
             42
      001FF4 82 46 8E 52 17 00 0C  1549         .db     0x82,0x46,0x8e,0x52,0x17,0x00,0x0c,0x20 ;.F.R... 
             20
      001FFC 2C 48 68 90 B0 FF 2A  1550         .db     0x2c,0x48,0x68,0x90,0xb0,0xff,0x2a,0x62 ;,Hh.0.*b
             62
      002004 0E 4E 52 57 04 10 30  1551         .db     0x0e,0x4e,0x52,0x57,0x04,0x10,0x30,0x40 ;.NRW..0@
             40
      00200C 85 A5 FF 2A 02 4F 92  1552         .db     0x85,0xa5,0xff,0x2a,0x02,0x4f,0x92,0x16 ;.%.*.O..
             16
      002014 96 04 0C 2C 50 70 81  1553         .db     0x96,0x04,0x0c,0x2c,0x50,0x70,0x81,0xa5 ;...,Pp.%
             A5
      00201C FF 0A 22 62 86 2F 92  1554         .db     0xff,0x0a,0x22,0x62,0x86,0x2f,0x92,0x16 ;.."b./..
             16
      002024 0C 50 64 70 88 FF 2A  1555         .db     0x0c,0x50,0x64,0x70,0x88,0xff,0x2a,0x02 ;.Pdp..*.
             02
      00202C 72 56 96 04 30 40 4C  1556         .db     0x72,0x56,0x96,0x04,0x30,0x40,0x4c,0x61 ;rV..0@La
             61
      002034 80 A4 AC FF 0A 02 42  1557         .db     0x80,0xa4,0xac,0xff,0x0a,0x02,0x42,0x07 ;.$,...B.
             07
      00203C 6E 56 96 10 2D 48 64  1558         .db     0x6e,0x56,0x96,0x10,0x2d,0x48,0x64,0x81 ;nV..-Hd.
             81
      002044 A8 FF 0A 82 06 0F 36  1559         .db     0xa8,0xff,0x0a,0x82,0x06,0x0f,0x36,0x76 ;(.....6v
             76
      00204C 10 41 60 68 AD FF 4A  1560         .db     0x10,0x41,0x60,0x68,0xad,0xff,0x4a,0x22 ;.A`h-.J"
             22
      002054 62 0E 92 16 01 4C 70  1561         .db     0x62,0x0e,0x92,0x16,0x01,0x4c,0x70,0x85 ;b....Lp.
             85
      00205C A4 FF 0A 42 6F 32 0C  1562         .db     0xa4,0xff,0x0a,0x42,0x6f,0x32,0x0c,0x20 ;$..Bo2. 
             20
      002064 45 64 70 80 A0 FF 2A  1563         .db     0x45,0x64,0x70,0x80,0xa0,0xff,0x2a,0x02 ;Edp. .*.
             02
      00206C 82 86 4E 76 2D 40 61  1564         .db     0x82,0x86,0x4e,0x76,0x2d,0x40,0x61,0x88 ;..Nv-@a.
             88
      002074 A8 FF 2A 0F 72 16 76  1565         .db     0xa8,0xff,0x2a,0x0f,0x72,0x16,0x76,0x01 ;(.*.r.v.
             01
      00207C 50 60 68 85 A4 FF 0A  1566         .db     0x50,0x60,0x68,0x85,0xa4,0xff,0x0a,0x03 ;P`h.$...
             03
      002084 06 86 2E 6E 72 0C 44  1567         .db     0x06,0x86,0x2e,0x6e,0x72,0x0c,0x44,0x50 ;...nr.DP
             50
      00208C 60 A8 FF 2A 02 42 06  1568         .db     0x60,0xa8,0xff,0x2a,0x02,0x42,0x06,0x8e ;`(.*.B..
             8E
      002094 12 37 08 4C 64 6C 80  1569         .db     0x12,0x37,0x08,0x4c,0x64,0x6c,0x80,0xa0 ;.7.Ldl. 
             A0
      00209C FF 0A 22 6F 52 92 00  1570         .db     0xff,0x0a,0x22,0x6f,0x52,0x92,0x00,0x2c ;.."oR..,
             2C
      0020A4 48 60 81 A4 FF 0A 22  1571         .db     0x48,0x60,0x81,0xa4,0xff,0x0a,0x22,0x62 ;H`.$.."b
             62
      0020AC 86 52 56 96 00 2D 44  1572         .db     0x86,0x52,0x56,0x96,0x00,0x2d,0x44,0x64 ;.RV..-Dd
             64
      0020B4 89 FF 0A 27 6E 13 36  1573         .db     0x89,0xff,0x0a,0x27,0x6e,0x13,0x36,0x48 ;...'n.6H
             48
      0020BC 70 81 A4 AC FF 0A 22  1574         .db     0x70,0x81,0xa4,0xac,0xff,0x0a,0x22,0x82 ;p.$,..".
             82
      0020C4 26 0E 4E 73 77 00 50  1575         .db     0x26,0x0e,0x4e,0x73,0x77,0x00,0x50,0x60 ;&.Nsw.P`
             60
      0020CC 85 A5 FF 2A 06 46 8E  1576         .db     0x85,0xa5,0xff,0x2a,0x06,0x46,0x8e,0x76 ;.%.*.F.v
             76
      0020D4 08 10 50 68 81 B0 FF  1577         .db     0x08,0x10,0x50,0x68,0x81,0xb0,0xff,0x0a ;..Ph.0..
             0A
      0020DC 22 62 2E 13 17 00 44  1578         .db     0x22,0x62,0x2e,0x13,0x17,0x00,0x44,0x69 ;"b....Di
             69
      0020E4 89 A9 FF 0A 42 86 33  1579         .db     0x89,0xa9,0xff,0x0a,0x42,0x86,0x33,0x36 ;.)..B.36
             36
      0020EC 96 00 10 45 64 A9 FF  1580         .db     0x96,0x00,0x10,0x45,0x64,0xa9,0xff,0x0a ;...Ed)..
             0A
      0020F4 22 62 86 33 56 00 44  1581         .db     0x22,0x62,0x86,0x33,0x56,0x00,0x44,0x65 ;"b.3V.De
             65
      0020FC 89 A9 FF 4A 03 06 72  1582         .db     0x89,0xa9,0xff,0x4a,0x03,0x06,0x72,0x36 ;.).J..r6
             36
      002104 76 08 10 29 4C 81 A0  1583         .db     0x76,0x08,0x10,0x29,0x4c,0x81,0xa0,0xff ;v..)L. .
             FF
      00210C 4A 02 67 0E 92 36 76  1584         .db     0x4a,0x02,0x67,0x0e,0x92,0x36,0x76,0x24 ;J.g..6v$
             24
      002114 40 4C 6C 88 FF 4A 46  1585         .db     0x40,0x4c,0x6c,0x88,0xff,0x4a,0x46,0x0e ;@Ll..JF.
             0E
      00211C 92 36 76 01 21 4C 6C  1586         .db     0x92,0x36,0x76,0x01,0x21,0x4c,0x6c,0xa5 ;.6v.!Ll%
             A5
      002124 FF 2A 82 0E 4E 96 10  1587         .db     0xff,0x2a,0x82,0x0e,0x4e,0x96,0x10,0x30 ;.*..N..0
             30
      00212C 40 50 60 70 85 A5 FF  1588         .db     0x40,0x50,0x60,0x70,0x85,0xa5,0xff,0x0a ;@P`p.%..
             0A
      002134 43 46 0E 32 57 10 20  1589         .db     0x43,0x46,0x0e,0x32,0x57,0x10,0x20,0x48 ;CF.2W. H
             48
      00213C 84 8C A0 A8 FF 2A 43  1590         .db     0x84,0x8c,0xa0,0xa8,0xff,0x2a,0x43,0x0e ;.. (.*C.
             0E
      002144 72 16 56 01 4C 85 FF  1591         .db     0x72,0x16,0x56,0x01,0x4c,0x85,0xff,0x4a ;r.V.L..J
             4A
      00214C 62 06 8E 32 36 76 28  1592         .db     0x62,0x06,0x8e,0x32,0x36,0x76,0x28,0x40 ;b..26v(@
             40
      002154 6C 84 A1 FF 0A 02 66  1593         .db     0x6c,0x84,0xa1,0xff,0x0a,0x02,0x66,0x32 ;l.!...f2
             32
      00215C 36 96 10 41 68 70 8C  1594         .db     0x36,0x96,0x10,0x41,0x68,0x70,0x8c,0xa1 ;6..Ahp.!
             A1
      002164 FF 4A 02 86 0E 12 16  1595         .db     0xff,0x4a,0x02,0x86,0x0e,0x12,0x16,0x56 ;.J.....V
             56
      00216C 24 4C 60 A8 B0 FF 2A  1596         .db     0x24,0x4c,0x60,0xa8,0xb0,0xff,0x2a,0x62 ;$L`(0.*b
             62
      002174 0E 36 01 20 40 4C 64  1597         .db     0x0e,0x36,0x01,0x20,0x40,0x4c,0x64,0x70 ;.6. @Ldp
             70
      00217C 84 A0 A8 FF 6A 22 86  1598         .db     0x84,0xa0,0xa8,0xff,0x6a,0x22,0x86,0x0e ;. (.j"..
             0E
      002184 36 76 00 10 45 60 A8  1599         .db     0x36,0x76,0x00,0x10,0x45,0x60,0xa8,0xb0 ;6v..E`(0
             B0
      00218C FF 0A 22 82 26 0E 4E  1600         .db     0xff,0x0a,0x22,0x82,0x26,0x0e,0x4e,0x73 ;..".&.Ns
             73
      002194 77 00 50 60 85 A4 FF  1601         .db     0x77,0x00,0x50,0x60,0x85,0xa4,0xff,0x0a ;w.P`.$..
             0A
      00219C 22 26 0E 52 92 56 96  1602         .db     0x22,0x26,0x0e,0x52,0x92,0x56,0x96,0x00 ;"&.R.V..
             00
      0021A4 30 48 60 A0 A8 FF 2A  1603         .db     0x30,0x48,0x60,0xa0,0xa8,0xff,0x2a,0x46 ;0H` (.*F
             46
      0021AC 0F 72 01 20 50 68 85  1604         .db     0x0f,0x72,0x01,0x20,0x50,0x68,0x85,0xa4 ;.r. Ph.$
             A4
      0021B4 AC FF 0A 42 66 32 36  1605         .db     0xac,0xff,0x0a,0x42,0x66,0x32,0x36,0x96 ;,..Bf26.
             96
      0021BC 00 10 20 45 68 70 8C  1606         .db     0x00,0x10,0x20,0x45,0x68,0x70,0x8c,0xa0 ;.. Ehp. 
             A0
      0021C4 FF 0A 03 07 32 72 56  1607         .db     0xff,0x0a,0x03,0x07,0x32,0x72,0x56,0x0c ;....2rV.
             0C
      0021CC 48 60 68 80 A0 FF 0A  1608         .db     0x48,0x60,0x68,0x80,0xa0,0xff,0x0a,0x22 ;H`h. .."
             22
      0021D4 82 07 6E 12 37 49 60  1609         .db     0x82,0x07,0x6e,0x12,0x37,0x49,0x60,0x90 ;..n.7I`.
             90
      0021DC A5 FF 0A 03 0E 8E 32  1610         .db     0xa5,0xff,0x0a,0x03,0x0e,0x8e,0x32,0x72 ;%.....2r
             72
      0021E4 36 76 10 44 60 68 80  1611         .db     0x36,0x76,0x10,0x44,0x60,0x68,0x80,0xa0 ;6v.D`h. 
             A0
      0021EC FF 4A 46 0E 72 36 76  1612         .db     0xff,0x4a,0x46,0x0e,0x72,0x36,0x76,0x01 ;.JF.r6v.
             01
      0021F4 21 4C 85 AD FF 2A 03  1613         .db     0x21,0x4c,0x85,0xad,0xff,0x2a,0x03,0x07 ;!L.-.*..
             07
      0021FC 73 16 09 50 60 81 A0  1614         .db     0x73,0x16,0x09,0x50,0x60,0x81,0xa0,0xa8 ;s..P`. (
             A8
      002204 FF 4A 62 0E 92 36 76  1615         .db     0xff,0x4a,0x62,0x0e,0x92,0x36,0x76,0x21 ;.Jb..6v!
             21
      00220C 4C 6C 85 A4 FF 4A 02  1616         .db     0x4c,0x6c,0x85,0xa4,0xff,0x4a,0x02,0x72 ;Ll.$.J.r
             72
      002214 36 76 04 24 40 4C 60  1617         .db     0x36,0x76,0x04,0x24,0x40,0x4c,0x60,0x81 ;6v.$@L`.
             81
      00221C A0 FF 4A 82 26 4E 73  1618         .db     0xa0,0xff,0x4a,0x82,0x26,0x4e,0x73,0x16 ; .J.&Ns.
             16
      002224 01 28 50 60 85 A4 FF  1619         .db     0x01,0x28,0x50,0x60,0x85,0xa4,0xff,0x4a ;.(P`.$.J
             4A
      00222C 02 06 8E 12 92 36 76  1620         .db     0x02,0x06,0x8e,0x12,0x92,0x36,0x76,0x08 ;.....6v.
             08
      002234 28 4C 6C 81 A1 FF 2A  1621         .db     0x28,0x4c,0x6c,0x81,0xa1,0xff,0x2a,0x62 ;(Ll.!.*b
             62
      00223C 0E 4E 53 57 04 30 40  1622         .db     0x0e,0x4e,0x53,0x57,0x04,0x30,0x40,0x85 ;.NSW.0@.
             85
      002244 FF 4A 22 62 27 4E 92  1623         .db     0xff,0x4a,0x22,0x62,0x27,0x4e,0x92,0x16 ;.J"b'N..
             16
      00224C 96 01 29 70 85 A5 FF  1624         .db     0x96,0x01,0x29,0x70,0x85,0xa5,0xff,0x0a ;..)p.%..
             0A
      002254 02 2E 73 16 76 0C 50  1625         .db     0x02,0x2e,0x73,0x16,0x76,0x0c,0x50,0x60 ;..s.v.P`
             60
      00225C 80 88 FF 6A 02 42 06  1626         .db     0x80,0x88,0xff,0x6a,0x02,0x42,0x06,0x92 ;...j.B..
             92
      002264 36 0D 45 70 A0 A8 FF  1627         .db     0x36,0x0d,0x45,0x70,0xa0,0xa8,0xff,0x0a ;6.Ep (..
             0A
      00226C 22 62 86 33 37 00 44  1628         .db     0x22,0x62,0x86,0x33,0x37,0x00,0x44,0x65 ;"b.37.De
             65
      002274 89 A9 FF 0A 82 06 2E  1629         .db     0x89,0xa9,0xff,0x0a,0x82,0x06,0x2e,0x6e ;.).....n
             6E
      00227C 33 16 0C 41 60 90 A4  1630         .db     0x33,0x16,0x0c,0x41,0x60,0x90,0xa4,0xac ;3..A`.$,
             AC
      002284 FF 0A 03 0E 4E 72 57  1631         .db     0xff,0x0a,0x03,0x0e,0x4e,0x72,0x57,0x10 ;....NrW.
             10
      00228C 44 61 80 88 A0 FF 4A  1632         .db     0x44,0x61,0x80,0x88,0xa0,0xff,0x4a,0x82 ;Da.. .J.
             82
      002294 6F 12 16 56 00 25 4C  1633         .db     0x6f,0x12,0x16,0x56,0x00,0x25,0x4c,0x60 ;o..V.%L`
             60
      00229C 90 A4 B0 FF 0A 02 42  1634         .db     0x90,0xa4,0xb0,0xff,0x0a,0x02,0x42,0x27 ;.$0...B'
             27
      0022A4 6E 13 36 48 70 81 A4  1635         .db     0x6e,0x13,0x36,0x48,0x70,0x81,0xa4,0xac ;n.6Hp.$,
             AC
      0022AC FF 6A 82 13 16 00 08  1636         .db     0xff,0x6a,0x82,0x13,0x16,0x00,0x08,0x21 ;.j.....!
             21
      0022B4 44 60 8C A4 AC FF 6A  1637         .db     0x44,0x60,0x8c,0xa4,0xac,0xff,0x6a,0x02 ;D`.$,.j.
             02
      0022BC 42 06 96 08 28 30 45  1638         .db     0x42,0x06,0x96,0x08,0x28,0x30,0x45,0x6d ;B...(0Em
             6D
      0022C4 80 8C A1 FF 4A 62 0E  1639         .db     0x80,0x8c,0xa1,0xff,0x4a,0x62,0x0e,0x96 ;..!.Jb..
             96
      0022CC 01 24 40 6D 84 8C A1  1640         .db     0x01,0x24,0x40,0x6d,0x84,0x8c,0xa1,0xff ;.$@m..!.
             FF
      0022D4 6A 62 06 2E 6E 92 16  1641         .db     0x6a,0x62,0x06,0x2e,0x6e,0x92,0x16,0x96 ;jb..n...
             96
      0022DC 08 41 70 A5 FF 0A 03  1642         .db     0x08,0x41,0x70,0xa5,0xff,0x0a,0x03,0x0e ;.Ap%....
             0E
      0022E4 8E 52 10 44 60 68 80  1643         .db     0x8e,0x52,0x10,0x44,0x60,0x68,0x80,0x90 ;.R.D`h..
             90
      0022EC A0 FF 0A 23 8E 32 17  1644         .db     0xa0,0xff,0x0a,0x23,0x8e,0x32,0x17,0x00 ; ..#.2..
             00
      0022F4 0C 44 69 81 FF 6A 22  1645         .db     0x0c,0x44,0x69,0x81,0xff,0x6a,0x22,0x86 ;.Di..j".
             86
      0022FC 12 16 56 01 24 44 4C  1646         .db     0x12,0x16,0x56,0x01,0x24,0x44,0x4c,0x60 ;..V.$DL`
             60
      002304 A8 B0 FF 0A 02 07 0E  1647         .db     0xa8,0xb0,0xff,0x0a,0x02,0x07,0x0e,0x6e ;(0.....n
             6E
      00230C 32 36 10 48 60 81 A4  1648         .db     0x32,0x36,0x10,0x48,0x60,0x81,0xa4,0xac ;26.H`.$,
             AC
      002314 FF 0A 23 46 6E 13 00  1649         .db     0xff,0x0a,0x23,0x46,0x6e,0x13,0x00,0x48 ;..#Fn..H
             48
      00231C 70 81 A4 AC FF 0A 22  1650         .db     0x70,0x81,0xa4,0xac,0xff,0x0a,0x22,0x26 ;p.$,.."&
             26
      002324 66 0E 13 16 00 48 68  1651         .db     0x66,0x0e,0x13,0x16,0x00,0x48,0x68,0x70 ;f....Hhp
             70
      00232C A0 FF 0A 22 82 0F 72  1652         .db     0xa0,0xff,0x0a,0x22,0x82,0x0f,0x72,0x16 ; .."..r.
             16
      002334 00 50 60 68 A9 FF 0A  1653         .db     0x00,0x50,0x60,0x68,0xa9,0xff,0x0a,0x22 ;.P`h).."
             22
      00233C 0F 56 00 30 44 60 68  1654         .db     0x0f,0x56,0x00,0x30,0x44,0x60,0x68,0x81 ;.V.0D`h.
             81
      002344 A4 B0 FF 4A 42 82 0E  1655         .db     0xa4,0xb0,0xff,0x4a,0x42,0x82,0x0e,0x73 ;$0.JB..s
             73
      00234C 17 00 21 4C 85 A5 FF  1656         .db     0x17,0x00,0x21,0x4c,0x85,0xa5,0xff,0x2a ;..!L.%.*
             2A
      002354 62 66 92 16 01 20 40  1657         .db     0x62,0x66,0x92,0x16,0x01,0x20,0x40,0x50 ;bf... @P
             50
      00235C 68 70 A0 FF 0A 02 42  1658         .db     0x68,0x70,0xa0,0xff,0x0a,0x02,0x42,0x06 ;hp ...B.
             06
      002364 46 0E 8E 73 77 48 50  1659         .db     0x46,0x0e,0x8e,0x73,0x77,0x48,0x50,0x68 ;F..swHPh
             68
      00236C A0 FF 2A 82 2E 72 16  1660         .db     0xa0,0xff,0x2a,0x82,0x2e,0x72,0x16,0x00 ; .*..r..
             00
      002374 08 50 60 68 85 AC FF  1661         .db     0x08,0x50,0x60,0x68,0x85,0xac,0xff,0x0a ;.P`h.,..
             0A
      00237C 43 46 0E 32 57 10 20  1662         .db     0x43,0x46,0x0e,0x32,0x57,0x10,0x20,0x48 ;CF.2W. H
             48
      002384 69 84 8C A1 FF 0A 22  1663         .db     0x69,0x84,0x8c,0xa1,0xff,0x0a,0x22,0x0e ;i..!..".
             0E
      00238C 17 00 44 4C 61 80 88  1664         .db     0x17,0x00,0x44,0x4c,0x61,0x80,0x88,0xff ;..DLa...
             FF
      002394 0A 26 0E 6E 13 16 00  1665         .db     0x0a,0x26,0x0e,0x6e,0x13,0x16,0x00,0x48 ;.&.n...H
             48
      00239C 64 70 84 A5 FF 2A 0F  1666         .db     0x64,0x70,0x84,0xa5,0xff,0x2a,0x0f,0x72 ;dp.%.*.r
             72
      0023A4 16 76 01 50 60 68 85  1667         .db     0x16,0x76,0x01,0x50,0x60,0x68,0x85,0xa5 ;.v.P`h.%
             A5
      0023AC FF 4A 02 86 0E 92 37  1668         .db     0xff,0x4a,0x02,0x86,0x0e,0x92,0x37,0x10 ;.J....7.
             10
      0023B4 24 40 60 6C 88 FF 0A  1669         .db     0x24,0x40,0x60,0x6c,0x88,0xff,0x0a,0x62 ;$@`l...b
             62
      0023BC 66 2E 32 16 96 0C 41  1670         .db     0x66,0x2e,0x32,0x16,0x96,0x0c,0x41,0x68 ;f.2...Ah
             68
      0023C4 70 8C FF 2A 02 67 12  1671         .db     0x70,0x8c,0xff,0x2a,0x02,0x67,0x12,0x52 ;p..*.g.R
             52
      0023CC 96 04 40 68 8C A9 FF  1672         .db     0x96,0x04,0x40,0x68,0x8c,0xa9,0xff,0x0a ;..@h.)..
             0A
      0023D4 03 86 6E 92 56 96 30  1673         .db     0x03,0x86,0x6e,0x92,0x56,0x96,0x30,0x44 ;..n.V.0D
             44
      0023DC 4C 60 A8 FF 0A 22 26  1674         .db     0x4c,0x60,0xa8,0xff,0x0a,0x22,0x26,0x76 ;L`(.."&v
             76
      0023E4 00 48 50 60 68 81 A4  1675         .db     0x00,0x48,0x50,0x60,0x68,0x81,0xa4,0xb0 ;.HP`h.$0
             B0
      0023EC FF 0A 22 62 0E 4E 92  1676         .db     0xff,0x0a,0x22,0x62,0x0e,0x4e,0x92,0x16 ;.."b.N..
             16
      0023F4 00 50 70 85 A4 FF 0A  1677         .db     0x00,0x50,0x70,0x85,0xa4,0xff,0x0a,0x0e ;.Pp.$...
             0E
      0023FC 32 37 10 41 64 6C A9  1678         .db     0x32,0x37,0x10,0x41,0x64,0x6c,0xa9,0xff ;27.Adl).
             FF
      002404 0A 22 46 8E 33 00 0C  1679         .db     0x0a,0x22,0x46,0x8e,0x33,0x00,0x0c,0x48 ;."F.3..H
             48
      00240C 68 81 A4 B0 FF 2A 43  1680         .db     0x68,0x81,0xa4,0xb0,0xff,0x2a,0x43,0x0f ;h.$0.*C.
             0F
      002414 72 16 96 01 50 85 A5  1681         .db     0x72,0x16,0x96,0x01,0x50,0x85,0xa5,0xff ;r...P.%.
             FF
      00241C 0A 42 66 0E 32 96 10  1682         .db     0x0a,0x42,0x66,0x0e,0x32,0x96,0x10,0x20 ;.Bf.2.. 
             20
      002424 45 68 70 A0 FF 0A 22  1683         .db     0x45,0x68,0x70,0xa0,0xff,0x0a,0x22,0x4f ;Ehp .."O
             4F
      00242C 52 92 17 00 2C 44 81  1684         .db     0x52,0x92,0x17,0x00,0x2c,0x44,0x81,0xa0 ;R...,D. 
             A0
      002434 A8 FF 0A 03 8E 52 0C  1685         .db     0xa8,0xff,0x0a,0x03,0x8e,0x52,0x0c,0x2c ;(....R.,
             2C
      00243C 44 68 81 A4 B0 FF 0A  1686         .db     0x44,0x68,0x81,0xa4,0xb0,0xff,0x0a,0x03 ;Dh.$0...
             03
      002444 8E 36 76 10 2C 44 4C  1687         .db     0x8e,0x36,0x76,0x10,0x2c,0x44,0x4c,0x68 ;.6v.,DLh
             68
      00244C 81 B0 FF 0A 42 8E 56  1688         .db     0x81,0xb0,0xff,0x0a,0x42,0x8e,0x56,0x0d ;.0..B.V.
             0D
      002454 20 45 64 6C 90 A0 B0  1689         .db     0x20,0x45,0x64,0x6c,0x90,0xa0,0xb0,0xff ; Edl. 0.
             FF
      00245C 4A 42 82 0E 73 17 01  1690         .db     0x4a,0x42,0x82,0x0e,0x73,0x17,0x01,0x21 ;JB..s..!
             21
      002464 4C 85 A5 FF 0A 43 0E  1691         .db     0x4c,0x85,0xa5,0xff,0x0a,0x43,0x0e,0x32 ;L.%..C.2
             32
      00246C 36 76 10 20 45 68 88  1692         .db     0x36,0x76,0x10,0x20,0x45,0x68,0x88,0xa0 ;6v. Eh. 
             A0
      002474 A8 FF 6A 82 06 8E 32  1693         .db     0xa8,0xff,0x6a,0x82,0x06,0x8e,0x32,0x72 ;(.j...2r
             72
      00247C 17 0C 40 48 60 A4 B0  1694         .db     0x17,0x0c,0x40,0x48,0x60,0xa4,0xb0,0xff ;..@H`$0.
             FF
      002484 0A 42 66 0E 00 20 44  1695         .db     0x0a,0x42,0x66,0x0e,0x00,0x20,0x44,0x4c ;.Bf.. DL
             4C
      00248C 68 70 89 A0 A8 FF 2A  1696         .db     0x68,0x70,0x89,0xa0,0xa8,0xff,0x2a,0x63 ;hp. (.*c
             63
      002494 52 57 30 40 65 89 A4  1697         .db     0x52,0x57,0x30,0x40,0x65,0x89,0xa4,0xac ;RW0@e.$,
             AC
      00249C FF 2A 82 52 56 96 04  1698         .db     0xff,0x2a,0x82,0x52,0x56,0x96,0x04,0x30 ;.*.RV..0
             30
      0024A4 40 61 84 8C A4 AC FF  1699         .db     0x40,0x61,0x84,0x8c,0xa4,0xac,0xff,0x4a ;@a..$,.J
             4A
      0024AC 62 0E 4E 17 01 24 40  1700         .db     0x62,0x0e,0x4e,0x17,0x01,0x24,0x40,0x70 ;b.N..$@p
             70
      0024B4 84 8C A0 A8 FF 2A 63  1701         .db     0x84,0x8c,0xa0,0xa8,0xff,0x2a,0x63,0x4e ;.. (.*cN
             4E
      0024BC 76 00 08 2D 40 50 64  1702         .db     0x76,0x00,0x08,0x2d,0x40,0x50,0x64,0x88 ;v..-@Pd.
             88
      0024C4 A5 FF 0A 82 07 6E 37  1703         .db     0xa5,0xff,0x0a,0x82,0x07,0x6e,0x37,0x10 ;%....n7.
             10
      0024CC 49 60 90 A5 FF 4A 02  1704         .db     0x49,0x60,0x90,0xa5,0xff,0x4a,0x02,0x0f ;I`.%.J..
             0F
      0024D4 92 10 24 40 50 6D A0  1705         .db     0x92,0x10,0x24,0x40,0x50,0x6d,0xa0,0xa8 ;..$@Pm (
             A8
      0024DC FF 0A 82 26 6E 73 96  1706         .db     0xff,0x0a,0x82,0x26,0x6e,0x73,0x96,0x00 ;...&ns..
             00
      0024E4 2C 48 50 60 A5 FF 2A  1707         .db     0x2c,0x48,0x50,0x60,0xa5,0xff,0x2a,0x63 ;,HP`%.*c
             63
      0024EC 06 0F 96 40 50 65 85  1708         .db     0x06,0x0f,0x96,0x40,0x50,0x65,0x85,0xa4 ;...@Pe.$
             A4
      0024F4 AC FF 0A 03 06 4E 8E  1709         .db     0xac,0xff,0x0a,0x03,0x06,0x4e,0x8e,0x52 ;,....N.R
             52
      0024FC 92 2C 44 A1 FF 2A 03  1710         .db     0x92,0x2c,0x44,0xa1,0xff,0x2a,0x03,0x06 ;.,D!.*..
             06
      002504 72 56 96 08 30 4C 80  1711         .db     0x72,0x56,0x96,0x08,0x30,0x4c,0x80,0x88 ;rV..0L..
             88
      00250C FF 2A 02 62 52 04 2C  1712         .db     0xff,0x2a,0x02,0x62,0x52,0x04,0x2c,0x40 ;.*.bR.,@
             40
      002514 65 89 A1 FF 6A 82 13  1713         .db     0x65,0x89,0xa1,0xff,0x6a,0x82,0x13,0x17 ;e.!.j...
             17
      00251C 00 08 21 44 60 8C A4  1714         .db     0x00,0x08,0x21,0x44,0x60,0x8c,0xa4,0xac ;..!D`.$,
             AC
      002524 FF 0A 22 62 67 2E 32  1715         .db     0xff,0x0a,0x22,0x62,0x67,0x2e,0x32,0x96 ;.."bg.2.
             96
      00252C 00 44 68 70 89 A9 FF  1716         .db     0x00,0x44,0x68,0x70,0x89,0xa9,0xff,0x4a ;.Dhp.).J
             4A
      002534 03 06 72 36 76 08 10  1717         .db     0x03,0x06,0x72,0x36,0x76,0x08,0x10,0x29 ;..r6v..)
             29
      00253C 4C 81 A1 FF 4A 82 86  1718         .db     0x4c,0x81,0xa1,0xff,0x4a,0x82,0x86,0x2f ;L.!.J../
             2F
      002544 76 24 50 60 89 B0 FF  1719         .db     0x76,0x24,0x50,0x60,0x89,0xb0,0xff,0x4a ;v$P`.0.J
             4A
      00254C 82 0E 72 57 01 24 30  1720         .db     0x82,0x0e,0x72,0x57,0x01,0x24,0x30,0x4c ;..rW.$0L
             4C
      002554 60 85 AD FF 4A 66 2E  1721         .db     0x60,0x85,0xad,0xff,0x4a,0x66,0x2e,0x13 ;`.-.Jf..
             13
      00255C 16 24 40 88 90 A4 FF  1722         .db     0x16,0x24,0x40,0x88,0x90,0xa4,0xff,0x0a ;.$@..$..
             0A
      002564 42 0E 4E 73 16 00 20  1723         .db     0x42,0x0e,0x4e,0x73,0x16,0x00,0x20,0x44 ;B.Ns.. D
             44
      00256C 50 80 A5 FF 4A 03 07  1724         .db     0x50,0x80,0xa5,0xff,0x4a,0x03,0x07,0x72 ;P.%.J..r
             72
      002574 76 08 28 4C 80 88 FF  1725         .db     0x76,0x08,0x28,0x4c,0x80,0x88,0xff,0x6a ;v.(L...j
             6A
      00257C 02 42 96 04 10 24 30  1726         .db     0x02,0x42,0x96,0x04,0x10,0x24,0x30,0x45 ;.B...$0E
             45
      002584 6D 80 8C A1 FF 0A 03  1727         .db     0x6d,0x80,0x8c,0xa1,0xff,0x0a,0x03,0x26 ;m..!...&
             26
      00258C 8E 92 0C 48 50 68 80  1728         .db     0x8e,0x92,0x0c,0x48,0x50,0x68,0x80,0xa1 ;...HPh.!
             A1
      002594 FF 0A 43 46 0E 32 72  1729         .db     0xff,0x0a,0x43,0x46,0x0e,0x32,0x72,0x36 ;..CF.2r6
             36
      00259C 76 10 20 48 68 84 A0  1730         .db     0x76,0x10,0x20,0x48,0x68,0x84,0xa0,0xff ;v. Hh. .
             FF
      0025A4 0A 42 0E 36 00 20 44  1731         .db     0x0a,0x42,0x0e,0x36,0x00,0x20,0x44,0x4c ;.B.6. DL
             4C
      0025AC 64 6C 80 88 A0 FF 2A  1732         .db     0x64,0x6c,0x80,0x88,0xa0,0xff,0x2a,0x82 ;dl.. .*.
             82
      0025B4 8E 72 01 20 40 4C 60  1733         .db     0x8e,0x72,0x01,0x20,0x40,0x4c,0x60,0x68 ;.r. @L`h
             68
      0025BC B0 FF 0A 22 62 67 2E  1734         .db     0xb0,0xff,0x0a,0x22,0x62,0x67,0x2e,0x13 ;0.."bg..
             13
      0025C4 17 00 44 89 AC FF 2A  1735         .db     0x17,0x00,0x44,0x89,0xac,0xff,0x2a,0x63 ;..D.,.*c
             63
      0025CC 06 8E 13 16 56 08 40  1736         .db     0x06,0x8e,0x13,0x16,0x56,0x08,0x40,0x69 ;....V.@i
             69
      0025D4 A4 B0 FF 4A 22 46 0E  1737         .db     0xa4,0xb0,0xff,0x4a,0x22,0x46,0x0e,0x6e ;$0.J"F.n
             6E
      0025DC 92 16 01 24 4D 70 A5  1738         .db     0x92,0x16,0x01,0x24,0x4d,0x70,0xa5,0xff ;...$Mp%.
             FF
      0025E4 0A 02 82 67 8E 52 56  1739         .db     0x0a,0x02,0x82,0x67,0x8e,0x52,0x56,0x30 ;...g.RV0
             30
      0025EC 40 48 68 B0 FF 0A 22  1740         .db     0x40,0x48,0x68,0xb0,0xff,0x0a,0x22,0x62 ;@Hh0.."b
             62
      0025F4 26 86 53 96 00 2C 48  1741         .db     0x26,0x86,0x53,0x96,0x00,0x2c,0x48,0x64 ;&.S..,Hd
             64
      0025FC 88 A9 FF 0A 22 46 0E  1742         .db     0x88,0xa9,0xff,0x0a,0x22,0x46,0x0e,0x6e ;.).."F.n
             6E
      002604 13 17 00 48 70 81 A5  1743         .db     0x13,0x17,0x00,0x48,0x70,0x81,0xa5,0xff ;...Hp.%.
             FF
      00260C 0A 23 2E 73 16 00 0C  1744         .db     0x0a,0x23,0x2e,0x73,0x16,0x00,0x0c,0x50 ;.#.s...P
             50
      002614 65 A1 FF 0A 82 52 2C  1745         .db     0x65,0xa1,0xff,0x0a,0x82,0x52,0x2c,0x41 ;e!...R,A
             41
      00261C 60 84 8C A4 AC FF 0A  1746         .db     0x60,0x84,0x8c,0xa4,0xac,0xff,0x0a,0x02 ;`..$,...
             02
      002624 42 07 92 36 96 10 49  1747         .db     0x42,0x07,0x92,0x36,0x96,0x10,0x49,0x64 ;B..6..Id
             64
      00262C 80 A0 A8 FF 0A 23 46  1748         .db     0x80,0xa0,0xa8,0xff,0x0a,0x23,0x46,0x0f ;. (..#F.
             0F
      002634 92 00 50 69 88 A0 A8  1749         .db     0x92,0x00,0x50,0x69,0x88,0xa0,0xa8,0xff ;..Pi. (.
             FF
      00263C 4A 82 6F 12 16 56 01  1750         .db     0x4a,0x82,0x6f,0x12,0x16,0x56,0x01,0x25 ;J.o..V.%
             25
      002644 4C 60 90 A4 B0 FF 2A  1751         .db     0x4c,0x60,0x90,0xa4,0xb0,0xff,0x2a,0x02 ;L`.$0.*.
             02
      00264C 07 72 57 30 4C 80 88  1752         .db     0x07,0x72,0x57,0x30,0x4c,0x80,0x88,0xa1 ;.rW0L..!
             A1
      002654 FF 4A 22 62 66 0E 92  1753         .db     0xff,0x4a,0x22,0x62,0x66,0x0e,0x92,0x36 ;.J"bf..6
             36
      00265C 96 01 4C 6C 88 A1 FF  1754         .db     0x96,0x01,0x4c,0x6c,0x88,0xa1,0xff,0x0a ;..Ll.!..
             0A
      002664 22 82 0E 4E 73 77 00  1755         .db     0x22,0x82,0x0e,0x4e,0x73,0x77,0x00,0x50 ;"..Nsw.P
             50
      00266C 60 85 A5 FF 4A 66 13  1756         .db     0x60,0x85,0xa5,0xff,0x4a,0x66,0x13,0x17 ;`.%.Jf..
             17
      002674 01 24 40 88 90 A4 AC  1757         .db     0x01,0x24,0x40,0x88,0x90,0xa4,0xac,0xff ;.$@..$,.
             FF
      00267C 6A 22 86 0F 12 36 76  1758         .db     0x6a,0x22,0x86,0x0f,0x12,0x36,0x76,0x24 ;j"...6v$
             24
      002684 44 60 8C A8 B0 FF 0A  1759         .db     0x44,0x60,0x8c,0xa8,0xb0,0xff,0x0a,0x22 ;D`.(0.."
             22
      00268C 62 46 86 0E 13 00 48  1760         .db     0x62,0x46,0x86,0x0e,0x13,0x00,0x48,0x6c ;bF....Hl
             6C
      002694 8C A9 FF 6A 82 06 2F  1761         .db     0x8c,0xa9,0xff,0x6a,0x82,0x06,0x2f,0x32 ;.).j../2
             32
      00269C 96 09 44 60 70 A5 FF  1762         .db     0x96,0x09,0x44,0x60,0x70,0xa5,0xff,0x2a ;..D`p%.*
             2A
      0026A4 63 06 72 36 08 2C 40  1763         .db     0x63,0x06,0x72,0x36,0x08,0x2c,0x40,0x4c ;c.r6.,@L
             4C
      0026AC 64 84 A9 FF 2A 63 4E  1764         .db     0x64,0x84,0xa9,0xff,0x2a,0x63,0x4e,0x76 ;d.).*cNv
             76
      0026B4 04 2D 40 50 64 88 A5  1765         .db     0x04,0x2d,0x40,0x50,0x64,0x88,0xa5,0xff ;.-@Pd.%.
             FF
      0026BC 6A 02 2E 6E 92 17 08  1766         .db     0x6a,0x02,0x2e,0x6e,0x92,0x17,0x08,0x24 ;j..n...$
             24
      0026C4 41 70 A5 FF 4A 22 82  1767         .db     0x41,0x70,0xa5,0xff,0x4a,0x22,0x82,0x0e ;Ap%.J"..
             0E
      0026CC 73 16 56 24 4C 60 85  1768         .db     0x73,0x16,0x56,0x24,0x4c,0x60,0x85,0xa5 ;s.V$L`.%
             A5
      0026D4 FF 0A 82 26 6E 73 77  1769         .db     0xff,0x0a,0x82,0x26,0x6e,0x73,0x77,0x00 ;...&nsw.
             00
      0026DC 2D 48 50 60 A5 FF 4A  1770         .db     0x2d,0x48,0x50,0x60,0xa5,0xff,0x4a,0x63 ;-HP`%.Jc
             63
      0026E4 06 86 4F 32 36 96 09  1771         .db     0x06,0x86,0x4f,0x32,0x36,0x96,0x09,0x28 ;..O26..(
             28
      0026EC 40 70 A9 FF 4A 03 06  1772         .db     0x40,0x70,0xa9,0xff,0x4a,0x03,0x06,0x73 ;@p).J..s
             73
      0026F4 36 76 08 10 4C 60 81  1773         .db     0x36,0x76,0x08,0x10,0x4c,0x60,0x81,0xa0 ;6v..L`. 
             A0
      0026FC FF 0A 63 52 56 30 41  1774         .db     0xff,0x0a,0x63,0x52,0x56,0x30,0x41,0x65 ;..cRV0Ae
             65
      002704 89 A4 AC FF 4A 22 86  1775         .db     0x89,0xa4,0xac,0xff,0x4a,0x22,0x86,0x0e ;.$,.J"..
             0E
      00270C 12 16 76 00 24 4D 60  1776         .db     0x12,0x16,0x76,0x00,0x24,0x4d,0x60,0xa8 ;..v.$M`(
             A8
      002714 B0 FF 0A 03 4E 96 2D  1777         .db     0xb0,0xff,0x0a,0x03,0x4e,0x96,0x2d,0x44 ;0...N.-D
             44
      00271C 70 80 88 A0 A8 FF 0A  1778         .db     0x70,0x80,0x88,0xa0,0xa8,0xff,0x0a,0x42 ;p.. (..B
             42
      002724 0E 32 37 10 20 45 64  1779         .db     0x0e,0x32,0x37,0x10,0x20,0x45,0x64,0x6c ;.27. Edl
             6C
      00272C 80 FF 4A 03 07 73 76  1780         .db     0x80,0xff,0x4a,0x03,0x07,0x73,0x76,0x08 ;..J..sv.
             08
      002734 4C 60 81 A0 A8 FF 0A  1781         .db     0x4c,0x60,0x81,0xa0,0xa8,0xff,0x0a,0x42 ;L`. (..B
             42
      00273C 82 2E 32 0C 20 44 6C  1782         .db     0x82,0x2e,0x32,0x0c,0x20,0x44,0x6c,0x89 ;..2. Dl.
             89
      002744 A4 AC FF 0A 03 6E 92  1783         .db     0xa4,0xac,0xff,0x0a,0x03,0x6e,0x92,0x36 ;$,...n.6
             36
      00274C 76 10 44 4C 81 A0 A8  1784         .db     0x76,0x10,0x44,0x4c,0x81,0xa0,0xa8,0xff ;v.DL. (.
             FF
      002754 6A 22 82 0E 32 92 36  1785         .db     0x6a,0x22,0x82,0x0e,0x32,0x92,0x36,0x76 ;j"..2.6v
             76
      00275C 00 10 45 6C A5 FF 0A  1786         .db     0x00,0x10,0x45,0x6c,0xa5,0xff,0x0a,0x43 ;..El%..C
             43
      002764 0E 8E 32 72 37 10 20  1787         .db     0x0e,0x8e,0x32,0x72,0x37,0x10,0x20,0x44 ;..2r7. D
             44
      00276C 68 84 B0 FF 0A 63 66  1788         .db     0x68,0x84,0xb0,0xff,0x0a,0x63,0x66,0x32 ;h.0..cf2
             32
      002774 0C 20 40 48 69 8C A4  1789         .db     0x0c,0x20,0x40,0x48,0x69,0x8c,0xa4,0xac ;. @Hi.$,
             AC
      00277C FF 0A 67 0E 8E 12 52  1790         .db     0xff,0x0a,0x67,0x0e,0x8e,0x12,0x52,0x16 ;..g...R.
             16
      002784 56 40 48 68 B0 FF 0A  1791         .db     0x56,0x40,0x48,0x68,0xb0,0xff,0x0a,0x23 ;V@Hh0..#
             23
      00278C 86 8E 72 00 2C 44 4C  1792         .db     0x86,0x8e,0x72,0x00,0x2c,0x44,0x4c,0x65 ;..r.,DLe
             65
      002794 B0 FF 2A 07 72 57 08  1793         .db     0xb0,0xff,0x2a,0x07,0x72,0x57,0x08,0x30 ;0.*.rW.0
             30
      00279C 4C 80 88 A0 A8 FF 6A  1794         .db     0x4c,0x80,0x88,0xa0,0xa8,0xff,0x6a,0x03 ;L.. (.j.
             03
      0027A4 8E 32 36 76 0C 45 60  1795         .db     0x8e,0x32,0x36,0x76,0x0c,0x45,0x60,0x6c ;.26v.E`l
             6C
      0027AC A1 FF 2A 43 46 0E 73  1796         .db     0xa1,0xff,0x2a,0x43,0x46,0x0e,0x73,0x01 ;!.*CF.s.
             01
      0027B4 20 4C 85 A1 FF 6A 22  1797         .db     0x20,0x4c,0x85,0xa1,0xff,0x6a,0x22,0x86 ; L.!.j".
             86
      0027BC 0F 16 00 24 44 50 60  1798         .db     0x0f,0x16,0x00,0x24,0x44,0x50,0x60,0xa8 ;...$DP`(
             A8
      0027C4 B0 FF 4A 42 82 0E 73  1799         .db     0xb0,0xff,0x4a,0x42,0x82,0x0e,0x73,0x17 ;0.JB..s.
             17
      0027CC 01 21 4C 85 FF 0A 82  1800         .db     0x01,0x21,0x4c,0x85,0xff,0x0a,0x82,0x26 ;.!L....&
             26
      0027D4 6E 32 00 0C 48 60 70  1801         .db     0x6e,0x32,0x00,0x0c,0x48,0x60,0x70,0x84 ;n2..H`p.
             84
      0027DC A5 FF 2A 42 06 46 0E  1802         .db     0xa5,0xff,0x2a,0x42,0x06,0x46,0x0e,0x8e ;%.*B.F..
             8E
      0027E4 73 77 4D 68 A0 FF 6A  1803         .db     0x73,0x77,0x4d,0x68,0xa0,0xff,0x6a,0x02 ;swMh .j.
             02
      0027EC 82 66 2E 6E 32 92 17  1804         .db     0x82,0x66,0x2e,0x6e,0x32,0x92,0x17,0x08 ;.f.n2...
             08
      0027F4 41 70 A5 FF 4A 03 07  1805         .db     0x41,0x70,0xa5,0xff,0x4a,0x03,0x07,0x72 ;Ap%.J..r
             72
      0027FC 28 4C 80 88 A0 FF 2A  1806         .db     0x28,0x4c,0x80,0x88,0xa0,0xff,0x2a,0x02 ;(L.. .*.
             02
      002804 42 0F 12 77 04 50 65  1807         .db     0x42,0x0f,0x12,0x77,0x04,0x50,0x65,0x80 ;B..w.Pe.
             80
      00280C FF 0A 23 0E 8E 72 56  1808         .db     0xff,0x0a,0x23,0x0e,0x8e,0x72,0x56,0x00 ;..#..rV.
             00
      002814 30 44 4C 65 B0 FF 0A  1809         .db     0x30,0x44,0x4c,0x65,0xb0,0xff,0x0a,0x42 ;0DLe0..B
             42
      00281C 2F 16 96 0C 20 44 70  1810         .db     0x2f,0x16,0x96,0x0c,0x20,0x44,0x70,0x80 ;/... Dp.
             80
      002824 88 A0 A8 FF 0A 42 82  1811         .db     0x88,0xa0,0xa8,0xff,0x0a,0x42,0x82,0x47 ;. (..B.G
             47
      00282C 6E 12 52 17 00 20 48  1812         .db     0x6e,0x12,0x52,0x17,0x00,0x20,0x48,0x90 ;n.R.. H.
             90
      002834 A5 FF 2A 02 82 86 6E  1813         .db     0xa5,0xff,0x2a,0x02,0x82,0x86,0x6e,0x17 ;%.*...n.
             17
      00283C 04 0C 4C 61 A8 B0 FF  1814         .db     0x04,0x0c,0x4c,0x61,0xa8,0xb0,0xff,0x0a ;..La(0..
             0A
      002844 03 06 52 92 17 0C 44  1815         .db     0x03,0x06,0x52,0x92,0x17,0x0c,0x44,0x60 ;..R...D`
             60
      00284C 80 A0 A8 FF 2A 22 62  1816         .db     0x80,0xa0,0xa8,0xff,0x2a,0x22,0x62,0x0e ;. (.*"b.
             0E
      002854 73 16 56 01 4C 85 A4  1817         .db     0x73,0x16,0x56,0x01,0x4c,0x85,0xa4,0xff ;s.V.L.$.
             FF
      00285C 0A 02 2E 36 76 10 41  1818         .db     0x0a,0x02,0x2e,0x36,0x76,0x10,0x41,0x65 ;...6v.Ae
             65
      002864 A0 A8 FF 0A 82 52 0C  1819         .db     0xa0,0xa8,0xff,0x0a,0x82,0x52,0x0c,0x41 ; (...R.A
             41
      00286C 60 68 84 8C A4 AC FF  1820         .db     0x60,0x68,0x84,0x8c,0xa4,0xac,0xff,0x0a ;`h..$,..
             0A
      002874 22 62 66 52 77 00 2D  1821         .db     0x22,0x62,0x66,0x52,0x77,0x00,0x2d,0x44 ;"bfRw.-D
             44
      00287C 68 89 A1 FF 4A 02 67  1822         .db     0x68,0x89,0xa1,0xff,0x4a,0x02,0x67,0x0e ;h.!.J.g.
             0E
      002884 72 36 96 04 24 40 4C  1823         .db     0x72,0x36,0x96,0x04,0x24,0x40,0x4c,0x88 ;r6..$@L.
             88
      00288C A9 FF 4A 46 0E 92 37  1824         .db     0xa9,0xff,0x4a,0x46,0x0e,0x92,0x37,0x10 ;).JF..7.
             10
      002894 21 6C 85 A5 FF 0A 03  1825         .db     0x21,0x6c,0x85,0xa5,0xff,0x0a,0x03,0x0f ;!l.%....
             0F
      00289C 92 96 30 44 50 80 A0  1826         .db     0x92,0x96,0x30,0x44,0x50,0x80,0xa0,0xa8 ;..0DP. (
             A8
      0028A4 FF 6A 82 06 4E 16 56  1827         .db     0xff,0x6a,0x82,0x06,0x4e,0x16,0x56,0x29 ;.j..N.V)
             29
      0028AC 44 60 8D A8 B0 FF 0A  1828         .db     0x44,0x60,0x8d,0xa8,0xb0,0xff,0x0a,0x42 ;D`.(0..B
             42
      0028B4 82 4E 8E 53 16 00 0C  1829         .db     0x82,0x4e,0x8e,0x53,0x16,0x00,0x0c,0x2c ;.N.S...,
             2C
      0028BC 44 84 A4 B0 FF 2A 02  1830         .db     0x44,0x84,0xa4,0xb0,0xff,0x2a,0x02,0x26 ;D.$0.*.&
             26
      0028C4 0E 56 96 04 10 30 4C  1831         .db     0x0e,0x56,0x96,0x04,0x10,0x30,0x4c,0x61 ;.V...0La
             61
      0028CC A0 FF 0A 22 62 26 86  1832         .db     0xa0,0xff,0x0a,0x22,0x62,0x26,0x86,0x0e ; .."b&..
             0E
      0028D4 53 57 00 30 48 64 A9  1833         .db     0x53,0x57,0x00,0x30,0x48,0x64,0xa9,0xff ;SW.0Hd).
             FF
      0028DC 6A 82 06 4E 16 56 08  1834         .db     0x6a,0x82,0x06,0x4e,0x16,0x56,0x08,0x29 ;j..N.V.)
             29
      0028E4 44 60 8D A8 B0 FF 6A  1835         .db     0x44,0x60,0x8d,0xa8,0xb0,0xff,0x6a,0x22 ;D`.(0.j"
             22
      0028EC 86 0F 12 00 24 44 60  1836         .db     0x86,0x0f,0x12,0x00,0x24,0x44,0x60,0xa8 ;....$D`(
             A8
      0028F4 B0 FF 0A 22 82 0F 72  1837         .db     0xb0,0xff,0x0a,0x22,0x82,0x0f,0x72,0x00 ;0.."..r.
             00
      0028FC 50 60 68 85 A8 FF 2A  1838         .db     0x50,0x60,0x68,0x85,0xa8,0xff,0x2a,0x23 ;P`h.(.*#
             23
      002904 0E 73 17 01 4C 65 80  1839         .db     0x0e,0x73,0x17,0x01,0x4c,0x65,0x80,0xff ;.s..Le..
             FF
      00290C 4A 02 42 26 6E 17 04  1840         .db     0x4a,0x02,0x42,0x26,0x6e,0x17,0x04,0x29 ;J.B&n..)
             29
      002914 4C 70 81 A5 FF 4A 66  1841         .db     0x4c,0x70,0x81,0xa5,0xff,0x4a,0x66,0x13 ;Lp.%.Jf.
             13
      00291C 17 01 24 40 88 90 FF  1842         .db     0x17,0x01,0x24,0x40,0x88,0x90,0xff,0x2a ;..$@...*
             2A
      002924 43 26 0E 72 36 96 01  1843         .db     0x43,0x26,0x0e,0x72,0x36,0x96,0x01,0x4c ;C&.r6..L
             4C
      00292C 85 A1 FF 2A 02 4F 92  1844         .db     0x85,0xa1,0xff,0x2a,0x02,0x4f,0x92,0x16 ;.!.*.O..
             16
      002934 05 2C 40 50 70 A0 A8  1845         .db     0x05,0x2c,0x40,0x50,0x70,0xa0,0xa8,0xff ;.,@Pp (.
             FF
      00293C 0A 22 62 26 66 13 16  1846         .db     0x0a,0x22,0x62,0x26,0x66,0x13,0x16,0x96 ;."b&f...
             96
      002944 00 48 68 70 8C A0 FF  1847         .db     0x00,0x48,0x68,0x70,0x8c,0xa0,0xff,0x6a ;.Hhp. .j
             6A
      00294C 82 2E 6E 13 05 21 44  1848         .db     0x82,0x2e,0x6e,0x13,0x05,0x21,0x44,0x60 ;..n..!D`
             60
      002954 90 A4 AC FF 0A 26 6E  1849         .db     0x90,0xa4,0xac,0xff,0x0a,0x26,0x6e,0x13 ;.$,..&n.
             13
      00295C 36 96 00 48 64 70 81  1850         .db     0x36,0x96,0x00,0x48,0x64,0x70,0x81,0xa5 ;6..Hdp.%
             A5
      002964 FF 4A 03 06 73 76 08  1851         .db     0xff,0x4a,0x03,0x06,0x73,0x76,0x08,0x10 ;.J..sv..
             10
      00296C 4C 60 81 A0 A8 FF 0A  1852         .db     0x4c,0x60,0x81,0xa0,0xa8,0xff,0x0a,0x22 ;L`. (.."
             22
      002974 62 27 8E 13 17 00 48  1853         .db     0x62,0x27,0x8e,0x13,0x17,0x00,0x48,0x90 ;b'....H.
             90
      00297C A1 FF 4A 03 0E 72 24  1854         .db     0xa1,0xff,0x4a,0x03,0x0e,0x72,0x24,0x4c ;!.J..r$L
             4C
      002984 80 88 FF 6A 22 86 72  1855         .db     0x80,0x88,0xff,0x6a,0x22,0x86,0x72,0x17 ;...j".r.
             17
      00298C 00 08 44 4C 60 A8 B0  1856         .db     0x00,0x08,0x44,0x4c,0x60,0xa8,0xb0,0xff ;..DL`(0.
             FF
      002994 4A 63 0F 53 56 96 04  1857         .db     0x4a,0x63,0x0f,0x53,0x56,0x96,0x04,0x24 ;Jc.SV..$
             24
      00299C 30 40 88 A5 FF 0A 22  1858         .db     0x30,0x40,0x88,0xa5,0xff,0x0a,0x22,0x62 ;0@.%.."b
             62
      0029A4 26 66 13 17 00 48 68  1859         .db     0x26,0x66,0x13,0x17,0x00,0x48,0x68,0x70 ;&f...Hhp
             70
      0029AC 8C A0 FF 2A 63 4E 96  1860         .db     0x8c,0xa0,0xff,0x2a,0x63,0x4e,0x96,0x04 ;. .*cN..
             04
      0029B4 10 2D 40 64 70 85 A4  1861         .db     0x10,0x2d,0x40,0x64,0x70,0x85,0xa4,0xff ;.-@dp.$.
             FF
      0029BC 0A 02 07 0E 92 10 30  1862         .db     0x0a,0x02,0x07,0x0e,0x92,0x10,0x30,0x48 ;......0H
             48
      0029C4 50 80 A0 A8 FF 4A 02  1863         .db     0x50,0x80,0xa0,0xa8,0xff,0x4a,0x02,0x0e ;P. (.J..
             0E
      0029CC 92 36 76 10 24 4C 6C  1864         .db     0x92,0x36,0x76,0x10,0x24,0x4c,0x6c,0x80 ;.6v.$Ll.
             80
      0029D4 88 FF 4A 02 06 8E 12  1865         .db     0x88,0xff,0x4a,0x02,0x06,0x8e,0x12,0x92 ;..J.....
             92
      0029DC 36 76 08 28 4C 6C 81  1866         .db     0x36,0x76,0x08,0x28,0x4c,0x6c,0x81,0xa0 ;6v.(Ll. 
             A0
      0029E4 FF 4A 43 0E 92 16 56  1867         .db     0xff,0x4a,0x43,0x0e,0x92,0x16,0x56,0x01 ;.JC...V.
             01
      0029EC 21 6C 85 FF 2A 63 86  1868         .db     0x21,0x6c,0x85,0xff,0x2a,0x63,0x86,0x4e ;!l..*c.N
             4E
      0029F4 53 04 0C 2C 40 64 A8  1869         .db     0x53,0x04,0x0c,0x2c,0x40,0x64,0xa8,0xb0 ;S..,@d(0
             B0
      0029FC FF 0A 82 2E 6E 17 00  1870         .db     0xff,0x0a,0x82,0x2e,0x6e,0x17,0x00,0x0c ;....n...
             0C
      002A04 41 60 70 A5 FF 0A 22  1871         .db     0x41,0x60,0x70,0xa5,0xff,0x0a,0x22,0x82 ;A`p%..".
             82
      002A0C 26 0F 72 00 50 60 68  1872         .db     0x26,0x0f,0x72,0x00,0x50,0x60,0x68,0xa9 ;&.r.P`h)
             A9
      002A14 FF 0A 03 06 6E 33 37  1873         .db     0xff,0x0a,0x03,0x06,0x6e,0x33,0x37,0x0d ;....n37.
             0D
      002A1C 45 60 90 A0 A8 FF 2A  1874         .db     0x45,0x60,0x90,0xa0,0xa8,0xff,0x2a,0x63 ;E`. (.*c
             63
      002A24 86 4E 72 16 76 00 08  1875         .db     0x86,0x4e,0x72,0x16,0x76,0x00,0x08,0x20 ;.Nr.v.. 
             20
      002A2C 50 64 88 A9 FF 0A 03  1876         .db     0x50,0x64,0x88,0xa9,0xff,0x0a,0x03,0x86 ;Pd.)....
             86
      002A34 6E 56 0D 45 60 90 A8  1877         .db     0x6e,0x56,0x0d,0x45,0x60,0x90,0xa8,0xb0 ;nV.E`.(0
             B0
      002A3C FF 2A 63 86 4E 53 04  1878         .db     0xff,0x2a,0x63,0x86,0x4e,0x53,0x04,0x0c ;.*c.NS..
             0C
      002A44 2C 40 64 88 A9 FF 2A  1879         .db     0x2c,0x40,0x64,0x88,0xa9,0xff,0x2a,0x03 ;,@d.).*.
             03
      002A4C 26 2E 73 77 30 50 81  1880         .db     0x26,0x2e,0x73,0x77,0x30,0x50,0x81,0xa0 ;&.sw0P. 
             A0
      002A54 A8 FF 4A 02 0F 92 96  1881         .db     0xa8,0xff,0x4a,0x02,0x0f,0x92,0x96,0x04 ;(.J.....
             04
      002A5C 10 24 50 6D 80 A0 A8  1882         .db     0x10,0x24,0x50,0x6d,0x80,0xa0,0xa8,0xff ;.$Pm. (.
             FF
      002A64 6A 22 82 06 2F 16 96  1883         .db     0x6a,0x22,0x82,0x06,0x2f,0x16,0x96,0x09 ;j"../...
             09
      002A6C 44 60 70 8C A5 FF 4A  1884         .db     0x44,0x60,0x70,0x8c,0xa5,0xff,0x4a,0x82 ;D`p.%.J.
             82
      002A74 07 4E 76 08 10 29 50  1885         .db     0x07,0x4e,0x76,0x08,0x10,0x29,0x50,0x60 ;.Nv..)P`
             60
      002A7C 85 A5 FF 2A 07 72 56  1886         .db     0x85,0xa5,0xff,0x2a,0x07,0x72,0x56,0x96 ;.%.*.rV.
             96
      002A84 08 30 4C 80 88 A0 A8  1887         .db     0x08,0x30,0x4c,0x80,0x88,0xa0,0xa8,0xff ;.0L.. (.
             FF
      002A8C 0A 22 62 13 36 76 00  1888         .db     0x0a,0x22,0x62,0x13,0x36,0x76,0x00,0x44 ;."b.6v.D
             44
      002A94 64 6C 89 A0 FF 0A 23  1889         .db     0x64,0x6c,0x89,0xa0,0xff,0x0a,0x23,0x92 ;dl. ..#.
             92
      002A9C 00 44 64 6C A1 FF 2A  1890         .db     0x00,0x44,0x64,0x6c,0xa1,0xff,0x2a,0x02 ;.Ddl!.*.
             02
      002AA4 46 2E 73 16 04 0C 50  1891         .db     0x46,0x2e,0x73,0x16,0x04,0x0c,0x50,0x68 ;F.s...Ph
             68
      002AAC 85 A1 FF 2A 43 0E 73  1892         .db     0x85,0xa1,0xff,0x2a,0x43,0x0e,0x73,0x17 ;.!.*C.s.
             17
      002AB4 01 4C 85 A0 A8 FF 2A  1893         .db     0x01,0x4c,0x85,0xa0,0xa8,0xff,0x2a,0x02 ;.L. (.*.
             02
      002ABC 2F 12 17 05 40 61 FF  1894         .db     0x2f,0x12,0x17,0x05,0x40,0x61,0xff,0x0a ;/...@a..
             0A
      002AC4 23 6E 33 17 00 0C 45  1895         .db     0x23,0x6e,0x33,0x17,0x00,0x0c,0x45,0x64 ;#n3...Ed
             64
      002ACC 90 A0 A8 FF 4A 42 82  1896         .db     0x90,0xa0,0xa8,0xff,0x4a,0x42,0x82,0x46 ;. (.JB.F
             46
      002AD4 0E 72 16 01 21 50 85  1897         .db     0x0e,0x72,0x16,0x01,0x21,0x50,0x85,0xa4 ;.r..!P.$
             A4
      002ADC FF 2A 63 67 2E 92 17  1898         .db     0xff,0x2a,0x63,0x67,0x2e,0x92,0x17,0x04 ;.*cg....
             04
      002AE4 0C 40 6D 88 A8 FF 0A  1899         .db     0x0c,0x40,0x6d,0x88,0xa8,0xff,0x0a,0x03 ;.@m.(...
             03
      002AEC 07 8E 13 36 48 81 A4  1900         .db     0x07,0x8e,0x13,0x36,0x48,0x81,0xa4,0xb0 ;...6H.$0
             B0
      002AF4 FF 0A 82 86 0E 53 00  1901         .db     0xff,0x0a,0x82,0x86,0x0e,0x53,0x00,0x30 ;.....S.0
             30
      002AFC 40 48 60 A8 B0 FF 0A  1902         .db     0x40,0x48,0x60,0xa8,0xb0,0xff,0x0a,0x62 ;@H`(0..b
             62
      002B04 66 0E 13 17 00 20 40  1903         .db     0x66,0x0e,0x13,0x17,0x00,0x20,0x40,0x48 ;f.... @H
             48
      002B0C 68 8C A0 FF 0A 22 06  1904         .db     0x68,0x8c,0xa0,0xff,0x0a,0x22,0x06,0x66 ;h. ..".f
             66
      002B14 6E 92 36 96 10 44 4C  1905         .db     0x6e,0x92,0x36,0x96,0x10,0x44,0x4c,0x70 ;n.6..DLp
             70
      002B1C A0 A8 FF 0A 02 62 86  1906         .db     0xa0,0xa8,0xff,0x0a,0x02,0x62,0x86,0x2e ; (...b..
             2E
      002B24 6E 17 41 64 70 A8 FF  1907         .db     0x6e,0x17,0x41,0x64,0x70,0xa8,0xff,0x4a ;n.Adp(.J
             4A
      002B2C 22 62 06 46 92 16 76  1908         .db     0x22,0x62,0x06,0x46,0x92,0x16,0x76,0x29 ;"b.F..v)
             29
      002B34 50 6C 85 A1 FF 4A 43  1909         .db     0x50,0x6c,0x85,0xa1,0xff,0x4a,0x43,0x0e ;Pl.!.JC.
             0E
      002B3C 92 16 56 00 21 6C 85  1910         .db     0x92,0x16,0x56,0x00,0x21,0x6c,0x85,0xff ;..V.!l..
             FF
      002B44 0A 42 82 0F 32 77 10  1911         .db     0x0a,0x42,0x82,0x0f,0x32,0x77,0x10,0x20 ;.B..2w. 
             20
      002B4C 44 68 A4 AC FF 0A 02  1912         .db     0x44,0x68,0xa4,0xac,0xff,0x0a,0x02,0x2e ;Dh$,....
             2E
      002B54 6E 73 16 76 0C 50 61  1913         .db     0x6e,0x73,0x16,0x76,0x0c,0x50,0x61,0x80 ;ns.v.Pa.
             80
      002B5C A4 FF 0A 03 0E 32 72  1914         .db     0xa4,0xff,0x0a,0x03,0x0e,0x32,0x72,0x56 ;$....2rV
             56
      002B64 10 44 60 68 80 A0 FF  1915         .db     0x10,0x44,0x60,0x68,0x80,0xa0,0xff,0x0a ;.D`h. ..
             0A
      002B6C 42 66 6E 32 96 10 20  1916         .db     0x42,0x66,0x6e,0x32,0x96,0x10,0x20,0x45 ;Bfn2.. E
             45
      002B74 70 A4 AC FF 0A 02 42  1917         .db     0x70,0xa4,0xac,0xff,0x0a,0x02,0x42,0x06 ;p$,...B.
             06
      002B7C 46 8E 56 96 10 2D 48  1918         .db     0x46,0x8e,0x56,0x96,0x10,0x2d,0x48,0x68 ;F.V..-Hh
             68
      002B84 81 A1 FF 0A 43 0E 4E  1919         .db     0x81,0xa1,0xff,0x0a,0x43,0x0e,0x4e,0x92 ;.!..C.N.
             92
      002B8C 77 10 20 44 50 88 A0  1920         .db     0x77,0x10,0x20,0x44,0x50,0x88,0xa0,0xa8 ;w. DP. (
             A8
      002B94 FF 6A 22 0F 92 16 56  1921         .db     0xff,0x6a,0x22,0x0f,0x92,0x16,0x56,0x00 ;.j"...V.
             00
      002B9C 24 44 6C 80 A0 A8 FF  1922         .db     0x24,0x44,0x6c,0x80,0xa0,0xa8,0xff,0x0a ;$Dl. (..
             0A
      002BA4 02 07 6E 56 96 0D 30  1923         .db     0x02,0x07,0x6e,0x56,0x96,0x0d,0x30,0x48 ;..nV..0H
             48
      002BAC 60 81 FF 0A 42 82 46  1924         .db     0x60,0x81,0xff,0x0a,0x42,0x82,0x46,0x86 ;`...B.F.
             86
      002BB4 13 00 48 6C A8 B0 FF  1925         .db     0x13,0x00,0x48,0x6c,0xa8,0xb0,0xff,0x2a ;..Hl(0.*
             2A
      002BBC 43 26 2F 92 16 96 50  1926         .db     0x43,0x26,0x2f,0x92,0x16,0x96,0x50,0x70 ;C&/...Pp
             70
      002BC4 85 A0 A8 FF 2A 02 82  1927         .db     0x85,0xa0,0xa8,0xff,0x2a,0x02,0x82,0x67 ;. (.*..g
             67
      002BCC 8E 12 52 16 56 04 40  1928         .db     0x8e,0x12,0x52,0x16,0x56,0x04,0x40,0x68 ;..R.V.@h
             68
      002BD4 B0 FF 0A 82 6E 13 16  1929         .db     0xb0,0xff,0x0a,0x82,0x6e,0x13,0x16,0x00 ;0...n...
             00
      002BDC 40 48 70 A4 AC FF 4A  1930         .db     0x40,0x48,0x70,0xa4,0xac,0xff,0x4a,0x06 ;@Hp$,.J.
             06
      002BE4 8E 32 92 36 76 28 40  1931         .db     0x8e,0x32,0x92,0x36,0x76,0x28,0x40,0x6c ;.2.6v(@l
             6C
      002BEC 84 A1 FF 0A 22 62 86  1932         .db     0x84,0xa1,0xff,0x0a,0x22,0x62,0x86,0x8e ;.!.."b..
             8E
      002BF4 13 37 00 48 64 6C B0  1933         .db     0x13,0x37,0x00,0x48,0x64,0x6c,0xb0,0xff ;.7.Hdl0.
             FF
      002BFC 0A 03 26 0E 73 56 96  1934         .db     0x0a,0x03,0x26,0x0e,0x73,0x56,0x96,0x10 ;..&.sV..
             10
      002C04 30 49 A0 A8 FF 4A 06  1935         .db     0x30,0x49,0xa0,0xa8,0xff,0x4a,0x06,0x8e ;0I (.J..
             8E
      002C0C 32 92 36 76 0C 28 40  1936         .db     0x32,0x92,0x36,0x76,0x0c,0x28,0x40,0x6c ;2.6v.(@l
             6C
      002C14 84 A1 FF 6A 42 82 66  1937         .db     0x84,0xa1,0xff,0x6a,0x42,0x82,0x66,0x0e ;.!.jB.f.
             0E
      002C1C 6E 92 17 00 44 4C 70  1938         .db     0x6e,0x92,0x17,0x00,0x44,0x4c,0x70,0xa5 ;n...DLp%
             A5
      002C24 FF 2A 02 67 12 52 04  1939         .db     0xff,0x2a,0x02,0x67,0x12,0x52,0x04,0x40 ;.*.g.R.@
             40
      002C2C 68 8C A9 FF 0A 22 62  1940         .db     0x68,0x8c,0xa9,0xff,0x0a,0x22,0x62,0x86 ;h.).."b.
             86
      002C34 13 00 44 64 6C 8C A9  1941         .db     0x13,0x00,0x44,0x64,0x6c,0x8c,0xa9,0xff ;..Ddl.).
             FF
      002C3C 4A 03 73 16 76 05 25  1942         .db     0x4a,0x03,0x73,0x16,0x76,0x05,0x25,0x50 ;J.s.v.%P
             50
      002C44 81 A0 A8 FF 2A 23 26  1943         .db     0x81,0xa0,0xa8,0xff,0x2a,0x23,0x26,0x0e ;. (.*#&.
             0E
      002C4C 36 76 10 4C 64 6C 85  1944         .db     0x36,0x76,0x10,0x4c,0x64,0x6c,0x85,0xa4 ;6v.Ldl.$
             A4
      002C54 FF 0A 22 62 4E 73 77  1945         .db     0xff,0x0a,0x22,0x62,0x4e,0x73,0x77,0x00 ;.."bNsw.
             00
      002C5C 2D 50 64 85 A1 FF 0A  1946         .db     0x2d,0x50,0x64,0x85,0xa1,0xff,0x0a,0x82 ;-Pd.!...
             82
      002C64 0F 56 00 10 30 41 60  1947         .db     0x0f,0x56,0x00,0x10,0x30,0x41,0x60,0x68 ;.V..0A`h
             68
      002C6C 88 AD FF 2A 22 62 06  1948         .db     0x88,0xad,0xff,0x2a,0x22,0x62,0x06,0x46 ;.-.*"b.F
             46
      002C74 4E 92 16 2C 50 70 85  1949         .db     0x4e,0x92,0x16,0x2c,0x50,0x70,0x85,0xff ;N..,Pp..
             FF
      002C7C 4A 02 07 72 08 28 4C  1950         .db     0x4a,0x02,0x07,0x72,0x08,0x28,0x4c,0x80 ;J..r.(L.
             80
      002C84 88 A1 FF 0A 42 82 0E  1951         .db     0x88,0xa1,0xff,0x0a,0x42,0x82,0x0e,0x4e ;.!..B..N
             4E
      002C8C 92 36 00 10 20 70 88  1952         .db     0x92,0x36,0x00,0x10,0x20,0x70,0x88,0xa5 ;.6.. p.%
             A5
      002C94 FF 0A 22 66 8E 32 16  1953         .db     0xff,0x0a,0x22,0x66,0x8e,0x32,0x16,0x56 ;.."f.2.V
             56
      002C9C 0C 45 69 90 FF 2A 02  1954         .db     0x0c,0x45,0x69,0x90,0xff,0x2a,0x02,0x52 ;.Ei..*.R
             52
      002CA4 57 04 30 40 61 81 A4  1955         .db     0x57,0x04,0x30,0x40,0x61,0x81,0xa4,0xac ;W.0@a.$,
             AC
      002CAC FF 6A 82 6F 12 52 16  1956         .db     0xff,0x6a,0x82,0x6f,0x12,0x52,0x16,0x56 ;.j.o.R.V
             56
      002CB4 00 40 48 60 A4 B0 FF  1957         .db     0x00,0x40,0x48,0x60,0xa4,0xb0,0xff,0x2a ;.@H`$0.*
             2A
      002CBC 03 0E 72 56 96 30 4C  1958         .db     0x03,0x0e,0x72,0x56,0x96,0x30,0x4c,0x80 ;..rV.0L.
             80
      002CC4 88 A0 A8 FF 0A 26 0E  1959         .db     0x88,0xa0,0xa8,0xff,0x0a,0x26,0x0e,0x76 ;. (..&.v
             76
      002CCC 00 30 48 50 60 68 81  1960         .db     0x00,0x30,0x48,0x50,0x60,0x68,0x81,0xa4 ;.0HP`h.$
             A4
      002CD4 B0 FF 0A 62 86 4E 53  1961         .db     0xb0,0xff,0x0a,0x62,0x86,0x4e,0x53,0x16 ;0..b.NS.
             16
      002CDC 56 0C 2C 41 88 A9 FF  1962         .db     0x56,0x0c,0x2c,0x41,0x88,0xa9,0xff,0x4a ;V.,A.).J
             4A
      002CE4 03 6E 73 04 0C 24 2C  1963         .db     0x03,0x6e,0x73,0x04,0x0c,0x24,0x2c,0x4c ;.ns..$,L
             4C
      002CEC 81 A0 A8 FF 0A 23 27  1964         .db     0x81,0xa0,0xa8,0xff,0x0a,0x23,0x27,0x8e ;. (..#'.
             8E
      002CF4 13 36 48 69 81 A4 B0  1965         .db     0x13,0x36,0x48,0x69,0x81,0xa4,0xb0,0xff ;.6Hi.$0.
             FF
      002CFC 0A 42 2E 16 76 00 0C  1966         .db     0x0a,0x42,0x2e,0x16,0x76,0x00,0x0c,0x20 ;.B..v.. 
             20
      002D04 50 64 6C 80 88 A1 FF  1967         .db     0x50,0x64,0x6c,0x80,0x88,0xa1,0xff,0x0a ;Pdl..!..
             0A
      002D0C 22 62 46 8E 52 37 00  1968         .db     0x22,0x62,0x46,0x8e,0x52,0x37,0x00,0x10 ;"bF.R7..
             10
      002D14 48 68 90 A4 FF 0A 03  1969         .db     0x48,0x68,0x90,0xa4,0xff,0x0a,0x03,0x6e ;Hh.$...n
             6E
      002D1C 92 16 56 44 4C 60 81  1970         .db     0x92,0x16,0x56,0x44,0x4c,0x60,0x81,0xa0 ;..VDL`. 
             A0
      002D24 A8 FF 0A 43 0E 32 56  1971         .db     0xa8,0xff,0x0a,0x43,0x0e,0x32,0x56,0x96 ;(..C.2V.
             96
      002D2C 10 20 45 68 88 A1 FF  1972         .db     0x10,0x20,0x45,0x68,0x88,0xa1,0xff,0x0a ;. Eh.!..
             0A
      002D34 03 8E 37 45 60 68 80  1973         .db     0x03,0x8e,0x37,0x45,0x60,0x68,0x80,0x90 ;..7E`h..
             90
      002D3C A1 FF 0A 42 46 92 77  1974         .db     0xa1,0xff,0x0a,0x42,0x46,0x92,0x77,0x0d ;!..BF.w.
             0D
      002D44 20 48 50 69 80 FF 4A  1975         .db     0x20,0x48,0x50,0x69,0x80,0xff,0x4a,0x43 ; HPi..JC
             43
      002D4C 0E 73 36 76 04 21 4C  1976         .db     0x0e,0x73,0x36,0x76,0x04,0x21,0x4c,0x85 ;.s6v.!L.
             85
      002D54 A0 FF 0A 42 2E 36 76  1977         .db     0xa0,0xff,0x0a,0x42,0x2e,0x36,0x76,0x20 ; ..B.6v 
             20
      002D5C 44 64 6C 81 A0 A8 FF  1978         .db     0x44,0x64,0x6c,0x81,0xa0,0xa8,0xff,0x6a ;Ddl. (.j
             6A
      002D64 22 0E 92 36 10 24 44  1979         .db     0x22,0x0e,0x92,0x36,0x10,0x24,0x44,0x4c ;"..6.$DL
             4C
      002D6C 60 70 80 A1 FF 0A 63  1980         .db     0x60,0x70,0x80,0xa1,0xff,0x0a,0x63,0x46 ;`p.!..cF
             46
      002D74 86 13 17 00 48 6C A8  1981         .db     0x86,0x13,0x17,0x00,0x48,0x6c,0xa8,0xb0 ;....Hl(0
             B0
      002D7C FF 0A 03 06 2E 6E 52  1982         .db     0xff,0x0a,0x03,0x06,0x2e,0x6e,0x52,0x92 ;.....nR.
             92
      002D84 17 0C 44 60 A0 A8 FF  1983         .db     0x17,0x0c,0x44,0x60,0xa0,0xa8,0xff,0x4a ;..D` (.J
             4A
      002D8C 43 0E 73 36 76 01 21  1984         .db     0x43,0x0e,0x73,0x36,0x76,0x01,0x21,0x4c ;C.s6v.!L
             4C
      002D94 85 A0 FF 0A 22 07 6E  1985         .db     0x85,0xa0,0xff,0x0a,0x22,0x07,0x6e,0x52 ;. ..".nR
             52
      002D9C 17 0C 2C 48 81 A8 B0  1986         .db     0x17,0x0c,0x2c,0x48,0x81,0xa8,0xb0,0xff ;..,H.(0.
             FF
      002DA4 4A 43 0E 73 17 01 21  1987         .db     0x4a,0x43,0x0e,0x73,0x17,0x01,0x21,0x4c ;JC.s..!L
             4C
      002DAC 85 A0 A8 FF 0A 23 27  1988         .db     0x85,0xa0,0xa8,0xff,0x0a,0x23,0x27,0x92 ;. (..#'.
             92
      002DB4 96 00 48 68 70 80 A1  1989         .db     0x96,0x00,0x48,0x68,0x70,0x80,0xa1,0xff ;..Hhp.!.
             FF
      002DBC 2A 62 66 2E 8E 13 04  1990         .db     0x2a,0x62,0x66,0x2e,0x8e,0x13,0x04,0x40 ;*bf....@
             40
      002DC4 68 70 A1 FF 2A 23 86  1991         .db     0x68,0x70,0xa1,0xff,0x2a,0x23,0x86,0x6e ;hp!.*#.n
             6E
      002DCC 12 16 01 4D 64 A8 B0  1992         .db     0x12,0x16,0x01,0x4d,0x64,0xa8,0xb0,0xff ;...Md(0.
             FF
      002DD4 0A 03 46 8E 52 2C 48  1993         .db     0x0a,0x03,0x46,0x8e,0x52,0x2c,0x48,0x68 ;..F.R,Hh
             68
      002DDC 81 A4 B0 FF 0A 23 27  1994         .db     0x81,0xa4,0xb0,0xff,0x0a,0x23,0x27,0x0e ;.$0..#'.
             0E
      002DE4 92 00 48 69 80 88 A1  1995         .db     0x92,0x00,0x48,0x69,0x80,0x88,0xa1,0xff ;..Hi..!.
             FF
      002DEC 0A 03 86 6E 33 16 56  1996         .db     0x0a,0x03,0x86,0x6e,0x33,0x16,0x56,0x0c ;...n3.V.
             0C
      002DF4 45 60 90 A9 FF 0A 03  1997         .db     0x45,0x60,0x90,0xa9,0xff,0x0a,0x03,0x06 ;E`.)....
             06
      002DFC 2E 6E 52 92 16 0C 44  1998         .db     0x2e,0x6e,0x52,0x92,0x16,0x0c,0x44,0x60 ;.nR...D`
             60
      002E04 A0 A8 FF 4A 42 82 47  1999         .db     0xa0,0xa8,0xff,0x4a,0x42,0x82,0x47,0x0e ; (.JB.G.
             0E
      002E0C 92 36 76 00 21 4C 6C  2000         .db     0x92,0x36,0x76,0x00,0x21,0x4c,0x6c,0xa5 ;.6v.!Ll%
             A5
      002E14 FF 6A 22 0E 6E 92 36  2001         .db     0xff,0x6a,0x22,0x0e,0x6e,0x92,0x36,0x96 ;.j".n.6.
             96
      002E1C 24 44 4C 70 80 A5 FF  2002         .db     0x24,0x44,0x4c,0x70,0x80,0xa5,0xff,0x2a ;$DLp.%.*
             2A
      002E24 02 66 0E 92 37 04 10  2003         .db     0x02,0x66,0x0e,0x92,0x37,0x04,0x10,0x40 ;.f..7..@
             40
      002E2C 69 A0 A8 FF 0A 02 42  2004         .db     0x69,0xa0,0xa8,0xff,0x0a,0x02,0x42,0x8e ;i (...B.
             8E
      002E34 32 56 10 45 64 6C A1  2005         .db     0x32,0x56,0x10,0x45,0x64,0x6c,0xa1,0xff ;2V.Edl!.
             FF
      002E3C 0A 23 26 8E 53 17 00  2006         .db     0x0a,0x23,0x26,0x8e,0x53,0x17,0x00,0x0c ;.#&.S...
             0C
      002E44 2C 48 81 A4 B0 FF 6A  2007         .db     0x2c,0x48,0x81,0xa4,0xb0,0xff,0x6a,0x02 ;,H.$0.j.
             02
      002E4C 06 8E 32 92 37 0C 28  2008         .db     0x06,0x8e,0x32,0x92,0x37,0x0c,0x28,0x41 ;..2.7.(A
             41
      002E54 6C A1 FF 2A 86 8E 72  2009         .db     0x6c,0xa1,0xff,0x2a,0x86,0x8e,0x72,0x76 ;l!.*..rv
             76
      002E5C 04 0C 20 4D 60 68 B0  2010         .db     0x04,0x0c,0x20,0x4d,0x60,0x68,0xb0,0xff ;.. M`h0.
             FF
      002E64 0A 42 2E 96 0D 20 44  2011         .db     0x0a,0x42,0x2e,0x96,0x0d,0x20,0x44,0x50 ;.B... DP
             50
      002E6C 65 80 88 A0 A8 FF 0A  2012         .db     0x65,0x80,0x88,0xa0,0xa8,0xff,0x0a,0x43 ;e.. (..C
             43
      002E74 46 0E 4E 92 16 00 20  2013         .db     0x46,0x0e,0x4e,0x92,0x16,0x00,0x20,0x50 ;F.N... P
             50
      002E7C 85 A0 A8 FF 0A 23 26  2014         .db     0x85,0xa0,0xa8,0xff,0x0a,0x23,0x26,0x92 ;. (..#&.
             92
      002E84 37 00 48 64 6C 80 A0  2015         .db     0x37,0x00,0x48,0x64,0x6c,0x80,0xa0,0xa8 ;7.Hdl. (
             A8
      002E8C FF 0A 23 27 92 16 96  2016         .db     0xff,0x0a,0x23,0x27,0x92,0x16,0x96,0x00 ;..#'....
             00
      002E94 48 68 70 A1 FF 6A 22  2017         .db     0x48,0x68,0x70,0xa1,0xff,0x6a,0x22,0x86 ;Hhp!.j".
             86
      002E9C 0E 16 56 01 24 44 4C  2018         .db     0x0e,0x16,0x56,0x01,0x24,0x44,0x4c,0x60 ;..V.$DL`
             60
      002EA4 A8 B0 FF 6A 06 4E 92  2019         .db     0xa8,0xb0,0xff,0x6a,0x06,0x4e,0x92,0x36 ;(0.j.N.6
             36
      002EAC 96 09 28 41 70 A0 A8  2020         .db     0x96,0x09,0x28,0x41,0x70,0xa0,0xa8,0xff ;..(Ap (.
             FF
      002EB4 0A 22 82 86 2E 33 17  2021         .db     0x0a,0x22,0x82,0x86,0x2e,0x33,0x17,0x00 ;."...3..
             00
      002EBC 44 61 89 AC FF 0A 63  2022         .db     0x44,0x61,0x89,0xac,0xff,0x0a,0x63,0x0e ;Da.,..c.
             0E
      002EC4 6E 56 30 40 48 64 AD  2023         .db     0x6e,0x56,0x30,0x40,0x48,0x64,0xad,0xff ;nV0@Hd-.
             FF
      002ECC 4A 22 86 4E 12 16 76  2024         .db     0x4a,0x22,0x86,0x4e,0x12,0x16,0x76,0x00 ;J".N..v.
             00
      002ED4 28 50 60 88 A8 B0 FF  2025         .db     0x28,0x50,0x60,0x88,0xa8,0xb0,0xff,0x2a ;(P`.(0.*
             2A
      002EDC 02 42 2E 77 04 0C 30  2026         .db     0x02,0x42,0x2e,0x77,0x04,0x0c,0x30,0x50 ;.B.w..0P
             50
      002EE4 65 80 88 A0 A8 FF 2A  2027         .db     0x65,0x80,0x88,0xa0,0xa8,0xff,0x2a,0x82 ;e.. (.*.
             82
      002EEC 0F 72 16 76 01 50 60  2028         .db     0x0f,0x72,0x16,0x76,0x01,0x50,0x60,0x68 ;.r.v.P`h
             68
      002EF4 85 A8 FF 2A 03 66 0E  2029         .db     0x85,0xa8,0xff,0x2a,0x03,0x66,0x0e,0x4e ;.(.*.f.N
             4E
      002EFC 12 77 04 50 89 A0 A8  2030         .db     0x12,0x77,0x04,0x50,0x89,0xa0,0xa8,0xff ;.w.P. (.
             FF
      002F04 4A 02 42 46 6E 17 04  2031         .db     0x4a,0x02,0x42,0x46,0x6e,0x17,0x04,0x0c ;J.BFn...
             0C
      002F0C 24 4C 70 81 A5 FF 0A  2032         .db     0x24,0x4c,0x70,0x81,0xa5,0xff,0x0a,0x42 ;$Lp.%..B
             42
      002F14 27 92 96 00 48 68 70  2033         .db     0x27,0x92,0x96,0x00,0x48,0x68,0x70,0x80 ;'...Hhp.
             80
      002F1C 88 FF 0A 86 33 0C 44  2034         .db     0x88,0xff,0x0a,0x86,0x33,0x0c,0x44,0x60 ;....3.D`
             60
      002F24 68 88 90 FF 0A 42 82  2035         .db     0x68,0x88,0x90,0xff,0x0a,0x42,0x82,0x26 ;h....B.&
             26
      002F2C 6E 33 00 48 64 90 A4  2036         .db     0x6e,0x33,0x00,0x48,0x64,0x90,0xa4,0xac ;n3.Hd.$,
             AC
      002F34 FF 4A 42 82 0E 92 36  2037         .db     0xff,0x4a,0x42,0x82,0x0e,0x92,0x36,0x76 ;.JB...6v
             76
      002F3C 00 10 21 4C 6C A5 FF  2038         .db     0x00,0x10,0x21,0x4c,0x6c,0xa5,0xff,0x0a ;..!Ll%..
             0A
      002F44 23 0E 6E 13 36 00 45  2039         .db     0x23,0x0e,0x6e,0x13,0x36,0x00,0x45,0x70 ;#.n.6.Ep
             70
      002F4C 90 A0 A8 FF 2A 23 0E  2040         .db     0x90,0xa0,0xa8,0xff,0x2a,0x23,0x0e,0x73 ;. (.*#.s
             73
      002F54 01 4C 65 88 A0 A8 FF  2041         .db     0x01,0x4c,0x65,0x88,0xa0,0xa8,0xff,0x0a ;.Le. (..
             0A
      002F5C 42 82 46 86 0E 6E 13  2042         .db     0x42,0x82,0x46,0x86,0x0e,0x6e,0x13,0x17 ;B.F..n..
             17
      002F64 00 48 70 A9 FF 0A 23  2043         .db     0x00,0x48,0x70,0xa9,0xff,0x0a,0x23,0x27 ;.Hp)..#'
             27
      002F6C 2E 92 16 00 50 6D 81  2044         .db     0x2e,0x92,0x16,0x00,0x50,0x6d,0x81,0xa0 ;....Pm. 
             A0
      002F74 A8 FF 6A 82 2F 12 96  2045         .db     0xa8,0xff,0x6a,0x82,0x2f,0x12,0x96,0x00 ;(.j./...
             00
      002F7C 08 21 50 60 8C A4 AC  2046         .db     0x08,0x21,0x50,0x60,0x8c,0xa4,0xac,0xff ;.!P`.$,.
             FF
      002F84 0A 03 66 2E 92 36 0D  2047         .db     0x0a,0x03,0x66,0x2e,0x92,0x36,0x0d,0x44 ;..f..6.D
             44
      002F8C 6D A1 FF 2A 62 46 0E  2048         .db     0x6d,0xa1,0xff,0x2a,0x62,0x46,0x0e,0x72 ;m!.*bF.r
             72
      002F94 36 76 01 20 4C 68 85  2049         .db     0x36,0x76,0x01,0x20,0x4c,0x68,0x85,0xa5 ;6v. Lh.%
             A5
      002F9C FF 4A 02 0E 92 36 76  2050         .db     0xff,0x4a,0x02,0x0e,0x92,0x36,0x76,0x04 ;.J...6v.
             04
      002FA4 24 40 4C 6C 81 A1 FF  2051         .db     0x24,0x40,0x4c,0x6c,0x81,0xa1,0xff,0x0a ;$@Ll.!..
             0A
      002FAC 42 82 2E 13 16 56 00  2052         .db     0x42,0x82,0x2e,0x13,0x16,0x56,0x00,0x20 ;B....V. 
             20
      002FB4 44 89 AC FF 0A 42 27  2053         .db     0x44,0x89,0xac,0xff,0x0a,0x42,0x27,0x92 ;D.,..B'.
             92
      002FBC 17 00 48 68 70 80 88  2054         .db     0x17,0x00,0x48,0x68,0x70,0x80,0x88,0xa0 ;..Hhp.. 
             A0
      002FC4 FF 4A 82 86 2F 76 05  2055         .db     0xff,0x4a,0x82,0x86,0x2f,0x76,0x05,0x24 ;.J../v.$
             24
      002FCC 50 60 89 AD FF 4A 22  2056         .db     0x50,0x60,0x89,0xad,0xff,0x4a,0x22,0x0e ;P`.-.J".
             0E
      002FD4 92 36 76 01 24 4C 60  2057         .db     0x92,0x36,0x76,0x01,0x24,0x4c,0x60,0x6c ;.6v.$L`l
             6C
      002FDC 88 A1 FF 0A 03 07 0E  2058         .db     0x88,0xa1,0xff,0x0a,0x03,0x07,0x0e,0x52 ;.!.....R
             52
      002FE4 92 56 96 10 48 60 80  2059         .db     0x92,0x56,0x96,0x10,0x48,0x60,0x80,0xa0 ;.V..H`. 
             A0
      002FEC A8 FF 0A 03 26 86 6E  2060         .db     0xa8,0xff,0x0a,0x03,0x26,0x86,0x6e,0x32 ;(...&.n2
             32
      002FF4 72 36 76 0D 48 60 A9  2061         .db     0x72,0x36,0x76,0x0d,0x48,0x60,0xa9,0xff ;r6v.H`).
             FF
      002FFC 2A 02 82 2E 8E 72 76  2062         .db     0x2a,0x02,0x82,0x2e,0x8e,0x72,0x76,0x04 ;*....rv.
             04
      003004 0C 50 60 68 B0 FF 2A  2063         .db     0x0c,0x50,0x60,0x68,0xb0,0xff,0x2a,0x43 ;.P`h0.*C
             43
      00300C 0E 73 01 20 4C 85 A0  2064         .db     0x0e,0x73,0x01,0x20,0x4c,0x85,0xa0,0xa8 ;.s. L. (
             A8
      003014 FF 0A 03 86 6E 52 16  2065         .db     0xff,0x0a,0x03,0x86,0x6e,0x52,0x16,0x56 ;....nR.V
             56
      00301C 2C 45 60 90 AD FF 0A  2066         .db     0x2c,0x45,0x60,0x90,0xad,0xff,0x0a,0x82 ;,E`.-...
             82
      003024 26 0E 6E 13 00 48 61  2067         .db     0x26,0x0e,0x6e,0x13,0x00,0x48,0x61,0x84 ;&.n..Ha.
             84
      00302C A4 AC FF 0A 42 66 0E  2068         .db     0xa4,0xac,0xff,0x0a,0x42,0x66,0x0e,0x32 ;$,..Bf.2
             32
      003034 36 96 10 20 45 6D A0  2069         .db     0x36,0x96,0x10,0x20,0x45,0x6d,0xa0,0xa8 ;6.. Em (
             A8
      00303C FF 0A 22 62 67 2E 13  2070         .db     0xff,0x0a,0x22,0x62,0x67,0x2e,0x13,0x00 ;.."bg...
             00
      003044 44 6C 89 AC FF 0A 23  2071         .db     0x44,0x6c,0x89,0xac,0xff,0x0a,0x23,0x46 ;Dl.,..#F
             46
      00304C 0E 8E 13 00 48 69 80  2072         .db     0x0e,0x8e,0x13,0x00,0x48,0x69,0x80,0xff ;....Hi..
             FF
      003054 6A 03 66 2E 8E 32 16  2073         .db     0x6a,0x03,0x66,0x2e,0x8e,0x32,0x16,0x56 ;j.f..2.V
             56
      00305C 04 0C 44 6C A1 FF 0A  2074         .db     0x04,0x0c,0x44,0x6c,0xa1,0xff,0x0a,0x02 ;..Dl!...
             02
      003064 42 66 6E 32 36 96 10  2075         .db     0x42,0x66,0x6e,0x32,0x36,0x96,0x10,0x45 ;Bfn26..E
             45
      00306C 70 A0 AC FF 2A 22 62  2076         .db     0x70,0xa0,0xac,0xff,0x2a,0x22,0x62,0x26 ;p ,.*"b&
             26
      003074 0E 73 36 96 01 4C 68  2077         .db     0x0e,0x73,0x36,0x96,0x01,0x4c,0x68,0x85 ;.s6..Lh.
             85
      00307C A1 FF 4A 82 0F 16 76  2078         .db     0xa1,0xff,0x4a,0x82,0x0f,0x16,0x76,0x01 ;!.J...v.
             01
      003084 24 50 60 6C 85 FF 0A  2079         .db     0x24,0x50,0x60,0x6c,0x85,0xff,0x0a,0x03 ;$P`l....
             03
      00308C 8E 56 0D 45 60 68 90  2080         .db     0x8e,0x56,0x0d,0x45,0x60,0x68,0x90,0xa1 ;.V.E`h.!
             A1
      003094 FF 0A 82 86 33 0C 44  2081         .db     0xff,0x0a,0x82,0x86,0x33,0x0c,0x44,0x60 ;....3.D`
             60
      00309C 68 88 A8 B0 FF 4A 62  2082         .db     0x68,0x88,0xa8,0xb0,0xff,0x4a,0x62,0x66 ;h.(0.Jbf
             66
      0030A4 2E 13 17 24 40 88 90  2083         .db     0x2e,0x13,0x17,0x24,0x40,0x88,0x90,0xa4 ;...$@..$
             A4
      0030AC FF 0A 22 27 8E 32 17  2084         .db     0xff,0x0a,0x22,0x27,0x8e,0x32,0x17,0x00 ;.."'.2..
             00
      0030B4 0C 48 6C 81 B0 FF 2A  2085         .db     0x0c,0x48,0x6c,0x81,0xb0,0xff,0x2a,0x62 ;.Hl.0.*b
             62
      0030BC 06 2F 92 16 09 40 70  2086         .db     0x06,0x2f,0x92,0x16,0x09,0x40,0x70,0x85 ;./...@p.
             85
      0030C4 A5 FF 2A 03 4F 92 16  2087         .db     0xa5,0xff,0x2a,0x03,0x4f,0x92,0x16,0x05 ;%.*.O...
             05
      0030CC 2C 50 70 A0 A8 FF 4A  2088         .db     0x2c,0x50,0x70,0xa0,0xa8,0xff,0x4a,0x62 ;,Pp (.Jb
             62
      0030D4 66 13 17 01 24 40 88  2089         .db     0x66,0x13,0x17,0x01,0x24,0x40,0x88,0x90 ;f...$@..
             90
      0030DC A4 AC FF 2A 63 52 16  2090         .db     0xa4,0xac,0xff,0x2a,0x63,0x52,0x16,0x01 ;$,.*cR..
             01
      0030E4 2C 40 65 8C A4 AC FF  2091         .db     0x2c,0x40,0x65,0x8c,0xa4,0xac,0xff,0x4a ;,@e.$,.J
             4A
      0030EC 66 2E 13 17 04 24 40  2092         .db     0x66,0x2e,0x13,0x17,0x04,0x24,0x40,0x88 ;f....$@.
             88
      0030F4 90 A9 FF 0A 23 2E 92  2093         .db     0x90,0xa9,0xff,0x0a,0x23,0x2e,0x92,0x00 ;.)..#...
             00
      0030FC 44 64 6C A0 A8 FF 2A  2094         .db     0x44,0x64,0x6c,0xa0,0xa8,0xff,0x2a,0x63 ;Ddl (.*c
             63
      003104 86 4E 17 2C 40 64 8D  2095         .db     0x86,0x4e,0x17,0x2c,0x40,0x64,0x8d,0xa8 ;.N.,@d.(
             A8
      00310C B0 FF 6A 22 86 0E 12  2096         .db     0xb0,0xff,0x6a,0x22,0x86,0x0e,0x12,0x01 ;0.j"....
             01
      003114 24 44 4C 60 A8 B0 FF  2097         .db     0x24,0x44,0x4c,0x60,0xa8,0xb0,0xff,0x4a ;$DL`(0.J
             4A
      00311C 62 2E 13 16 04 24 40  2098         .db     0x62,0x2e,0x13,0x16,0x04,0x24,0x40,0x84 ;b....$@.
             84
      003124 8C A4 FF 4A 82 0E 92  2099         .db     0x8c,0xa4,0xff,0x4a,0x82,0x0e,0x92,0x36 ;.$.J...6
             36
      00312C 76 01 21 40 4C 6C 88  2100         .db     0x76,0x01,0x21,0x40,0x4c,0x6c,0x88,0xa5 ;v.!@Ll.%
             A5
      003134 FF 0A 42 82 2E 13 17  2101         .db     0xff,0x0a,0x42,0x82,0x2e,0x13,0x17,0x00 ;..B.....
             00
      00313C 44 69 89 A4 AC FF 4A  2102         .db     0x44,0x69,0x89,0xa4,0xac,0xff,0x4a,0x03 ;Di.$,.J.
             03
      003144 4E 16 76 08 25 50 60  2103         .db     0x4e,0x16,0x76,0x08,0x25,0x50,0x60,0x85 ;N.v.%P`.
             85
      00314C A5 FF 4A 22 82 0F 73  2104         .db     0xa5,0xff,0x4a,0x22,0x82,0x0f,0x73,0x16 ;%.J"..s.
             16
      003154 96 01 24 50 60 88 A5  2105         .db     0x96,0x01,0x24,0x50,0x60,0x88,0xa5,0xff ;..$P`.%.
             FF
      00315C 0A 42 82 46 0E 4E 92  2106         .db     0x0a,0x42,0x82,0x46,0x0e,0x4e,0x92,0x16 ;.B.F.N..
             16
      003164 00 20 50 70 85 A5 FF  2107         .db     0x00,0x20,0x50,0x70,0x85,0xa5,0xff,0x0a ;. Pp.%..
             0A
      00316C 23 92 96 00 44 64 6C  2108         .db     0x23,0x92,0x96,0x00,0x44,0x64,0x6c,0x80 ;#...Ddl.
             80
      003174 88 A1 FF 2A 62 0E 16  2109         .db     0x88,0xa1,0xff,0x2a,0x62,0x0e,0x16,0x56 ;.!.*b..V
             56
      00317C 01 20 40 64 6C 88 90  2110         .db     0x01,0x20,0x40,0x64,0x6c,0x88,0x90,0xa1 ;. @dl..!
             A1
      003184 FF 4A 43 0E 73 37 04  2111         .db     0xff,0x4a,0x43,0x0e,0x73,0x37,0x04,0x10 ;.JC.s7..
             10
      00318C 21 4C 85 A0 A8 FF 2A  2112         .db     0x21,0x4c,0x85,0xa0,0xa8,0xff,0x2a,0x43 ;!L. (.*C
             43
      003194 0E 73 16 56 01 20 4C  2113         .db     0x0e,0x73,0x16,0x56,0x01,0x20,0x4c,0x68 ;.s.V. Lh
             68
      00319C 88 A0 A8 FF 0A 27 0E  2114         .db     0x88,0xa0,0xa8,0xff,0x0a,0x27,0x0e,0x92 ;. (..'..
             92
      0031A4 00 48 69 80 88 A1 FF  2115         .db     0x00,0x48,0x69,0x80,0x88,0xa1,0xff,0x0a ;.Hi..!..
             0A
      0031AC 42 82 0E 4E 92 16 00  2116         .db     0x42,0x82,0x0e,0x4e,0x92,0x16,0x00,0x20 ;B..N... 
             20
      0031B4 44 70 88 A5 FF 0A 03  2117         .db     0x44,0x70,0x88,0xa5,0xff,0x0a,0x03,0x26 ;Dp.%...&
             26
      0031BC 8E 32 72 17 0C 48 68  2118         .db     0x8e,0x32,0x72,0x17,0x0c,0x48,0x68,0x80 ;.2r..Hh.
             80
      0031C4 A0 FF 0A 42 72 77 0D  2119         .db     0xa0,0xff,0x0a,0x42,0x72,0x77,0x0d,0x20 ; ..Brw. 
             20
      0031CC 44 50 65 80 A4 FF 4A  2120         .db     0x44,0x50,0x65,0x80,0xa4,0xff,0x4a,0x03 ;DPe.$.J.
             03
      0031D4 06 4E 16 76 08 29 50  2121         .db     0x06,0x4e,0x16,0x76,0x08,0x29,0x50,0x60 ;.N.v.)P`
             60
      0031DC 85 A5 FF 2A 62 2F 12  2122         .db     0x85,0xa5,0xff,0x2a,0x62,0x2f,0x12,0x00 ;.%.*b/..
             00
      0031E4 08 20 40 50 64 A0 A8  2123         .db     0x08,0x20,0x40,0x50,0x64,0xa0,0xa8,0xff ;. @Pd (.
             FF
      0031EC 0A 27 92 36 96 00 48  2124         .db     0x0a,0x27,0x92,0x36,0x96,0x00,0x48,0x68 ;.'.6..Hh
             68
      0031F4 70 81 FF 2A 23 0E 73  2125         .db     0x70,0x81,0xff,0x2a,0x23,0x0e,0x73,0x17 ;p..*#.s.
             17
      0031FC 01 4C 65 85 A0 A8 FF  2126         .db     0x01,0x4c,0x65,0x85,0xa0,0xa8,0xff,0x2a ;.Le. (.*
             2A
      003204 02 6F 17 05 4C 61 80  2127         .db     0x02,0x6f,0x17,0x05,0x4c,0x61,0x80,0xb0 ;.o..La.0
             B0
      00320C FF 2A 63 86 2E 6E 52  2128         .db     0xff,0x2a,0x63,0x86,0x2e,0x6e,0x52,0x92 ;.*c..nR.
             92
      003214 16 56 04 0C 40 64 A8  2129         .db     0x16,0x56,0x04,0x0c,0x40,0x64,0xa8,0xff ;.V..@d(.
             FF
      00321C 2A 43 26 0E 72 16 56  2130         .db     0x2a,0x43,0x26,0x0e,0x72,0x16,0x56,0x01 ;*C&.r.V.
             01
      003224 4C 85 A0 A8 FF 4A 03  2131         .db     0x4c,0x85,0xa0,0xa8,0xff,0x4a,0x03,0x72 ;L. (.J.r
             72
      00322C 16 05 24 50 60 81 A4  2132         .db     0x16,0x05,0x24,0x50,0x60,0x81,0xa4,0xac ;..$P`.$,
             AC
      003234 FF 4A 02 07 4E 16 76  2133         .db     0xff,0x4a,0x02,0x07,0x4e,0x16,0x76,0x08 ;.J..N.v.
             08
      00323C 29 50 60 85 A5 FF 2A  2134         .db     0x29,0x50,0x60,0x85,0xa5,0xff,0x2a,0x03 ;)P`.%.*.
             03
      003244 46 8E 72 04 0C 2C 4C  2135         .db     0x46,0x8e,0x72,0x04,0x0c,0x2c,0x4c,0x68 ;F.r..,Lh
             68
      00324C 81 B0 FF 0A 42 82 86  2136         .db     0x81,0xb0,0xff,0x0a,0x42,0x82,0x86,0x2e ;.0..B...
             2E
      003254 33 00 44 65 89 A8 B0  2137         .db     0x33,0x00,0x44,0x65,0x89,0xa8,0xb0,0xff ;3.De.(0.
             FF
      00325C 2A 63 86 4E 16 56 2C  2138         .db     0x2a,0x63,0x86,0x4e,0x16,0x56,0x2c,0x40 ;*c.N.V,@
             40
      003264 64 8D B0 FF 0A 03 86  2139         .db     0x64,0x8d,0xb0,0xff,0x0a,0x03,0x86,0x4e ;d.0....N
             4E
      00326C 52 16 2C 44 60 89 AD  2140         .db     0x52,0x16,0x2c,0x44,0x60,0x89,0xad,0xff ;R.,D`.-.
             FF
      003274 0A 22 62 86 2E 33 00  2141         .db     0x0a,0x22,0x62,0x86,0x2e,0x33,0x00,0x44 ;."b..3.D
             44
      00327C 65 89 A9 FF 0A 22 62  2142         .db     0x65,0x89,0xa9,0xff,0x0a,0x22,0x62,0x8e ;e.).."b.
             8E
      003284 13 16 00 48 65 90 A0  2143         .db     0x13,0x16,0x00,0x48,0x65,0x90,0xa0,0xb0 ;...He. 0
             B0
      00328C FF 0A 63 66 32 16 96  2144         .db     0xff,0x0a,0x63,0x66,0x32,0x16,0x96,0x0c ;..cf2...
             0C
      003294 20 40 48 6D 8C A4 AC  2145         .db     0x20,0x40,0x48,0x6d,0x8c,0xa4,0xac,0xff ; @Hm.$,.
             FF
      00329C 2A 02 42 26 0E 56 96  2146         .db     0x2a,0x02,0x42,0x26,0x0e,0x56,0x96,0x04 ;*.B&.V..
             04
      0032A4 30 4C 65 A0 FF 2A 63  2147         .db     0x30,0x4c,0x65,0xa0,0xff,0x2a,0x63,0x0e ;0Le .*c.
             0E
      0032AC 4E 52 01 30 40 64 A5  2148         .db     0x4e,0x52,0x01,0x30,0x40,0x64,0xa5,0xff ;NR.0@d%.
             FF
      0032B4 0A 66 32 37 0D 20 40  2149         .db     0x0a,0x66,0x32,0x37,0x0d,0x20,0x40,0x48 ;.f27. @H
             48
      0032BC 69 8C A0 FF 2A 06 46  2150         .db     0x69,0x8c,0xa0,0xff,0x2a,0x06,0x46,0x8e ;i. .*.F.
             8E
      0032C4 76 08 10 2D 50 68 81  2151         .db     0x76,0x08,0x10,0x2d,0x50,0x68,0x81,0xb0 ;v..-Ph.0
             B0
      0032CC FF 0A 03 26 86 6E 32  2152         .db     0xff,0x0a,0x03,0x26,0x86,0x6e,0x32,0x72 ;...&.n2r
             72
      0032D4 0D 48 60 A9 FF 0A 42  2153         .db     0x0d,0x48,0x60,0xa9,0xff,0x0a,0x42,0x0e ;.H`)..B.
             0E
      0032DC 8E 17 00 44 4C 65 80  2154         .db     0x8e,0x17,0x00,0x44,0x4c,0x65,0x80,0xb0 ;...DLe.0
             B0
      0032E4 FF 4A 22 82 0E 73 16  2155         .db     0xff,0x4a,0x22,0x82,0x0e,0x73,0x16,0x56 ;.J"..s.V
             56
      0032EC 01 4C 60 85 A4 FF 2A  2156         .db     0x01,0x4c,0x60,0x85,0xa4,0xff,0x2a,0x23 ;.L`.$.*#
             23
      0032F4 0E 73 36 76 01 4C 65  2157         .db     0x0e,0x73,0x36,0x76,0x01,0x4c,0x65,0xa0 ;.s6v.Le 
             A0
      0032FC A8 FF 4A 02 42 27 8E  2158         .db     0xa8,0xff,0x4a,0x02,0x42,0x27,0x8e,0x36 ;(.J.B'.6
             36
      003304 76 05 28 4C 6C 81 B0  2159         .db     0x76,0x05,0x28,0x4c,0x6c,0x81,0xb0,0xff ;v.(Ll.0.
             FF
      00330C 0A 63 2F 76 00 0C 20  2160         .db     0x0a,0x63,0x2f,0x76,0x00,0x0c,0x20,0x50 ;.c/v.. P
             50
      003314 64 85 A8 B0 FF 0A 0E  2161         .db     0x64,0x85,0xa8,0xb0,0xff,0x0a,0x0e,0x72 ;d.(0...r
             72
      00331C 57 30 44 4C 65 85 A5  2162         .db     0x57,0x30,0x44,0x4c,0x65,0x85,0xa5,0xff ;W0DLe.%.
             FF
      003324 0A 4E 76 0D 2C 50 61  2163         .db     0x0a,0x4e,0x76,0x0d,0x2c,0x50,0x61,0x80 ;.Nv.,Pa.
             80
      00332C 88 A5 FF 0A 42 82 4F  2164         .db     0x88,0xa5,0xff,0x0a,0x42,0x82,0x4f,0x92 ;.%..B.O.
             92
      003334 16 00 0C 2C 44 70 A5  2165         .db     0x16,0x00,0x0c,0x2c,0x44,0x70,0xa5,0xff ;...,Dp%.
             FF
      00333C 0A 63 67 2E 72 16 76  2166         .db     0x0a,0x63,0x67,0x2e,0x72,0x16,0x76,0x00 ;.cg.r.v.
             00
      003344 0C 20 50 68 88 A9 FF  2167         .db     0x0c,0x20,0x50,0x68,0x88,0xa9,0xff,0x0a ;. Ph.)..
             0A
      00334C 23 0E 8E 32 37 00 45  2168         .db     0x23,0x0e,0x8e,0x32,0x37,0x00,0x45,0x64 ;#..27.Ed
             64
      003354 6C 90 A1 FF 2A 02 82  2169         .db     0x6c,0x90,0xa1,0xff,0x2a,0x02,0x82,0x06 ;l.!.*...
             06
      00335C 8E 72 56 08 10 4C 60  2170         .db     0x8e,0x72,0x56,0x08,0x10,0x4c,0x60,0x68 ;.rV..L`h
             68
      003364 B0 FF 0A 27 8E 32 17  2171         .db     0xb0,0xff,0x0a,0x27,0x8e,0x32,0x17,0x00 ;0..'.2..
             00
      00336C 0C 48 6C 81 B0 FF 0A  2172         .db     0x0c,0x48,0x6c,0x81,0xb0,0xff,0x0a,0x23 ;.Hl.0..#
             23
      003374 92 00 44 64 6C 80 88  2173         .db     0x92,0x00,0x44,0x64,0x6c,0x80,0x88,0xa0 ;..Ddl.. 
             A0
      00337C FF 4A 03 0E 92 77 04  2174         .db     0xff,0x4a,0x03,0x0e,0x92,0x77,0x04,0x10 ;.J...w..
             10
      003384 24 4D 6C A1 FF 4A 42  2175         .db     0x24,0x4d,0x6c,0xa1,0xff,0x4a,0x42,0x82 ;$Ml!.JB.
             82
      00338C 2E 92 77 00 08 21 50  2176         .db     0x2e,0x92,0x77,0x00,0x08,0x21,0x50,0x6c ;..w..!Pl
             6C
      003394 A5 FF 4A 03 0E 72 17  2177         .db     0xa5,0xff,0x4a,0x03,0x0e,0x72,0x17,0x04 ;%.J..r..
             04
      00339C 24 4C 80 88 AD FF 2A  2178         .db     0x24,0x4c,0x80,0x88,0xad,0xff,0x2a,0x02 ;$L..-.*.
             02
      0033A4 92 76 04 0C 4C 64 6C  2179         .db     0x92,0x76,0x04,0x0c,0x4c,0x64,0x6c,0x81 ;.v..Ldl.
             81
      0033AC A0 A8 FF 4A 22 82 86  2180         .db     0xa0,0xa8,0xff,0x4a,0x22,0x82,0x86,0x0e ; (.J"...
             0E
      0033B4 57 24 4C 60 89 A8 B0  2181         .db     0x57,0x24,0x4c,0x60,0x89,0xa8,0xb0,0xff ;W$L`.(0.
             FF
      0033BC 4A 82 66 0E 92 36 76  2182         .db     0x4a,0x82,0x66,0x0e,0x92,0x36,0x76,0x01 ;J.f..6v.
             01
      0033C4 21 40 4C 6C A5 FF 0A  2183         .db     0x21,0x40,0x4c,0x6c,0xa5,0xff,0x0a,0x42 ;!@Ll%..B
             42
      0033CC 66 0E 8E 73 36 10 20  2184         .db     0x66,0x0e,0x8e,0x73,0x36,0x10,0x20,0x44 ;f..s6. D
             44
      0033D4 4C 68 A0 FF 2A 82 86  2185         .db     0x4c,0x68,0xa0,0xff,0x2a,0x82,0x86,0x8e ;Lh .*...
             8E
      0033DC 72 76 04 0C 20 4D 60  2186         .db     0x72,0x76,0x04,0x0c,0x20,0x4d,0x60,0x68 ;rv.. M`h
             68
      0033E4 B0 FF 4A 02 62 06 8E  2187         .db     0xb0,0xff,0x4a,0x02,0x62,0x06,0x8e,0x17 ;0.J.b...
             17
      0033EC 08 40 4C 6D 84 A0 B0  2188         .db     0x08,0x40,0x4c,0x6d,0x84,0xa0,0xb0,0xff ;.@Lm. 0.
             FF
      0033F4 0A 03 66 2E 8E 32 72  2189         .db     0x0a,0x03,0x66,0x2e,0x8e,0x32,0x72,0x36 ;..f..2r6
             36
      0033FC 76 0D 44 68 A1 FF 2A  2190         .db     0x76,0x0d,0x44,0x68,0xa1,0xff,0x2a,0x02 ;v.Dh!.*.
             02
      003404 82 2E 8E 72 04 0C 50  2191         .db     0x82,0x2e,0x8e,0x72,0x04,0x0c,0x50,0x60 ;...r..P`
             60
      00340C 68 B0 FF 0A 03 86 4E  2192         .db     0x68,0xb0,0xff,0x0a,0x03,0x86,0x4e,0x72 ;h0....Nr
             72
      003414 16 0C 2C 44 50 60 AD  2193         .db     0x16,0x0c,0x2c,0x44,0x50,0x60,0xad,0xff ;..,DP`-.
             FF
      00341C 4A 02 86 0F 32 36 76  2194         .db     0x4a,0x02,0x86,0x0f,0x32,0x36,0x76,0x04 ;J...26v.
             04
      003424 10 24 60 88 A8 B0 FF  2195         .db     0x10,0x24,0x60,0x88,0xa8,0xb0,0xff,0x0a ;.$`.(0..
             0A
      00342C 42 82 0F 52 56 96 00  2196         .db     0x42,0x82,0x0f,0x52,0x56,0x96,0x00,0x30 ;B..RV..0
             30
      003434 44 68 88 A5 FF 0A 03  2197         .db     0x44,0x68,0x88,0xa5,0xff,0x0a,0x03,0x4e ;Dh.%...N
             4E
      00343C 8E 33 17 0C 44 60 81  2198         .db     0x8e,0x33,0x17,0x0c,0x44,0x60,0x81,0xb0 ;.3..D`.0
             B0
      003444 FF 0A 22 62 66 8E 32  2199         .db     0xff,0x0a,0x22,0x62,0x66,0x8e,0x32,0x16 ;.."bf.2.
             16
      00344C 56 0C 45 69 90 B0 FF  2200         .db     0x56,0x0c,0x45,0x69,0x90,0xb0,0xff,0x0a ;V.Ei.0..
             0A
      003454 03 06 2E 92 16 0C 44  2201         .db     0x03,0x06,0x2e,0x92,0x16,0x0c,0x44,0x50 ;......DP
             50
      00345C 88 A0 A8 FF 4A 02 2E  2202         .db     0x88,0xa0,0xa8,0xff,0x4a,0x02,0x2e,0x92 ;. (.J...
             92
      003464 77 24 50 60 6C 84 A1  2203         .db     0x77,0x24,0x50,0x60,0x6c,0x84,0xa1,0xff ;w$P`l.!.
             FF
      00346C 2A 23 26 86 6E 16 01  2204         .db     0x2a,0x23,0x26,0x86,0x6e,0x16,0x01,0x2c ;*#&.n..,
             2C
      003474 4D 64 A8 B0 FF 0A 42  2205         .db     0x4d,0x64,0xa8,0xb0,0xff,0x0a,0x42,0x82 ;Md(0..B.
             82
      00347C 86 33 56 00 44 65 89  2206         .db     0x86,0x33,0x56,0x00,0x44,0x65,0x89,0xa8 ;.3V.De.(
             A8
      003484 B0 FF 0A 27 0E 92 00  2207         .db     0xb0,0xff,0x0a,0x27,0x0e,0x92,0x00,0x48 ;0..'...H
             48
      00348C 69 80 88 A0 A8 FF 4A  2208         .db     0x69,0x80,0x88,0xa0,0xa8,0xff,0x4a,0x43 ;i.. (.JC
             43
      003494 0E 72 36 76 04 21 4C  2209         .db     0x0e,0x72,0x36,0x76,0x04,0x21,0x4c,0x85 ;.r6v.!L.
             85
      00349C A1 FF 6A 03 26 0E 53  2210         .db     0xa1,0xff,0x6a,0x03,0x26,0x0e,0x53,0x56 ;!.j.&.SV
             56
      0034A4 96 04 30 48 60 80 A1  2211         .db     0x96,0x04,0x30,0x48,0x60,0x80,0xa1,0xff ;..0H`.!.
             FF
      0034AC 2A 03 6E 73 17 04 0C  2212         .db     0x2a,0x03,0x6e,0x73,0x17,0x04,0x0c,0x4c ;*.ns...L
             4C
      0034B4 61 80 A0 A8 FF 2A 02  2213         .db     0x61,0x80,0xa0,0xa8,0xff,0x2a,0x02,0x27 ;a. (.*.'
             27
      0034BC 8E 73 16 04 0C 50 68  2214         .db     0x8e,0x73,0x16,0x04,0x0c,0x50,0x68,0x81 ;.s...Ph.
             81
      0034C4 FF 0A 67 0E 8E 52 56  2215         .db     0xff,0x0a,0x67,0x0e,0x8e,0x52,0x56,0x00 ;..g..RV.
             00
      0034CC 30 40 48 68 B0 FF 2A  2216         .db     0x30,0x40,0x48,0x68,0xb0,0xff,0x2a,0x02 ;0@Hh0.*.
             02
      0034D4 06 46 8E 76 08 10 2D  2217         .db     0x06,0x46,0x8e,0x76,0x08,0x10,0x2d,0x50 ;.F.v..-P
             50
      0034DC 68 81 B0 FF 0A 23 8E  2218         .db     0x68,0x81,0xb0,0xff,0x0a,0x23,0x8e,0x72 ;h.0..#.r
             72
      0034E4 17 0C 44 4C 65 81 A0  2219         .db     0x17,0x0c,0x44,0x4c,0x65,0x81,0xa0,0xb0 ;..DLe. 0
             B0
      0034EC FF 4A 82 4E 16 76 25  2220         .db     0xff,0x4a,0x82,0x4e,0x16,0x76,0x25,0x50 ;.J.N.v%P
             50
      0034F4 60 85 A8 B0 FF 0A 82  2221         .db     0x60,0x85,0xa8,0xb0,0xff,0x0a,0x82,0x4f ;`.(0...O
             4F
      0034FC 16 56 0C 20 41 60 90  2222         .db     0x16,0x56,0x0c,0x20,0x41,0x60,0x90,0xad ;.V. A`.-
             AD
      003504 FF 2A 63 06 0E 6E 56  2223         .db     0xff,0x2a,0x63,0x06,0x0e,0x6e,0x56,0x10 ;.*c..nV.
             10
      00350C 30 40 4C 64 AD FF 0A  2224         .db     0x30,0x40,0x4c,0x64,0xad,0xff,0x0a,0x42 ;0@Ld-..B
             42
      003514 82 66 2E 6E 92 16 00  2225         .db     0x82,0x66,0x2e,0x6e,0x92,0x16,0x00,0x0c ;.f.n....
             0C
      00351C 20 44 70 A5 FF 2A 02  2226         .db     0x20,0x44,0x70,0xa5,0xff,0x2a,0x02,0x92 ; Dp%.*..
             92
      003524 36 76 04 10 4C 64 6C  2227         .db     0x36,0x76,0x04,0x10,0x4c,0x64,0x6c,0x81 ;6v..Ldl.
             81
      00352C A0 A8 FF 0A 2F 32 16  2228         .db     0xa0,0xa8,0xff,0x0a,0x2f,0x32,0x16,0x96 ; (../2..
             96
      003534 0C 41 64 70 A5 FF 4A  2229         .db     0x0c,0x41,0x64,0x70,0xa5,0xff,0x4a,0x23 ;.Adp%.J#
             23
      00353C 26 0E 92 16 01 4C 6D  2230         .db     0x26,0x0e,0x92,0x16,0x01,0x4c,0x6d,0x88 ;&....Lm.
             88
      003544 A0 A8 FF 2A 82 0E 4E  2231         .db     0xa0,0xa8,0xff,0x2a,0x82,0x0e,0x4e,0x53 ; (.*..NS
             53
      00354C 04 30 40 60 85 A5 FF  2232         .db     0x04,0x30,0x40,0x60,0x85,0xa5,0xff,0x2a ;.0@`.%.*
             2A
      003554 62 0E 4E 53 56 04 30  2233         .db     0x62,0x0e,0x4e,0x53,0x56,0x04,0x30,0x40 ;b.NSV.0@
             40
      00355C 85 A4 AC FF 0A 03 86  2234         .db     0x85,0xa4,0xac,0xff,0x0a,0x03,0x86,0x6e ;.$,....n
             6E
      003564 53 16 56 2C 45 60 AD  2235         .db     0x53,0x16,0x56,0x2c,0x45,0x60,0xad,0xff ;S.V,E`-.
             FF
      00356C 0A 42 82 67 13 36 76  2236         .db     0x0a,0x42,0x82,0x67,0x13,0x36,0x76,0x00 ;.B.g.6v.
             00
      003574 44 89 A8 B0 FF 0A 23  2237         .db     0x44,0x89,0xa8,0xb0,0xff,0x0a,0x23,0x46 ;D.(0..#F
             46
      00357C 92 96 00 48 68 70 81  2238         .db     0x92,0x96,0x00,0x48,0x68,0x70,0x81,0xff ;...Hhp..
             FF
      003584 4A 03 26 4E 72 16 04  2239         .db     0x4a,0x03,0x26,0x4e,0x72,0x16,0x04,0x0c ;J.&Nr...
             0C
      00358C 28 50 60 85 A0 FF 0A  2240         .db     0x28,0x50,0x60,0x85,0xa0,0xff,0x0a,0x63 ;(P`. ..c
             63
      003594 46 86 13 16 56 00 48  2241         .db     0x46,0x86,0x13,0x16,0x56,0x00,0x48,0x6c ;F...V.Hl
             6C
      00359C A8 B0 FF 0A 23 67 8E  2242         .db     0xa8,0xb0,0xff,0x0a,0x23,0x67,0x8e,0x72 ;(0..#g.r
             72
      0035A4 16 56 00 2C 44 4C 68  2243         .db     0x16,0x56,0x00,0x2c,0x44,0x4c,0x68,0xb0 ;.V.,DLh0
             B0
      0035AC FF 0A 43 0E 73 56 96  2244         .db     0xff,0x0a,0x43,0x0e,0x73,0x56,0x96,0x00 ;..C.sV..
             00
      0035B4 10 20 30 49 88 A0 A8  2245         .db     0x10,0x20,0x30,0x49,0x88,0xa0,0xa8,0xff ;. 0I. (.
             FF
      0035BC 0A 26 66 6E 92 17 00  2246         .db     0x0a,0x26,0x66,0x6e,0x92,0x17,0x00,0x49 ;.&fn...I
             49
      0035C4 70 A5 FF 0A 63 06 6E  2247         .db     0x70,0xa5,0xff,0x0a,0x63,0x06,0x6e,0x52 ;p%..c.nR
             52
      0035CC 36 76 2C 40 48 64 A9  2248         .db     0x36,0x76,0x2c,0x40,0x48,0x64,0xa9,0xff ;6v,@Hd).
             FF
      0035D4 2A 03 6E 92 17 05 2C  2249         .db     0x2a,0x03,0x6e,0x92,0x17,0x05,0x2c,0x4c ;*.n...,L
             4C
      0035DC 70 A0 A8 FF 2A 43 0E  2250         .db     0x70,0xa0,0xa8,0xff,0x2a,0x43,0x0e,0x72 ;p (.*C.r
             72
      0035E4 01 20 4C 64 85 A1 FF  2251         .db     0x01,0x20,0x4c,0x64,0x85,0xa1,0xff,0x0a ;. Ld.!..
             0A
      0035EC 23 92 16 00 44 64 6C  2252         .db     0x23,0x92,0x16,0x00,0x44,0x64,0x6c,0xa0 ;#...Ddl 
             A0
      0035F4 A8 FF 0A 02 2E 73 16  2253         .db     0xa8,0xff,0x0a,0x02,0x2e,0x73,0x16,0x76 ;(....s.v
             76
      0035FC 0C 50 61 80 88 A4 FF  2254         .db     0x0c,0x50,0x61,0x80,0x88,0xa4,0xff,0x4a ;.Pa..$.J
             4A
      003604 03 06 4E 72 16 08 28  2255         .db     0x03,0x06,0x4e,0x72,0x16,0x08,0x28,0x50 ;..Nr..(P
             50
      00360C 60 85 A4 AC FF 6A 02  2256         .db     0x60,0x85,0xa4,0xac,0xff,0x6a,0x02,0x0f ;`.$,.j..
             0F
      003614 32 92 36 76 10 41 6C  2257         .db     0x32,0x92,0x36,0x76,0x10,0x41,0x6c,0x80 ;2.6v.Al.
             80
      00361C A5 FF 6A 82 4E 16 08  2258         .db     0xa5,0xff,0x6a,0x82,0x4e,0x16,0x08,0x25 ;%.j.N..%
             25
      003624 44 50 60 8D A4 AC FF  2259         .db     0x44,0x50,0x60,0x8d,0xa4,0xac,0xff,0x4a ;DP`.$,.J
             4A
      00362C 03 0E 72 56 96 04 10  2260         .db     0x03,0x0e,0x72,0x56,0x96,0x04,0x10,0x30 ;..rV...0
             30
      003634 4C 60 85 FF 0A 23 92  2261         .db     0x4c,0x60,0x85,0xff,0x0a,0x23,0x92,0x17 ;L`...#..
             17
      00363C 00 44 64 6C 80 88 FF  2262         .db     0x00,0x44,0x64,0x6c,0x80,0x88,0xff,0x2a ;.Ddl...*
             2A
      003644 43 4E 72 16 00 08 20  2263         .db     0x43,0x4e,0x72,0x16,0x00,0x08,0x20,0x50 ;CNr... P
             50
      00364C 64 85 A1 FF 0A 22 62  2264         .db     0x64,0x85,0xa1,0xff,0x0a,0x22,0x62,0x26 ;d.!.."b&
             26
      003654 8E 33 17 00 48 65 90  2265         .db     0x8e,0x33,0x17,0x00,0x48,0x65,0x90,0xff ;.3..He..
             FF
      00365C 2A 86 6E 17 00 08 2C  2266         .db     0x2a,0x86,0x6e,0x17,0x00,0x08,0x2c,0x4c ;*.n...,L
             4C
      003664 61 90 A8 B0 FF 4A 02  2267         .db     0x61,0x90,0xa8,0xb0,0xff,0x4a,0x02,0x07 ;a.(0.J..
             07
      00366C 4E 16 76 29 50 60 85  2268         .db     0x4e,0x16,0x76,0x29,0x50,0x60,0x85,0xa5 ;N.v)P`.%
             A5
      003674 FF 0A 23 26 8E 52 17  2269         .db     0xff,0x0a,0x23,0x26,0x8e,0x52,0x17,0x0c ;..#&.R..
             0C
      00367C 48 65 84 90 A1 FF 0A  2270         .db     0x48,0x65,0x84,0x90,0xa1,0xff,0x0a,0x02 ;He..!...
             02
      003684 42 07 0E 6E 32 37 10  2271         .db     0x42,0x07,0x0e,0x6e,0x32,0x37,0x10,0x48 ;B..n27.H
             48
      00368C 64 80 A5 FF 0A 62 2E  2272         .db     0x64,0x80,0xa5,0xff,0x0a,0x62,0x2e,0x6e ;d.%..b.n
             6E
      003694 32 17 0C 20 41 70 A0  2273         .db     0x32,0x17,0x0c,0x20,0x41,0x70,0xa0,0xa8 ;2.. Ap (
             A8
      00369C FF 0A 22 62 26 86 0E  2274         .db     0xff,0x0a,0x22,0x62,0x26,0x86,0x0e,0x53 ;.."b&..S
             53
      0036A4 57 00 30 48 64 88 A9  2275         .db     0x57,0x00,0x30,0x48,0x64,0x88,0xa9,0xff ;W.0Hd.).
             FF
      0036AC 2A 02 4F 16 96 05 2C  2276         .db     0x2a,0x02,0x4f,0x16,0x96,0x05,0x2c,0x50 ;*.O...,P
             50
      0036B4 70 81 A4 AC FF 0A 23  2277         .db     0x70,0x81,0xa4,0xac,0xff,0x0a,0x23,0x66 ;p.$,..#f
             66
      0036BC 8E 52 37 00 10 45 68  2278         .db     0x8e,0x52,0x37,0x00,0x10,0x45,0x68,0x90 ;.R7..Eh.
             90
      0036C4 A1 FF 6A 22 0E 92 36  2279         .db     0xa1,0xff,0x6a,0x22,0x0e,0x92,0x36,0x76 ;!.j"..6v
             76
      0036CC 24 44 4C 60 6C 80 A1  2280         .db     0x24,0x44,0x4c,0x60,0x6c,0x80,0xa1,0xff ;$DL`l.!.
             FF
      0036D4 4A 42 82 46 0E 72 36  2281         .db     0x4a,0x42,0x82,0x46,0x0e,0x72,0x36,0x76 ;JB.F.r6v
             76
      0036DC 00 21 4C 85 AD FF 0A  2282         .db     0x00,0x21,0x4c,0x85,0xad,0xff,0x0a,0x23 ;.!L.-..#
             23
      0036E4 92 57 00 44 64 6C 81  2283         .db     0x92,0x57,0x00,0x44,0x64,0x6c,0x81,0xa1 ;.W.Ddl.!
             A1
      0036EC FF 0A 42 27 8E 17 00  2284         .db     0xff,0x0a,0x42,0x27,0x8e,0x17,0x00,0x0c ;..B'....
             0C
      0036F4 48 6D 81 A1 FF 4A 63  2285         .db     0x48,0x6d,0x81,0xa1,0xff,0x4a,0x63,0x06 ;Hm.!.Jc.
             06
      0036FC 6E 92 36 08 40 4C 70  2286         .db     0x6e,0x92,0x36,0x08,0x40,0x4c,0x70,0x84 ;n.6.@Lp.
             84
      003704 A5 FF 0A 02 07 0E 52  2287         .db     0xa5,0xff,0x0a,0x02,0x07,0x0e,0x52,0x92 ;%.....R.
             92
      00370C 77 10 48 60 A0 A8 FF  2288         .db     0x77,0x10,0x48,0x60,0xa0,0xa8,0xff,0x2a ;w.H` (.*
             2A
      003714 22 82 26 0F 72 76 50  2289         .db     0x22,0x82,0x26,0x0f,0x72,0x76,0x50,0x60 ;".&.rvP`
             60
      00371C 68 85 A9 FF 0A 03 06  2290         .db     0x68,0x85,0xa9,0xff,0x0a,0x03,0x06,0x86 ;h.).....
             86
      003724 2F 32 72 16 0C 44 60  2291         .db     0x2f,0x32,0x72,0x16,0x0c,0x44,0x60,0xa9 ;/2r..D`)
             A9
      00372C FF 4A 62 66 2E 13 17  2292         .db     0xff,0x4a,0x62,0x66,0x2e,0x13,0x17,0x04 ;.Jbf....
             04
      003734 24 40 88 90 A4 AC FF  2293         .db     0x24,0x40,0x88,0x90,0xa4,0xac,0xff,0x0a ;$@..$,..
             0A
      00373C 22 62 86 0F 76 00 30  2294         .db     0x22,0x62,0x86,0x0f,0x76,0x00,0x30,0x50 ;"b..v.0P
             50
      003744 64 6C 89 B0 FF 2A 63  2295         .db     0x64,0x6c,0x89,0xb0,0xff,0x2a,0x63,0x0e ;dl.0.*c.
             0E
      00374C 4E 12 52 01 40 64 A9  2296         .db     0x4e,0x12,0x52,0x01,0x40,0x64,0xa9,0xff ;N.R.@d).
             FF
      003754 0A 42 27 0E 92 96 00  2297         .db     0x0a,0x42,0x27,0x0e,0x92,0x96,0x00,0x48 ;.B'....H
             48
      00375C 68 70 80 88 A0 FF 0A  2298         .db     0x68,0x70,0x80,0x88,0xa0,0xff,0x0a,0x02 ;hp.. ...
             02
      003764 07 4E 72 16 0C 50 61  2299         .db     0x07,0x4e,0x72,0x16,0x0c,0x50,0x61,0x80 ;.Nr..Pa.
             80
      00376C 88 FF 0A 86 0E 33 37  2300         .db     0x88,0xff,0x0a,0x86,0x0e,0x33,0x37,0x10 ;.....37.
             10
      003774 44 60 68 88 90 A8 FF  2301         .db     0x44,0x60,0x68,0x88,0x90,0xa8,0xff,0x0a ;D`h..(..
             0A
      00377C 42 82 67 2E 13 00 44  2302         .db     0x42,0x82,0x67,0x2e,0x13,0x00,0x44,0x6c ;B.g...Dl
             6C
      003784 89 A8 B0 FF 2A 03 26  2303         .db     0x89,0xa8,0xb0,0xff,0x2a,0x03,0x26,0x8e ;.(0.*.&.
             8E
      00378C 72 17 05 4C 60 68 80  2304         .db     0x72,0x17,0x05,0x4c,0x60,0x68,0x80,0xb0 ;r..L`h.0
             B0
      003794 FF 0A 42 82 86 2F 76  2305         .db     0xff,0x0a,0x42,0x82,0x86,0x2f,0x76,0x0d ;..B../v.
             0D
      00379C 20 50 64 89 AD FF 0A  2306         .db     0x20,0x50,0x64,0x89,0xad,0xff,0x0a,0x42 ; Pd.-..B
             42
      0037A4 27 0E 92 00 48 68 70  2307         .db     0x27,0x0e,0x92,0x00,0x48,0x68,0x70,0x80 ;'...Hhp.
             80
      0037AC 88 FF 2A 02 62 2F 92  2308         .db     0x88,0xff,0x2a,0x02,0x62,0x2f,0x92,0x16 ;..*.b/..
             16
      0037B4 96 05 40 70 85 A5 FF  2309         .db     0x96,0x05,0x40,0x70,0x85,0xa5,0xff,0x0a ;..@p.%..
             0A
      0037BC 22 62 66 8E 13 00 44  2310         .db     0x22,0x62,0x66,0x8e,0x13,0x00,0x44,0x68 ;"bf...Dh
             68
      0037C4 70 90 A0 FF 0A 07 6E  2311         .db     0x70,0x90,0xa0,0xff,0x0a,0x07,0x6e,0x32 ;p. ...n2
             32
      0037CC 0C 48 64 70 81 A5 FF  2312         .db     0x0c,0x48,0x64,0x70,0x81,0xa5,0xff,0x0a ;.Hdp.%..
             0A
      0037D4 23 27 0E 92 00 48 68  2313         .db     0x23,0x27,0x0e,0x92,0x00,0x48,0x68,0x70 ;#'...Hhp
             70
      0037DC 81 A0 A8 FF 2A 03 07  2314         .db     0x81,0xa0,0xa8,0xff,0x2a,0x03,0x07,0x8e ;. (.*...
             8E
      0037E4 72 08 4C 60 68 81 B0  2315         .db     0x72,0x08,0x4c,0x60,0x68,0x81,0xb0,0xff ;r.L`h.0.
             FF
      0037EC 0A 42 82 47 8E 52 37  2316         .db     0x0a,0x42,0x82,0x47,0x8e,0x52,0x37,0x10 ;.B.G.R7.
             10
      0037F4 20 48 68 90 A4 B0 FF  2317         .db     0x20,0x48,0x68,0x90,0xa4,0xb0,0xff,0x0a ; Hh.$0..
             0A
      0037FC 42 27 92 36 96 00 48  2318         .db     0x42,0x27,0x92,0x36,0x96,0x00,0x48,0x68 ;B'.6..Hh
             68
      003804 70 81 A0 FF 2A 02 62  2319         .db     0x70,0x81,0xa0,0xff,0x2a,0x02,0x62,0x2f ;p. .*.b/
             2F
      00380C 92 05 40 70 85 A5 FF  2320         .db     0x92,0x05,0x40,0x70,0x85,0xa5,0xff,0x0a ;..@p.%..
             0A
      003814 42 27 92 96 00 48 68  2321         .db     0x42,0x27,0x92,0x96,0x00,0x48,0x68,0x70 ;B'...Hhp
             70
      00381C 80 A0 A8 FF 0A 03 86  2322         .db     0x80,0xa0,0xa8,0xff,0x0a,0x03,0x86,0x2f ;. (..../
             2F
      003824 32 72 36 76 0D 44 60  2323         .db     0x32,0x72,0x36,0x76,0x0d,0x44,0x60,0xa9 ;2r6v.D`)
             A9
      00382C FF 0A 42 46 8E 72 37  2324         .db     0xff,0x0a,0x42,0x46,0x8e,0x72,0x37,0x10 ;..BF.r7.
             10
      003834 20 49 68 A4 B0 FF 0A  2325         .db     0x20,0x49,0x68,0xa4,0xb0,0xff,0x0a,0x03 ; Ih$0...
             03
      00383C 06 2E 8E 72 16 0C 50  2326         .db     0x06,0x2e,0x8e,0x72,0x16,0x0c,0x50,0x60 ;...r..P`
             60
      003844 68 80 A0 B0 FF 0A 22  2327         .db     0x68,0x80,0xa0,0xb0,0xff,0x0a,0x22,0x62 ;h. 0.."b
             62
      00384C 86 2E 13 37 00 44 64  2328         .db     0x86,0x2e,0x13,0x37,0x00,0x44,0x64,0x6c ;...7.Ddl
             6C
      003854 8C A9 FF 2A 63 86 52  2329         .db     0x8c,0xa9,0xff,0x2a,0x63,0x86,0x52,0x57 ;.).*c.RW
             57
      00385C 00 08 2C 40 64 89 A8  2330         .db     0x00,0x08,0x2c,0x40,0x64,0x89,0xa8,0xb0 ;..,@d.(0
             B0
      003864 FF 4A 02 66 0E 13 17  2331         .db     0xff,0x4a,0x02,0x66,0x0e,0x13,0x17,0x04 ;.J.f....
             04
      00386C 40 6D 88 90 A0 A8 FF  2332         .db     0x40,0x6d,0x88,0x90,0xa0,0xa8,0xff,0x0a ;@m.. (..
             0A
      003874 23 27 0E 92 00 48 68  2333         .db     0x23,0x27,0x0e,0x92,0x00,0x48,0x68,0x70 ;#'...Hhp
             70
      00387C 80 88 A1 FF 2A 02 6F  2334         .db     0x80,0x88,0xa1,0xff,0x2a,0x02,0x6f,0x13 ;..!.*.o.
             13
      003884 16 56 05 40 61 B0 FF  2335         .db     0x16,0x56,0x05,0x40,0x61,0xb0,0xff,0x0a ;.V.@a0..
             0A
      00388C 42 82 86 2F 72 0D 20  2336         .db     0x42,0x82,0x86,0x2f,0x72,0x0d,0x20,0x50 ;B../r. P
             50
      003894 64 88 A9 FF 2A 62 66  2337         .db     0x64,0x88,0xa9,0xff,0x2a,0x62,0x66,0x8e ;d.).*bf.
             8E
      00389C 12 17 00 08 40 68 70  2338         .db     0x12,0x17,0x00,0x08,0x40,0x68,0x70,0xa1 ;....@hp!
             A1
      0038A4 FF 0A 82 0E 33 36 10  2339         .db     0xff,0x0a,0x82,0x0e,0x33,0x36,0x10,0x44 ;....36.D
             44
      0038AC 60 68 84 A4 AC FF 4A  2340         .db     0x60,0x68,0x84,0xa4,0xac,0xff,0x4a,0x03 ;`h.$,.J.
             03
      0038B4 26 0E 72 56 96 04 30  2341         .db     0x26,0x0e,0x72,0x56,0x96,0x04,0x30,0x4c ;&.rV..0L
             4C
      0038BC 60 81 A0 FF 0A 03 06  2342         .db     0x60,0x81,0xa0,0xff,0x0a,0x03,0x06,0x2e ;`. .....
             2E
      0038C4 8E 72 16 0C 50 60 68  2343         .db     0x8e,0x72,0x16,0x0c,0x50,0x60,0x68,0xa0 ;.r..P`h 
             A0
      0038CC B0 FF 4A 02 66 0E 13  2344         .db     0xb0,0xff,0x4a,0x02,0x66,0x0e,0x13,0x04 ;0.J.f...
             04
      0038D4 40 6D 88 90 A1 FF 0A  2345         .db     0x40,0x6d,0x88,0x90,0xa1,0xff,0x0a,0x22 ;@m..!.."
             22
      0038DC 62 86 2E 6E 13 17 00  2346         .db     0x62,0x86,0x2e,0x6e,0x13,0x17,0x00,0x44 ;b..n...D
             44
      0038E4 64 70 A8 FF 0A 23 27  2347         .db     0x64,0x70,0xa8,0xff,0x0a,0x23,0x27,0x92 ;dp(..#'.
             92
      0038EC 96 00 48 68 70 80 88  2348         .db     0x96,0x00,0x48,0x68,0x70,0x80,0x88,0xa0 ;..Hhp.. 
             A0
      0038F4 FF 6A 03 27 0E 92 17  2349         .db     0xff,0x6a,0x03,0x27,0x0e,0x92,0x17,0x04 ;.j.'....
             04
      0038FC 48 6D A0 A8 FF 2A 03  2350         .db     0x48,0x6d,0xa0,0xa8,0xff,0x2a,0x03,0x0e ;Hm (.*..
             0E
      003904 72 36 76 04 4C 60 68  2351         .db     0x72,0x36,0x76,0x04,0x4c,0x60,0x68,0xa4 ;r6v.L`h$
             A4
      00390C AC FF 0A 23 46 0E 92  2352         .db     0xac,0xff,0x0a,0x23,0x46,0x0e,0x92,0x16 ;,..#F...
             16
      003914 00 48 68 70 81 A1 FF  2353         .db     0x00,0x48,0x68,0x70,0x81,0xa1,0xff,0x0a ;.Hhp.!..
             0A
      00391C 62 2F 32 16 0C 41 64  2354         .db     0x62,0x2f,0x32,0x16,0x0c,0x41,0x64,0x70 ;b/2..Adp
             70
      003924 A1 FF 4A 42 82 0E 92  2355         .db     0xa1,0xff,0x4a,0x42,0x82,0x0e,0x92,0x36 ;!.JB...6
             36
      00392C 76 01 21 4C 6C 88 A5  2356         .db     0x76,0x01,0x21,0x4c,0x6c,0x88,0xa5,0xff ;v.!Ll.%.
             FF
      003934 4A 02 86 4E 12 16 76  2357         .db     0x4a,0x02,0x86,0x4e,0x12,0x16,0x76,0x05 ;J..N..v.
             05
      00393C 28 50 60 89 A8 B0 FF  2358         .db     0x28,0x50,0x60,0x89,0xa8,0xb0,0xff,0x0a ;(P`.(0..
             0A
      003944 42 27 0E 92 96 00 48  2359         .db     0x42,0x27,0x0e,0x92,0x96,0x00,0x48,0x68 ;B'....Hh
             68
      00394C 70 A0 A8 FF 4A 02 66  2360         .db     0x70,0xa0,0xa8,0xff,0x4a,0x02,0x66,0x0e ;p (.J.f.
             0E
      003954 13 16 04 40 6D 88 90  2361         .db     0x13,0x16,0x04,0x40,0x6d,0x88,0x90,0xa0 ;...@m.. 
             A0
      00395C A8 FF 2A 02 82 0E 8E  2362         .db     0xa8,0xff,0x2a,0x02,0x82,0x0e,0x8e,0x72 ;(.*....r
             72
      003964 37 04 10 4C 60 68 B0  2363         .db     0x37,0x04,0x10,0x4c,0x60,0x68,0xb0,0xff ;7..L`h0.
             FF
      00396C 0A 07 4E 72 16 0C 50  2364         .db     0x0a,0x07,0x4e,0x72,0x16,0x0c,0x50,0x61 ;..Nr..Pa
             61
      003974 80 88 A9 FF 0A 23 27  2365         .db     0x80,0x88,0xa9,0xff,0x0a,0x23,0x27,0x0e ;..)..#'.
             0E
      00397C 92 36 00 48 68 70 85  2366         .db     0x92,0x36,0x00,0x48,0x68,0x70,0x85,0xa8 ;.6.Hhp.(
             A8
      003984 FF 6A 03 0E 8E 92 36  2367         .db     0xff,0x6a,0x03,0x0e,0x8e,0x92,0x36,0x10 ;.j....6.
             10
      00398C 44 4C 70 A1 FF 4A 82  2368         .db     0x44,0x4c,0x70,0xa1,0xff,0x4a,0x82,0x4e ;DLp!.J.N
             4E
      003994 16 76 05 25 50 60 85  2369         .db     0x16,0x76,0x05,0x25,0x50,0x60,0x85,0xa8 ;.v.%P`.(
             A8
      00399C B0 FF 0A 23 46 0E 92  2370         .db     0xb0,0xff,0x0a,0x23,0x46,0x0e,0x92,0x00 ;0..#F...
             00
      0039A4 48 68 70 80 88 A1 FF  2371         .db     0x48,0x68,0x70,0x80,0x88,0xa1,0xff,0x6a ;Hhp..!.j
             6A
      0039AC 03 66 2E 92 17 05 44  2372         .db     0x03,0x66,0x2e,0x92,0x17,0x05,0x44,0x6d ;.f....Dm
             6D
      0039B4 A0 A8 FF 0A 42 82 66  2373         .db     0xa0,0xa8,0xff,0x0a,0x42,0x82,0x66,0x2e ; (..B.f.
             2E
      0039BC 92 37 0D 20 44 6C A5  2374         .db     0x92,0x37,0x0d,0x20,0x44,0x6c,0xa5,0xff ;.7. Dl%.
             FF
      0039C4 2A 63 0E 4E 12 16 56  2375         .db     0x2a,0x63,0x0e,0x4e,0x12,0x16,0x56,0x01 ;*c.N..V.
             01
      0039CC 40 64 AD FF 0A 42 82  2376         .db     0x40,0x64,0xad,0xff,0x0a,0x42,0x82,0x86 ;@d-..B..
             86
      0039D4 2E 33 16 00 44 65 89  2377         .db     0x2e,0x33,0x16,0x00,0x44,0x65,0x89,0xa8 ;.3..De.(
             A8
      0039DC B0 FF 4A 02 66 0E 13  2378         .db     0xb0,0xff,0x4a,0x02,0x66,0x0e,0x13,0x17 ;0.J.f...
             17
      0039E4 04 40 6D 88 90 A1 FF  2379         .db     0x04,0x40,0x6d,0x88,0x90,0xa1,0xff,0x2a ;.@m..!.*
             2A
      0039EC 02 66 13 56 04 40 69  2380         .db     0x02,0x66,0x13,0x56,0x04,0x40,0x69,0x88 ;.f.V.@i.
             88
      0039F4 90 A0 FF 0A 42 82 46  2381         .db     0x90,0xa0,0xff,0x0a,0x42,0x82,0x46,0x0e ;. ..B.F.
             0E
      0039FC 6E 13 16 00 48 70 84  2382         .db     0x6e,0x13,0x16,0x00,0x48,0x70,0x84,0xa4 ;n...Hp.$
             A4
      003A04 AC FF 4A 02 66 0E 13  2383         .db     0xac,0xff,0x4a,0x02,0x66,0x0e,0x13,0x16 ;,.J.f...
             16
      003A0C 04 40 6D 88 90 FF 2A  2384         .db     0x04,0x40,0x6d,0x88,0x90,0xff,0x2a,0x22 ;.@m...*"
             22
      003A14 82 0E 72 36 76 01 4C  2385         .db     0x82,0x0e,0x72,0x36,0x76,0x01,0x4c,0x60 ;..r6v.L`
             60
      003A1C 68 85 FF 2A 42 82 86  2386         .db     0x68,0x85,0xff,0x2a,0x42,0x82,0x86,0x0e ;h..*B...
             0E
      003A24 72 36 76 01 20 4C 64  2387         .db     0x72,0x36,0x76,0x01,0x20,0x4c,0x64,0x88 ;r6v. Ld.
             88
      003A2C A9 FF 0A 22 62 86 8E  2388         .db     0xa9,0xff,0x0a,0x22,0x62,0x86,0x8e,0x52 ;).."b..R
             52
      003A34 36 76 00 2C 45 65 B0  2389         .db     0x36,0x76,0x00,0x2c,0x45,0x65,0xb0,0xff ;6v.,Ee0.
             FF
      003A3C 0A 86 0E 33 10 44 60  2390         .db     0x0a,0x86,0x0e,0x33,0x10,0x44,0x60,0x68 ;...3.D`h
             68
      003A44 A8 B0 FF 2A 62 0E 4E  2391         .db     0xa8,0xb0,0xff,0x2a,0x62,0x0e,0x4e,0x53 ;(0.*b.NS
             53
      003A4C 57 04 30 40 85 A4 AC  2392         .db     0x57,0x04,0x30,0x40,0x85,0xa4,0xac,0xff ;W.0@.$,.
             FF
      003A54 0A 82 86 0E 33 37 10  2393         .db     0x0a,0x82,0x86,0x0e,0x33,0x37,0x10,0x44 ;....37.D
             44
      003A5C 60 68 88 90 A8 FF 2A  2394         .db     0x60,0x68,0x88,0x90,0xa8,0xff,0x2a,0x22 ;`h..(.*"
             22
      003A64 82 0E 72 36 76 01 4C  2395         .db     0x82,0x0e,0x72,0x36,0x76,0x01,0x4c,0x60 ;..r6v.L`
             60
      003A6C 68 85 A9 FF 4A 02 2F  2396         .db     0x68,0x85,0xa9,0xff,0x4a,0x02,0x2f,0x96 ;h.).J./.
             96
      003A74 05 24 40 50 70 85 A5  2397         .db     0x05,0x24,0x40,0x50,0x70,0x85,0xa5,0xff ;.$@Pp.%.
             FF
      003A7C 0A 22 62 86 2E 13 56  2398         .db     0x0a,0x22,0x62,0x86,0x2e,0x13,0x56,0x00 ;."b...V.
             00
      003A84 44 64 6C 8D AC FF 0A  2399         .db     0x44,0x64,0x6c,0x8d,0xac,0xff,0x0a,0x03 ;Ddl.,...
             03
      003A8C 2E 6E 32 17 0C 44 70  2400         .db     0x2e,0x6e,0x32,0x17,0x0c,0x44,0x70,0x81 ;.n2..Dp.
             81
      003A94 A0 A8 FF 0A 43 2E 92  2401         .db     0xa0,0xa8,0xff,0x0a,0x43,0x2e,0x92,0x56 ; (..C..V
             56
      003A9C 00 44 64 6C 85 A0 A8  2402         .db     0x00,0x44,0x64,0x6c,0x85,0xa0,0xa8,0xff ;.Ddl. (.
             FF
      003AA4 0A 22 27 6E 32 17 00  2403         .db     0x0a,0x22,0x27,0x6e,0x32,0x17,0x00,0x0c ;."'n2...
             0C
      003AAC 48 70 81 A0 A8 FF 2A  2404         .db     0x48,0x70,0x81,0xa0,0xa8,0xff,0x2a,0x02 ;Hp. (.*.
             02
      003AB4 86 0E 4E 13 56 96 04  2405         .db     0x86,0x0e,0x4e,0x13,0x56,0x96,0x04,0x40 ;..N.V..@
             40
      003ABC 61 A8 FF 2A 43 86 6E  2406         .db     0x61,0xa8,0xff,0x2a,0x43,0x86,0x6e,0x72 ;a(.*C.nr
             72
      003AC4 77 04 10 20 4D 64 A9  2407         .db     0x77,0x04,0x10,0x20,0x4d,0x64,0xa9,0xff ;w.. Md).
             FF
      003ACC 0A 23 27 92 00 48 68  2408         .db     0x0a,0x23,0x27,0x92,0x00,0x48,0x68,0x70 ;.#'..Hhp
             70
      003AD4 80 88 A0 A8 FF 2A 23  2409         .db     0x80,0x88,0xa0,0xa8,0xff,0x2a,0x23,0x0e ;.. (.*#.
             0E
      003ADC 92 36 76 04 4C 64 6C  2410         .db     0x92,0x36,0x76,0x04,0x4c,0x64,0x6c,0x85 ;.6v.Ldl.
             85
      003AE4 FF 2A 63 0F 76 01 50  2411         .db     0xff,0x2a,0x63,0x0f,0x76,0x01,0x50,0x64 ;.*c.v.Pd
             64
      003AEC 6C A5 FF 0A 23 2E 92  2412         .db     0x6c,0xa5,0xff,0x0a,0x23,0x2e,0x92,0x00 ;l%..#...
             00
      003AF4 44 64 6C 80 88 A0 A8  2413         .db     0x44,0x64,0x6c,0x80,0x88,0xa0,0xa8,0xff ;Ddl.. (.
             FF
      003AFC 0A 42 82 46 8E 52 37  2414         .db     0x0a,0x42,0x82,0x46,0x8e,0x52,0x37,0x10 ;.B.F.R7.
             10
      003B04 20 48 68 90 A4 B0 FF  2415         .db     0x20,0x48,0x68,0x90,0xa4,0xb0,0xff,0x0a ; Hh.$0..
             0A
      003B0C 63 66 2E 53 56 96 0C  2416         .db     0x63,0x66,0x2e,0x53,0x56,0x96,0x0c,0x30 ;cf.SV..0
             30
      003B14 41 68 A4 AC FF 0A 82  2417         .db     0x41,0x68,0xa4,0xac,0xff,0x0a,0x82,0x86 ;Ah$,....
             86
      003B1C 0E 33 37 10 44 60 68  2418         .db     0x0e,0x33,0x37,0x10,0x44,0x60,0x68,0x89 ;.37.D`h.
             89
      003B24 A8 B0 FF 0A 27 0E 92  2419         .db     0xa8,0xb0,0xff,0x0a,0x27,0x0e,0x92,0x00 ;(0..'...
             00
      003B2C 48 68 70 80 88 A0 A8  2420         .db     0x48,0x68,0x70,0x80,0x88,0xa0,0xa8,0xff ;Hhp.. (.
             FF
      003B34 4A 42 82 46 0E 92 36  2421         .db     0x4a,0x42,0x82,0x46,0x0e,0x92,0x36,0x76 ;JB.F..6v
             76
      003B3C 21 4C 6C 85 A8 FF 0A  2422         .db     0x21,0x4c,0x6c,0x85,0xa8,0xff,0x0a,0x22 ;!Ll.(.."
             22
      003B44 82 6E 92 17 00 45 60  2423         .db     0x82,0x6e,0x92,0x17,0x00,0x45,0x60,0x70 ;.n...E`p
             70
      003B4C A5 FF 2A 46 8E 72 17  2424         .db     0xa5,0xff,0x2a,0x46,0x8e,0x72,0x17,0x04 ;%.*F.r..
             04
      003B54 0C 2C 4C 68 81 A0 B0  2425         .db     0x0c,0x2c,0x4c,0x68,0x81,0xa0,0xb0,0xff ;.,Lh. 0.
             FF
      003B5C 0A 26 0E 72 56 96 00  2426         .db     0x0a,0x26,0x0e,0x72,0x56,0x96,0x00,0x30 ;.&.rV..0
             30
      003B64 49 61 A0 FF 4A 02 27  2427         .db     0x49,0x61,0xa0,0xff,0x4a,0x02,0x27,0x0e ;Ia .J.'.
             0E
      003B6C 92 17 04 4C 6D 80 88  2428         .db     0x92,0x17,0x04,0x4c,0x6d,0x80,0x88,0xa0 ;...Lm.. 
             A0
      003B74 A8 FF 0A 86 0E 33 36  2429         .db     0xa8,0xff,0x0a,0x86,0x0e,0x33,0x36,0x10 ;(....36.
             10
      003B7C 44 61 88 90 A9 FF 4A  2430         .db     0x44,0x61,0x88,0x90,0xa9,0xff,0x4a,0x02 ;Da..).J.
             02
      003B84 27 0E 92 17 04 4C 6D  2431         .db     0x27,0x0e,0x92,0x17,0x04,0x4c,0x6d,0x80 ;'....Lm.
             80
      003B8C 88 A1 FF 2A 42 82 46  2432         .db     0x88,0xa1,0xff,0x2a,0x42,0x82,0x46,0x0e ;.!.*B.F.
             0E
      003B94 72 36 76 01 20 4C 68  2433         .db     0x72,0x36,0x76,0x01,0x20,0x4c,0x68,0x85 ;r6v. Lh.
             85
      003B9C A8 FF 4A 43 0E 72 36  2434         .db     0xa8,0xff,0x4a,0x43,0x0e,0x72,0x36,0x76 ;(.JC.r6v
             76
      003BA4 04 21 4C 85 A0 A8 FF  2435         .db     0x04,0x21,0x4c,0x85,0xa0,0xa8,0xff,0x0a ;.!L. (..
             0A
      003BAC 42 27 0E 92 96 00 48  2436         .db     0x42,0x27,0x0e,0x92,0x96,0x00,0x48,0x68 ;B'....Hh
             68
      003BB4 70 81 A0 A8 FF 0A 23  2437         .db     0x70,0x81,0xa0,0xa8,0xff,0x0a,0x23,0x0e ;p. (..#.
             0E
      003BBC 92 17 00 48 68 70 88  2438         .db     0x92,0x17,0x00,0x48,0x68,0x70,0x88,0xa0 ;...Hhp. 
             A0
      003BC4 A8 FF 2A 62 06 2E 6E  2439         .db     0xa8,0xff,0x2a,0x62,0x06,0x2e,0x6e,0x13 ;(.*b..n.
             13
      003BCC 08 40 64 70 84 FF 0A  2440         .db     0x08,0x40,0x64,0x70,0x84,0xff,0x0a,0x23 ;.@dp...#
             23
      003BD4 27 0E 92 96 00 48 68  2441         .db     0x27,0x0e,0x92,0x96,0x00,0x48,0x68,0x70 ;'....Hhp
             70
      003BDC 80 88 A0 A8 FF 0A 23  2442         .db     0x80,0x88,0xa0,0xa8,0xff,0x0a,0x23,0x2e ;.. (..#.
             2E
      003BE4 92 17 00 44 68 70 80  2443         .db     0x92,0x17,0x00,0x44,0x68,0x70,0x80,0x88 ;...Dhp..
             88
      003BEC A1 FF 4A 02 66 0E 13  2444         .db     0xa1,0xff,0x4a,0x02,0x66,0x0e,0x13,0x17 ;!.J.f...
             17
      003BF4 04 40 6D 88 90 A0 FF  2445         .db     0x04,0x40,0x6d,0x88,0x90,0xa0,0xff,0x0a ;.@m.. ..
             0A
      003BFC 23 8E 12 16 56 00 44  2446         .db     0x23,0x8e,0x12,0x16,0x56,0x00,0x44,0x4c ;#...V.DL
             4C
      003C04 69 A0 B0 FF 4A 82 26  2447         .db     0x69,0xa0,0xb0,0xff,0x4a,0x82,0x26,0x4e ;i 0.J.&N
             4E
      003C0C 72 16 04 0C 28 50 60  2448         .db     0x72,0x16,0x04,0x0c,0x28,0x50,0x60,0x85 ;r...(P`.
             85
      003C14 A4 AC FF 2A 02 8E 72  2449         .db     0xa4,0xac,0xff,0x2a,0x02,0x8e,0x72,0x04 ;$,.*..r.
             04
      003C1C 40 4C 60 68 81 B0 FF  2450         .db     0x40,0x4c,0x60,0x68,0x81,0xb0,0xff,0x4a ;@L`h.0.J
             4A
      003C24 42 82 46 0E 92 36 76  2451         .db     0x42,0x82,0x46,0x0e,0x92,0x36,0x76,0x01 ;B.F..6v.
             01
      003C2C 21 4C 6C 88 A5 FF 2A  2452         .db     0x21,0x4c,0x6c,0x88,0xa5,0xff,0x2a,0x02 ;!Ll.%.*.
             02
      003C34 6F 12 17 04 4C 61 80  2453         .db     0x6f,0x12,0x17,0x04,0x4c,0x61,0x80,0x90 ;o...La..
             90
      003C3C A0 FF 2A 22 82 0E 72  2454         .db     0xa0,0xff,0x2a,0x22,0x82,0x0e,0x72,0x36 ; .*"..r6
             36
      003C44 76 01 4C 60 68 85 AC  2455         .db     0x76,0x01,0x4c,0x60,0x68,0x85,0xac,0xff ;v.L`h.,.
             FF
      003C4C 2A 02 62 06 2F 92 16  2456         .db     0x2a,0x02,0x62,0x06,0x2f,0x92,0x16,0x09 ;*.b./...
             09
      003C54 40 70 85 FF 0A 86 0E  2457         .db     0x40,0x70,0x85,0xff,0x0a,0x86,0x0e,0x33 ;@p.....3
             33
      003C5C 37 10 44 61 88 90 A8  2458         .db     0x37,0x10,0x44,0x61,0x88,0x90,0xa8,0xb0 ;7.Da..(0
             B0
      003C64 FF                    2459         .db     0xff
                                   2460 ;
                                   2461 ; _DATA wird zur Berechnung Programmgröße verwendet
                                   2462 ;
                                   2463         .area    _DATA
                                   2464 ;
                                   2465 ; das hier sind wahrscheinlich nur Füllbytes, um
                                   2466 ; auf die 128-Byte Blockgröße aufzufüllen
                                   2467 ; im KCC-Header steht eadr als Endeaddresse
                                   2468 ;
      003D51                       2469 prfsum:
      003D51 00                    2470         .db     0x00
      003D52                       2471 hidden:
      003D52 00                    2472         .db     0x00
      003D53                       2473 toggled:
      003D53 00                    2474         .db     0x00
      003D54                       2475 field:
      003D54 00 00 00 00 00 00 00  2476         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      003D5C 00 00 00 00 00 00 00  2477         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      003D64 00 00 00 00 00 00 00  2478         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      003D6C 00 00 00 00 00 00 00  2479         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      003D74 00 00 00 00           2480         .db     0x00,0x00,0x00,0x00
      003D78                       2481 level:
      003D78 00                    2482         .db     0x00
      003D79                       2483 puzzle:
      003D79 00 00                 2484         .db     0x00,0x00
      003D7B                       2485 moves:
      003D7B 00 00                 2486         .db     0x00,0x00
      003D7D                       2487 pptr:
      003D7D 00 00                 2488         .db     0x00,0x00
      003D7F                       2489 custone:
      003D7F 00 00                 2490         .db     0x00,0x00
      003D81                       2491 pcnt:
      003D81 00                    2492         .db     0x00
      003D82                       2493 stones:
      003D82 00 00                 2494         .db     0x00,0x00
      003D84                       2495         .ds     17*4-2
                                   2496 ; end of source
                                   2497 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.                                                    =  002710 GL
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 GL
    .__.H$L.                                                    =  000000 GL
    BG_BLACK                                                    =  000000 G
    BG_GREEN                                                    =  000002 G
    BG_YELLOW                                                   =  000003 G
    BWS                                                         =  00EC00 G
  0 CNVBN                                                          0009D0 GR
    CONBU                                                          ****** GX
    CURSR                                                       =  00002B G
    CURSR_CHAR                                                  =  00001F G
    DECODE_END                                                  =  000001 G
    EMPTY                                                       =  000000 G
    FG_BLACK                                                    =  000000 G
    FG_CYAN                                                     =  000060 G
    FG_GREEN                                                    =  000020 G
    FIELD_END                                                   =  0000FF G
    FIELD_SIZE                                                  =  00000C G
    FRAME_COLOR                                                 =  000063 G
    HORIZONTAL                                                  =  000000 G
    INCH                                                        =  000001 G
    INLIN                                                       =  000005 G
    INPUT_LINE_size                                             =  00000E G
  0 Level0                                                         000593 GR
    Level0_size                                                 =  000008 G
  0 Level1                                                         00059B GR
    Level1_size                                                 =  000008 G
  0 Level2                                                         0005A3 GR
    Level2_size                                                 =  000008 G
  0 Level3                                                         0005AB GR
    Level3_size                                                 =  000008 G
    MASK_CAPITAL_LETTERS                                        =  00003F G
    MASK_LEVEL_CODE                                             =  00001C G
    MASK_LOWER_BITS                                             =  000003 G
    MASK_LOWER_NIBBLE                                           =  00000F G
    MASK_UPPER_BITS                                             =  0000C0 G
    MAX_LEVEL                                                   =  000003 G
    MINIMUM_DISTANCE                                            =  0000FF G
  0 Num1                                                           0009B9 GR
  0 Num2                                                           0009BB GR
    OUTCH                                                       =  000000 G
  0 OUTH1                                                          000989 GR
  0 OUTH2                                                          000993 GR
  0 OUTHL                                                          00097B GR
    POSITION_FIELD                                              =  00EDE2 G
    POSITION_INPUT_LINE                                         =  00EF51 G
    POSITION_LEVEL                                              =  00EDD8 G
    POSITION_MOVES                                              =  00EE5B G
    POSITION_PUZZEL                                             =  00EE1B G
    POSITION_SUCCESS                                            =  00EE91 G
    POSX_INPUT_LINE                                             =  000011 G
    POSY_INPUT_LINE                                             =  00001A G
    POS_END_42                                                  =  000204 G
  0 PRS1                                                           0009C5 GR
  0 PRS2                                                           0009CE GR
    PRST7                                                       =  000002 G
    RED_STONE_COLOR                                             =  000002 G
    SCREEN_HEIGHT                                               =  000020 G
    SCREEN_WIDTH                                                =  000020 G
    SELC                                                        =  0000C2 G
    SELCR                                                       =  0000C3 G
    SIZE2                                                       =  000002 G
    STONE_COLOR                                                 =  000002 G
    STONE_RECT_size                                             =  000004 G
    VERTICAL                                                    =  000001 G
    VK_CLS                                                      =  00000C G
    VK_DOWN                                                     =  00000A G
    VK_ENTER                                                    =  00000D G
    VK_LEFT                                                     =  000008 G
    VK_RIGHT                                                    =  000009 G
    VK_UP                                                       =  00000B G
  0 _main                                                          000000 GR
  0 atoh                                                           0009E1 GR
  0 calc_distance                                                  00067D GR
  0 calc_distance1                                                 000688 GR
  0 calc_distance2                                                 00069B GR
  0 calc_pos                                                       0008CC GR
  0 calc_pos0                                                      0008D2 GR
  0 calc_pos1                                                      0008D9 GR
    cls_small_window                                               ****** GX
  0 cmd                                                            000003 GR
  0 cmd_end_marker                                                 00000B GR
    cmd_size                                                    =  000008 G
  0 codeinp                                                        0004CB GR
  0 cu_down                                                        00061D GR
  0 cu_down1                                                       000623 GR
  0 cu_init                                                        0005E3 GR
  0 cu_left                                                        00063D GR
  0 cu_left1                                                       000643 GR
  0 cu_right                                                       00065D GR
  0 cu_right1                                                      000663 GR
  0 cu_up                                                          0005FD GR
  0 cu_up1                                                         000603 GR
    cursor_disable                                                 ****** GX
  1 custone                                                        00002E GR
  0 decode                                                         0007DA GR
  0 decomp                                                         0004C2 GR
  0 draw                                                           000956 GR
  0 draw1                                                          00095D GR
  0 draw2                                                          00095C GR
  0 encode                                                         0007AE GR
  0 ende                                                           000054 GR
  1 field                                                          000003 GR
    field_size                                                  =  000024 G
  0 fullwindw                                                      0000BD GR
  0 geschafft                                                      0005D4 GR
    geschafft_size                                              =  00000F G
  0 getpuzzle                                                      000808 GR
  0 gp1                                                            00081C GR
  0 gp2                                                            00080B GR
  0 gp3                                                            00081F GR
  1 hidden                                                         000001 GR
  0 hlkon                                                          000996 GR
    inline                                                         ****** GX
  0 kdo                                                            00007D GR
  0 kdotab                                                         000097 GR
  1 level                                                          000027 GR
  0 lvl0cnt                                                        0009F4 GR
  0 lvl1cnt                                                        0009F6 GR
  0 lvl2cnt                                                        0009F8 GR
  0 lvl3cnt                                                        0009FA GR
  0 mainloop                                                       00002D GR
  0 mainpic                                                        0000C2 GR
    mainpic_size                                                =  0001AA G
  0 move_down                                                      0006F5 GR
  0 move_left                                                      00071B GR
  0 move_right                                                     00073E GR
  0 move_up                                                        0006D2 GR
  1 moves                                                          00002A GR
  0 mv_right0                                                      000756 GR
  0 next_stone                                                     0006B6 GR
  0 next_stone1                                                    0006CA GR
  0 nextpuzzle                                                     00077C GR
  0 np1                                                            000784 GR
  0 np2                                                            00079C GR
  0 outhx                                                          000980 GR
  1 pcnt                                                           000030 GR
  1 pptr                                                           00002C GR
  1 prfsum                                                         000000 GR
  0 prnst0                                                         0009C4 GR
  1 puzzle                                                         000028 GR
  0 puzzles                                                        0009FC GR
    puzzles_size                                                =  003169 G
  0 qtab                                                           0006AF GR
    qtab_size                                                   =  000006 G
  0 red2                                                           000910 GR
    red2_size                                                   =  00000A G
  0 res1                                                           00057D GR
  0 reset                                                          000555 GR
  0 ret_from_prnst0                                                0004D0 GR
  0 s2                                                             000544 GR
  0 sadr                                                           000000 GR
  0 senk                                                           000947 GR
  0 senk2                                                          0008F8 GR
    senk2_size                                                  =  00000A G
  0 senk3                                                          000902 GR
    senk3_size                                                  =  00000E G
  0 show                                                           000876 GR
  0 show0                                                          00087D GR
  0 show1                                                          000891 GR
  0 show2                                                          00088F GR
  0 show3                                                          0008A2 GR
  0 show_mv                                                        000869 GR
  0 show_stone                                                     00091A GR
  0 show_stone1                                                    000932 GR
  0 showcu1                                                        0008CA GR
  0 smallwindw                                                     0000B9 GR
  0 solved                                                         0005B3 GR
  0 sp0                                                            0004F6 GR
  0 sp1                                                            000519 GR
  0 sp2                                                            000521 GR
  0 sp2a                                                           00052B GR
  0 start                                                          00000D GR
  1 stones                                                         000031 GR
  0 toggle                                                         0000B1 GR
  1 toggled                                                        000002 GR
  0 txt_prompt                                                     0004CE GR
    txt_prompt_size                                             =  000002 G
  0 unp1                                                           000865 GR
  0 unp2                                                           000831 GR
  0 unpack                                                         000829 GR
  0 vers                                                           000074 GR
    vers_size                                                   =  000009 G
  0 waag2                                                          0008E0 GR
    waag2_size                                                  =  00000A G
  0 waag3                                                          0008EA GR
    waag3_size                                                  =  00000E G
    z1013                                                       =  000001 G
    z9001                                                       =  000000 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size   3B65   flags    0
   1 _DATA                                      size     75   flags    0


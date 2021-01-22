                                      1         .module blocks
                                      2         .include 'platform.s'
                           000000     1 z9001                           =       0
                           000000     2 z1013                           =       0
                           000001     3 ta_alpha                        =       1
                                      4 ;
                                      5 ; ta specific constants
                                      6 ;
                           000005     7 BOS                             =       0x0005
                           00F000     8 BWS                             =       0xf000
                           000800     9 OFFSET_COLOR                    =       0x0800
                           00E469    10 cfg20_settings                  =       0xe469
                           00E9E8    11 crt_cls                         =       0xe9e8
                                     12 
                           000020    13 CFG20                           =       0x20
                           000050    14 CRT_REG                         =       0x50
                           000051    15 CRT_DATA                        =       0x51
                           00000A    16 REG_10_CURSOR_START             =       10 
                                     17 
                           00000C    18 VK_CLS                          =       0x0c
                           00000D    19 VK_ENTER                        =       0x0d
                           00001D    20 VK_LEFT                         =       0x1d
                           00001C    21 VK_RIGHT                        =       0x1c
                           00001E    22 VK_UP                           =       0x1e
                           00001F    23 VK_DOWN                         =       0x1f
                                     24 
                                     25 ;
                                     26 ; platform specific constants
                                     27 ;
                           000000    28 FG_BLACK                        =       0
                           000001    29 FG_BLUE                         =       1
                           000002    30 FG_RED                          =       2
                           000003    31 FG_MAGENTA                      =       3
                           000004    32 FG_GREEN                        =       4
                           000005    33 FG_CYAN                         =       5
                           000006    34 FG_YELLOW                       =       6
                           000007    35 FG_WHITE                        =       7
                           000000    36 BG_BLACK                        =       0*8
                           000008    37 BG_BLUE                         =       1*8
                           000010    38 BG_RED                          =       2*8
                           000018    39 BG_MAGENTA                      =       3*8
                           000020    40 BG_GREEN                        =       4*8
                           000028    41 BG_CYAN                         =       5*8
                           000030    42 BG_YELLOW                       =       6*8
                           000038    43 BG_WHITE                        =       7*8
                           000033    44 FRAME_COLOR                     =       FG_MAGENTA+BG_YELLOW
                           000034    45 STONE_COLOR                     =       FG_GREEN+BG_YELLOW
                           000033    46 RED_STONE_COLOR                 =       FG_MAGENTA+BG_YELLOW
                           00001C    47 SELC                            =       0x1c
                           00001C    48 SELCR                           =       0x1c
                           000028    49 SCREEN_WIDTH                    =       0x28
                           000018    50 SCREEN_HEIGHT                   =       0x18
                           000015    51 POSY_INPUT_LINE                 =       21
                           000016    52 POSX_INPUT_LINE                 =       22
                           00000F    53 INPUT_LINE_size                 =       0x0f
                           00F228    54 POSITION_MOVES                  =       BWS+13*SCREEN_WIDTH+32
                           00F296    55 POSITION_SUCCESS                =       BWS+16*SCREEN_WIDTH+22
                           00F193    56 POSITION_FIELD                  =       BWS+10*SCREEN_WIDTH+3
                           00F185    57 POSITION_LEVEL                  =       BWS+9*SCREEN_WIDTH+29
                           00F1D8    58 POSITION_PUZZEL                 =       BWS+11*SCREEN_WIDTH+32
                           00F35E    59 POSITION_INPUT_LINE             =       BWS+POSY_INPUT_LINE*SCREEN_WIDTH+POSX_INPUT_LINE
                           00000C    60 FIELD_SIZE                      =       0x0c
                                     61 .macro CURSOR_DISABLE
                                     62         call    crt_cursor_disable
                                     63 .endm
                                     64 
                           000083    65 TOP_LEFT   = 0x83
                           000083    66 TOP_MIDDLE = 0x83
                           000014    67 TOP_RIGHT  = 0x14
                                     68 
                           000080    69 BOTTOM_LEFT   = 0x80
                           000080    70 BOTTOM_MIDDLE = 0x80
                           000015    71 BOTTOM_RIGHT  = 0x15
                                     72 
                           000080    73 LEFT = 0x80
                           000015    74 RIGHT = 0x15
                                     75 
                                     76 .macro STONE_GFX
                                     77 waag2:
                                     78         .db     0x02,0x04
                                     79         .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
                                     80         .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
                                     81 waag3:
                                     82         .db     0x02,0x06
                                     83         .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
                                     84         .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
                                     85 senk2:
                                     86         .db     0x04,0x02
                                     87         .db     TOP_LEFT,TOP_RIGHT
                                     88         .db     LEFT,RIGHT
                                     89         .db     LEFT,RIGHT
                                     90         .db     BOTTOM_LEFT,BOTTOM_RIGHT
                                     91 senk3:
                                     92         .db     0x06,0x02
                                     93         .db     TOP_LEFT,TOP_RIGHT
                                     94         .db     LEFT,RIGHT
                                     95         .db     LEFT,RIGHT
                                     96         .db     LEFT,RIGHT
                                     97         .db     LEFT,RIGHT
                                     98         .db     BOTTOM_LEFT,BOTTOM_RIGHT
                                     99 red2:
                                    100         .db     0x02,0x04
                                    101         .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
                                    102         .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
                                    103 
                                    104 .endm
                                    105 
                                    106 .macro UP_INCH
                                    107         call    inch
                                    108 .endm
                                    109 
                                    110 .macro  SYS_EXIT
                                    111         jp      exit
                                    112 .endm
                                    113 
                                    114 .macro  CALL_OUTA
                                    115         call    putchar
                                    116 .endm
                                    117 
                                    118 .macro  INPUT_LINE
                                    119         call    inline
                                    120 .endm
                                    121 
                                    122 .macro  SET_CURSOR ADR
                                    123         ld      hl,#ADR
                                    124         ld      (CURS),hl
                                    125 .endm
                                    126 
                                    127 .macro ROLL_SMALL_WIN
                                    128         call    cls_small_window
                                    129 .endm
                                    130 
                                    131 .macro  TXT_ERROR
                                    132         .asciz  'Err'
                                    133 .endm
                                    134 
                                    135 .macro MAIN_PIC
                                    136         .db     0xe0,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4
                                    137         .db     0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe1
                                    138 
                                    139         .db     0xe5,0x20,0x1c,0x93,0x20,0x15,0x20,0x1c,0x14,0x1c,0x04,0x15,0x20,0x10,0x9f,0x0c,0x04,0x20,0x20,0x20
                                    140         .ascii  '  VPOHLERS  2020   \345'
                                    141 
                                    142         .db     0xe5,0x20,0x1d,0x0e,0x14,0x15,0x20,0x15,0x15,0x15,0x20,0x8a,0x99,0x20,0x0a,0x93,0x20,0x20,0x20,0x20
                                    143         .ascii  '                   \345'
                                    144 
                                    145         .db     0xe5,0x20,0x8a,0x8f,0x15,0x8a,0x10,0x8a,0x15,0x8a,0x10,0x15,0x20,0x15,0x0c,0x06,0x20,0x20,0x20,0x20
                                    146         .ascii  '- FREE THE STONE - \345'
                                    147 
                                    148         .db     0xe2,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4
                                    149         .db     0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe3
                                    150 
                                    151         .ascii  '                                        '
                                    152         .ascii  '     E,S,D,X select   e,s,d,x move      '
                                    153         .ascii  '       <SPACE> toggle, A next           '
                                    154         .ascii  '                                        '
                                    155 
                                    156         .db     0x20,0x20,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x20,0x20,0x20,0x20
                                    157         .ascii  '  Level  Beginner   '
                                    158 
                                    159         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    160         .ascii  '                    '
                                    161 
                                    162         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    163         .ascii  '  Puzzle    00001   '
                                    164 
                                    165         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    166         .ascii  '                    '
                                    167 
                                    168         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x0a,0x04,0x20,0x20,0x20
                                    169         .ascii  '  Moves     00000   '
                                    170 
                                    171         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    172         .ascii  '                    '
                                    173         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
                                    174         .ascii  '                    '
                                    175 
                                    176         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x97,0x04,0x20,0x20,0x20
                                    177         .ascii  '                    '
                                    178         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    179         .ascii  '                    '
                                    180         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    181         .ascii  '  Code/Reset/Quit   '
                                    182         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    183         .ascii  '                    '
                                    184         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    185         .ascii  ' \340\344\344\344\344\344\344\344\344\344\344\344\344\344\344\344\341  '
                                    186         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
                                    187         .ascii  ' \345               \345  '
                                    188         ;FIELD bottom line
                                    189         .db     0x20,0x20,0x0d,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0e,0x20,0x20,0x20,0x20
                                    190         .ascii  ' \342\344\344\344\344\344\344\344\344\344\344\344\344\344\344\344\343  '
                                    191 
                                    192         .db     0x20,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x20,0x20,0x20
                                    193         .ascii  '                    '
                                    194 
                                    195 .endm
                                    196 
                                    197 .macro CLS_SMALL_WINDOW
                                    198         call    cls_small_window
                                    199 .endm
                                    200 
                                    201 .macro CLS_FULL_WINDOW
                                    202         call    crt_cls
                                    203 .endm
                                    204 
                                    205 .macro DECOMP
                                    206 
                                    207 window_list:
                                    208         .dw BWS+OFFSET_COLOR
                                    209         .db SCREEN_WIDTH,5
                                    210         .db BG_BLUE|FG_CYAN
                                    211 
                                    212         .dw BWS+5*SCREEN_WIDTH+OFFSET_COLOR
                                    213         .db SCREEN_WIDTH,3
                                    214         .db BG_BLACK|FG_CYAN
                                    215 
                                    216         .dw BWS+8*SCREEN_WIDTH+OFFSET_COLOR
                                    217         .db SCREEN_WIDTH,16
                                    218         .db BG_BLUE|FG_YELLOW
                                    219         
                                    220         .dw POSITION_FIELD-SCREEN_WIDTH-2+OFFSET_COLOR
                                    221         .db FIELD_SIZE+4,FIELD_SIZE+2
                                    222         .db BG_YELLOW|FG_MAGENTA
                                    223         
                                    224         .dw POSITION_LEVEL-8+OFFSET_COLOR
                                    225         .db 17,5
                                    226         .db BG_BLUE|FG_YELLOW
                                    227         
                                    228         .dw POSITION_LEVEL-8+5*SCREEN_WIDTH+OFFSET_COLOR
                                    229         .db 17,4
                                    230         .db BG_BLUE|FG_RED
                                    231         
                                    232         .dw POSITION_INPUT_LINE-3*SCREEN_WIDTH-1+OFFSET_COLOR
                                    233         .db 19,7
                                    234         .db BG_BLUE|FG_CYAN
                                    235 
                                    236         .dw POSITION_INPUT_LINE+OFFSET_COLOR
                                    237         .db 15,1
                                    238         .db BG_BLUE|FG_RED
                                    239 
                                    240 window_list_size = 8
                                    241 
                                    242 decomp:
                                    243         ld      de,#BWS
                                    244         ld      bc,#SCREEN_WIDTH*SCREEN_HEIGHT
                                    245         ldir
                                    246 
                                    247         ld      hl,#window_list
                                    248         ld      b,#window_list_size
                                    249 next_window:
                                    250         push    bc
                                    251         ld      e,(hl)
                                    252         inc     hl
                                    253         ld      d,(hl)
                                    254         inc     hl
                                    255         ld      c,(hl)
                                    256         inc     hl
                                    257         ld      b,(hl)
                                    258         inc     hl
                                    259         ld      a,(hl)
                                    260         inc     hl
                                    261         ex      de,hl
                                    262         call    color_window
                                    263         ex      de,hl
                                    264         pop     bc
                                    265         djnz    next_window
                                    266         ld      a,#BG_BLUE|FG_YELLOW
                                    267         ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+22
                                    268         ld      (hl),a
                                    269         ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+27
                                    270         ld      (hl),a
                                    271         ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+33
                                    272         ld      (hl),a
                                    273         ret
                                    274 .endm
                                    275 
                                    276 .macro PUT_A_COLORED
                                    277         ld      (hl),a
                                    278         set     3,h
                                    279         ex      af,af'
                                    280         ld      (hl),a
                                    281         ex      af,af'
                                    282         res     3,h
                                    283 .endm
                                    284 
                                    285 .macro SET_STONE_COLOR
                                    286         set     3,h
                                    287         ld      a,(color_stone)
                                    288         ld      (hl),a
                                    289         res     3,h
                                    290 .endm
                                    291 
                                    292 .macro SET_NORMAL_STONE_COLOR
                                    293         ld      a,#STONE_COLOR
                                    294         ld      (color_stone),a
                                    295 .endm
                                    296 
                                    297 .macro SET_RED_STONE_COLOR
                                    298         ld      a,#RED_STONE_COLOR
                                    299         ld      (color_stone),a
                                    300 .endm
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
      00A00F                         45 sadr:
      00A00F                         46 _main:
      00A00F C3 1C A0         [10]   47         jp      start
      00A012                         48 cmd:
      00A012 42 4C 4F 43 4B 53 20    49         .ascii  'BLOCKS  '
             20
      00A01A                         50 cmd_end_marker:
      00A01A 00 00                   51         .dw     0x0000
      00A01C                         52 start:
      00000D                         53         CURSOR_DISABLE
      00A01C CD C8 DB         [17]    1         call    crt_cursor_disable
      00A01F 21 B7 A0         [10]   54         ld      hl,#mainpic
      00A022 CD 9F A4         [17]   55         call    decomp
      00A025 CD AF A0         [17]   56         call    smallwindw
      00A028 3E 00            [ 7]   57         ld      a,#0
      00A02A 32 27 80         [13]   58         ld      (level),a
      00A02D 32 01 80         [13]   59         ld      (hidden),a
      00A030 32 02 80         [13]   60         ld      (toggled),a
      00A033 21 00 00         [10]   61         ld      hl,#0
      00A036 22 28 80         [16]   62         ld      (puzzle),hl
      00A039 CD 57 A5         [17]   63         call    reset
      00A03C                         64 mainloop:
      00002D                         65         CURSOR_DISABLE
      00A03C CD C8 DB         [17]    1         call    crt_cursor_disable
      000030                         66         UP_INCH
      00A03F CD 98 DB         [17]    1         call    inch
      00A042 FE 51            [ 7]   67         cp      #'Q'
      00A044 28 1E            [12]   68         jr      z,ende
      00A046 21 73 A0         [10]   69         ld      hl,#kdo
      00A049 01 1A 00         [10]   70         ld      bc,#kdotab-kdo
      00A04C ED B1            [21]   71         cpir
      00A04E 20 EC            [12]   72         jr      nz,mainloop
      00A050 3E 19            [ 7]   73         ld      a,#kdotab-kdo-1
      00A052 91               [ 4]   74         sub     c
      00A053 CB 3F            [ 8]   75         srl     a
      00A055 87               [ 4]   76         add     a,a
      00A056 21 8D A0         [10]   77         ld      hl,#kdotab
      00A059 4F               [ 4]   78         ld      c,a
      00A05A 09               [11]   79         add     hl,bc
      00A05B 5E               [ 7]   80         ld      e,(hl)
      00A05C 23               [ 6]   81         inc     hl
      00A05D 56               [ 7]   82         ld      d,(hl)
      00A05E 21 3C A0         [10]   83         ld      hl,#mainloop
      00A061 E5               [11]   84         push    hl
      00A062 D5               [11]   85         push    de
      00A063 C9               [10]   86         ret
      00A064                         87 ende:
      00A064 CD B3 A0         [17]   88         call    fullwindw
      000058                         89         SYS_EXIT
      00A067 C3 84 DB         [10]    1         jp      exit
      00A06A                         90 vers:
      00A06A 31 2F 31 35 2F 32 30    91         .ascii  '1/15/2021'
             32 31
      00A073                         92 kdo:
      00A073 43                      93         .db     'C'
                           000001    94 .if  eq,z9001
      00A074 63                      95         .db     'c'
                           000000    96 .else
                                     97         .db     0
                                     98 .endif
      00A075 52                      99         .db     'R'
                           000001   100 .if  eq,z9001
      00A076 72                     101         .db     'r'
                           000000   102 .else
                                    103         .db     0
                                    104 .endif
      00A077 45 1E                  105         .db     'E',VK_UP
      00A079 53 1D                  106         .db     'S',VK_LEFT
      00A07B 44 1C                  107         .db     'D',VK_RIGHT
      00A07D 58 1F                  108         .db     'X',VK_DOWN
      00A07F 65 00                  109         .db     'e',0x00
      00A081 73 00                  110         .db     's',0x00
      00A083 64 00                  111         .db     'd',0x00
      00A085 78 00                  112         .db     'x',0x00
      00A087 41 61                  113         .db     'A','a'
      00A089 20 0D                  114         .db     ' ',VK_ENTER
                           000001   115 .if  eq,z9001
      00A08B 4E 6E                  116         .db     'N','n'
                                    117 .endif
      00A08D                        118 kdotab:
      00A08D CE A4                  119         .dw     codeinp
      00A08F 57 A5                  120         .dw     reset
      00A091 00 A6                  121         .dw     cu_up
      00A093 40 A6                  122         .dw     cu_left
      00A095 60 A6                  123         .dw     cu_right
      00A097 20 A6                  124         .dw     cu_down
      00A099 D5 A6                  125         .dw     move_up
      00A09B 1E A7                  126         .dw     move_left
      00A09D 41 A7                  127         .dw     move_right
      00A09F F8 A6                  128         .dw     move_down
      00A0A1 B9 A6                  129         .dw     next_stone
      00A0A3 A7 A0                  130         .dw     toggle
                           000001   131 .if  eq,z9001        
      00A0A5 B5 A5                  132         .dw     solved
                                    133 .endif
      00A0A7                        134 toggle:
      00A0A7 3A 02 80         [13]  135         ld      a,(toggled)
      00A0AA 2F               [ 4]  136         cpl
      00A0AB 32 02 80         [13]  137         ld      (toggled),a
      00A0AE C9               [10]  138         ret
      00A0AF                        139 smallwindw:
      0000A0                        140         CLS_SMALL_WINDOW
      00A0AF CD DA DB         [17]    1         call    cls_small_window
      00A0B2 C9               [10]  141         ret
      00A0B3                        142 fullwindw:
      0000A4                        143         CLS_FULL_WINDOW
      00A0B3 CD E8 E9         [17]    1         call    crt_cls
      00A0B6 C9               [10]  144         ret
      00A0B7                        145 mainpic:
      0000A8                        146         MAIN_PIC
      00A0B7 E0 E4 E4 E4 E4 E4 E4     1         .db     0xe0,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4
             E4 E4 E4 E4 E4 E4 E4
             E4 E4 E4 E4 E4 E4
      00A0CB E4 E4 E4 E4 E4 E4 E4     2         .db     0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe1
             E4 E4 E4 E4 E4 E4 E4
             E4 E4 E4 E4 E4 E1
                                      3 
      00A0DF E5 20 1C 93 20 15 20     4         .db     0xe5,0x20,0x1c,0x93,0x20,0x15,0x20,0x1c,0x14,0x1c,0x04,0x15,0x20,0x10,0x9f,0x0c,0x04,0x20,0x20,0x20
             1C 14 1C 04 15 20 10
             9F 0C 04 20 20 20
      00A0F3 20 20 56 50 4F 48 4C     5         .ascii  '  VPOHLERS  2020   \345'
             45 52 53 20 20 32 30
             32 30 20 20 20 E5
                                      6 
      00A107 E5 20 1D 0E 14 15 20     7         .db     0xe5,0x20,0x1d,0x0e,0x14,0x15,0x20,0x15,0x15,0x15,0x20,0x8a,0x99,0x20,0x0a,0x93,0x20,0x20,0x20,0x20
             15 15 15 20 8A 99 20
             0A 93 20 20 20 20
      00A11B 20 20 20 20 20 20 20     8         .ascii  '                   \345'
             20 20 20 20 20 20 20
             20 20 20 20 20 E5
                                      9 
      00A12F E5 20 8A 8F 15 8A 10    10         .db     0xe5,0x20,0x8a,0x8f,0x15,0x8a,0x10,0x8a,0x15,0x8a,0x10,0x15,0x20,0x15,0x0c,0x06,0x20,0x20,0x20,0x20
             8A 15 8A 10 15 20 15
             0C 06 20 20 20 20
      00A143 2D 20 46 52 45 45 20    11         .ascii  '- FREE THE STONE - \345'
             54 48 45 20 53 54 4F
             4E 45 20 2D 20 E5
                                     12 
      00A157 E2 E4 E4 E4 E4 E4 E4    13         .db     0xe2,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4
             E4 E4 E4 E4 E4 E4 E4
             E4 E4 E4 E4 E4 E4
      00A16B E4 E4 E4 E4 E4 E4 E4    14         .db     0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe4,0xe3
             E4 E4 E4 E4 E4 E4 E4
             E4 E4 E4 E4 E4 E3
                                     15 
      00A17F 20 20 20 20 20 20 20    16         .ascii  '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00A1A7 20 20 20 20 20 45 2C    17         .ascii  '     E,S,D,X select   e,s,d,x move      '
             53 2C 44 2C 58 20 73
             65 6C 65 63 74 20 20
             20 65 2C 73 2C 64 2C
             78 20 6D 6F 76 65 20
             20 20 20 20 20
      00A1CF 20 20 20 20 20 20 20    18         .ascii  '       <SPACE> toggle, A next           '
             3C 53 50 41 43 45 3E
             20 74 6F 67 67 6C 65
             2C 20 41 20 6E 65 78
             74 20 20 20 20 20 20
             20 20 20 20 20
      00A1F7 20 20 20 20 20 20 20    19         .ascii  '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
                                     20 
      00A21F 20 20 8F 8F 8F 8F 8F    21         .db     0x20,0x20,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x8f,0x20,0x20,0x20,0x20
             8F 8F 8F 8F 8F 8F 8F
             8F 8F 20 20 20 20
      00A233 20 20 4C 65 76 65 6C    22         .ascii  '  Level  Beginner   '
             20 20 42 65 67 69 6E
             6E 65 72 20 20 20
                                     23 
      00A247 20 20 15 20 20 20 20    24         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A25B 20 20 20 20 20 20 20    25         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
                                     26 
      00A26F 20 20 15 20 20 20 20    27         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A283 20 20 50 75 7A 7A 6C    28         .ascii  '  Puzzle    00001   '
             65 20 20 20 20 30 30
             30 30 31 20 20 20
                                     29 
      00A297 20 20 15 20 20 20 20    30         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A2AB 20 20 20 20 20 20 20    31         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
                                     32 
      00A2BF 20 20 15 20 20 20 20    33         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x0a,0x04,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 0A 04 20 20 20
      00A2D3 20 20 4D 6F 76 65 73    34         .ascii  '  Moves     00000   '
             20 20 20 20 20 30 30
             30 30 30 20 20 20
                                     35 
      00A2E7 20 20 15 20 20 20 20    36         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20 20 20 20 20
      00A2FB 20 20 20 20 20 20 20    37         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
      00A30F 20 20 15 20 20 20 20    38         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 20 20 20 20 20
      00A323 20 20 20 20 20 20 20    39         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
                                     40 
      00A337 20 20 15 20 20 20 20    41         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x97,0x04,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 97 04 20 20 20
      00A34B 20 20 20 20 20 20 20    42         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
      00A35F 20 20 15 20 20 20 20    43         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A373 20 20 20 20 20 20 20    44         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
      00A387 20 20 15 20 20 20 20    45         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A39B 20 20 43 6F 64 65 2F    46         .ascii  '  Code/Reset/Quit   '
             52 65 73 65 74 2F 51
             75 69 74 20 20 20
      00A3AF 20 20 15 20 20 20 20    47         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A3C3 20 20 20 20 20 20 20    48         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
      00A3D7 20 20 15 20 20 20 20    49         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A3EB 20 E0 E4 E4 E4 E4 E4    50         .ascii  ' \340\344\344\344\344\344\344\344\344\344\344\344\344\344\344\344\341  '
             E4 E4 E4 E4 E4 E4 E4
             E4 E4 E4 E1 20 20
      00A3FF 20 20 15 20 20 20 20    51         .db     0x20,0x20,0x15,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x95,0x20,0x20,0x20,0x20
             20 20 20 20 20 20 20
             20 95 20 20 20 20
      00A413 20 E5 20 20 20 20 20    52         .ascii  ' \345               \345  '
             20 20 20 20 20 20 20
             20 20 20 E5 20 20
                                     53         ;FIELD bottom line
      00A427 20 20 0D 0C 0C 0C 0C    54         .db     0x20,0x20,0x0d,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0c,0x0e,0x20,0x20,0x20,0x20
             0C 0C 0C 0C 0C 0C 0C
             0C 0E 20 20 20 20
      00A43B 20 E2 E4 E4 E4 E4 E4    55         .ascii  ' \342\344\344\344\344\344\344\344\344\344\344\344\344\344\344\344\343  '
             E4 E4 E4 E4 E4 E4 E4
             E4 E4 E4 E3 20 20
                                     56 
      00A44F 20 03 03 03 03 03 03    57         .db     0x20,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x20,0x20,0x20
             03 03 03 03 03 03 03
             03 03 03 20 20 20
      00A463 20 20 20 20 20 20 20    58         .ascii  '                    '
             20 20 20 20 20 20 20
             20 20 20 20 20 20
                                     59 
      00A477                        147         DECOMP
                                      1 
      000468                          2 window_list:
      00A477 00 F8                    3         .dw BWS+OFFSET_COLOR
      00A479 28 05                    4         .db SCREEN_WIDTH,5
      00A47B 0D                       5         .db BG_BLUE|FG_CYAN
                                      6 
      00A47C C8 F8                    7         .dw BWS+5*SCREEN_WIDTH+OFFSET_COLOR
      00A47E 28 03                    8         .db SCREEN_WIDTH,3
      00A480 05                       9         .db BG_BLACK|FG_CYAN
                                     10 
      00A481 40 F9                   11         .dw BWS+8*SCREEN_WIDTH+OFFSET_COLOR
      00A483 28 10                   12         .db SCREEN_WIDTH,16
      00A485 0E                      13         .db BG_BLUE|FG_YELLOW
                                     14         
      00A486 69 F9                   15         .dw POSITION_FIELD-SCREEN_WIDTH-2+OFFSET_COLOR
      00A488 10 0E                   16         .db FIELD_SIZE+4,FIELD_SIZE+2
      00A48A 33                      17         .db BG_YELLOW|FG_MAGENTA
                                     18         
      00A48B 7D F9                   19         .dw POSITION_LEVEL-8+OFFSET_COLOR
      00A48D 11 05                   20         .db 17,5
      00A48F 0E                      21         .db BG_BLUE|FG_YELLOW
                                     22         
      00A490 45 FA                   23         .dw POSITION_LEVEL-8+5*SCREEN_WIDTH+OFFSET_COLOR
      00A492 11 04                   24         .db 17,4
      00A494 0A                      25         .db BG_BLUE|FG_RED
                                     26         
      00A495 E5 FA                   27         .dw POSITION_INPUT_LINE-3*SCREEN_WIDTH-1+OFFSET_COLOR
      00A497 13 07                   28         .db 19,7
      00A499 0D                      29         .db BG_BLUE|FG_CYAN
                                     30 
      00A49A 5E FB                   31         .dw POSITION_INPUT_LINE+OFFSET_COLOR
      00A49C 0F 01                   32         .db 15,1
      00A49E 0A                      33         .db BG_BLUE|FG_RED
                                     34 
                           000008    35 window_list_size = 8
                                     36 
      00A49F                         37 decomp:
      00A49F 11 00 F0         [10]   38         ld      de,#BWS
      00A4A2 01 C0 03         [10]   39         ld      bc,#SCREEN_WIDTH*SCREEN_HEIGHT
      00A4A5 ED B0            [21]   40         ldir
                                     41 
      00A4A7 21 77 A4         [10]   42         ld      hl,#window_list
      00A4AA 06 08            [ 7]   43         ld      b,#window_list_size
      00A4AC                         44 next_window:
      00A4AC C5               [11]   45         push    bc
      00A4AD 5E               [ 7]   46         ld      e,(hl)
      00A4AE 23               [ 6]   47         inc     hl
      00A4AF 56               [ 7]   48         ld      d,(hl)
      00A4B0 23               [ 6]   49         inc     hl
      00A4B1 4E               [ 7]   50         ld      c,(hl)
      00A4B2 23               [ 6]   51         inc     hl
      00A4B3 46               [ 7]   52         ld      b,(hl)
      00A4B4 23               [ 6]   53         inc     hl
      00A4B5 7E               [ 7]   54         ld      a,(hl)
      00A4B6 23               [ 6]   55         inc     hl
      00A4B7 EB               [ 4]   56         ex      de,hl
      00A4B8 CD B5 DB         [17]   57         call    color_window
      00A4BB EB               [ 4]   58         ex      de,hl
      00A4BC C1               [10]   59         pop     bc
      00A4BD 10 ED            [13]   60         djnz    next_window
      00A4BF 3E 0E            [ 7]   61         ld      a,#BG_BLUE|FG_YELLOW
      00A4C1 21 E6 FA         [10]   62         ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+22
      00A4C4 77               [ 7]   63         ld      (hl),a
      00A4C5 21 EB FA         [10]   64         ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+27
      00A4C8 77               [ 7]   65         ld      (hl),a
      00A4C9 21 F1 FA         [10]   66         ld      hl,#BWS+OFFSET_COLOR+18*SCREEN_WIDTH+33
      00A4CC 77               [ 7]   67         ld      (hl),a
      00A4CD C9               [10]   68         ret
      00A4CE                        148 codeinp:
      00A4CE CD E2 A9         [17]  149         call    prnst0
      00A4D1                        150 txt_prompt:
      00A4D1 3E 00                  151         .asciz  '>'
      00A4D3                        152 ret_from_prnst0:
      00A4D3 11 78 80         [10]  153         ld      de,#CONBU
      00A4D6 3E 0A            [ 7]  154         ld      a,#10
      00A4D8 12               [ 7]  155         ld      (de),a
      0004CA                        156         INPUT_LINE
      00A4D9 CD F7 DB         [17]    1         call    inline
      00A4DC DA 57 A5         [10]  157         jp      c,reset
      00A4DF 13               [ 6]  158         inc     de
      00A4E0 1A               [ 7]  159         ld      a,(de)
      00A4E1 FE 00            [ 7]  160         cp      #EMPTY
      00A4E3 CA 57 A5         [10]  161         jp      z,reset
      00A4E6 21 7A 80         [10]  162         ld      hl,#CONBU+2
      00A4E9 7E               [ 7]  163         ld      a,(hl)
      00A4EA FE 76            [ 7]  164         cp      #'v'
      00A4EC 20 0B            [12]  165         jr      nz,sp0
      00A4EE 23               [ 6]  166         inc     hl
      00A4EF 7E               [ 7]  167         ld      a,(hl)
      00A4F0 FE 70            [ 7]  168         cp      #'p'
      00A4F2 20 05            [12]  169         jr      nz,sp0
      00A4F4 32 01 80         [13]  170         ld      (hidden),a
      00A4F7 18 D5            [12]  171         jr      codeinp
      00A4F9                        172 sp0:
      00A4F9 3A 01 80         [13]  173         ld      a,(hidden)
      00A4FC FE 70            [ 7]  174         cp      #'p'
      00A4FE 20 1C            [12]  175         jr      nz,sp1
      00A500 21 7A 80         [10]  176         ld      hl,#CONBU+2
      00A503 7E               [ 7]  177         ld      a,(hl)
      00A504 FE 30            [ 7]  178         cp      #'0'
      00A506 20 14            [12]  179         jr      nz,sp1
      00A508 CD 00 AA         [17]  180         call    atoh
      00A50B 38 3A            [12]  181         jr      c,s2
      00A50D 4F               [ 4]  182         ld      c,a
      00A50E CD 00 AA         [17]  183         call    atoh
      00A511 38 34            [12]  184         jr      c,s2
      00A513 57               [ 4]  185         ld      d,a
      00A514 CD 00 AA         [17]  186         call    atoh
      00A517 38 2E            [12]  187         jr      c,s2
      00A519 5F               [ 4]  188         ld      e,a
      00A51A 18 08            [12]  189         jr      sp2
      00A51C                        190 sp1:
      00A51C 21 7A 80         [10]  191         ld      hl,#CONBU+2
      00A51F CD DE A7         [17]  192         call    decode
      00A522 38 23            [12]  193         jr      c,s2
      00A524                        194 sp2:
      00A524 79               [ 4]  195         ld      a,c
      00A525 FE 04            [ 7]  196         cp      #MAX_LEVEL+1
      00A527 30 1E            [12]  197         jr      nc,s2
      00A529 41               [ 4]  198         ld      b,c
      00A52A 04               [ 4]  199         inc     b
      00A52B 21 11 AA         [10]  200         ld      hl,#lvl0cnt-2
      00A52E                        201 sp2a:
      00A52E 23               [ 6]  202         inc     hl
      00A52F 23               [ 6]  203         inc     hl
      00A530 10 FC            [13]  204         djnz    sp2a
      00A532 7E               [ 7]  205         ld      a,(hl)
      00A533 23               [ 6]  206         inc     hl
      00A534 66               [ 7]  207         ld      h,(hl)
      00A535 6F               [ 4]  208         ld      l,a
      00A536 B7               [ 4]  209         or      a
      00A537 2B               [ 6]  210         dec     hl
      00A538 ED 52            [15]  211         sbc     hl,de
      00A53A 38 0B            [12]  212         jr      c,s2
      00A53C 79               [ 4]  213         ld      a,c
      00A53D 32 27 80         [13]  214         ld      (level),a
      00A540 ED 53 28 80      [20]  215         ld      (puzzle),de
      00A544 C3 57 A5         [10]  216         jp      reset
      00A547                        217 s2:
      000538                        218         SET_CURSOR POSITION_INPUT_LINE
      00A547 21 5E F3         [10]    1         ld      hl,#POSITION_INPUT_LINE
      00A54A 22 76 80         [16]    2         ld      (CURS),hl
      00A54D CD E2 A9         [17]  219         call    prnst0
      000541                        220         TXT_ERROR
      00A550 45 72 72 00              1         .asciz  'Err'
      00A554 C3 CE A4         [10]  221         jp      codeinp
      00A557                        222 reset:
      00A557 3A 27 80         [13]  223         ld      a,(level)
      00A55A 4F               [ 4]  224         ld      c,a
      00A55B ED 5B 28 80      [20]  225         ld      de,(puzzle)
      00A55F CD 0C A8         [17]  226         call    getpuzzle
      00A562 CD 2D A8         [17]  227         call    unpack
      00A565 21 FF FF         [10]  228         ld      hl,#-1
      00A568 22 2A 80         [16]  229         ld      (moves),hl
      00A56B 21 31 80         [10]  230         ld      hl,#stones
      00A56E 22 2E 80         [16]  231         ld      (custone),hl
      00A571 CD 6D A8         [17]  232         call    show_mv
      00A574 3A 27 80         [13]  233         ld      a,(level)
      00A577 47               [ 4]  234         ld      b,a
      00A578 04               [ 4]  235         inc     b
      00A579 11 08 00         [10]  236         ld      de,#Level0_size
      00A57C 21 8D A5         [10]  237         ld      hl,#Level0-Level0_size
      00A57F                        238 res1:
      00A57F 19               [11]  239         add     hl,de
      00A580 10 FD            [13]  240         djnz    res1
      00A582 01 08 00         [10]  241         ld      bc,#Level0_size
      00A585 11 85 F1         [10]  242         ld      de,#POSITION_LEVEL
      00A588 ED B0            [21]  243         ldir
      00A58A 11 D8 F1         [10]  244         ld      de,#POSITION_PUZZEL
      00A58D 2A 28 80         [16]  245         ld      hl,(puzzle)
      00A590 23               [ 6]  246         inc     hl
      00A591 CD B4 A9         [17]  247         call    hlkon
      00A594 C9               [10]  248         ret
      00A595                        249 Level0:
      00A595 42 65 67 69 6E 6E 65   250         .ascii  'Beginner'
             72
      00A59D                        251 Level1:
      00A59D 49 6E 74 65 72 6D 65   252         .ascii  'Intermed'
             64
      00A5A5                        253 Level2:
      00A5A5 41 64 76 61 6E 63 65   254         .ascii  'Advanced'
             64
      00A5AD                        255 Level3:
      00A5AD 20 20 45 78 70 65 72   256         .ascii  '  Expert'
             74
      00A5B5                        257 solved:
      00A5B5 21 D7 A5         [10]  258         ld      hl,#geschafft
      00A5B8 11 96 F2         [10]  259         ld      de,#POSITION_SUCCESS
      00A5BB 01 0F 00         [10]  260         ld      bc,#geschafft_size
      00A5BE ED B0            [21]  261         ldir
      0005B1                        262         UP_INCH
      00A5C0 CD 98 DB         [17]    1         call    inch
      00A5C3 CD 7F A7         [17]  263         call    nextpuzzle
      00A5C6 CD 57 A5         [17]  264         call    reset
                                    265         ;       löscht das aktuelle Fenster, sprich das Kleine!
                                    266         ;       und, das ist wichtig, setzt den Cursor wieder auf den Anfang
      0005BA                        267         ROLL_SMALL_WIN
      00A5C9 CD DA DB         [17]    1         call    cls_small_window
      00A5CC 3A 27 80         [13]  268         ld      a,(level)
      00A5CF 4F               [ 4]  269         ld      c,a
      00A5D0 ED 5B 28 80      [20]  270         ld      de,(puzzle)
      00A5D4 C3 B1 A7         [10]  271         jp      encode
      00A5D7                        272 geschafft:
      00A5D7 2A 20 53 20 4F 20 4C   273         .ascii  '* S O L V E D *'
             20 56 20 45 20 44 20
             2A
      00A5E6                        274 cu_init:
      00A5E6 FD 2A 2E 80      [20]  275         ld      iy,(custone)
      00A5EA FD 5E 00         [19]  276         ld      e,0(iy)
      00A5ED FD 56 01         [19]  277         ld      d,1(iy)
      00A5F0 0E FF            [ 7]  278         ld      c,#MINIMUM_DISTANCE
      00A5F2 D9               [ 4]  279         exx
      00A5F3 01 04 00         [10]  280         ld      bc,#STONE_RECT_size
      00A5F6 D9               [ 4]  281         exx
      00A5F7 DD 21 31 80      [14]  282         ld      ix,#stones
      00A5FB 3A 02 80         [13]  283         ld      a,(toggled)
      00A5FE B7               [ 4]  284         or      a
      00A5FF C9               [10]  285         ret
      00A600                        286 cu_up:
      00A600 CD E6 A5         [17]  287         call    cu_init
      00A603 C2 D5 A6         [10]  288         jp      nz,move_up
      00A606                        289 cu_up1:
      00A606 DD 7E 01         [19]  290         ld      a,1(ix)
      00A609 BA               [ 4]  291         cp      d
      00A60A DC 80 A6         [17]  292         call    c,calc_distance
      00A60D D9               [ 4]  293         exx
      00A60E DD 09            [15]  294         add     ix,bc
      00A610 D9               [ 4]  295         exx
      00A611 DD 7E 00         [19]  296         ld      a,0(ix)
      00A614 FE FF            [ 7]  297         cp      #FIELD_END
      00A616 20 EE            [12]  298         jr      nz,cu_up1
      00A618 FD 22 2E 80      [20]  299         ld      (custone),iy
      00A61C CD 7A A8         [17]  300         call    show
      00A61F C9               [10]  301         ret
      00A620                        302 cu_down:
      00A620 CD E6 A5         [17]  303         call    cu_init
      00A623 C2 F8 A6         [10]  304         jp      nz,move_down
      00A626                        305 cu_down1:
      00A626 7A               [ 4]  306         ld      a,d
      00A627 DD BE 01         [19]  307         cp      1(ix)
      00A62A DC 80 A6         [17]  308         call    c,calc_distance
      00A62D D9               [ 4]  309         exx
      00A62E DD 09            [15]  310         add     ix,bc
      00A630 D9               [ 4]  311         exx
      00A631 DD 7E 00         [19]  312         ld      a,0(ix)
      00A634 FE FF            [ 7]  313         cp      #FIELD_END
      00A636 20 EE            [12]  314         jr      nz,cu_down1
      00A638 FD 22 2E 80      [20]  315         ld      (custone),iy
      00A63C CD 7A A8         [17]  316         call    show
      00A63F C9               [10]  317         ret
      00A640                        318 cu_left:
      00A640 CD E6 A5         [17]  319         call    cu_init
      00A643 C2 1E A7         [10]  320         jp      nz,move_left
      00A646                        321 cu_left1:
      00A646 DD 7E 00         [19]  322         ld      a,0(ix)
      00A649 BB               [ 4]  323         cp      e
      00A64A DC 80 A6         [17]  324         call    c,calc_distance
      00A64D D9               [ 4]  325         exx
      00A64E DD 09            [15]  326         add     ix,bc
      00A650 D9               [ 4]  327         exx
      00A651 DD 7E 00         [19]  328         ld      a,0(ix)
      00A654 FE FF            [ 7]  329         cp      #FIELD_END
      00A656 20 EE            [12]  330         jr      nz,cu_left1
      00A658 FD 22 2E 80      [20]  331         ld      (custone),iy
      00A65C CD 7A A8         [17]  332         call    show
      00A65F C9               [10]  333         ret
      00A660                        334 cu_right:
      00A660 CD E6 A5         [17]  335         call    cu_init
      00A663 C2 41 A7         [10]  336         jp      nz,move_right
      00A666                        337 cu_right1:
      00A666 7B               [ 4]  338         ld      a,e
      00A667 DD BE 00         [19]  339         cp      0(ix)
      00A66A DC 80 A6         [17]  340         call    c,calc_distance
      00A66D D9               [ 4]  341         exx
      00A66E DD 09            [15]  342         add     ix,bc
      00A670 D9               [ 4]  343         exx
      00A671 DD 7E 00         [19]  344         ld      a,0(ix)
      00A674 FE FF            [ 7]  345         cp      #FIELD_END
      00A676 20 EE            [12]  346         jr      nz,cu_right1
      00A678 FD 22 2E 80      [20]  347         ld      (custone),iy
      00A67C CD 7A A8         [17]  348         call    show
      00A67F C9               [10]  349         ret
      00A680                        350 calc_distance:
      00A680 C5               [11]  351         push    bc
      00A681 DD 7E 00         [19]  352         ld      a,0(ix)
      00A684 43               [ 4]  353         ld      b,e
      00A685 90               [ 4]  354         sub     b
      00A686 F2 8B A6         [10]  355         jp      p,calc_distance1
      00A689 ED 44            [ 8]  356         neg
      00A68B                        357 calc_distance1:
      00A68B 21 B2 A6         [10]  358         ld      hl,#qtab
      00A68E 4F               [ 4]  359         ld      c,a
      00A68F 06 00            [ 7]  360         ld      b,#0
      00A691 09               [11]  361         add     hl,bc
      00A692 7E               [ 7]  362         ld      a,(hl)
      00A693 F5               [11]  363         push    af
      00A694 DD 7E 01         [19]  364         ld      a,1(ix)
      00A697 42               [ 4]  365         ld      b,d
      00A698 90               [ 4]  366         sub     b
      00A699 F2 9E A6         [10]  367         jp      p,calc_distance2
      00A69C ED 44            [ 8]  368         neg
      00A69E                        369 calc_distance2:
      00A69E 21 B2 A6         [10]  370         ld      hl,#qtab
      00A6A1 4F               [ 4]  371         ld      c,a
      00A6A2 06 00            [ 7]  372         ld      b,#0
      00A6A4 09               [11]  373         add     hl,bc
      00A6A5 7E               [ 7]  374         ld      a,(hl)
      00A6A6 C1               [10]  375         pop     bc
      00A6A7 80               [ 4]  376         add     a,b
      00A6A8 C1               [10]  377         pop     bc
      00A6A9 C8               [11]  378         ret     z
      00A6AA B9               [ 4]  379         cp      c
      00A6AB D0               [11]  380         ret     nc
      00A6AC 4F               [ 4]  381         ld      c,a
      00A6AD DD E5            [15]  382         push    ix
      00A6AF FD E1            [14]  383         pop     iy
      00A6B1 C9               [10]  384         ret
      00A6B2                        385 qtab:
      00A6B2 00 01 04 09 10 19      386         .db     0x00,0x01,0x04,0x09,0x10,0x19
                                    387 ; unchecked data source
      00A6B8 C9                     388         .db     0xc9
      00A6B9                        389 next_stone:
      00A6B9 DD 2A 2E 80      [20]  390         ld      ix,(custone)
      00A6BD 01 04 00         [10]  391         ld      bc,#STONE_RECT_size
      00A6C0 DD 09            [15]  392         add     ix,bc
      00A6C2 DD 7E 00         [19]  393         ld      a,0(ix)
      00A6C5 FE FF            [ 7]  394         cp      #FIELD_END
      00A6C7 20 04            [12]  395         jr      nz,next_stone1
      00A6C9 DD 21 31 80      [14]  396         ld      ix,#stones
      00A6CD                        397 next_stone1:
      00A6CD DD 22 2E 80      [20]  398         ld      (custone),ix
      00A6D1 CD 7A A8         [17]  399         call    show
      00A6D4 C9               [10]  400         ret
      00A6D5                        401 move_up:
      00A6D5 DD 2A 2E 80      [20]  402         ld      ix,(custone)
      00A6D9 DD 7E 02         [19]  403         ld      a,2(ix)
      00A6DC FE 00            [ 7]  404         cp      #HORIZONTAL
      00A6DE C0               [11]  405         ret     nz
      00A6DF DD 7E 01         [19]  406         ld      a,1(ix)
      00A6E2 FE 00            [ 7]  407         cp      #0
      00A6E4 C8               [11]  408         ret     z
      00A6E5 3D               [ 4]  409         dec     a
      00A6E6 DD 5E 00         [19]  410         ld      e,0(ix)
      00A6E9 57               [ 4]  411         ld      d,a
      00A6EA CD DD A8         [17]  412         call    calc_pos0
      00A6ED 7E               [ 7]  413         ld      a,(hl)
      00A6EE FE 20            [ 7]  414         cp      #' '
      00A6F0 C0               [11]  415         ret     nz
      00A6F1 DD 35 01         [23]  416         dec     1(ix)
      00A6F4 CD 6D A8         [17]  417         call    show_mv
      00A6F7 C9               [10]  418         ret
      00A6F8                        419 move_down:
      00A6F8 DD 2A 2E 80      [20]  420         ld      ix,(custone)
      00A6FC DD 7E 02         [19]  421         ld      a,2(ix)
      00A6FF FE 00            [ 7]  422         cp      #HORIZONTAL
      00A701 C0               [11]  423         ret     nz
      00A702 DD 7E 01         [19]  424         ld      a,1(ix)
      00A705 DD 46 03         [19]  425         ld      b,3(ix)
      00A708 80               [ 4]  426         add     a,b
      00A709 FE 06            [ 7]  427         cp      #FIELD_SIZE/2
      00A70B D0               [11]  428         ret     nc
      00A70C DD 5E 00         [19]  429         ld      e,0(ix)
      00A70F 57               [ 4]  430         ld      d,a
      00A710 CD DD A8         [17]  431         call    calc_pos0
      00A713 7E               [ 7]  432         ld      a,(hl)
      00A714 FE 20            [ 7]  433         cp      #' '
      00A716 C0               [11]  434         ret     nz
      00A717 DD 34 01         [23]  435         inc     1(ix)
      00A71A CD 6D A8         [17]  436         call    show_mv
      00A71D C9               [10]  437         ret
      00A71E                        438 move_left:
      00A71E DD 2A 2E 80      [20]  439         ld      ix,(custone)
      00A722 DD 7E 02         [19]  440         ld      a,2(ix)
      00A725 FE 01            [ 7]  441         cp      #VERTICAL
      00A727 C0               [11]  442         ret     nz
      00A728 DD 7E 00         [19]  443         ld      a,0(ix)
      00A72B FE 00            [ 7]  444         cp      #0
      00A72D C8               [11]  445         ret     z
      00A72E 3D               [ 4]  446         dec     a
      00A72F 5F               [ 4]  447         ld      e,a
      00A730 DD 56 01         [19]  448         ld      d,1(ix)
      00A733 CD DD A8         [17]  449         call    calc_pos0
      00A736 7E               [ 7]  450         ld      a,(hl)
      00A737 FE 20            [ 7]  451         cp      #' '
      00A739 C0               [11]  452         ret     nz
      00A73A DD 35 00         [23]  453         dec     0(ix)
      00A73D CD 6D A8         [17]  454         call    show_mv
      00A740 C9               [10]  455         ret
      00A741                        456 move_right:
      00A741 21 31 80         [10]  457         ld      hl,#stones
      00A744 ED 5B 2E 80      [20]  458         ld      de,(custone)
      00A748 B7               [ 4]  459         or      a
      00A749 ED 52            [15]  460         sbc     hl,de
      00A74B 20 0C            [12]  461         jr      nz,mv_right0
      00A74D 2A 31 80         [16]  462         ld      hl,(stones)
      00A750 11 04 02         [10]  463         ld      de,#POS_END_42
      00A753 B7               [ 4]  464         or      a
      00A754 ED 52            [15]  465         sbc     hl,de
      00A756 CA B5 A5         [10]  466         jp      z,solved
      00A759                        467 mv_right0:
      00A759 DD 2A 2E 80      [20]  468         ld      ix,(custone)
      00A75D DD 7E 02         [19]  469         ld      a,2(ix)
      00A760 FE 01            [ 7]  470         cp      #VERTICAL
      00A762 C0               [11]  471         ret     nz
      00A763 DD 7E 00         [19]  472         ld      a,0(ix)
      00A766 DD 46 03         [19]  473         ld      b,3(ix)
      00A769 80               [ 4]  474         add     a,b
      00A76A FE 06            [ 7]  475         cp      #FIELD_SIZE/2
      00A76C D0               [11]  476         ret     nc
      00A76D 5F               [ 4]  477         ld      e,a
      00A76E DD 56 01         [19]  478         ld      d,1(ix)
      00A771 CD DD A8         [17]  479         call    calc_pos0
      00A774 7E               [ 7]  480         ld      a,(hl)
      00A775 FE 20            [ 7]  481         cp      #' '
      00A777 C0               [11]  482         ret     nz
      00A778 DD 34 00         [23]  483         inc     0(ix)
      00A77B CD 6D A8         [17]  484         call    show_mv
      00A77E C9               [10]  485         ret
      00A77F                        486 nextpuzzle:
      00A77F 3A 27 80         [13]  487         ld      a,(level)
      00A782 47               [ 4]  488         ld      b,a
      00A783 04               [ 4]  489         inc     b
      00A784 21 11 AA         [10]  490         ld      hl,#lvl0cnt-2
      00A787                        491 np1:
      00A787 23               [ 6]  492         inc     hl
      00A788 23               [ 6]  493         inc     hl
      00A789 10 FC            [13]  494         djnz    np1
      00A78B 7E               [ 7]  495         ld      a,(hl)
      00A78C 23               [ 6]  496         inc     hl
      00A78D 66               [ 7]  497         ld      h,(hl)
      00A78E 6F               [ 4]  498         ld      l,a
      00A78F 2B               [ 6]  499         dec     hl
      00A790 ED 5B 28 80      [20]  500         ld      de,(puzzle)
      00A794 13               [ 6]  501         inc     de
      00A795 B7               [ 4]  502         or      a
      00A796 ED 52            [15]  503         sbc     hl,de
      00A798 38 05            [12]  504         jr      c,np2
      00A79A ED 53 28 80      [20]  505         ld      (puzzle),de
      00A79E C9               [10]  506         ret
      00A79F                        507 np2:
      00A79F 3A 27 80         [13]  508         ld      a,(level)
      00A7A2 FE 03            [ 7]  509         cp      #MAX_LEVEL
      00A7A4 C8               [11]  510         ret     z
      00A7A5 3C               [ 4]  511         inc     a
      00A7A6 32 27 80         [13]  512         ld      (level),a
      00A7A9 11 00 00         [10]  513         ld      de,#0
      00A7AC ED 53 28 80      [20]  514         ld      (puzzle),de
      00A7B0 C9               [10]  515         ret
      00A7B1                        516 encode:
      00A7B1 ED 5F            [ 9]  517         ld      a,r
      00A7B3 E6 1C            [ 7]  518         and     #MASK_LEVEL_CODE
      00A7B5 81               [ 4]  519         add     a,c
      00A7B6 C6 41            [ 7]  520         add     a,#'A'
      00A7B8 FE 5B            [ 7]  521         cp      #'Z'+1
      00A7BA 30 F5            [12]  522         jr      nc,encode
      00A7BC 67               [ 4]  523         ld      h,a
      0007AE                        524         CALL_OUTA
      00A7BD CD 8D DB         [17]    1         call    putchar
      00A7C0 7C               [ 4]  525         ld      a,h
      00A7C1 87               [ 4]  526         add     a,a
      00A7C2 82               [ 4]  527         add     a,d
      00A7C3 83               [ 4]  528         add     a,e
      00A7C4 C6 8E            [ 7]  529         add     a,#142
      00A7C6 CD 9D A9         [17]  530         call    outhx
      00A7C9 62               [ 4]  531         ld      h,d
      00A7CA 6B               [ 4]  532         ld      l,e
      00A7CB 29               [11]  533         add     hl,hl
      00A7CC 29               [11]  534         add     hl,hl
      00A7CD ED 5F            [ 9]  535         ld      a,r
      00A7CF 87               [ 4]  536         add     a,a
      00A7D0 E6 C0            [ 7]  537         and     #MASK_UPPER_BITS
      00A7D2 84               [ 4]  538         add     a,h
      00A7D3 67               [ 4]  539         ld      h,a
      00A7D4 ED 5F            [ 9]  540         ld      a,r
      00A7D6 E6 03            [ 7]  541         and     #MASK_LOWER_BITS
      00A7D8 85               [ 4]  542         add     a,l
      00A7D9 6F               [ 4]  543         ld      l,a
      00A7DA CD 98 A9         [17]  544         call    OUTHL
      00A7DD C9               [10]  545         ret
      00A7DE                        546 decode:
      00A7DE 4E               [ 7]  547         ld      c,(hl)
      00A7DF 23               [ 6]  548         inc     hl
      00A7E0 CD 00 AA         [17]  549         call    atoh
      00A7E3 D8               [11]  550         ret     c
      00A7E4 32 00 80         [13]  551         ld      (prfsum),a
      00A7E7 CD 00 AA         [17]  552         call    atoh
      00A7EA D8               [11]  553         ret     c
      00A7EB E6 3F            [ 7]  554         and     #MASK_CAPITAL_LETTERS
      00A7ED 57               [ 4]  555         ld      d,a
      00A7EE CD 00 AA         [17]  556         call    atoh
      00A7F1 D8               [11]  557         ret     c
      00A7F2 5F               [ 4]  558         ld      e,a
      00A7F3 CB 3A            [ 8]  559         srl     d
      00A7F5 CB 1B            [ 8]  560         rr      e
      00A7F7 CB 3A            [ 8]  561         srl     d
      00A7F9 CB 1B            [ 8]  562         rr      e
      00A7FB 79               [ 4]  563         ld      a,c
      00A7FC 87               [ 4]  564         add     a,a
      00A7FD 82               [ 4]  565         add     a,d
      00A7FE 83               [ 4]  566         add     a,e
      00A7FF C6 8E            [ 7]  567         add     a,#142
      00A801 21 00 80         [10]  568         ld      hl,#prfsum
      00A804 BE               [ 7]  569         cp      (hl)
      00A805 D8               [11]  570         ret     c
      00A806 79               [ 4]  571         ld      a,c
      00A807 3D               [ 4]  572         dec     a
      00A808 E6 03            [ 7]  573         and     #3
      00A80A 4F               [ 4]  574         ld      c,a
      00A80B C9               [10]  575         ret
      00A80C                        576 getpuzzle:
      00A80C 21 13 AA         [10]  577         ld      hl,#lvl0cnt
      00A80F                        578 gp2:
      00A80F 79               [ 4]  579         ld      a,c
      00A810 B7               [ 4]  580         or      a
      00A811 28 0D            [12]  581         jr      z,gp1
      00A813 7E               [ 7]  582         ld      a,(hl)
      00A814 23               [ 6]  583         inc     hl
      00A815 46               [ 7]  584         ld      b,(hl)
      00A816 23               [ 6]  585         inc     hl
      00A817 E5               [11]  586         push    hl
      00A818 6F               [ 4]  587         ld      l,a
      00A819 60               [ 4]  588         ld      h,b
      00A81A 19               [11]  589         add     hl,de
      00A81B EB               [ 4]  590         ex      de,hl
      00A81C E1               [10]  591         pop     hl
      00A81D 0D               [ 4]  592         dec     c
      00A81E 18 EF            [12]  593         jr      gp2
      00A820                        594 gp1:
      00A820 21 1B AA         [10]  595         ld      hl,#puzzles
      00A823                        596 gp3:
      00A823 7A               [ 4]  597         ld      a,d
      00A824 B3               [ 4]  598         or      e
      00A825 C8               [11]  599         ret     z
      00A826 3E FF            [ 7]  600         ld      a,#FIELD_END
      00A828 ED B1            [21]  601         cpir
      00A82A 1B               [ 6]  602         dec     de
      00A82B 18 F6            [12]  603         jr      gp3
      00A82D                        604 unpack:
      00A82D 22 2C 80         [16]  605         ld      (pptr),hl
      00A830 06 00            [ 7]  606         ld      b,#0
      00A832 11 31 80         [10]  607         ld      de,#stones
      00A835                        608 unp2:
      00A835 7E               [ 7]  609         ld      a,(hl)
      00A836 23               [ 6]  610         inc     hl
      00A837 FE FF            [ 7]  611         cp      #FIELD_END
      00A839 28 2E            [12]  612         jr      z,unp1
      00A83B 04               [ 4]  613         inc     b
      00A83C 4F               [ 4]  614         ld      c,a
      00A83D 3E 00            [ 7]  615         ld      a,#0
      00A83F CB 11            [ 8]  616         rl      c
      00A841 17               [ 4]  617         rla
      00A842 CB 11            [ 8]  618         rl      c
      00A844 17               [ 4]  619         rla
      00A845 CB 11            [ 8]  620         rl      c
      00A847 17               [ 4]  621         rla
      00A848 12               [ 7]  622         ld      (de),a
      00A849 13               [ 6]  623         inc     de
      00A84A 3E 00            [ 7]  624         ld      a,#0
      00A84C CB 11            [ 8]  625         rl      c
      00A84E 17               [ 4]  626         rla
      00A84F CB 11            [ 8]  627         rl      c
      00A851 17               [ 4]  628         rla
      00A852 CB 11            [ 8]  629         rl      c
      00A854 17               [ 4]  630         rla
      00A855 12               [ 7]  631         ld      (de),a
      00A856 13               [ 6]  632         inc     de
      00A857 3E 00            [ 7]  633         ld      a,#0
      00A859 CB 11            [ 8]  634         rl      c
      00A85B 17               [ 4]  635         rla
      00A85C 12               [ 7]  636         ld      (de),a
      00A85D 13               [ 6]  637         inc     de
      00A85E 3E 00            [ 7]  638         ld      a,#0
      00A860 CB 11            [ 8]  639         rl      c
      00A862 17               [ 4]  640         rla
      00A863 C6 02            [ 7]  641         add     a,#SIZE2
      00A865 12               [ 7]  642         ld      (de),a
      00A866 13               [ 6]  643         inc     de
      00A867 18 CC            [12]  644         jr      unp2
      00A869                        645 unp1:
      00A869 3E FF            [ 7]  646         ld      a,#FIELD_END
      00A86B 12               [ 7]  647         ld      (de),a
      00A86C C9               [10]  648         ret
      00A86D                        649 show_mv:
      00A86D 2A 2A 80         [16]  650         ld      hl,(moves)
      00A870 23               [ 6]  651         inc     hl
      00A871 22 2A 80         [16]  652         ld      (moves),hl
      00A874 11 28 F2         [10]  653         ld      de,#POSITION_MOVES
      00A877 CD B4 A9         [17]  654         call    hlkon
      00A87A                        655 show:
      00A87A 06 10            [ 7]  656         ld      b,#geschafft_size+1
      00A87C 3E 20            [ 7]  657         ld      a,#' '
      00A87E 21 96 F2         [10]  658         ld      hl,#POSITION_SUCCESS
      00A881                        659 show0:
      00A881 77               [ 7]  660         ld      (hl),a
      00A882 23               [ 6]  661         inc     hl
      00A883 10 FC            [13]  662         djnz    show0
      00A885 21 93 F1         [10]  663         ld      hl,#POSITION_FIELD
      00A888 11 1C 00         [10]  664         ld      de,#SCREEN_WIDTH-FIELD_SIZE
      00A88B 3E 20            [ 7]  665         ld      a,#' '
      00A88D 08               [ 4]  666         ex      af,af'
      00A88E 3E 33            [ 7]  667         ld      a,#FRAME_COLOR
      00A890 08               [ 4]  668         ex      af,af'
      00A891 0E 0C            [ 7]  669         ld      c,#FIELD_SIZE
      00A893                        670 show2:
      00A893 06 0C            [ 7]  671         ld      b,#FIELD_SIZE
      00A895                        672 show1:
      000886                        673         PUT_A_COLORED
      00A895 77               [ 7]    1         ld      (hl),a
      00A896 CB DC            [ 8]    2         set     3,h
      00A898 08               [ 4]    3         ex      af,af'
      00A899 77               [ 7]    4         ld      (hl),a
      00A89A 08               [ 4]    5         ex      af,af'
      00A89B CB 9C            [ 8]    6         res     3,h
      00A89D 23               [ 6]  674         inc     hl
      00A89E 10 F5            [13]  675         djnz    show1
      00A8A0 19               [11]  676         add     hl,de
      00A8A1 0D               [ 4]  677         dec     c
      00A8A2 20 EF            [12]  678         jr      nz,show2
      00A8A4 3E 00            [ 7]  679         ld      a,#0
      00A8A6 32 30 80         [13]  680         ld      (pcnt),a
      00A8A9 DD 21 31 80      [14]  681         ld      ix,#stones
      00A8AD                        682 show3:
      00A8AD CD 25 A9         [17]  683         call    show_stone
      00A8B0 11 04 00         [10]  684         ld      de,#STONE_RECT_size
      00A8B3 DD 19            [15]  685         add     ix,de
      00A8B5 DD 7E 00         [19]  686         ld      a,0(ix)
      00A8B8 FE FF            [ 7]  687         cp      #FIELD_END
      00A8BA 20 F1            [12]  688         jr      nz,show3
      00A8BC DD 2A 2E 80      [20]  689         ld      ix,(custone)
      00A8C0 CD D7 A8         [17]  690         call    calc_pos
      00A8C3 E5               [11]  691         push    hl
      00A8C4 21 31 80         [10]  692         ld      hl,#stones
      00A8C7 ED 5B 2E 80      [20]  693         ld      de,(custone)
      00A8CB B7               [ 4]  694         or      a
      00A8CC ED 52            [15]  695         sbc     hl,de
      00A8CE E1               [10]  696         pop     hl
      00A8CF 3E 1C            [ 7]  697         ld      a,#SELC
      00A8D1 20 02            [12]  698         jr      nz,showcu1
      00A8D3 3E 1C            [ 7]  699         ld      a,#SELCR
      00A8D5                        700 showcu1:
      00A8D5 77               [ 7]  701         ld      (hl),a
      00A8D6 C9               [10]  702         ret
      00A8D7                        703 calc_pos:
      00A8D7 DD 5E 00         [19]  704         ld      e,0(ix)
      00A8DA DD 56 01         [19]  705         ld      d,1(ix)
      00A8DD                        706 calc_pos0:
      00A8DD 21 43 F1         [10]  707         ld      hl,#POSITION_FIELD-2*SCREEN_WIDTH
      00A8E0 01 50 00         [10]  708         ld      bc,#2*SCREEN_WIDTH
      00A8E3 14               [ 4]  709         inc     d
      00A8E4                        710 calc_pos1:
      00A8E4 09               [11]  711         add     hl,bc
      00A8E5 15               [ 4]  712         dec     d
      00A8E6 20 FC            [12]  713         jr      nz,calc_pos1
      00A8E8 19               [11]  714         add     hl,de
      00A8E9 19               [11]  715         add     hl,de
      00A8EA C9               [10]  716         ret
      00A8EB                        717         STONE_GFX
      0008DC                          1 waag2:
      00A8EB 02 04                    2         .db     0x02,0x04
      00A8ED 83 83 83 14              3         .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
      00A8F1 80 80 80 15              4         .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
      00A8F5                          5 waag3:
      00A8F5 02 06                    6         .db     0x02,0x06
      00A8F7 83 83 83 83 83 14        7         .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
      00A8FD 80 80 80 80 80 15        8         .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
      00A903                          9 senk2:
      00A903 04 02                   10         .db     0x04,0x02
      00A905 83 14                   11         .db     TOP_LEFT,TOP_RIGHT
      00A907 80 15                   12         .db     LEFT,RIGHT
      00A909 80 15                   13         .db     LEFT,RIGHT
      00A90B 80 15                   14         .db     BOTTOM_LEFT,BOTTOM_RIGHT
      00A90D                         15 senk3:
      00A90D 06 02                   16         .db     0x06,0x02
      00A90F 83 14                   17         .db     TOP_LEFT,TOP_RIGHT
      00A911 80 15                   18         .db     LEFT,RIGHT
      00A913 80 15                   19         .db     LEFT,RIGHT
      00A915 80 15                   20         .db     LEFT,RIGHT
      00A917 80 15                   21         .db     LEFT,RIGHT
      00A919 80 15                   22         .db     BOTTOM_LEFT,BOTTOM_RIGHT
      00A91B                         23 red2:
      00A91B 02 04                   24         .db     0x02,0x04
      00A91D 83 83 83 14             25         .db     TOP_LEFT,TOP_MIDDLE,TOP_MIDDLE,TOP_RIGHT
      00A921 80 80 80 15             26         .db     BOTTOM_LEFT,BOTTOM_MIDDLE,BOTTOM_MIDDLE,BOTTOM_RIGHT
                                     27 
      00A925                        718 show_stone:
      00A925 CD D7 A8         [17]  719         call    calc_pos
      00A928 01 28 00         [10]  720         ld      bc,#SCREEN_WIDTH
      00A92B E5               [11]  721         push    hl
      00A92C D9               [ 4]  722         exx
      00A92D E1               [10]  723         pop     hl
      00091F                        724         SET_NORMAL_STONE_COLOR
      00A92E 3E 34            [ 7]    1         ld      a,#STONE_COLOR
      00A930 32 75 80         [13]    2         ld      (color_stone),a
      00A933 3A 30 80         [13]  725         ld      a,(pcnt)
      00A936 B7               [ 4]  726         or      a
      00A937 20 0E            [12]  727         jr      nz,show_stone1
      00A939 11 1B A9         [10]  728         ld      de,#red2
      00A93C 3C               [ 4]  729         inc     a
      00A93D 32 30 80         [13]  730         ld      (pcnt),a
      000931                        731         SET_RED_STONE_COLOR
      00A940 3E 33            [ 7]    1         ld      a,#RED_STONE_COLOR
      00A942 32 75 80         [13]    2         ld      (color_stone),a
      00A945 18 24            [12]  732         jr      draw
      00A947                        733 show_stone1:
      00A947 DD 7E 02         [19]  734         ld      a,2(ix)
      00A94A B7               [ 4]  735         or      a
      00A94B 28 0F            [12]  736         jr      z,senk
      00A94D DD 7E 03         [19]  737         ld      a,3(ix)
      00A950 FE 02            [ 7]  738         cp      #SIZE2
      00A952 11 EB A8         [10]  739         ld      de,#waag2
      00A955 28 14            [12]  740         jr      z,draw
      00A957 11 F5 A8         [10]  741         ld      de,#waag3
      00A95A 18 0F            [12]  742         jr      draw
      00A95C                        743 senk:
      00A95C DD 7E 03         [19]  744         ld      a,3(ix)
      00A95F FE 02            [ 7]  745         cp      #SIZE2
      00A961 11 03 A9         [10]  746         ld      de,#senk2
      00A964 28 05            [12]  747         jr      z,draw
      00A966 11 0D A9         [10]  748         ld      de,#senk3
      00A969 18 00            [12]  749         jr      draw
      00A96B                        750 draw:
      00A96B 1A               [ 7]  751         ld      a,(de)
      00A96C 4F               [ 4]  752         ld      c,a
      00A96D 13               [ 6]  753         inc     de
      00A96E 1A               [ 7]  754         ld      a,(de)
      00A96F 47               [ 4]  755         ld      b,a
      00A970 13               [ 6]  756         inc     de
      00A971                        757 draw2:
      00A971 C5               [11]  758         push    bc
      00A972                        759 draw1:
      00A972 1A               [ 7]  760         ld      a,(de)
      00A973 77               [ 7]  761         ld      (hl),a
      000965                        762         SET_STONE_COLOR
      00A974 CB DC            [ 8]    1         set     3,h
      00A976 3A 75 80         [13]    2         ld      a,(color_stone)
      00A979 77               [ 7]    3         ld      (hl),a
      00A97A CB 9C            [ 8]    4         res     3,h
      00A97C 23               [ 6]  763         inc     hl
      00A97D 13               [ 6]  764         inc     de
      00A97E 10 F2            [13]  765         djnz    draw1
      00A980 D9               [ 4]  766         exx
      00A981 09               [11]  767         add     hl,bc
      00A982 E5               [11]  768         push    hl
      00A983 D9               [ 4]  769         exx
      00A984 E1               [10]  770         pop     hl
      00A985 C1               [10]  771         pop     bc
      00A986 0D               [ 4]  772         dec     c
      00A987 20 E8            [12]  773         jr      nz,draw2
      00A989 C9               [10]  774         ret
                                    775 ;COOUT:
                                    776 ; unchecked data source
      00A98A 7E FE 20 30 02 3E 20   777         .db     0x7e,0xfe,0x20,0x30,0x02,0x3e,0x20,0xcd ;~~ 0.> M
             CD
      00A992 05 F3 23 10 F3 C9      778         .db     0x05,0xf3,0x23,0x10,0xf3,0xc9           ;.s#.sI
      00A998                        779 OUTHL:
      00A998 7C               [ 4]  780         ld      a,h
      00A999 CD 9D A9         [17]  781         call    outhx
      00A99C 7D               [ 4]  782         ld      a,l
      00A99D                        783 outhx:
      00A99D F5               [11]  784         push    af
      00A99E 07               [ 4]  785         rlca
      00A99F 07               [ 4]  786         rlca
      00A9A0 07               [ 4]  787         rlca
      00A9A1 07               [ 4]  788         rlca
      00A9A2 CD A6 A9         [17]  789         call    OUTH1
      00A9A5 F1               [10]  790         pop     af
      00A9A6                        791 OUTH1:
      00A9A6 E6 0F            [ 7]  792         and     #MASK_LOWER_NIBBLE
      00A9A8 C6 30            [ 7]  793         add     a,#'0'
      00A9AA FE 3A            [ 7]  794         cp      #'9'+1
      00A9AC 38 02            [12]  795         jr      c,OUTH2
      00A9AE C6 07            [ 7]  796         add     a,#'F'-'A'+2
      00A9B0                        797 OUTH2:
      0009A1                        798         CALL_OUTA
      00A9B0 CD 8D DB         [17]    1         call    putchar
      00A9B3 C9               [10]  799         ret
      00A9B4                        800 hlkon:
      00A9B4 C5               [11]  801         push    bc
      00A9B5 D5               [11]  802         push    de
      00A9B6 E5               [11]  803         push    hl
      00A9B7 01 F0 D8         [10]  804         ld      bc,#-10000
      00A9BA CD D7 A9         [17]  805         call    Num1
      00A9BD 01 18 FC         [10]  806         ld      bc,#-1000
      00A9C0 CD D7 A9         [17]  807         call    Num1
      00A9C3 01 9C FF         [10]  808         ld      bc,#-100
      00A9C6 CD D7 A9         [17]  809         call    Num1
      00A9C9 0E F6            [ 7]  810         ld      c,#-10
      00A9CB CD D7 A9         [17]  811         call    Num1
      00A9CE 0E FF            [ 7]  812         ld      c,#-1
      00A9D0 CD D7 A9         [17]  813         call    Num1
      00A9D3 E1               [10]  814         pop     hl
      00A9D4 D1               [10]  815         pop     de
      00A9D5 C1               [10]  816         pop     bc
      00A9D6 C9               [10]  817         ret
      00A9D7                        818 Num1:
      00A9D7 3E 2F            [ 7]  819         ld      a,#'0'-1
      00A9D9                        820 Num2:
      00A9D9 3C               [ 4]  821         inc     a
      00A9DA 09               [11]  822         add     hl,bc
      00A9DB 38 FC            [12]  823         jr      c,Num2
      00A9DD ED 42            [15]  824         sbc     hl,bc
      00A9DF 12               [ 7]  825         ld      (de),a
      00A9E0 13               [ 6]  826         inc     de
      00A9E1 C9               [10]  827         ret
      00A9E2                        828 prnst0:
      00A9E2 E3               [19]  829         ex      (sp),hl
      00A9E3                        830 PRS1:
      00A9E3 7E               [ 7]  831         ld      a,(hl)
      00A9E4 23               [ 6]  832         inc     hl
      00A9E5 B7               [ 4]  833         or      a
      00A9E6 28 05            [12]  834         jr      z,PRS2
      0009D9                        835         CALL_OUTA
      00A9E8 CD 8D DB         [17]    1         call    putchar
      00A9EB 18 F6            [12]  836         jr      PRS1
      00A9ED                        837 PRS2:
      00A9ED E3               [19]  838         ex      (sp),hl
      00A9EE C9               [10]  839         ret
      00A9EF                        840 CNVBN:
      00A9EF D6 30            [ 7]  841         sub     #'0'
      00A9F1 D8               [11]  842         ret     c
      00A9F2 FE 0A            [ 7]  843         cp      #10
      00A9F4 3F               [ 4]  844         ccf
      00A9F5 D0               [11]  845         ret     nc
      00A9F6 FE 11            [ 7]  846         cp      #'A'-'0'
      00A9F8 D8               [11]  847         ret     c
      00A9F9 FE 17            [ 7]  848         cp      #'F'-'0'+1
      00A9FB 3F               [ 4]  849         ccf
      00A9FC D8               [11]  850         ret     c
      00A9FD D6 07            [ 7]  851         sub     #'F'-'A'+2
      00A9FF C9               [10]  852         ret
      00AA00                        853 atoh:
      00AA00 7E               [ 7]  854         ld      a,(hl)
      00AA01 23               [ 6]  855         inc     hl
      00AA02 CD EF A9         [17]  856         call    CNVBN
      00AA05 D8               [11]  857         ret     c
      00AA06 17               [ 4]  858         rla
      00AA07 17               [ 4]  859         rla
      00AA08 17               [ 4]  860         rla
      00AA09 17               [ 4]  861         rla
      00AA0A 47               [ 4]  862         ld      b,a
      00AA0B 7E               [ 7]  863         ld      a,(hl)
      00AA0C 23               [ 6]  864         inc     hl
      00AA0D CD EF A9         [17]  865         call    CNVBN
      00AA10 D8               [11]  866         ret     c
      00AA11 80               [ 4]  867         add     a,b
      00AA12 C9               [10]  868         ret
      00AA13                        869 lvl0cnt:
      00AA13 90 01                  870         .db     0x90,0x01
      00AA15                        871 lvl1cnt:
      00AA15 2C 01                  872         .db     0x2c,0x01
      00AA17                        873 lvl2cnt:
      00AA17 C8 00                  874         .db     0xc8,0x00
      00AA19                        875 lvl3cnt:
      00AA19 64 00                  876         .db     0x64,0x00
      00AA1B                        877 puzzles:
      00AA1B 0A 03 8E 17 0C 45 90   878         .db     0x0a,0x03,0x8e,0x17,0x0c,0x45,0x90,0xa1 ;.....E.!
             A1
      00AA23 FF 0A 0E 56 30 44 4C   879         .db     0xff,0x0a,0x0e,0x56,0x30,0x44,0x4c,0x65 ;...V0DLe
             65
      00AA2B 85 FF 0A 22 62 13 00   880         .db     0x85,0xff,0x0a,0x22,0x62,0x13,0x00,0x44 ;..."b..D
             44
      00AA33 69 89 FF 0A 0E 52 56   881         .db     0x69,0x89,0xff,0x0a,0x0e,0x52,0x56,0x30 ;i....RV0
             30
      00AA3B 65 85 A4 FF 0A 82 4F   882         .db     0x65,0x85,0xa4,0xff,0x0a,0x82,0x4f,0x52 ;e.$...OR
             52
      00AA43 2C 41 90 A5 FF 0A 82   883         .db     0x2c,0x41,0x90,0xa5,0xff,0x0a,0x82,0x52 ;,A.%...R
             52
      00AA4B 2C 41 61 84 8C FF 0A   884         .db     0x2c,0x41,0x61,0x84,0x8c,0xff,0x0a,0x0f ;,Aa.....
             0F
      00AA53 52 56 00 30 60 68 A9   885         .db     0x52,0x56,0x00,0x30,0x60,0x68,0xa9,0xff ;RV.0`h).
             FF
      00AA5B 0A 27 8E 13 48 69 A4   886         .db     0x0a,0x27,0x8e,0x13,0x48,0x69,0xa4,0xb0 ;.'..Hi$0
             B0
      00AA63 FF 2A 03 26 86 6E 17   887         .db     0xff,0x2a,0x03,0x26,0x86,0x6e,0x17,0x05 ;.*.&.n..
             05
      00AA6B 4C 61 90 A9 FF 4A 23   888         .db     0x4c,0x61,0x90,0xa9,0xff,0x4a,0x23,0x27 ;La.).J#'
             27
      00AA73 4E 92 17 00 29 70 85   889         .db     0x4e,0x92,0x17,0x00,0x29,0x70,0x85,0xff ;N...)p..
             FF
      00AA7B 2A 0E 4E 73 76 04 30   890         .db     0x2a,0x0e,0x4e,0x73,0x76,0x04,0x30,0x50 ;*.Nsv.0P
             50
      00AA83 64 85 A4 FF 0A 42 27   891         .db     0x64,0x85,0xa4,0xff,0x0a,0x42,0x27,0x0e ;d.$..B'.
             0E
      00AA8B 57 00 30 69 84 8C A4   892         .db     0x57,0x00,0x30,0x69,0x84,0x8c,0xa4,0xac ;W.0i..$,
             AC
      00AA93 FF 4A 22 26 4E 16 76   893         .db     0xff,0x4a,0x22,0x26,0x4e,0x16,0x76,0x29 ;.J"&N.v)
             29
      00AA9B 50 60 85 AD FF 2A 02   894         .db     0x50,0x60,0x85,0xad,0xff,0x2a,0x02,0x66 ;P`.-.*.f
             66
      00AAA3 0E 12 16 56 04 40 68   895         .db     0x0e,0x12,0x16,0x56,0x04,0x40,0x68,0x88 ;...V.@h.
             88
      00AAAB 90 A0 A8 FF 0A 02 42   896         .db     0x90,0xa0,0xa8,0xff,0x0a,0x02,0x42,0x0f ;. (...B.
             0F
      00AAB3 92 44 69 80 88 A0 A8   897         .db     0x92,0x44,0x69,0x80,0x88,0xa0,0xa8,0xff ;.Di.. (.
             FF
      00AABB 0A 0E 52 10 30 40 48   898         .db     0x0a,0x0e,0x52,0x10,0x30,0x40,0x48,0x60 ;..R.0@H`
             60
      00AAC3 68 89 A4 FF 0A 22 62   899         .db     0x68,0x89,0xa4,0xff,0x0a,0x22,0x62,0x46 ;h.$.."bF
             46
      00AACB 8E 72 36 76 00 10 2C   900         .db     0x8e,0x72,0x36,0x76,0x00,0x10,0x2c,0x49 ;.r6v..,I
             49
      00AAD3 68 84 B0 FF 6A 06 0E   901         .db     0x68,0x84,0xb0,0xff,0x6a,0x06,0x0e,0x32 ;h.0.j..2
             32
      00AADB 92 36 10 45 6C A0 A8   902         .db     0x92,0x36,0x10,0x45,0x6c,0xa0,0xa8,0xff ;.6.El (.
             FF
      00AAE3 2A 22 82 0E 4E 72 77   903         .db     0x2a,0x22,0x82,0x0e,0x4e,0x72,0x77,0x50 ;*"..NrwP
             50
      00AAEB 60 88 A4 AC FF 6A 02   904         .db     0x60,0x88,0xa4,0xac,0xff,0x6a,0x02,0x42 ;`.$,.j.B
             42
      00AAF3 26 66 92 77 04 0C 29   905         .db     0x26,0x66,0x92,0x77,0x04,0x0c,0x29,0x48 ;&f.w..)H
             48
      00AAFB 50 6C A1 FF 2A 22 62   906         .db     0x50,0x6c,0xa1,0xff,0x2a,0x22,0x62,0x0e ;Pl!.*"b.
             0E
      00AB03 92 16 01 4C 64 6C 88   907         .db     0x92,0x16,0x01,0x4c,0x64,0x6c,0x88,0xa1 ;...Ldl.!
             A1
      00AB0B FF 0A 47 52 36 76 10   908         .db     0xff,0x0a,0x47,0x52,0x36,0x76,0x10,0x20 ;..GR6v. 
             20
      00AB13 48 68 89 A0 A8 FF 6A   909         .db     0x48,0x68,0x89,0xa0,0xa8,0xff,0x6a,0x22 ;Hh. (.j"
             22
      00AB1B 82 67 0E 52 57 00 10   910         .db     0x82,0x67,0x0e,0x52,0x57,0x00,0x10,0x30 ;.g.RW..0
             30
      00AB23 45 8C A8 B0 FF 2A 02   911         .db     0x45,0x8c,0xa8,0xb0,0xff,0x2a,0x02,0x42 ;E.(0.*.B
             42
      00AB2B 27 8E 92 96 04 68 70   912         .db     0x27,0x8e,0x92,0x96,0x04,0x68,0x70,0x80 ;'....hp.
             80
      00AB33 A1 FF 4A 6E 17 21 4C   913         .db     0xa1,0xff,0x4a,0x6e,0x17,0x21,0x4c,0x70 ;!.Jn.!Lp
             70
      00AB3B 81 A4 AC FF 0A 22 62   914         .db     0x81,0xa4,0xac,0xff,0x0a,0x22,0x62,0x67 ;.$,.."bg
             67
      00AB43 0F 12 52 00 68 8C A9   915         .db     0x0f,0x12,0x52,0x00,0x68,0x8c,0xa9,0xff ;..R.h.).
             FF
      00AB4B 0A 62 66 4E 17 00 0C   916         .db     0x0a,0x62,0x66,0x4e,0x17,0x00,0x0c,0x20 ;.bfN... 
             20
      00AB53 41 70 88 90 AD FF 2A   917         .db     0x41,0x70,0x88,0x90,0xad,0xff,0x2a,0x02 ;Ap..-.*.
             02
      00AB5B 42 27 8E 73 16 04 0C   918         .db     0x42,0x27,0x8e,0x73,0x16,0x04,0x0c,0x2c ;B'.s...,
             2C
      00AB63 68 80 A1 FF 0A 22 62   919         .db     0x68,0x80,0xa1,0xff,0x0a,0x22,0x62,0x46 ;h.!.."bF
             46
      00AB6B 0E 6E 13 00 48 70 84   920         .db     0x0e,0x6e,0x13,0x00,0x48,0x70,0x84,0xa0 ;.n..Hp. 
             A0
      00AB73 FF 4A 22 82 0E 4E 96   921         .db     0xff,0x4a,0x22,0x82,0x0e,0x4e,0x96,0x50 ;.J"..N.P
             50
      00AB7B 60 70 85 FF 0A 6E 56   922         .db     0x60,0x70,0x85,0xff,0x0a,0x6e,0x56,0x10 ;`p...nV.
             10
      00AB83 30 44 4C 61 84 90 A5   923         .db     0x30,0x44,0x4c,0x61,0x84,0x90,0xa5,0xff ;0DLa..%.
             FF
      00AB8B 0A 02 42 4F 92 96 0D   924         .db     0x0a,0x02,0x42,0x4f,0x92,0x96,0x0d,0x64 ;..BO...d
             64
      00AB93 70 81 A1 FF 0A 42 82   925         .db     0x70,0x81,0xa1,0xff,0x0a,0x42,0x82,0x86 ;p.!..B..
             86
      00AB9B 0F 16 56 00 20 65 88   926         .db     0x0f,0x16,0x56,0x00,0x20,0x65,0x88,0x90 ;..V. e..
             90
      00ABA3 A8 B0 FF 4A 22 62 06   927         .db     0xa8,0xb0,0xff,0x4a,0x22,0x62,0x06,0x46 ;(0.J"b.F
             46
      00ABAB 92 16 09 28 50 6C 85   928         .db     0x92,0x16,0x09,0x28,0x50,0x6c,0x85,0xa0 ;...(Pl. 
             A0
      00ABB3 FF 4A 22 82 8E 72 17   929         .db     0xff,0x4a,0x22,0x82,0x8e,0x72,0x17,0x00 ;.J"..r..
             00
      00ABBB 08 25 4C 60 84 B0 FF   930         .db     0x08,0x25,0x4c,0x60,0x84,0xb0,0xff,0x2a ;.%L`.0.*
             2A
      00ABC3 43 26 0E 4E 73 77 50   931         .db     0x43,0x26,0x0e,0x4e,0x73,0x77,0x50,0x85 ;C&.NswP.
             85
      00ABCB A0 A8 FF 0A 22 62 67   932         .db     0xa0,0xa8,0xff,0x0a,0x22,0x62,0x67,0x52 ; (.."bgR
             52
      00ABD3 56 96 00 30 44 89 A9   933         .db     0x56,0x96,0x00,0x30,0x44,0x89,0xa9,0xff ;V..0D.).
             FF
      00ABDB 2A 02 8E 52 57 08 10   934         .db     0x2a,0x02,0x8e,0x52,0x57,0x08,0x10,0x30 ;*..RW..0
             30
      00ABE3 60 68 81 FF 2A 63 0F   935         .db     0x60,0x68,0x81,0xff,0x2a,0x63,0x0f,0x76 ;`h..*c.v
             76
      00ABEB 10 40 65 84 8C A4 FF   936         .db     0x10,0x40,0x65,0x84,0x8c,0xa4,0xff,0x4a ;.@e..$.J
             4A
      00ABF3 02 06 72 76 08 10 28   937         .db     0x02,0x06,0x72,0x76,0x08,0x10,0x28,0x4c ;..rv..(L
             4C
      00ABFB 60 81 A0 FF 0A 23 0E   938         .db     0x60,0x81,0xa0,0xff,0x0a,0x23,0x0e,0x92 ;`. ..#..
             92
      00AC03 36 76 00 10 45 64 6C   939         .db     0x36,0x76,0x00,0x10,0x45,0x64,0x6c,0x80 ;6v..Edl.
             80
      00AC0B FF 2A 02 62 4E 8E 92   940         .db     0xff,0x2a,0x02,0x62,0x4e,0x8e,0x92,0x16 ;.*.bN...
             16
      00AC13 04 0C 2C 40 70 84 A1   941         .db     0x04,0x0c,0x2c,0x40,0x70,0x84,0xa1,0xff ;..,@p.!.
             FF
      00AC1B 0A 03 06 46 6E 52 17   942         .db     0x0a,0x03,0x06,0x46,0x6e,0x52,0x17,0x2c ;...FnR.,
             2C
      00AC23 48 81 FF 4A 03 92 17   943         .db     0x48,0x81,0xff,0x4a,0x03,0x92,0x17,0x05 ;H..J....
             05
      00AC2B 4C 6D 81 A1 FF 0A 22   944         .db     0x4c,0x6d,0x81,0xa1,0xff,0x0a,0x22,0x82 ;Lm.!..".
             82
      00AC33 67 72 56 96 10 30 44   945         .db     0x67,0x72,0x56,0x96,0x10,0x30,0x44,0x4c ;grV..0DL
             4C
      00AC3B 68 AC FF 0A 82 13 17   946         .db     0x68,0xac,0xff,0x0a,0x82,0x13,0x17,0x40 ;h,.....@
             40
      00AC43 48 8C A4 AC FF 0A 42   947         .db     0x48,0x8c,0xa4,0xac,0xff,0x0a,0x42,0x0e ;H.$,..B.
             0E
      00AC4B 36 76 00 10 20 45 64   948         .db     0x36,0x76,0x00,0x10,0x20,0x45,0x64,0x6c ;6v.. Edl
             6C
      00AC53 80 FF 2A 02 42 06 6F   949         .db     0x80,0xff,0x2a,0x02,0x42,0x06,0x6f,0x96 ;..*.B.o.
             96
      00AC5B 08 10 2D 70 80 A1 FF   950         .db     0x08,0x10,0x2d,0x70,0x80,0xa1,0xff,0x6a ;..-p.!.j
             6A
      00AC63 22 82 07 32 09 48 60   951         .db     0x22,0x82,0x07,0x32,0x09,0x48,0x60,0xa4 ;"..2.H`$
             A4
      00AC6B AC FF 0A 63 06 66 2E   952         .db     0xac,0xff,0x0a,0x63,0x06,0x66,0x2e,0x32 ;,..c.f.2
             32
      00AC73 16 0C 41 69 8C A4 FF   953         .db     0x16,0x0c,0x41,0x69,0x8c,0xa4,0xff,0x0a ;..Ai.$..
             0A
      00AC7B 82 06 6E 92 17 40 48   954         .db     0x82,0x06,0x6e,0x92,0x17,0x40,0x48,0x60 ;..n..@H`
             60
      00AC83 70 84 A5 FF 2A 43 26   955         .db     0x70,0x84,0xa5,0xff,0x2a,0x43,0x26,0x0f ;p.%.*C&.
             0F
      00AC8B 73 77 01 50 85 A5 FF   956         .db     0x73,0x77,0x01,0x50,0x85,0xa5,0xff,0x2a ;sw.P.%.*
             2A
      00AC93 62 66 2E 8E 53 57 04   957         .db     0x62,0x66,0x2e,0x8e,0x53,0x57,0x04,0x0c ;bf..SW..
             0C
      00AC9B 30 40 68 A4 B0 FF 2A   958         .db     0x30,0x40,0x68,0xa4,0xb0,0xff,0x2a,0x22 ;0@h$0.*"
             22
      00ACA3 62 86 8E 52 01 2C 65   959         .db     0x62,0x86,0x8e,0x52,0x01,0x2c,0x65,0x90 ;b..R.,e.
             90
      00ACAB B0 FF 0A 06 46 8E 73   960         .db     0xb0,0xff,0x0a,0x06,0x46,0x8e,0x73,0x76 ;0...F.sv
             76
      00ACB3 48 50 68 A0 FF 0A 03   961         .db     0x48,0x50,0x68,0xa0,0xff,0x0a,0x03,0x26 ;HPh ...&
             26
      00ACBB 86 72 77 30 48 50 61   962         .db     0x86,0x72,0x77,0x30,0x48,0x50,0x61,0xac ;.rw0HPa,
             AC
      00ACC3 FF 4A 0E 92 36 21 40   963         .db     0xff,0x4a,0x0e,0x92,0x36,0x21,0x40,0x4c ;.J..6!@L
             4C
      00ACCB 70 84 A5 FF 0A 62 26   964         .db     0x70,0x84,0xa5,0xff,0x0a,0x62,0x26,0x86 ;p.%..b&.
             86
      00ACD3 52 16 56 00 0C 2C 48   965         .db     0x52,0x16,0x56,0x00,0x0c,0x2c,0x48,0x65 ;R.V..,He
             65
      00ACDB 8C AC FF 0A 03 52 92   966         .db     0x8c,0xac,0xff,0x0a,0x03,0x52,0x92,0x17 ;.,...R..
             17
      00ACE3 0C 44 60 80 A0 A8 FF   967         .db     0x0c,0x44,0x60,0x80,0xa0,0xa8,0xff,0x0a ;.D`. (..
             0A
      00ACEB 03 2F 96 0D 60 70 84   968         .db     0x03,0x2f,0x96,0x0d,0x60,0x70,0x84,0xa1 ;./..`p.!
             A1
      00ACF3 FF 6A 03 86 6E 92 96   969         .db     0xff,0x6a,0x03,0x86,0x6e,0x92,0x96,0x04 ;.j..n...
             04
      00ACFB 0C 24 45 60 70 A8 FF   970         .db     0x0c,0x24,0x45,0x60,0x70,0xa8,0xff,0x4a ;.$E`p(.J
             4A
      00AD03 02 0F 92 04 10 24 50   971         .db     0x02,0x0f,0x92,0x04,0x10,0x24,0x50,0x6d ;.....$Pm
             6D
      00AD0B 80 A0 A8 FF 0A 42 27   972         .db     0x80,0xa0,0xa8,0xff,0x0a,0x42,0x27,0x8e ;. (..B'.
             8E
      00AD13 92 17 00 0C 6D 81 FF   973         .db     0x92,0x17,0x00,0x0c,0x6d,0x81,0xff,0x0a ;....m...
             0A
      00AD1B 82 8E 53 56 0D 2D 40   974         .db     0x82,0x8e,0x53,0x56,0x0d,0x2d,0x40,0x48 ;..SV.-@H
             48
      00AD23 60 84 A4 B0 FF 0A 02   975         .db     0x60,0x84,0xa4,0xb0,0xff,0x0a,0x02,0x42 ;`.$0...B
             42
      00AD2B 27 8E 32 56 0D 48 69   976         .db     0x27,0x8e,0x32,0x56,0x0d,0x48,0x69,0x80 ;'.2V.Hi.
             80
      00AD33 B0 FF 2A 02 62 66 8E   977         .db     0xb0,0xff,0x2a,0x02,0x62,0x66,0x8e,0x73 ;0.*.bf.s
             73
      00AD3B 56 04 2D 40 4C 68 A1   978         .db     0x56,0x04,0x2d,0x40,0x4c,0x68,0xa1,0xff ;V.-@Lh!.
             FF
      00AD43 6A 23 0F 92 36 76 00   979         .db     0x6a,0x23,0x0f,0x92,0x36,0x76,0x00,0x44 ;j#..6v.D
             44
      00AD4B 6C 80 A5 FF 0A 03 06   980         .db     0x6c,0x80,0xa5,0xff,0x0a,0x03,0x06,0x4e ;l.%....N
             4E
      00AD53 8E 53 16 56 2C 44 A1   981         .db     0x8e,0x53,0x16,0x56,0x2c,0x44,0xa1,0xff ;.S.V,D!.
             FF
      00AD5B 0A 22 46 6E 13 36 00   982         .db     0x0a,0x22,0x46,0x6e,0x13,0x36,0x00,0x48 ;."Fn.6.H
             48
      00AD63 70 81 FF 0A 23 86 6E   983         .db     0x70,0x81,0xff,0x0a,0x23,0x86,0x6e,0x17 ;p...#.n.
             17
      00AD6B 00 0C 45 64 70 90 AD   984         .db     0x00,0x0c,0x45,0x64,0x70,0x90,0xad,0xff ;..Edp.-.
             FF
      00AD73 2A 63 06 2F 32 96 40   985         .db     0x2a,0x63,0x06,0x2f,0x32,0x96,0x40,0x64 ;*c./2.@d
             64
      00AD7B 70 84 8C A5 FF 0A 02   986         .db     0x70,0x84,0x8c,0xa5,0xff,0x0a,0x02,0x42 ;p..%...B
             42
      00AD83 26 6F 32 92 0C 48 70   987         .db     0x26,0x6f,0x32,0x92,0x0c,0x48,0x70,0x80 ;&o2..Hp.
             80
      00AD8B A1 FF 0A 82 0E 53 00   988         .db     0xa1,0xff,0x0a,0x82,0x0e,0x53,0x00,0x30 ;!....S.0
             30
      00AD93 40 48 60 A4 AC FF 0A   989         .db     0x40,0x48,0x60,0xa4,0xac,0xff,0x0a,0x42 ;@H`$,..B
             42
      00AD9B 6F 16 56 00 20 44 4C   990         .db     0x6f,0x16,0x56,0x00,0x20,0x44,0x4c,0x64 ;o.V. DLd
             64
      00ADA3 90 A0 FF 2A 63 86 2E   991         .db     0x90,0xa0,0xff,0x2a,0x63,0x86,0x2e,0x16 ;. .*c...
             16
      00ADAB 04 0C 40 64 6C 88 90   992         .db     0x04,0x0c,0x40,0x64,0x6c,0x88,0x90,0xa8 ;..@dl..(
             A8
      00ADB3 FF 0A 22 0E 4E 13 00   993         .db     0xff,0x0a,0x22,0x0e,0x4e,0x13,0x00,0x44 ;..".N..D
             44
      00ADBB 80 88 A1 FF 2A 42 6E   994         .db     0x80,0x88,0xa1,0xff,0x2a,0x42,0x6e,0x17 ;..!.*Bn.
             17
      00ADC3 01 20 2C 4C 64 70 80   995         .db     0x01,0x20,0x2c,0x4c,0x64,0x70,0x80,0xa0 ;. ,Ldp. 
             A0
      00ADCB FF 2A 46 2E 73 20 30   996         .db     0xff,0x2a,0x46,0x2e,0x73,0x20,0x30,0x50 ;.*F.s 0P
             50
      00ADD3 68 80 A1 FF 0A 42 82   997         .db     0x68,0x80,0xa1,0xff,0x0a,0x42,0x82,0x46 ;h.!..B.F
             46
      00ADDB 32 00 0C 20 48 69 84   998         .db     0x32,0x00,0x0c,0x20,0x48,0x69,0x84,0xa4 ;2.. Hi.$
             A4
      00ADE3 FF 0A 23 06 0E 4E 32   999         .db     0xff,0x0a,0x23,0x06,0x0e,0x4e,0x32,0x72 ;..#..N2r
             72
      00ADEB 36 76 10 64 85 A4 FF  1000         .db     0x36,0x76,0x10,0x64,0x85,0xa4,0xff,0x0a ;6v.d.$..
             0A
      00ADF3 23 8E 33 36 00 0C 45  1001         .db     0x23,0x8e,0x33,0x36,0x00,0x0c,0x45,0x90 ;#.36..E.
             90
      00ADFB A1 FF 2A 23 26 66 8E  1002         .db     0xa1,0xff,0x2a,0x23,0x26,0x66,0x8e,0x12 ;!.*#&f..
             12
      00AE03 52 16 56 00 08 68 A1  1003         .db     0x52,0x16,0x56,0x00,0x08,0x68,0xa1,0xff ;R.V..h!.
             FF
      00AE0B 0A 42 6F 36 0D 20 45  1004         .db     0x0a,0x42,0x6f,0x36,0x0d,0x20,0x45,0x64 ;.Bo6. Ed
             64
      00AE13 90 FF 0A 82 0F 53 56  1005         .db     0x90,0xff,0x0a,0x82,0x0f,0x53,0x56,0x96 ;.....SV.
             96
      00AE1B 00 30 41 60 A5 FF 0A  1006         .db     0x00,0x30,0x41,0x60,0xa5,0xff,0x0a,0x63 ;.0A`%..c
             63
      00AE23 0F 52 56 96 30 41 68  1007         .db     0x0f,0x52,0x56,0x96,0x30,0x41,0x68,0x88 ;.RV.0Ah.
             88
      00AE2B A4 AC FF 4A 02 06 92  1008         .db     0xa4,0xac,0xff,0x4a,0x02,0x06,0x92,0x08 ;$,.J....
             08
      00AE33 10 28 30 40 6C 84 A1  1009         .db     0x10,0x28,0x30,0x40,0x6c,0x84,0xa1,0xff ;.(0@l.!.
             FF
      00AE3B 2A 63 0E 4E 04 30 40  1010         .db     0x2a,0x63,0x0e,0x4e,0x04,0x30,0x40,0x64 ;*c.N.0@d
             64
      00AE43 70 85 A5 FF 4A 73 16  1011         .db     0x70,0x85,0xa5,0xff,0x4a,0x73,0x16,0x76 ;p.%.Js.v
             76
      00AE4B 04 21 50 81 A1 FF 0A  1012         .db     0x04,0x21,0x50,0x81,0xa1,0xff,0x0a,0x02 ;.!P.!...
             02
      00AE53 42 06 2F 52 37 0D 64  1013         .db     0x42,0x06,0x2f,0x52,0x37,0x0d,0x64,0x80 ;B./R7.d.
             80
      00AE5B 88 FF 0A 82 86 2F 16  1014         .db     0x88,0xff,0x0a,0x82,0x86,0x2f,0x16,0x00 ;...../..
             00
      00AE63 0C 41 60 A9 FF 0A 66  1015         .db     0x0c,0x41,0x60,0xa9,0xff,0x0a,0x66,0x8e ;.A`)..f.
             8E
      00AE6B 53 57 00 0C 2D 41 68  1016         .db     0x53,0x57,0x00,0x0c,0x2d,0x41,0x68,0xa1 ;SW..-Ah!
             A1
      00AE73 FF 0A 23 6F 32 92 17  1017         .db     0xff,0x0a,0x23,0x6f,0x32,0x92,0x17,0x00 ;..#o2...
             00
      00AE7B 45 70 80 A0 FF 0A 82  1018         .db     0x45,0x70,0x80,0xa0,0xff,0x0a,0x82,0x86 ;Ep. ....
             86
      00AE83 4E 53 0C 2C 41 88 A8  1019         .db     0x4e,0x53,0x0c,0x2c,0x41,0x88,0xa8,0xb0 ;NS.,A.(0
             B0
      00AE8B FF 0A 52 36 0C 2C 41  1020         .db     0xff,0x0a,0x52,0x36,0x0c,0x2c,0x41,0x61 ;..R6.,Aa
             61
      00AE93 84 A4 AC FF 0A 62 86  1021         .db     0x84,0xa4,0xac,0xff,0x0a,0x62,0x86,0x33 ;.$,..b.3
             33
      00AE9B 0D 40 48 64 8C A9 FF  1022         .db     0x0d,0x40,0x48,0x64,0x8c,0xa9,0xff,0x2a ;.@Hd.).*
             2A
      00AEA3 82 06 4E 8E 76 08 2C  1023         .db     0x82,0x06,0x4e,0x8e,0x76,0x08,0x2c,0x40 ;..N.v.,@
             40
      00AEAB 50 61 84 B0 FF 0A 22  1024         .db     0x50,0x61,0x84,0xb0,0xff,0x0a,0x22,0x62 ;Pa.0.."b
             62
      00AEB3 6F 13 16 56 00 48 64  1025         .db     0x6f,0x13,0x16,0x56,0x00,0x48,0x64,0x90 ;o..V.Hd.
             90
      00AEBB B0 FF 2A 0F 76 04 20  1026         .db     0xb0,0xff,0x2a,0x0f,0x76,0x04,0x20,0x50 ;0.*.v. P
             50
      00AEC3 64 6C 85 A5 FF 0A 23  1027         .db     0x64,0x6c,0x85,0xa5,0xff,0x0a,0x23,0x6f ;dl.%..#o
             6F
      00AECB 32 00 0C 45 70 80 A0  1028         .db     0x32,0x00,0x0c,0x45,0x70,0x80,0xa0,0xb0 ;2..Ep. 0
             B0
      00AED3 FF 0A 22 62 2E 8E 12  1029         .db     0xff,0x0a,0x22,0x62,0x2e,0x8e,0x12,0x52 ;.."b...R
             52
      00AEDB 00 65 90 A0 FF 4A 42  1030         .db     0x00,0x65,0x90,0xa0,0xff,0x4a,0x42,0x82 ;.e. .JB.
             82
      00AEE3 47 12 77 20 28 4D A4  1031         .db     0x47,0x12,0x77,0x20,0x28,0x4d,0xa4,0xac ;G.w (M$,
             AC
      00AEEB FF 0A 63 86 6E 53 00  1032         .db     0xff,0x0a,0x63,0x86,0x6e,0x53,0x00,0x2c ;..c.nS.,
             2C
      00AEF3 48 64 A8 B0 FF 6A 02  1033         .db     0x48,0x64,0xa8,0xb0,0xff,0x6a,0x02,0x42 ;Hd(0.j.B
             42
      00AEFB 8E 36 76 0D 25 44 6C  1034         .db     0x8e,0x36,0x76,0x0d,0x25,0x44,0x6c,0x80 ;.6v.%Dl.
             80
      00AF03 A1 FF 2A 0F 16 76 01  1035         .db     0xa1,0xff,0x2a,0x0f,0x16,0x76,0x01,0x50 ;!.*..v.P
             50
      00AF0B 64 6C 85 FF 2A 22 86  1036         .db     0x64,0x6c,0x85,0xff,0x2a,0x22,0x86,0x2f ;dl..*"./
             2F
      00AF13 12 72 77 50 61 AC FF  1037         .db     0x12,0x72,0x77,0x50,0x61,0xac,0xff,0x0a ;.rwPa,..
             0A
      00AF1B 02 0F 52 56 10 30 60  1038         .db     0x02,0x0f,0x52,0x56,0x10,0x30,0x60,0x68 ;..RV.0`h
             68
      00AF23 A1 FF 2A 42 2E 73 77  1039         .db     0xa1,0xff,0x2a,0x42,0x2e,0x73,0x77,0x04 ;!.*B.sw.
             04
      00AF2B 20 30 50 64 80 A0 FF  1040         .db     0x20,0x30,0x50,0x64,0x80,0xa0,0xff,0x0a ; 0Pd. ..
             0A
      00AF33 42 6F 32 92 57 00 0C  1041         .db     0x42,0x6f,0x32,0x92,0x57,0x00,0x0c,0x20 ;Bo2.W.. 
             20
      00AF3B 48 64 81 A1 FF 0A 66  1042         .db     0x48,0x64,0x81,0xa1,0xff,0x0a,0x66,0x0f ;Hd.!..f.
             0F
      00AF43 73 77 30 44 68 A0 A8  1043         .db     0x73,0x77,0x30,0x44,0x68,0xa0,0xa8,0xff ;sw0Dh (.
             FF
      00AF4B 0A 22 62 27 8E 52 16  1044         .db     0x0a,0x22,0x62,0x27,0x8e,0x52,0x16,0x56 ;."b'.R.V
             56
      00AF53 00 2C 48 68 84 B0 FF  1045         .db     0x00,0x2c,0x48,0x68,0x84,0xb0,0xff,0x2a ;.,Hh.0.*
             2A
      00AF5B 63 4F 56 96 00 08 2D  1046         .db     0x63,0x4f,0x56,0x96,0x00,0x08,0x2d,0x40 ;cOV...-@
             40
      00AF63 64 A5 FF 2A 0F 72 76  1047         .db     0x64,0xa5,0xff,0x2a,0x0f,0x72,0x76,0x01 ;d%.*.rv.
             01
      00AF6B 50 60 68 A5 FF 2A 06  1048         .db     0x50,0x60,0x68,0xa5,0xff,0x2a,0x06,0x4f ;P`h%.*.O
             4F
      00AF73 92 36 08 10 2C 40 70  1049         .db     0x92,0x36,0x08,0x10,0x2c,0x40,0x70,0xa5 ;.6..,@p%
             A5
      00AF7B FF 4A 82 26 0F 73 77  1050         .db     0xff,0x4a,0x82,0x26,0x0f,0x73,0x77,0x00 ;.J.&.sw.
             00
      00AF83 30 50 60 84 A5 FF 2A  1051         .db     0x30,0x50,0x60,0x84,0xa5,0xff,0x2a,0x23 ;0P`.%.*#
             23
      00AF8B 46 2F 92 50 70 85 A0  1052         .db     0x46,0x2f,0x92,0x50,0x70,0x85,0xa0,0xa8 ;F/.Pp. (
             A8
      00AF93 FF 4A 42 82 0E 72 00  1053         .db     0xff,0x4a,0x42,0x82,0x0e,0x72,0x00,0x21 ;.JB..r.!
             21
      00AF9B 4C 85 A5 FF 0A 43 47  1054         .db     0x4c,0x85,0xa5,0xff,0x0a,0x43,0x47,0x0e ;L.%..CG.
             0E
      00AFA3 53 20 30 48 88 A4 AC  1055         .db     0x53,0x20,0x30,0x48,0x88,0xa4,0xac,0xff ;S 0H.$,.
             FF
      00AFAB 0A 03 06 4F 92 0D 2C  1056         .db     0x0a,0x03,0x06,0x4f,0x92,0x0d,0x2c,0x70 ;...O..,p
             70
      00AFB3 81 A4 FF 6A 82 16 76  1057         .db     0x81,0xa4,0xff,0x6a,0x82,0x16,0x76,0x21 ;.$.j..v!
             21
      00AFBB 44 50 60 6C A8 B0 FF  1058         .db     0x44,0x50,0x60,0x6c,0xa8,0xb0,0xff,0x2a ;DP`l(0.*
             2A
      00AFC3 03 06 86 0E 37 10 4C  1059         .db     0x03,0x06,0x86,0x0e,0x37,0x10,0x4c,0x61 ;....7.La
             61
      00AFCB 88 A8 B0 FF 4A 62 06  1060         .db     0x88,0xa8,0xb0,0xff,0x4a,0x62,0x06,0x52 ;.(0.Jb.R
             52
      00AFD3 92 08 29 40 84 A1 FF  1061         .db     0x92,0x08,0x29,0x40,0x84,0xa1,0xff,0x0a ;..)@.!..
             0A
      00AFDB 03 8E 57 2D 44 4C 81  1062         .db     0x03,0x8e,0x57,0x2d,0x44,0x4c,0x81,0xb0 ;..W-DL.0
             B0
      00AFE3 FF 0A 42 6F 32 0D 20  1063         .db     0xff,0x0a,0x42,0x6f,0x32,0x0d,0x20,0x45 ;..Bo2. E
             45
      00AFEB 90 A1 FF 6A 42 82 0E  1064         .db     0x90,0xa1,0xff,0x6a,0x42,0x82,0x0e,0x6e ;.!.jB..n
             6E
      00AFF3 32 36 96 01 45 70 A5  1065         .db     0x32,0x36,0x96,0x01,0x45,0x70,0xa5,0xff ;26..Ep%.
             FF
      00AFFB 0A 22 26 32 72 00 0C  1066         .db     0x0a,0x22,0x26,0x32,0x72,0x00,0x0c,0x48 ;."&2r..H
             48
      00B003 60 68 A0 FF 0A 82 06  1067         .db     0x60,0x68,0xa0,0xff,0x0a,0x82,0x06,0x8e ;`h .....
             8E
      00B00B 53 16 56 0C 2C 40 48  1068         .db     0x53,0x16,0x56,0x0c,0x2c,0x40,0x48,0x60 ;S.V.,@H`
             60
      00B013 84 A4 B0 FF 0A 42 82  1069         .db     0x84,0xa4,0xb0,0xff,0x0a,0x42,0x82,0x86 ;.$0..B..
             86
      00B01B 16 56 20 45 65 88 90  1070         .db     0x16,0x56,0x20,0x45,0x65,0x88,0x90,0xa8 ;.V Ee..(
             A8
      00B023 B0 FF 4A 82 0F 52 92  1071         .db     0xb0,0xff,0x4a,0x82,0x0f,0x52,0x92,0x56 ;0.J..R.V
             56
      00B02B 96 30 60 85 FF 0A 47  1072         .db     0x96,0x30,0x60,0x85,0xff,0x0a,0x47,0x0f ;.0`...G.
             0F
      00B033 52 56 00 30 68 88 90  1073         .db     0x52,0x56,0x00,0x30,0x68,0x88,0x90,0xa9 ;RV.0h..)
             A9
      00B03B FF 0A 62 06 2E 6E 33  1074         .db     0xff,0x0a,0x62,0x06,0x2e,0x6e,0x33,0x16 ;..b..n3.
             16
      00B043 0C 41 90 A9 FF 2A 42  1075         .db     0x0c,0x41,0x90,0xa9,0xff,0x2a,0x42,0x27 ;.A.).*B'
             27
      00B04B 8E 92 17 4C 69 81 A1  1076         .db     0x8e,0x92,0x17,0x4c,0x69,0x81,0xa1,0xff ;...Li.!.
             FF
      00B053 0A 03 06 2E 37 0D 44  1077         .db     0x0a,0x03,0x06,0x2e,0x37,0x0d,0x44,0x60 ;....7.D`
             60
      00B05B 68 FF 0A 42 66 32 00  1078         .db     0x68,0xff,0x0a,0x42,0x66,0x32,0x00,0x0c ;h..Bf2..
             0C
      00B063 20 45 6C 8C A4 AC FF  1079         .db     0x20,0x45,0x6c,0x8c,0xa4,0xac,0xff,0x0a ; El.$,..
             0A
      00B06B 42 82 46 86 12 72 16  1080         .db     0x42,0x82,0x46,0x86,0x12,0x72,0x16,0x56 ;B.F..r.V
             56
      00B073 00 20 49 68 88 AC FF  1081         .db     0x00,0x20,0x49,0x68,0x88,0xac,0xff,0x4a ;. Ih.,.J
             4A
      00B07B 2E 73 16 76 00 08 21  1082         .db     0x2e,0x73,0x16,0x76,0x00,0x08,0x21,0x50 ;.s.v..!P
             50
      00B083 85 A4 FF 0A 03 06 0E  1083         .db     0x85,0xa4,0xff,0x0a,0x03,0x06,0x0e,0x8e ;.$......
             8E
      00B08B 52 56 30 45 60 90 A0  1084         .db     0x52,0x56,0x30,0x45,0x60,0x90,0xa0,0xff ;RV0E`. .
             FF
      00B093 2A 66 92 17 40 4C 6D  1085         .db     0x2a,0x66,0x92,0x17,0x40,0x4c,0x6d,0x88 ;*f..@Lm.
             88
      00B09B A1 FF 2A 43 86 6E 76  1086         .db     0xa1,0xff,0x2a,0x43,0x86,0x6e,0x76,0x01 ;!.*C.nv.
             01
      00B0A3 20 2C 4D 64 A8 B0 FF  1087         .db     0x20,0x2c,0x4d,0x64,0xa8,0xb0,0xff,0x0a ; ,Md(0..
             0A
      00B0AB 22 62 8E 53 56 96 00  1088         .db     0x22,0x62,0x8e,0x53,0x56,0x96,0x00,0x30 ;"b.SV..0
             30
      00B0B3 44 68 A1 FF 0A 43 8E  1089         .db     0x44,0x68,0xa1,0xff,0x0a,0x43,0x8e,0x32 ;Dh!..C.2
             32
      00B0BB 16 56 00 20 45 68 84  1090         .db     0x16,0x56,0x00,0x20,0x45,0x68,0x84,0x90 ;.V. Eh..
             90
      00B0C3 A0 FF 0A 43 92 0C 20  1091         .db     0xa0,0xff,0x0a,0x43,0x92,0x0c,0x20,0x44 ; ..C.. D
             44
      00B0CB 4C 6C 84 A0 A8 FF 0A  1092         .db     0x4c,0x6c,0x84,0xa0,0xa8,0xff,0x0a,0x47 ;Ll. (..G
             47
      00B0D3 0F 12 52 16 00 68 8C  1093         .db     0x0f,0x12,0x52,0x16,0x00,0x68,0x8c,0xa9 ;..R..h.)
             A9
      00B0DB FF 6A 22 2E 12 96 00  1094         .db     0xff,0x6a,0x22,0x2e,0x12,0x96,0x00,0x08 ;.j".....
             08
      00B0E3 24 44 50 6D 8C A1 FF  1095         .db     0x24,0x44,0x50,0x6d,0x8c,0xa1,0xff,0x4a ;$DPm.!.J
             4A
      00B0EB 03 06 73 57 28 4C 81  1096         .db     0x03,0x06,0x73,0x57,0x28,0x4c,0x81,0xa0 ;..sW(L. 
             A0
      00B0F3 A8 FF 6A 22 86 4F 12  1097         .db     0xa8,0xff,0x6a,0x22,0x86,0x4f,0x12,0x16 ;(.j".O..
             16
      00B0FB 56 00 08 44 60 90 A8  1098         .db     0x56,0x00,0x08,0x44,0x60,0x90,0xa8,0xb0 ;V..D`.(0
             B0
      00B103 FF 0A 22 62 8E 56 00  1099         .db     0xff,0x0a,0x22,0x62,0x8e,0x56,0x00,0x2d ;.."b.V.-
             2D
      00B10B 48 65 90 A0 FF 2A 43  1100         .db     0x48,0x65,0x90,0xa0,0xff,0x2a,0x43,0x2e ;He. .*C.
             2E
      00B113 73 77 04 0C 20 50 64  1101         .db     0x73,0x77,0x04,0x0c,0x20,0x50,0x64,0x88 ;sw.. Pd.
             88
      00B11B A0 FF 0A 03 6E 52 92  1102         .db     0xa0,0xff,0x0a,0x03,0x6e,0x52,0x92,0x76 ; ...nR.v
             76
      00B123 0D 2C 48 81 A1 FF 6A  1103         .db     0x0d,0x2c,0x48,0x81,0xa1,0xff,0x6a,0x02 ;.,H.!.j.
             02
      00B12B 82 66 2E 6E 32 92 36  1104         .db     0x82,0x66,0x2e,0x6e,0x32,0x92,0x36,0x96 ;.f.n2.6.
             96
      00B133 41 70 A5 FF 4A 02 46  1105         .db     0x41,0x70,0xa5,0xff,0x4a,0x02,0x46,0x0f ;Ap%.J.F.
             0F
      00B13B 32 92 96 10 24 6C 80  1106         .db     0x32,0x92,0x96,0x10,0x24,0x6c,0x80,0xa1 ;2...$l.!
             A1
      00B143 FF 0A 22 2E 6E 52 92  1107         .db     0xff,0x0a,0x22,0x2e,0x6e,0x52,0x92,0x56 ;..".nR.V
             56
      00B14B 96 0D 30 44 84 A5 FF  1108         .db     0x96,0x0d,0x30,0x44,0x84,0xa5,0xff,0x4a ;..0D.%.J
             4A
      00B153 03 6E 17 05 4C 70 81  1109         .db     0x03,0x6e,0x17,0x05,0x4c,0x70,0x81,0xa5 ;.n..Lp.%
             A5
      00B15B FF 6A 42 0F 32 96 00  1110         .db     0xff,0x6a,0x42,0x0f,0x32,0x96,0x00,0x10 ;.jB.2...
             10
      00B163 20 44 6D 80 A1 FF 2A  1111         .db     0x20,0x44,0x6d,0x80,0xa1,0xff,0x2a,0x22 ; Dm.!.*"
             22
      00B16B 07 4E 72 16 08 2C 50  1112         .db     0x07,0x4e,0x72,0x16,0x08,0x2c,0x50,0x85 ;.Nr..,P.
             85
      00B173 FF 0A 42 8E 32 72 16  1113         .db     0xff,0x0a,0x42,0x8e,0x32,0x72,0x16,0x56 ;..B.2r.V
             56
      00B17B 20 48 65 80 B0 FF 0A  1114         .db     0x20,0x48,0x65,0x80,0xb0,0xff,0x0a,0x43 ; He.0..C
             43
      00B183 47 0E 32 72 10 20 48  1115         .db     0x47,0x0e,0x32,0x72,0x10,0x20,0x48,0x68 ;G.2r. Hh
             68
      00B18B 88 FF 2A 02 2E 73 16  1116         .db     0x88,0xff,0x2a,0x02,0x2e,0x73,0x16,0x04 ;..*..s..
             04
      00B193 0C 50 65 80 A0 A8 FF  1117         .db     0x0c,0x50,0x65,0x80,0xa0,0xa8,0xff,0x4a ;.Pe. (.J
             4A
      00B19B 02 42 06 46 4F 92 96  1118         .db     0x02,0x42,0x06,0x46,0x4f,0x92,0x96,0x08 ;.B.FO...
             08
      00B1A3 10 28 70 80 A1 FF 0A  1119         .db     0x10,0x28,0x70,0x80,0xa1,0xff,0x0a,0x62 ;.(p.!..b
             62
      00B1AB 8E 32 37 0D 20 40 48  1120         .db     0x8e,0x32,0x37,0x0d,0x20,0x40,0x48,0x64 ;.27. @Hd
             64
      00B1B3 6C 84 A0 FF 0A 63 4E  1121         .db     0x6c,0x84,0xa0,0xff,0x0a,0x63,0x4e,0x53 ;l. ..cNS
             53
      00B1BB 57 0D 2D 41 64 88 A9  1122         .db     0x57,0x0d,0x2d,0x41,0x64,0x88,0xa9,0xff ;W.-Ad.).
             FF
      00B1C3 4A 02 86 0E 92 37 04  1123         .db     0x4a,0x02,0x86,0x0e,0x92,0x37,0x04,0x10 ;J....7..
             10
      00B1CB 24 60 6C 88 FF 0A 63  1124         .db     0x24,0x60,0x6c,0x88,0xff,0x0a,0x63,0x86 ;$`l...c.
             86
      00B1D3 2E 16 0C 41 64 6C 88  1125         .db     0x2e,0x16,0x0c,0x41,0x64,0x6c,0x88,0x90 ;...Adl..
             90
      00B1DB A8 FF 0A 42 27 6E 13  1126         .db     0xa8,0xff,0x0a,0x42,0x27,0x6e,0x13,0x16 ;(..B'n..
             16
      00B1E3 96 00 48 70 84 A5 FF  1127         .db     0x96,0x00,0x48,0x70,0x84,0xa5,0xff,0x4a ;..Hp.%.J
             4A
      00B1EB 02 82 06 4F 52 16 56  1128         .db     0x02,0x82,0x06,0x4f,0x52,0x16,0x56,0x09 ;...OR.V.
             09
      00B1F3 29 40 84 A5 FF 4A 0E  1129         .db     0x29,0x40,0x84,0xa5,0xff,0x4a,0x0e,0x72 ;)@.%.J.r
             72
      00B1FB 36 76 21 4C 60 85 A4  1130         .db     0x36,0x76,0x21,0x4c,0x60,0x85,0xa4,0xb0 ;6v!L`.$0
             B0
      00B203 FF 0A 82 06 0F 32 92  1131         .db     0xff,0x0a,0x82,0x06,0x0f,0x32,0x92,0x36 ;.....2.6
             36
      00B20B 96 41 88 A5 FF 0A 43  1132         .db     0x96,0x41,0x88,0xa5,0xff,0x0a,0x43,0x46 ;.A.%..CF
             46
      00B213 0E 52 92 77 00 10 20  1133         .db     0x0e,0x52,0x92,0x77,0x00,0x10,0x20,0x30 ;.R.w.. 0
             30
      00B21B 48 84 A1 FF 0A 23 46  1134         .db     0x48,0x84,0xa1,0xff,0x0a,0x23,0x46,0x2f ;H.!..#F/
             2F
      00B223 16 96 00 0C 70 81 A4  1135         .db     0x16,0x96,0x00,0x0c,0x70,0x81,0xa4,0xff ;....p.$.
             FF
      00B22B 0A 22 82 86 16 56 00  1136         .db     0x0a,0x22,0x82,0x86,0x16,0x56,0x00,0x45 ;."...V.E
             45
      00B233 61 88 90 A8 B0 FF 2A  1137         .db     0x61,0x88,0x90,0xa8,0xb0,0xff,0x2a,0x02 ;a..(0.*.
             02
      00B23B 82 67 2E 6E 13 96 05  1138         .db     0x82,0x67,0x2e,0x6e,0x13,0x96,0x05,0x40 ;.g.n...@
             40
      00B243 70 A9 FF 2A 22 26 4E  1139         .db     0x70,0xa9,0xff,0x2a,0x22,0x26,0x4e,0x73 ;p).*"&Ns
             73
      00B24B 77 2C 50 64 85 A1 FF  1140         .db     0x77,0x2c,0x50,0x64,0x85,0xa1,0xff,0x2a ;w,Pd.!.*
             2A
      00B253 42 82 0F 72 20 50 68  1141         .db     0x42,0x82,0x0f,0x72,0x20,0x50,0x68,0x88 ;B..r Ph.
             88
      00B25B A4 AC FF 0A 62 2E 6E  1142         .db     0xa4,0xac,0xff,0x0a,0x62,0x2e,0x6e,0x16 ;$,..b.n.
             16
      00B263 0C 41 70 90 A5 FF 0A  1143         .db     0x0c,0x41,0x70,0x90,0xa5,0xff,0x0a,0x82 ;.Ap.%...
             82
      00B26B 26 72 77 48 50 60 68  1144         .db     0x26,0x72,0x77,0x48,0x50,0x60,0x68,0x85 ;&rwHP`h.
             85
      00B273 A4 AC FF 0A 23 6E 52  1145         .db     0xa4,0xac,0xff,0x0a,0x23,0x6e,0x52,0x92 ;$,..#nR.
             92
      00B27B 00 0C 48 81 A0 A8 FF  1146         .db     0x00,0x0c,0x48,0x81,0xa0,0xa8,0xff,0x0a ;..H. (..
             0A
      00B283 82 8E 53 2D 40 48 60  1147         .db     0x82,0x8e,0x53,0x2d,0x40,0x48,0x60,0xa4 ;..S-@H`$
             A4
      00B28B B0 FF 2A 02 67 2E 96  1148         .db     0xb0,0xff,0x2a,0x02,0x67,0x2e,0x96,0x05 ;0.*.g...
             05
      00B293 40 50 6D 89 A9 FF 0A  1149         .db     0x40,0x50,0x6d,0x89,0xa9,0xff,0x0a,0x03 ;@Pm.)...
             03
      00B29B 07 8E 57 2D 48 81 A4  1150         .db     0x07,0x8e,0x57,0x2d,0x48,0x81,0xa4,0xb0 ;..W-H.$0
             B0
      00B2A3 FF 4A 22 0E 73 17 24  1151         .db     0xff,0x4a,0x22,0x0e,0x73,0x17,0x24,0x4c ;.J".s.$L
             4C
      00B2AB 60 80 88 A1 FF 0A 66  1152         .db     0x60,0x80,0x88,0xa1,0xff,0x0a,0x66,0x0e ;`..!..f.
             0E
      00B2B3 00 20 44 4C 68 70 A0  1153         .db     0x00,0x20,0x44,0x4c,0x68,0x70,0xa0,0xa8 ;. DLhp (
             A8
      00B2BB FF 2A 62 8E 12 52 16  1154         .db     0xff,0x2a,0x62,0x8e,0x12,0x52,0x16,0x56 ;.*b..R.V
             56
      00B2C3 01 40 65 90 A0 FF 2A  1155         .db     0x01,0x40,0x65,0x90,0xa0,0xff,0x2a,0x03 ;.@e. .*.
             03
      00B2CB 06 46 72 56 96 30 4C  1156         .db     0x06,0x46,0x72,0x56,0x96,0x30,0x4c,0x81 ;.FrV.0L.
             81
      00B2D3 A0 A8 FF 0A 22 62 4E  1157         .db     0xa0,0xa8,0xff,0x0a,0x22,0x62,0x4e,0x92 ; (.."bN.
             92
      00B2DB 36 96 0D 2C 70 85 A1  1158         .db     0x36,0x96,0x0d,0x2c,0x70,0x85,0xa1,0xff ;6..,p.!.
             FF
      00B2E3 0A 22 62 26 0F 16 76  1159         .db     0x0a,0x22,0x62,0x26,0x0f,0x16,0x76,0x00 ;."b&..v.
             00
      00B2EB 50 85 A4 FF 0A 66 2E  1160         .db     0x50,0x85,0xa4,0xff,0x0a,0x66,0x2e,0x00 ;P.$..f..
             00
      00B2F3 0C 20 41 68 70 A0 A8  1161         .db     0x0c,0x20,0x41,0x68,0x70,0xa0,0xa8,0xff ;. Ahp (.
             FF
      00B2FB 2A 22 82 26 86 6E 17  1162         .db     0x2a,0x22,0x82,0x26,0x86,0x6e,0x17,0x01 ;*".&.n..
             01
      00B303 2C 4C 60 90 A8 B0 FF  1163         .db     0x2c,0x4c,0x60,0x90,0xa8,0xb0,0xff,0x0a ;,L`.(0..
             0A
      00B30B 42 46 8E 20 49 69 81  1164         .db     0x42,0x46,0x8e,0x20,0x49,0x69,0x81,0xa1 ;BF. Ii.!
             A1
      00B313 FF 0A 62 66 2F 96 0C  1165         .db     0xff,0x0a,0x62,0x66,0x2f,0x96,0x0c,0x20 ;..bf/.. 
             20
      00B31B 30 41 70 88 A0 FF 0A  1166         .db     0x30,0x41,0x70,0x88,0xa0,0xff,0x0a,0x03 ;0Ap. ...
             03
      00B323 66 92 17 44 4C 6D 88  1167         .db     0x66,0x92,0x17,0x44,0x4c,0x6d,0x88,0xa1 ;f..DLm.!
             A1
      00B32B FF 0A 23 86 2F 12 77  1168         .db     0xff,0x0a,0x23,0x86,0x2f,0x12,0x77,0x00 ;..#./.w.
             00
      00B333 50 64 88 A9 FF 0A 0E  1169         .db     0x50,0x64,0x88,0xa9,0xff,0x0a,0x0e,0x52 ;Pd.)...R
             52
      00B33B 56 30 44 60 68 84 8C  1170         .db     0x56,0x30,0x44,0x60,0x68,0x84,0x8c,0xa9 ;V0D`h..)
             A9
      00B343 FF 0A 02 52 57 0D 30  1171         .db     0xff,0x0a,0x02,0x52,0x57,0x0d,0x30,0x61 ;...RW.0a
             61
      00B34B 89 A9 FF 0A 06 46 0E  1172         .db     0x89,0xa9,0xff,0x0a,0x06,0x46,0x0e,0x32 ;.)...F.2
             32
      00B353 92 56 96 10 48 6C 80  1173         .db     0x92,0x56,0x96,0x10,0x48,0x6c,0x80,0xa1 ;.V..Hl.!
             A1
      00B35B FF 0A 22 62 27 6E 33  1174         .db     0xff,0x0a,0x22,0x62,0x27,0x6e,0x33,0x16 ;.."b'n3.
             16
      00B363 56 00 0C 48 90 FF 0A  1175         .db     0x56,0x00,0x0c,0x48,0x90,0xff,0x0a,0x42 ;V..H...B
             42
      00B36B 82 37 0D 20 45 64 88  1176         .db     0x82,0x37,0x0d,0x20,0x45,0x64,0x88,0x90 ;.7. Ed..
             90
      00B373 AD FF 0A 06 46 8E 13  1177         .db     0xad,0xff,0x0a,0x06,0x46,0x8e,0x13,0x16 ;-...F...
             16
      00B37B 56 48 81 A4 B0 FF 4A  1178         .db     0x56,0x48,0x81,0xa4,0xb0,0xff,0x4a,0x22 ;VH.$0.J"
             22
      00B383 0E 73 16 01 24 4C 85  1179         .db     0x0e,0x73,0x16,0x01,0x24,0x4c,0x85,0xa0 ;.s..$L. 
             A0
      00B38B A8 FF 0A 22 82 46 8E  1180         .db     0xa8,0xff,0x0a,0x22,0x82,0x46,0x8e,0x72 ;(..".F.r
             72
      00B393 57 00 2D 49 68 84 B0  1181         .db     0x57,0x00,0x2d,0x49,0x68,0x84,0xb0,0xff ;W.-Ih.0.
             FF
      00B39B 4A 22 82 26 0E 4E 01  1182         .db     0x4a,0x22,0x82,0x26,0x0e,0x4e,0x01,0x50 ;J".&.N.P
             50
      00B3A3 60 84 8C A5 FF 0A 63  1183         .db     0x60,0x84,0x8c,0xa5,0xff,0x0a,0x63,0x0f ;`..%..c.
             0F
      00B3AB 52 56 96 00 10 30 41  1184         .db     0x52,0x56,0x96,0x00,0x10,0x30,0x41,0x68 ;RV...0Ah
             68
      00B3B3 A4 AC FF 0A 02 42 06  1185         .db     0xa4,0xac,0xff,0x0a,0x02,0x42,0x06,0x46 ;$,...B.F
             46
      00B3BB 8E 32 72 37 0D 68 80  1186         .db     0x8e,0x32,0x72,0x37,0x0d,0x68,0x80,0xa1 ;.2r7.h.!
             A1
      00B3C3 FF 4A 02 0E 6E 72 36  1187         .db     0xff,0x4a,0x02,0x0e,0x6e,0x72,0x36,0x04 ;.J..nr6.
             04
      00B3CB 10 24 4C 60 81 FF 2A  1188         .db     0x10,0x24,0x4c,0x60,0x81,0xff,0x2a,0x02 ;.$L`..*.
             02
      00B3D3 2F 72 16 76 04 0C 50  1189         .db     0x2f,0x72,0x16,0x76,0x04,0x0c,0x50,0x61 ;/r.v..Pa
             61
      00B3DB A4 FF 0A 03 67 6E 52  1190         .db     0xa4,0xff,0x0a,0x03,0x67,0x6e,0x52,0x17 ;$...gnR.
             17
      00B3E3 2C 45 90 AD FF 0A 22  1191         .db     0x2c,0x45,0x90,0xad,0xff,0x0a,0x22,0x26 ;,E.-.."&
             26
      00B3EB 86 0E 33 36 76 10 48  1192         .db     0x86,0x0e,0x33,0x36,0x76,0x10,0x48,0x61 ;..36v.Ha
             61
      00B3F3 88 A8 B0 FF 0A 42 6F  1193         .db     0x88,0xa8,0xb0,0xff,0x0a,0x42,0x6f,0x13 ;.(0..Bo.
             13
      00B3FB 36 20 45 64 80 B0 FF  1194         .db     0x36,0x20,0x45,0x64,0x80,0xb0,0xff,0x4a ;6 Ed.0.J
             4A
      00B403 82 12 16 56 00 21 60  1195         .db     0x82,0x12,0x16,0x56,0x00,0x21,0x60,0x88 ;...V.!`.
             88
      00B40B 90 AD FF 0A 63 46 86  1196         .db     0x90,0xad,0xff,0x0a,0x63,0x46,0x86,0x2f ;.-..cF./
             2F
      00B413 77 00 0C 20 50 A9 FF  1197         .db     0x77,0x00,0x0c,0x20,0x50,0xa9,0xff,0x0a ;w.. P)..
             0A
      00B41B 07 96 10 48 50 61 81  1198         .db     0x07,0x96,0x10,0x48,0x50,0x61,0x81,0xa0 ;...HPa. 
             A0
      00B423 A8 FF 0A 46 0F 72 00  1199         .db     0xa8,0xff,0x0a,0x46,0x0f,0x72,0x00,0x20 ;(..F.r. 
             20
      00B42B 50 68 85 A4 FF 4A 62  1200         .db     0x50,0x68,0x85,0xa4,0xff,0x4a,0x62,0x4e ;Ph.$.JbN
             4E
      00B433 36 96 04 20 28 40 70  1201         .db     0x36,0x96,0x04,0x20,0x28,0x40,0x70,0x85 ;6.. (@p.
             85
      00B43B A5 FF 0A 03 2E 6E 73  1202         .db     0xa5,0xff,0x0a,0x03,0x2e,0x6e,0x73,0x56 ;%....nsV
             56
      00B443 0D 44 61 A0 A8 FF 2A  1203         .db     0x0d,0x44,0x61,0xa0,0xa8,0xff,0x2a,0x42 ;.Da (.*B
             42
      00B44B 82 46 86 0E 12 52 37  1204         .db     0x82,0x46,0x86,0x0e,0x12,0x52,0x37,0x01 ;.F...R7.
             01
      00B453 20 68 8C FF 0A 82 06  1205         .db     0x20,0x68,0x8c,0xff,0x0a,0x82,0x06,0x6e ; h.....n
             6E
      00B45B 13 40 48 70 A4 AC FF  1206         .db     0x13,0x40,0x48,0x70,0xa4,0xac,0xff,0x4a ;.@Hp$,.J
             4A
      00B463 82 0E 4E 13 96 24 40  1207         .db     0x82,0x0e,0x4e,0x13,0x96,0x24,0x40,0x60 ;..N..$@`
             60
      00B46B 70 85 A8 FF 6A 06 46  1208         .db     0x70,0x85,0xa8,0xff,0x6a,0x06,0x46,0x32 ;p.(.j.F2
             32
      00B473 96 0C 28 48 6D 80 A1  1209         .db     0x96,0x0c,0x28,0x48,0x6d,0x80,0xa1,0xff ;..(Hm.!.
             FF
      00B47B 4A 23 06 46 4F 92 96  1210         .db     0x4a,0x23,0x06,0x46,0x4f,0x92,0x96,0x08 ;J#.FO...
             08
      00B483 10 28 70 80 A1 FF 2A  1211         .db     0x10,0x28,0x70,0x80,0xa1,0xff,0x2a,0x63 ;.(p.!.*c
             63
      00B48B 0F 32 37 40 64 6C 84  1212         .db     0x0f,0x32,0x37,0x40,0x64,0x6c,0x84,0x8c ;.27@dl..
             8C
      00B493 A5 FF 4A 22 82 06 0E  1213         .db     0xa5,0xff,0x4a,0x22,0x82,0x06,0x0e,0x4e ;%.J"...N
             4E
      00B49B 12 96 60 70 85 A8 FF  1214         .db     0x12,0x96,0x60,0x70,0x85,0xa8,0xff,0x0a ;..`p.(..
             0A
      00B4A3 63 32 36 76 10 20 41  1215         .db     0x63,0x32,0x36,0x76,0x10,0x20,0x41,0x6c ;c26v. Al
             6C
      00B4AB 8C A4 AC FF 2A 62 6F  1216         .db     0x8c,0xa4,0xac,0xff,0x2a,0x62,0x6f,0x12 ;.$,.*bo.
             12
      00B4B3 17 01 40 4C 64 A0 B0  1217         .db     0x17,0x01,0x40,0x4c,0x64,0xa0,0xb0,0xff ;..@Ld 0.
             FF
      00B4BB 4A 02 42 26 72 16 76  1218         .db     0x4a,0x02,0x42,0x26,0x72,0x16,0x76,0x05 ;J.B&r.v.
             05
      00B4C3 29 50 81 AD FF 0A 63  1219         .db     0x29,0x50,0x81,0xad,0xff,0x0a,0x63,0x86 ;)P.-..c.
             86
      00B4CB 32 36 76 10 20 41 6C  1220         .db     0x32,0x36,0x76,0x10,0x20,0x41,0x6c,0x8c ;26v. Al.
             8C
      00B4D3 A8 B0 FF 0A 42 86 8E  1221         .db     0xa8,0xb0,0xff,0x0a,0x42,0x86,0x8e,0x52 ;(0..B..R
             52
      00B4DB 16 56 00 2C 65 B0 FF  1222         .db     0x16,0x56,0x00,0x2c,0x65,0xb0,0xff,0x2a ;.V.,e0.*
             2A
      00B4E3 03 86 4E 16 04 2C 50  1223         .db     0x03,0x86,0x4e,0x16,0x04,0x2c,0x50,0x61 ;..N..,Pa
             61
      00B4EB 88 A8 B0 FF 4A 02 86  1224         .db     0x88,0xa8,0xb0,0xff,0x4a,0x02,0x86,0x0e ;.(0.J...
             0E
      00B4F3 92 37 24 40 60 6C 88  1225         .db     0x92,0x37,0x24,0x40,0x60,0x6c,0x88,0xff ;.7$@`l..
             FF
      00B4FB 0A 22 16 56 00 44 4C  1226         .db     0x0a,0x22,0x16,0x56,0x00,0x44,0x4c,0x60 ;.".V.DL`
             60
      00B503 68 80 88 A4 FF 0A 42  1227         .db     0x68,0x80,0x88,0xa4,0xff,0x0a,0x42,0x0e ;h..$..B.
             0E
      00B50B 6E 73 20 44 4C 64 80  1228         .db     0x6e,0x73,0x20,0x44,0x4c,0x64,0x80,0xa0 ;ns DLd. 
             A0
      00B513 FF 0A 03 86 6E 52 17  1229         .db     0xff,0x0a,0x03,0x86,0x6e,0x52,0x17,0x2c ;....nR.,
             2C
      00B51B 45 60 90 A8 B0 FF 0A  1230         .db     0x45,0x60,0x90,0xa8,0xb0,0xff,0x0a,0x22 ;E`.(0.."
             22
      00B523 6F 52 16 00 0C 2C 45  1231         .db     0x6f,0x52,0x16,0x00,0x0c,0x2c,0x45,0x90 ;oR...,E.
             90
      00B52B A1 FF 0A 22 62 86 53  1232         .db     0xa1,0xff,0x0a,0x22,0x62,0x86,0x53,0x00 ;!.."b.S.
             00
      00B533 2C 45 64 A9 FF 0A 06  1233         .db     0x2c,0x45,0x64,0xa9,0xff,0x0a,0x06,0x46 ;,Ed)...F
             46
      00B53B 0F 77 10 69 A0 A8 FF  1234         .db     0x0f,0x77,0x10,0x69,0xa0,0xa8,0xff,0x4a ;.w.i (.J
             4A
      00B543 02 62 67 92 17 05 40  1235         .db     0x02,0x62,0x67,0x92,0x17,0x05,0x40,0x6d ;.bg...@m
             6D
      00B54B 88 A8 FF 0A 42 0F 16  1236         .db     0x88,0xa8,0xff,0x0a,0x42,0x0f,0x16,0x00 ;.(..B...
             00
      00B553 20 44 50 64 6C 80 88  1237         .db     0x20,0x44,0x50,0x64,0x6c,0x80,0x88,0xff ; DPdl...
             FF
      00B55B 0A 22 0E 8E 56 00 30  1238         .db     0x0a,0x22,0x0e,0x8e,0x56,0x00,0x30,0x44 ;."..V.0D
             44
      00B563 4C 60 68 80 B0 FF 2A  1239         .db     0x4c,0x60,0x68,0x80,0xb0,0xff,0x2a,0x02 ;L`h.0.*.
             02
      00B56B 52 04 2C 40 60 68 80  1240         .db     0x52,0x04,0x2c,0x40,0x60,0x68,0x80,0xa1 ;R.,@`h.!
             A1
      00B573 FF 4A 02 46 4E 92 16  1241         .db     0xff,0x4a,0x02,0x46,0x4e,0x92,0x16,0x24 ;.J.FN..$
             24
      00B57B 2C 70 85 FF 4A 02 0E  1242         .db     0x2c,0x70,0x85,0xff,0x4a,0x02,0x0e,0x92 ;,p..J...
             92
      00B583 04 24 60 6C A1 FF 2A  1243         .db     0x04,0x24,0x60,0x6c,0xa1,0xff,0x2a,0x02 ;.$`l!.*.
             02
      00B58B 42 27 8E 53 16 04 0C  1244         .db     0x42,0x27,0x8e,0x53,0x16,0x04,0x0c,0x2c ;B'.S...,
             2C
      00B593 68 80 A0 FF 0A 46 0F  1245         .db     0x68,0x80,0xa0,0xff,0x0a,0x46,0x0f,0x53 ;h. ..F.S
             53
      00B59B 57 10 20 68 81 A0 A8  1246         .db     0x57,0x10,0x20,0x68,0x81,0xa0,0xa8,0xff ;W. h. (.
             FF
      00B5A3 2A 63 0F 57 40 64 84  1247         .db     0x2a,0x63,0x0f,0x57,0x40,0x64,0x84,0x8c ;*c.W@d..
             8C
      00B5AB A5 FF 2A 02 07 73 36  1248         .db     0xa5,0xff,0x2a,0x02,0x07,0x73,0x36,0x76 ;%.*..s6v
             76
      00B5B3 08 10 4C 81 A0 FF 4A  1249         .db     0x08,0x10,0x4c,0x81,0xa0,0xff,0x4a,0x82 ;..L. .J.
             82
      00B5BB 0F 16 76 04 24 50 60  1250         .db     0x0f,0x16,0x76,0x04,0x24,0x50,0x60,0x6c ;..v.$P`l
             6C
      00B5C3 85 A8 FF 0A 22 82 27  1251         .db     0x85,0xa8,0xff,0x0a,0x22,0x82,0x27,0x0e ;.(..".'.
             0E
      00B5CB 8E 12 37 00 49 68 84  1252         .db     0x8e,0x12,0x37,0x00,0x49,0x68,0x84,0xb0 ;..7.Ih.0
             B0
      00B5D3 FF 2A 43 6F 20 2C 4D  1253         .db     0xff,0x2a,0x43,0x6f,0x20,0x2c,0x4d,0x64 ;.*Co ,Md
             64
      00B5DB 84 90 A0 B0 FF 6A 22  1254         .db     0x84,0x90,0xa0,0xb0,0xff,0x6a,0x22,0x86 ;.. 0.j".
             86
      00B5E3 17 25 44 4C 60 8D A8  1255         .db     0x17,0x25,0x44,0x4c,0x60,0x8d,0xa8,0xb0 ;.%DL`.(0
             B0
      00B5EB FF 2A 42 46 17 01 20  1256         .db     0xff,0x2a,0x42,0x46,0x17,0x01,0x20,0x68 ;.*BF.. h
             68
      00B5F3 70 80 88 A0 FF 4A 26  1257         .db     0x70,0x80,0x88,0xa0,0xff,0x4a,0x26,0x6e ;p.. .J&n
             6E
      00B5FB 57 04 0C 28 30 4C 81  1258         .db     0x57,0x04,0x0c,0x28,0x30,0x4c,0x81,0xff ;W..(0L..
             FF
      00B603 6A 02 27 0E 52 56 96  1259         .db     0x6a,0x02,0x27,0x0e,0x52,0x56,0x96,0x04 ;j.'.RV..
             04
      00B60B 10 30 48 80 A1 FF 2A  1260         .db     0x10,0x30,0x48,0x80,0xa1,0xff,0x2a,0x63 ;.0H.!.*c
             63
      00B613 06 2E 6E 17 08 40 70  1261         .db     0x06,0x2e,0x6e,0x17,0x08,0x40,0x70,0x84 ;..n..@p.
             84
      00B61B 90 A5 FF 0A 03 26 6F  1262         .db     0x90,0xa5,0xff,0x0a,0x03,0x26,0x6f,0x57 ;.%...&oW
             57
      00B623 0D 2D 49 60 80 B0 FF  1263         .db     0x0d,0x2d,0x49,0x60,0x80,0xb0,0xff,0x0a ;.-I`.0..
             0A
      00B62B 82 06 4E 8E 52 16 2C  1264         .db     0x82,0x06,0x4e,0x8e,0x52,0x16,0x2c,0x41 ;..N.R.,A
             41
      00B633 60 90 A4 B0 FF 4A 46  1265         .db     0x60,0x90,0xa4,0xb0,0xff,0x4a,0x46,0x92 ;`.$0.JF.
             92
      00B63B 36 76 0D 21 6C 81 A1  1266         .db     0x36,0x76,0x0d,0x21,0x6c,0x81,0xa1,0xff ;6v.!l.!.
             FF
      00B643 4A 22 82 4E 73 76 25  1267         .db     0x4a,0x22,0x82,0x4e,0x73,0x76,0x25,0x50 ;J".Nsv%P
             50
      00B64B 60 85 A5 FF 0A 42 46  1268         .db     0x60,0x85,0xa5,0xff,0x0a,0x42,0x46,0x20 ;`.%..BF 
             20
      00B653 68 70 80 88 A0 FF 0A  1269         .db     0x68,0x70,0x80,0x88,0xa0,0xff,0x0a,0x62 ;hp.. ..b
             62
      00B65B 66 4E 8E 16 0C 2C 41  1270         .db     0x66,0x4e,0x8e,0x16,0x0c,0x2c,0x41,0x90 ;fN...,A.
             90
      00B663 A4 B0 FF 6A 22 86 12  1271         .db     0xa4,0xb0,0xff,0x6a,0x22,0x86,0x12,0x52 ;$0.j"..R
             52
      00B66B 16 01 44 60 8C A8 B0  1272         .db     0x16,0x01,0x44,0x60,0x8c,0xa8,0xb0,0xff ;..D`.(0.
             FF
      00B673 0A 06 0E 4E 52 92 56  1273         .db     0x0a,0x06,0x0e,0x4e,0x52,0x92,0x56,0x96 ;...NR.V.
             96
      00B67B 10 30 85 A4 FF 0A 22  1274         .db     0x10,0x30,0x85,0xa4,0xff,0x0a,0x22,0x26 ;.0.$.."&
             26
      00B683 66 0E 53 00 30 48 68  1275         .db     0x66,0x0e,0x53,0x00,0x30,0x48,0x68,0x88 ;f.S.0Hh.
             88
      00B68B A0 FF 0A 82 86 13 20  1276         .db     0xa0,0xff,0x0a,0x82,0x86,0x13,0x20,0x41 ; ..... A
             41
      00B693 8C A8 B0 FF 0A 42 82  1277         .db     0x8c,0xa8,0xb0,0xff,0x0a,0x42,0x82,0x4e ;.(0..B.N
             4E
      00B69B 32 16 0C 20 44 70 89  1278         .db     0x32,0x16,0x0c,0x20,0x44,0x70,0x89,0xff ;2.. Dp..
             FF
      00B6A3 0A 42 82 06 86 4F 36  1279         .db     0x0a,0x42,0x82,0x06,0x86,0x4f,0x36,0x96 ;.B...O6.
             96
      00B6AB 10 2C 44 70 A9 FF 0A  1280         .db     0x10,0x2c,0x44,0x70,0xa9,0xff,0x0a,0x02 ;.,Dp)...
             02
      00B6B3 42 8E 52 92 36 76 0C  1281         .db     0x42,0x8e,0x52,0x92,0x36,0x76,0x0c,0x2c ;B.R.6v.,
             2C
      00B6BB 48 68 81 A1 FF 2A 02  1282         .db     0x48,0x68,0x81,0xa1,0xff,0x2a,0x02,0x62 ;Hh.!.*.b
             62
      00B6C3 2F 12 96 40 50 70 85  1283         .db     0x2f,0x12,0x96,0x40,0x50,0x70,0x85,0xa4 ;/..@Pp.$
             A4
      00B6CB AC FF 0A 42 16 20 44  1284         .db     0xac,0xff,0x0a,0x42,0x16,0x20,0x44,0x4c ;,..B. DL
             4C
      00B6D3 64 6C 80 A0 A8 FF 4A  1285         .db     0x64,0x6c,0x80,0xa0,0xa8,0xff,0x4a,0x02 ;dl. (.J.
             02
      00B6DB 06 92 36 08 10 29 4C  1286         .db     0x06,0x92,0x36,0x08,0x10,0x29,0x4c,0x70 ;..6..)Lp
             70
      00B6E3 81 A0 FF 4A 82 0F 53  1287         .db     0x81,0xa0,0xff,0x4a,0x82,0x0f,0x53,0x56 ;. .J..SV
             56
      00B6EB 96 30 60 85 A4 FF 0A  1288         .db     0x96,0x30,0x60,0x85,0xa4,0xff,0x0a,0x43 ;.0`.$..C
             43
      00B6F3 67 32 0D 20 45 6C 8C  1289         .db     0x67,0x32,0x0d,0x20,0x45,0x6c,0x8c,0xa9 ;g2. El.)
             A9
      00B6FB FF 0A 42 0E 20 44 4C  1290         .db     0xff,0x0a,0x42,0x0e,0x20,0x44,0x4c,0x80 ;..B. DL.
             80
      00B703 88 A0 A8 FF 0A 63 2E  1291         .db     0x88,0xa0,0xa8,0xff,0x0a,0x63,0x2e,0x53 ;. (..c.S
             53
      00B70B 57 00 0C 30 41 68 A4  1292         .db     0x57,0x00,0x0c,0x30,0x41,0x68,0xa4,0xac ;W..0Ah$,
             AC
      00B713 FF 0A 23 8E 33 00 0C  1293         .db     0xff,0x0a,0x23,0x8e,0x33,0x00,0x0c,0x45 ;..#.3..E
             45
      00B71B 68 90 A0 FF 4A 02 0F  1294         .db     0x68,0x90,0xa0,0xff,0x4a,0x02,0x0f,0x92 ;h. .J...
             92
      00B723 37 24 60 6C 80 A1 FF  1295         .db     0x37,0x24,0x60,0x6c,0x80,0xa1,0xff,0x4a ;7$`l.!.J
             4A
      00B72B 2F 72 16 00 08 21 50  1296         .db     0x2f,0x72,0x16,0x00,0x08,0x21,0x50,0x85 ;/r...!P.
             85
      00B733 A4 FF 0A 22 66 2E 73  1297         .db     0xa4,0xff,0x0a,0x22,0x66,0x2e,0x73,0x56 ;$.."f.sV
             56
      00B73B 96 0D 30 44 68 88 A1  1298         .db     0x96,0x0d,0x30,0x44,0x68,0x88,0xa1,0xff ;..0Dh.!.
             FF
      00B743 0A 43 0E 32 72 36 10  1299         .db     0x0a,0x43,0x0e,0x32,0x72,0x36,0x10,0x20 ;.C.2r6. 
             20
      00B74B 44 64 88 A0 FF 0A 82  1300         .db     0x44,0x64,0x88,0xa0,0xff,0x0a,0x82,0x2f ;Dd. .../
             2F
      00B753 52 57 0D 20 30 41 88  1301         .db     0x52,0x57,0x0d,0x20,0x30,0x41,0x88,0xa5 ;RW. 0A.%
             A5
      00B75B FF 0A 03 06 2E 77 0D  1302         .db     0xff,0x0a,0x03,0x06,0x2e,0x77,0x0d,0x44 ;.....w.D
             44
      00B763 60 68 A0 FF 2A 63 06  1303         .db     0x60,0x68,0xa0,0xff,0x2a,0x63,0x06,0x86 ;`h .*c..
             86
      00B76B 52 56 96 08 10 2D 40  1304         .db     0x52,0x56,0x96,0x08,0x10,0x2d,0x40,0x64 ;RV...-@d
             64
      00B773 A9 FF 2A 02 42 26 6E  1305         .db     0xa9,0xff,0x2a,0x02,0x42,0x26,0x6e,0x92 ;).*.B&n.
             92
      00B77B 36 96 04 4C 70 81 A4  1306         .db     0x36,0x96,0x04,0x4c,0x70,0x81,0xa4,0xff ;6..Lp.$.
             FF
      00B783 6A 03 06 66 2E 92 77  1307         .db     0x6a,0x03,0x06,0x66,0x2e,0x92,0x77,0x09 ;j..f..w.
             09
      00B78B 30 44 6C A1 FF 2A 02  1308         .db     0x30,0x44,0x6c,0xa1,0xff,0x2a,0x02,0x42 ;0Dl!.*.B
             42
      00B793 07 73 16 56 09 4C 64  1309         .db     0x07,0x73,0x16,0x56,0x09,0x4c,0x64,0x80 ;.s.V.Ld.
             80
      00B79B FF 4A 42 06 46 4F 36  1310         .db     0xff,0x4a,0x42,0x06,0x46,0x4f,0x36,0x96 ;.JB.FO6.
             96
      00B7A3 08 10 70 81 FF 0A 42  1311         .db     0x08,0x10,0x70,0x81,0xff,0x0a,0x42,0x0f ;..p...B.
             0F
      00B7AB 53 56 10 20 44 65 81  1312         .db     0x53,0x56,0x10,0x20,0x44,0x65,0x81,0xa0 ;SV. De. 
             A0
      00B7B3 A8 FF 4A 0F 72 16 76  1313         .db     0xa8,0xff,0x4a,0x0f,0x72,0x16,0x76,0x01 ;(.J.r.v.
             01
      00B7BB 24 50 85 FF 0A 42 0E  1314         .db     0x24,0x50,0x85,0xff,0x0a,0x42,0x0e,0x00 ;$P...B..
             00
      00B7C3 10 20 44 64 6C 80 88  1315         .db     0x10,0x20,0x44,0x64,0x6c,0x80,0x88,0xa0 ;. Ddl.. 
             A0
      00B7CB FF 0A 82 2E 8E 16 0C  1316         .db     0xff,0x0a,0x82,0x2e,0x8e,0x16,0x0c,0x41 ;.......A
             41
      00B7D3 60 68 90 A4 FF 0A 22  1317         .db     0x60,0x68,0x90,0xa4,0xff,0x0a,0x22,0x76 ;`h.$.."v
             76
      00B7DB 00 2D 48 50 60 68 81  1318         .db     0x00,0x2d,0x48,0x50,0x60,0x68,0x81,0xa0 ;.-HP`h. 
             A0
      00B7E3 A8 FF 0A 23 67 52 57  1319         .db     0xa8,0xff,0x0a,0x23,0x67,0x52,0x57,0x00 ;(..#gRW.
             00
      00B7EB 0C 2D 45 68 8C AD FF  1320         .db     0x0c,0x2d,0x45,0x68,0x8c,0xad,0xff,0x0a ;.-Eh.-..
             0A
      00B7F3 23 0E 4E 53 57 00 30  1321         .db     0x23,0x0e,0x4e,0x53,0x57,0x00,0x30,0x64 ;#.NSW.0d
             64
      00B7FB 85 A5 FF 0A 43 0E 6E  1322         .db     0x85,0xa5,0xff,0x0a,0x43,0x0e,0x6e,0x32 ;.%..C.n2
             32
      00B803 17 20 45 90 A0 A8 FF  1323         .db     0x17,0x20,0x45,0x90,0xa0,0xa8,0xff,0x2a ;. E. (.*
             2A
      00B80B 63 0E 4E 04 10 20 40  1324         .db     0x63,0x0e,0x4e,0x04,0x10,0x20,0x40,0x64 ;c.N.. @d
             64
      00B813 84 8C A5 FF 6A 02 42  1325         .db     0x84,0x8c,0xa5,0xff,0x6a,0x02,0x42,0x27 ;..%.j.B'
             27
      00B81B 0E 6E 92 17 04 48 70  1326         .db     0x0e,0x6e,0x92,0x17,0x04,0x48,0x70,0xa5 ;.n...Hp%
             A5
      00B823 FF 2A 22 62 0F 73 77  1327         .db     0xff,0x2a,0x22,0x62,0x0f,0x73,0x77,0x50 ;.*"b.swP
             50
      00B82B 85 A5 FF 4A 82 0E 16  1328         .db     0x85,0xa5,0xff,0x4a,0x82,0x0e,0x16,0x56 ;.%.J...V
             56
      00B833 01 21 60 88 90 AD FF  1329         .db     0x01,0x21,0x60,0x88,0x90,0xad,0xff,0x2a ;.!`..-.*
             2A
      00B83B 42 82 2E 8E 12 52 16  1330         .db     0x42,0x82,0x2e,0x8e,0x12,0x52,0x16,0x56 ;B....R.V
             56
      00B843 05 20 68 90 B0 FF 2A  1331         .db     0x05,0x20,0x68,0x90,0xb0,0xff,0x2a,0x02 ;. h.0.*.
             02
      00B84B 42 07 2E 52 92 56 96  1332         .db     0x42,0x07,0x2e,0x52,0x92,0x56,0x96,0x08 ;B..R.V..
             08
      00B853 10 30 81 FF 0A 03 66  1333         .db     0x10,0x30,0x81,0xff,0x0a,0x03,0x66,0x6f ;.0....fo
             6F
      00B85B 36 0D 2C 45 90 A0 FF  1334         .db     0x36,0x0d,0x2c,0x45,0x90,0xa0,0xff,0x2a ;6.,E. .*
             2A
      00B863 42 0E 92 77 01 20 4D  1335         .db     0x42,0x0e,0x92,0x77,0x01,0x20,0x4d,0x64 ;B..w. Md
             64
      00B86B 6C A0 FF 0A 22 62 46  1336         .db     0x6c,0xa0,0xff,0x0a,0x22,0x62,0x46,0x86 ;l .."bF.
             86
      00B873 53 77 00 2C 48 88 A9  1337         .db     0x53,0x77,0x00,0x2c,0x48,0x88,0xa9,0xff ;Sw.,H.).
             FF
      00B87B 2A 02 42 06 86 2F 72  1338         .db     0x2a,0x02,0x42,0x06,0x86,0x2f,0x72,0x16 ;*.B../r.
             16
      00B883 76 09 50 64 88 AC FF  1339         .db     0x76,0x09,0x50,0x64,0x88,0xac,0xff,0x0a ;v.Pd.,..
             0A
      00B88B 02 42 52 2C 45 64 81  1340         .db     0x02,0x42,0x52,0x2c,0x45,0x64,0x81,0xa0 ;.BR,Ed. 
             A0
      00B893 FF 0A 42 46 0F 57 10  1341         .db     0xff,0x0a,0x42,0x46,0x0f,0x57,0x10,0x20 ;..BF.W. 
             20
      00B89B 69 81 A0 A8 FF 6A 22  1342         .db     0x69,0x81,0xa0,0xa8,0xff,0x6a,0x22,0x86 ;i. (.j".
             86
      00B8A3 0F 76 01 30 44 50 60  1343         .db     0x0f,0x76,0x01,0x30,0x44,0x50,0x60,0x8c ;.v.0DP`.
             8C
      00B8AB A8 B0 FF 0A 22 62 0F  1344         .db     0xa8,0xb0,0xff,0x0a,0x22,0x62,0x0f,0x92 ;(0.."b..
             92
      00B8B3 44 50 65 88 A0 FF 2A  1345         .db     0x44,0x50,0x65,0x88,0xa0,0xff,0x2a,0x66 ;DPe. .*f
             66
      00B8BB 8E 92 36 40 4C 68 70  1346         .db     0x8e,0x92,0x36,0x40,0x4c,0x68,0x70,0xa1 ;..6@Lhp!
             A1
      00B8C3 FF 2A 02 42 6F 12 36  1347         .db     0xff,0x2a,0x02,0x42,0x6f,0x12,0x36,0x05 ;.*.Bo.6.
             05
      00B8CB 4C 64 80 90 A1 FF 4A  1348         .db     0x4c,0x64,0x80,0x90,0xa1,0xff,0x4a,0x03 ;Ld..!.J.
             03
      00B8D3 73 04 24 2C 4C 81 A0  1349         .db     0x73,0x04,0x24,0x2c,0x4c,0x81,0xa0,0xa8 ;s.$,L. (
             A8
      00B8DB FF 4A 06 46 12 96 28  1350         .db     0xff,0x4a,0x06,0x46,0x12,0x96,0x28,0x4d ;.J.F..(M
             4D
      00B8E3 70 81 A0 A8 FF 2A 62  1351         .db     0x70,0x81,0xa0,0xa8,0xff,0x2a,0x62,0x2e ;p. (.*b.
             2E
      00B8EB 8E 32 16 56 04 0C 20  1352         .db     0x8e,0x32,0x16,0x56,0x04,0x0c,0x20,0x40 ;.2.V.. @
             40
      00B8F3 65 84 B0 FF 2A 62 66  1353         .db     0x65,0x84,0xb0,0xff,0x2a,0x62,0x66,0x52 ;e.0.*bfR
             52
      00B8FB 92 16 56 01 2C 40 68  1354         .db     0x92,0x16,0x56,0x01,0x2c,0x40,0x68,0xa0 ;..V.,@h 
             A0
      00B903 A8 FF 0A 03 92 17 0C  1355         .db     0xa8,0xff,0x0a,0x03,0x92,0x17,0x0c,0x44 ;(......D
             44
      00B90B 4C 80 A0 A8 FF 0A 42  1356         .db     0x4c,0x80,0xa0,0xa8,0xff,0x0a,0x42,0x26 ;L. (..B&
             26
      00B913 6F 92 17 00 0C 2C 49  1357         .db     0x6f,0x92,0x17,0x00,0x0c,0x2c,0x49,0x64 ;o....,Id
             64
      00B91B 84 A1 FF 0A 42 82 46  1358         .db     0x84,0xa1,0xff,0x0a,0x42,0x82,0x46,0x86 ;.!..B.F.
             86
      00B923 12 72 36 00 20 49 68  1359         .db     0x12,0x72,0x36,0x00,0x20,0x49,0x68,0x88 ;.r6. Ih.
             88
      00B92B AC FF 2A 03 72 56 04  1360         .db     0xac,0xff,0x2a,0x03,0x72,0x56,0x04,0x0c ;,.*.rV..
             0C
      00B933 30 4C 61 81 A1 FF 0A  1361         .db     0x30,0x4c,0x61,0x81,0xa1,0xff,0x0a,0x82 ;0La.!...
             82
      00B93B 4F 00 0C 2D 41 60 70  1362         .db     0x4f,0x00,0x0c,0x2d,0x41,0x60,0x70,0x84 ;O..-A`p.
             84
      00B943 90 A5 FF 0A 02 07 0E  1363         .db     0x90,0xa5,0xff,0x0a,0x02,0x07,0x0e,0x32 ;.%.....2
             32
      00B94B 57 10 48 84 8C A4 B0  1364         .db     0x57,0x10,0x48,0x84,0x8c,0xa4,0xb0,0xff ;W.H..$0.
             FF
      00B953 4A 03 86 2F 13 05 60  1365         .db     0x4a,0x03,0x86,0x2f,0x13,0x05,0x60,0x70 ;J../..`p
             70
      00B95B 88 90 A9 FF 0A 23 6E  1366         .db     0x88,0x90,0xa9,0xff,0x0a,0x23,0x6e,0x13 ;..)..#n.
             13
      00B963 17 00 45 70 90 A0 FF  1367         .db     0x17,0x00,0x45,0x70,0x90,0xa0,0xff,0x2a ;..Ep. .*
             2A
      00B96B 63 4E 53 56 01 2D 40  1368         .db     0x63,0x4e,0x53,0x56,0x01,0x2d,0x40,0x64 ;cNSV.-@d
             64
      00B973 84 A4 AC FF 0A 23 06  1369         .db     0x84,0xa4,0xac,0xff,0x0a,0x23,0x06,0x46 ;.$,..#.F
             46
      00B97B 8E 32 72 16 56 0C 68  1370         .db     0x8e,0x32,0x72,0x16,0x56,0x0c,0x68,0x80 ;.2r.V.h.
             80
      00B983 A1 FF 0A 02 42 06 6E  1371         .db     0xa1,0xff,0x0a,0x02,0x42,0x06,0x6e,0x32 ;!...B.n2
             32
      00B98B 17 45 64 80 90 AD FF  1372         .db     0x17,0x45,0x64,0x80,0x90,0xad,0xff,0x4a ;.Ed..-.J
             4A
      00B993 02 06 32 92 77 08 10  1373         .db     0x02,0x06,0x32,0x92,0x77,0x08,0x10,0x28 ;..2.w..(
             28
      00B99B 40 6C A1 FF 2A 43 06  1374         .db     0x40,0x6c,0xa1,0xff,0x2a,0x43,0x06,0x2f ;@l!.*C./
             2F
      00B9A3 72 76 08 50 85 A5 FF  1375         .db     0x72,0x76,0x08,0x50,0x85,0xa5,0xff,0x4a ;rv.P.%.J
             4A
      00B9AB 42 82 0E 92 16 00 21  1376         .db     0x42,0x82,0x0e,0x92,0x16,0x00,0x21,0x6c ;B.....!l
             6C
      00B9B3 88 A5 FF 2A 03 06 46  1377         .db     0x88,0xa5,0xff,0x2a,0x03,0x06,0x46,0x72 ;.%.*..Fr
             72
      00B9BB 16 09 50 81 A0 A8 FF  1378         .db     0x16,0x09,0x50,0x81,0xa0,0xa8,0xff,0x2a ;..P. (.*
             2A
      00B9C3 02 42 2E 8E 53 16 04  1379         .db     0x02,0x42,0x2e,0x8e,0x53,0x16,0x04,0x0c ;.B..S...
             0C
      00B9CB 65 80 A0 B0 FF 0A 26  1380         .db     0x65,0x80,0xa0,0xb0,0xff,0x0a,0x26,0x66 ;e. 0..&f
             66
      00B9D3 0E 52 57 00 30 48 68  1381         .db     0x0e,0x52,0x57,0x00,0x30,0x48,0x68,0x8c ;.RW.0Hh.
             8C
      00B9DB AD FF 2A 43 0F 73 77  1382         .db     0xad,0xff,0x2a,0x43,0x0f,0x73,0x77,0x50 ;-.*C.swP
             50
      00B9E3 68 85 A8 FF 4A 02 42  1383         .db     0x68,0x85,0xa8,0xff,0x4a,0x02,0x42,0x07 ;h.(.J.B.
             07
      00B9EB 12 96 08 28 6D 81 A0  1384         .db     0x12,0x96,0x08,0x28,0x6d,0x81,0xa0,0xa8 ;...(m. (
             A8
      00B9F3 FF 2A 43 4F 16 76 01  1385         .db     0xff,0x2a,0x43,0x4f,0x16,0x76,0x01,0x20 ;.*CO.v. 
             20
      00B9FB 2C 50 64 A0 FF 0A 22  1386         .db     0x2c,0x50,0x64,0xa0,0xff,0x0a,0x22,0x62 ;,Pd .."b
             62
      00BA03 0E 6E 33 37 00 10 45  1387         .db     0x0e,0x6e,0x33,0x37,0x00,0x10,0x45,0x84 ;.n37..E.
             84
      00BA0B A9 FF 2A 62 06 2F 72  1388         .db     0xa9,0xff,0x2a,0x62,0x06,0x2f,0x72,0x56 ;).*b./rV
             56
      00BA13 96 08 10 30 85 A4 FF  1389         .db     0x96,0x08,0x10,0x30,0x85,0xa4,0xff,0x0a ;...0.$..
             0A
      00BA1B 42 82 46 32 37 00 10  1390         .db     0x42,0x82,0x46,0x32,0x37,0x00,0x10,0x20 ;B.F27.. 
             20
      00BA23 48 69 84 FF 0A 02 62  1391         .db     0x48,0x69,0x84,0xff,0x0a,0x02,0x62,0x86 ;Hi....b.
             86
      00BA2B 33 0C 40 48 64 A9 FF  1392         .db     0x33,0x0c,0x40,0x48,0x64,0xa9,0xff,0x0a ;3.@Hd)..
             0A
      00BA33 22 53 96 00 2D 44 64  1393         .db     0x22,0x53,0x96,0x00,0x2d,0x44,0x64,0x80 ;"S..-Dd.
             80
      00BA3B 88 A9 FF 0A 23 66 8E  1394         .db     0x88,0xa9,0xff,0x0a,0x23,0x66,0x8e,0x33 ;.)..#f.3
             33
      00BA43 36 00 0C 45 68 B0 FF  1395         .db     0x36,0x00,0x0c,0x45,0x68,0xb0,0xff,0x2a ;6..Eh0.*
             2A
      00BA4B 42 06 2E 6E 92 96 08  1396         .db     0x42,0x06,0x2e,0x6e,0x92,0x96,0x08,0x10 ;B..n....
             10
      00BA53 64 70 81 A5 FF 2A 63  1397         .db     0x64,0x70,0x81,0xa5,0xff,0x2a,0x63,0x8e ;dp.%.*c.
             8E
      00BA5B 52 17 01 20 2C 40 68  1398         .db     0x52,0x17,0x01,0x20,0x2c,0x40,0x68,0x90 ;R.. ,@h.
             90
      00BA63 FF 0A 63 32 36 0D 20  1399         .db     0xff,0x0a,0x63,0x32,0x36,0x0d,0x20,0x41 ;..c26. A
             41
      00BA6B 6C 8C A4 AC FF 0A 86  1400         .db     0x6c,0x8c,0xa4,0xac,0xff,0x0a,0x86,0x53 ;l.$,...S
             53
      00BA73 57 00 2D 40 48 88 A9  1401         .db     0x57,0x00,0x2d,0x40,0x48,0x88,0xa9,0xff ;W.-@H.).
             FF
      00BA7B 0A 22 62 26 86 6E 17  1402         .db     0x0a,0x22,0x62,0x26,0x86,0x6e,0x17,0x0c ;."b&.n..
             0C
      00BA83 49 64 70 90 AD FF 2A  1403         .db     0x49,0x64,0x70,0x90,0xad,0xff,0x2a,0x43 ;Idp.-.*C
             43
      00BA8B 46 0E 73 16 56 01 20  1404         .db     0x46,0x0e,0x73,0x16,0x56,0x01,0x20,0x4c ;F.s.V. L
             4C
      00BA93 68 A0 FF 0A 06 46 8E  1405         .db     0x68,0xa0,0xff,0x0a,0x06,0x46,0x8e,0x56 ;h ...F.V
             56
      00BA9B 96 2D 68 81 A1 FF 4A  1406         .db     0x96,0x2d,0x68,0x81,0xa1,0xff,0x4a,0x03 ;.-h.!.J.
             03
      00BAA3 6E 72 17 04 24 2C 4C  1407         .db     0x6e,0x72,0x17,0x04,0x24,0x2c,0x4c,0x81 ;nr..$,L.
             81
      00BAAB A1 FF 0A 03 07 6E 36  1408         .db     0xa1,0xff,0x0a,0x03,0x07,0x6e,0x36,0x76 ;!....n6v
             76
      00BAB3 0D 48 60 81 A1 FF 0A  1409         .db     0x0d,0x48,0x60,0x81,0xa1,0xff,0x0a,0x66 ;.H`.!..f
             66
      00BABB 32 0C 40 48 69 A0 A8  1410         .db     0x32,0x0c,0x40,0x48,0x69,0xa0,0xa8,0xff ;2.@Hi (.
             FF
      00BAC3 0A 42 0E 00 20 64 6C  1411         .db     0x0a,0x42,0x0e,0x00,0x20,0x64,0x6c,0x80 ;.B.. dl.
             80
      00BACB 88 A0 A8 FF 4A 03 46  1412         .db     0x88,0xa0,0xa8,0xff,0x4a,0x03,0x46,0x8e ;. (.J.F.
             8E
      00BAD3 12 36 76 05 25 4C 6C  1413         .db     0x12,0x36,0x76,0x05,0x25,0x4c,0x6c,0x81 ;.6v.%Ll.
             81
      00BADB A1 FF 0A 22 26 86 6E  1414         .db     0xa1,0xff,0x0a,0x22,0x26,0x86,0x6e,0x17 ;!.."&.n.
             17
      00BAE3 0C 49 64 70 90 AD FF  1415         .db     0x0c,0x49,0x64,0x70,0x90,0xad,0xff,0x0a ;.Idp.-..
             0A
      00BAEB 22 26 52 92 57 00 0C  1416         .db     0x22,0x26,0x52,0x92,0x57,0x00,0x0c,0x2d ;"&R.W..-
             2D
      00BAF3 48 60 80 A0 FF 0A 03  1417         .db     0x48,0x60,0x80,0xa0,0xff,0x0a,0x03,0x07 ;H`. ....
             07
      00BAFB 0E 52 57 10 48 60 80  1418         .db     0x0e,0x52,0x57,0x10,0x48,0x60,0x80,0x8c ;.RW.H`..
             8C
      00BB03 A1 FF 0A 42 0E 73 16  1419         .db     0xa1,0xff,0x0a,0x42,0x0e,0x73,0x16,0x56 ;!..B.s.V
             56
      00BB0B 00 20 44 4C 64 80 FF  1420         .db     0x00,0x20,0x44,0x4c,0x64,0x80,0xff,0x0a ;. DLd...
             0A
      00BB13 02 42 06 0E 6E 92 36  1421         .db     0x02,0x42,0x06,0x0e,0x6e,0x92,0x36,0x96 ;.B..n.6.
             96
      00BB1B 44 4C 64 70 80 A0 FF  1422         .db     0x44,0x4c,0x64,0x70,0x80,0xa0,0xff,0x2a ;DLdp. .*
             2A
      00BB23 63 2E 8E 32 16 04 0C  1423         .db     0x63,0x2e,0x8e,0x32,0x16,0x04,0x0c,0x40 ;c..2...@
             40
      00BB2B 69 84 B0 FF 0A 02 62  1424         .db     0x69,0x84,0xb0,0xff,0x0a,0x02,0x62,0x8e ;i.0...b.
             8E
      00BB33 53 56 96 30 40 48 68  1425         .db     0x53,0x56,0x96,0x30,0x40,0x48,0x68,0xa1 ;SV.0@Hh!
             A1
      00BB3B FF 0A 46 86 0E 53 00  1426         .db     0xff,0x0a,0x46,0x86,0x0e,0x53,0x00,0x10 ;..F..S..
             10
      00BB43 30 48 88 A9 FF 0A 82  1427         .db     0x30,0x48,0x88,0xa9,0xff,0x0a,0x82,0x6e ;0H.)...n
             6E
      00BB4B 13 16 96 00 20 40 48  1428         .db     0x13,0x16,0x96,0x00,0x20,0x40,0x48,0x70 ;.... @Hp
             70
      00BB53 A5 FF 0A 42 86 8E 52  1429         .db     0xa5,0xff,0x0a,0x42,0x86,0x8e,0x52,0x16 ;%..B..R.
             16
      00BB5B 56 00 0C 2C 65 90 FF  1430         .db     0x56,0x00,0x0c,0x2c,0x65,0x90,0xff,0x0a ;V..,e...
             0A
      00BB63 22 62 26 53 16 00 2C  1431         .db     0x22,0x62,0x26,0x53,0x16,0x00,0x2c,0x48 ;"b&S..,H
             48
      00BB6B 64 84 FF 0A 43 92 16  1432         .db     0x64,0x84,0xff,0x0a,0x43,0x92,0x16,0x20 ;d...C.. 
             20
      00BB73 44 4C 6C A0 A8 FF 0A  1433         .db     0x44,0x4c,0x6c,0xa0,0xa8,0xff,0x0a,0x63 ;DLl (..c
             63
      00BB7B 86 2E 6E 32 00 0C 41  1434         .db     0x86,0x2e,0x6e,0x32,0x00,0x0c,0x41,0x70 ;..n2..Ap
             70
      00BB83 A9 FF 0A 22 6E 52 36  1435         .db     0xa9,0xff,0x0a,0x22,0x6e,0x52,0x36,0x00 ;).."nR6.
             00
      00BB8B 0C 2C 45 61 90 FF 0A  1436         .db     0x0c,0x2c,0x45,0x61,0x90,0xff,0x0a,0x42 ;.,Ea...B
             42
      00BB93 66 32 17 0C 20 45 68  1437         .db     0x66,0x32,0x17,0x0c,0x20,0x45,0x68,0x70 ;f2.. Ehp
             70
      00BB9B A1 FF 0A 42 82 47 8E  1438         .db     0xa1,0xff,0x0a,0x42,0x82,0x47,0x8e,0x52 ;!..B.G.R
             52
      00BBA3 20 2C 48 90 A4 FF 4A  1439         .db     0x20,0x2c,0x48,0x90,0xa4,0xff,0x4a,0x82 ; ,H.$.J.
             82
      00BBAB 06 16 56 08 29 60 88  1440         .db     0x06,0x16,0x56,0x08,0x29,0x60,0x88,0x90 ;..V.)`..
             90
      00BBB3 AD FF 4A 46 0E 92 36  1441         .db     0xad,0xff,0x4a,0x46,0x0e,0x92,0x36,0x76 ;-.JF..6v
             76
      00BBBB 00 10 21 6C A5 FF 0A  1442         .db     0x00,0x10,0x21,0x6c,0xa5,0xff,0x0a,0x82 ;..!l%...
             82
      00BBC3 07 2E 6E 77 0D 50 60  1443         .db     0x07,0x2e,0x6e,0x77,0x0d,0x50,0x60,0x84 ;..nw.P`.
             84
      00BBCB A5 FF 0A 07 8E 33 0C  1444         .db     0xa5,0xff,0x0a,0x07,0x8e,0x33,0x0c,0x48 ;%....3.H
             48
      00BBD3 81 A4 B0 FF 2A 62 0F  1445         .db     0x81,0xa4,0xb0,0xff,0x2a,0x62,0x0f,0x72 ;.$0.*b.r
             72
      00BBDB 16 76 01 50 85 FF 2A  1446         .db     0x16,0x76,0x01,0x50,0x85,0xff,0x2a,0x8e ;.v.P..*.
             8E
      00BBE3 72 16 01 40 50 60 68  1447         .db     0x72,0x16,0x01,0x40,0x50,0x60,0x68,0x84 ;r..@P`h.
             84
      00BBEB B0 FF 0A 43 86 4F 92  1448         .db     0xb0,0xff,0x0a,0x43,0x86,0x4f,0x92,0x16 ;0..C.O..
             16
      00BBF3 0C 20 2C 44 50 64 A8  1449         .db     0x0c,0x20,0x2c,0x44,0x50,0x64,0xa8,0xff ;. ,DPd(.
             FF
      00BBFB 0A 42 0F 37 20 44 64  1450         .db     0x0a,0x42,0x0f,0x37,0x20,0x44,0x64,0x6c ;.B.7 Ddl
             6C
      00BC03 80 88 A1 FF 2A 62 92  1451         .db     0x80,0x88,0xa1,0xff,0x2a,0x62,0x92,0x16 ;..!.*b..
             16
      00BC0B 56 01 40 64 6C 85 A0  1452         .db     0x56,0x01,0x40,0x64,0x6c,0x85,0xa0,0xa8 ;V.@dl. (
             A8
      00BC13 FF 0A 42 27 8E 53 96  1453         .db     0xff,0x0a,0x42,0x27,0x8e,0x53,0x96,0x00 ;..B'.S..
             00
      00BC1B 0C 2D 48 68 A1 FF 0A  1454         .db     0x0c,0x2d,0x48,0x68,0xa1,0xff,0x0a,0x43 ;.-Hh!..C
             43
      00BC23 67 2E 76 0D 20 44 50  1455         .db     0x67,0x2e,0x76,0x0d,0x20,0x44,0x50,0x68 ;g.v. DPh
             68
      00BC2B 89 A8 B0 FF 4A 06 46  1456         .db     0x89,0xa8,0xb0,0xff,0x4a,0x06,0x46,0x4e ;.(0.J.FN
             4E
      00BC33 92 16 08 28 70 85 A8  1457         .db     0x92,0x16,0x08,0x28,0x70,0x85,0xa8,0xff ;...(p.(.
             FF
      00BC3B 0A 02 42 32 36 76 10  1458         .db     0x0a,0x02,0x42,0x32,0x36,0x76,0x10,0x45 ;..B26v.E
             45
      00BC43 6C 80 A0 A8 FF 4A 22  1459         .db     0x6c,0x80,0xa0,0xa8,0xff,0x4a,0x22,0x82 ;l. (.J".
             82
      00BC4B 26 4E 77 00 08 29 50  1460         .db     0x26,0x4e,0x77,0x00,0x08,0x29,0x50,0x60 ;&Nw..)P`
             60
      00BC53 88 A4 AC FF 2A 42 82  1461         .db     0x88,0xa4,0xac,0xff,0x2a,0x42,0x82,0x46 ;.$,.*B.F
             46
      00BC5B 86 0E 72 36 76 01 20  1462         .db     0x86,0x0e,0x72,0x36,0x76,0x01,0x20,0x4c ;..r6v. L
             4C
      00BC63 68 88 FF 4A 62 0E 17  1463         .db     0x68,0x88,0xff,0x4a,0x62,0x0e,0x17,0x01 ;h..Jb...
             01
      00BC6B 24 40 6D 84 8C A0 A8  1464         .db     0x24,0x40,0x6d,0x84,0x8c,0xa0,0xa8,0xff ;$@m.. (.
             FF
      00BC73 0A 0E 4E 52 92 96 00  1465         .db     0x0a,0x0e,0x4e,0x52,0x92,0x96,0x00,0x30 ;..NR...0
             30
      00BC7B 44 64 84 A5 FF 2A 82  1466         .db     0x44,0x64,0x84,0xa5,0xff,0x2a,0x82,0x0e ;Dd.%.*..
             0E
      00BC83 4E 53 76 30 40 60 85  1467         .db     0x4e,0x53,0x76,0x30,0x40,0x60,0x85,0xa4 ;NSv0@`.$
             A4
      00BC8B AC FF 4A 07 4E 76 08  1468         .db     0xac,0xff,0x4a,0x07,0x4e,0x76,0x08,0x10 ;,.J.Nv..
             10
      00BC93 29 50 60 85 A5 FF 2A  1469         .db     0x29,0x50,0x60,0x85,0xa5,0xff,0x2a,0x03 ;)P`.%.*.
             03
      00BC9B 6F 16 56 04 4C 61 90  1470         .db     0x6f,0x16,0x56,0x04,0x4c,0x61,0x90,0xa4 ;o.V.La.$
             A4
      00BCA3 B0 FF 0A 42 82 46 86  1471         .db     0xb0,0xff,0x0a,0x42,0x82,0x46,0x86,0x2e ;0..B.F..
             2E
      00BCAB 76 20 50 68 89 A8 B0  1472         .db     0x76,0x20,0x50,0x68,0x89,0xa8,0xb0,0xff ;v Ph.(0.
             FF
      00BCB3 0A 03 06 2E 6E 73 16  1473         .db     0x0a,0x03,0x06,0x2e,0x6e,0x73,0x16,0x0c ;....ns..
             0C
      00BCBB 50 81 FF 0A 02 42 0E  1474         .db     0x50,0x81,0xff,0x0a,0x02,0x42,0x0e,0x8e ;P....B..
             8E
      00BCC3 36 10 44 4C 65 80 FF  1475         .db     0x36,0x10,0x44,0x4c,0x65,0x80,0xff,0x0a ;6.DLe...
             0A
      00BCCB 02 42 06 8E 33 16 56  1476         .db     0x02,0x42,0x06,0x8e,0x33,0x16,0x56,0x0c ;.B..3.V.
             0C
      00BCD3 65 80 90 A0 FF 0A 62  1477         .db     0x65,0x80,0x90,0xa0,0xff,0x0a,0x62,0x46 ;e.. ..bF
             46
      00BCDB 86 52 16 00 0C 20 2C  1478         .db     0x86,0x52,0x16,0x00,0x0c,0x20,0x2c,0x48 ;.R... ,H
             48
      00BCE3 8C A8 B0 FF 2A 42 0E  1479         .db     0x8c,0xa8,0xb0,0xff,0x2a,0x42,0x0e,0x6e ;.(0.*B.n
             6E
      00BCEB 92 96 20 4D 64 70 80  1480         .db     0x92,0x96,0x20,0x4d,0x64,0x70,0x80,0xa0 ;.. Mdp. 
             A0
      00BCF3 FF 0A 23 86 2F 76 0C  1481         .db     0xff,0x0a,0x23,0x86,0x2f,0x76,0x0c,0x50 ;..#./v.P
             50
      00BCFB 64 89 A8 FF 0A 62 66  1482         .db     0x64,0x89,0xa8,0xff,0x0a,0x62,0x66,0x13 ;d.(..bf.
             13
      00BD03 17 00 20 40 48 68 8C  1483         .db     0x17,0x00,0x20,0x40,0x48,0x68,0x8c,0xff ;.. @Hh..
             FF
      00BD0B 4A 63 16 56 04 21 40  1484         .db     0x4a,0x63,0x16,0x56,0x04,0x21,0x40,0x6c ;Jc.V.!@l
             6C
      00BD13 88 90 AD FF 0A 03 06  1485         .db     0x88,0x90,0xad,0xff,0x0a,0x03,0x06,0x46 ;..-....F
             46
      00BD1B 8E 36 76 0D 48 68 81  1486         .db     0x8e,0x36,0x76,0x0d,0x48,0x68,0x81,0xa4 ;.6v.Hh.$
             A4
      00BD23 FF 0A 23 46 0F 73 96  1487         .db     0xff,0x0a,0x23,0x46,0x0f,0x73,0x96,0x00 ;..#F.s..
             00
      00BD2B 30 50 68 A5 FF 2A 22  1488         .db     0x30,0x50,0x68,0xa5,0xff,0x2a,0x22,0x62 ;0Ph%.*"b
             62
      00BD33 26 86 0E 72 16 01 4C  1489         .db     0x26,0x86,0x0e,0x72,0x16,0x01,0x4c,0x65 ;&..r..Le
             65
      00BD3B A8 B0 FF 2A 06 46 8E  1490         .db     0xa8,0xb0,0xff,0x2a,0x06,0x46,0x8e,0x17 ;(0.*.F..
             17
      00BD43 2C 4C 81 A4 B0 FF 0A  1491         .db     0x2c,0x4c,0x81,0xa4,0xb0,0xff,0x0a,0x02 ;,L.$0...
             02
      00BD4B 07 6E 56 96 2D 48 81  1492         .db     0x07,0x6e,0x56,0x96,0x2d,0x48,0x81,0xa0 ;.nV.-H. 
             A0
      00BD53 A8 FF 2A 02 27 0E 73  1493         .db     0xa8,0xff,0x2a,0x02,0x27,0x0e,0x73,0x56 ;(.*.'.sV
             56
      00BD5B 96 04 30 4C 68 A0 FF  1494         .db     0x96,0x04,0x30,0x4c,0x68,0xa0,0xff,0x0a ;..0Lh ..
             0A
      00BD63 42 8E 32 16 56 20 45  1495         .db     0x42,0x8e,0x32,0x16,0x56,0x20,0x45,0x65 ;B.2.V Ee
             65
      00BD6B 80 90 A0 B0 FF 0A 82  1496         .db     0x80,0x90,0xa0,0xb0,0xff,0x0a,0x82,0x86 ;.. 0....
             86
      00BD73 2F 16 56 0C 20 41 60  1497         .db     0x2f,0x16,0x56,0x0c,0x20,0x41,0x60,0xad ;/.V. A`-
             AD
      00BD7B FF 0A 43 47 0E 36 10  1498         .db     0xff,0x0a,0x43,0x47,0x0e,0x36,0x10,0x20 ;..CG.6. 
             20
      00BD83 49 6D 88 A1 FF 2A 03  1499         .db     0x49,0x6d,0x88,0xa1,0xff,0x2a,0x03,0x06 ;Im.!.*..
             06
      00BD8B 4E 73 77 08 50 61 81  1500         .db     0x4e,0x73,0x77,0x08,0x50,0x61,0x81,0xa0 ;Nsw.Pa. 
             A0
      00BD93 A8 FF 2A 63 86 52 36  1501         .db     0xa8,0xff,0x2a,0x63,0x86,0x52,0x36,0x76 ;(.*c.R6v
             76
      00BD9B 04 2C 40 64 89 AC FF  1502         .db     0x04,0x2c,0x40,0x64,0x89,0xac,0xff,0x0a ;.,@d.,..
             0A
      00BDA3 23 27 2E 92 16 00 50  1503         .db     0x23,0x27,0x2e,0x92,0x16,0x00,0x50,0x6d ;#'....Pm
             6D
      00BDAB A1 FF 0A 43 2F 92 96  1504         .db     0xa1,0xff,0x0a,0x43,0x2f,0x92,0x96,0x0c ;!..C/...
             0C
      00BDB3 20 44 50 70 88 A0 A8  1505         .db     0x20,0x44,0x50,0x70,0x88,0xa0,0xa8,0xff ; DPp. (.
             FF
      00BDBB 4A 22 82 07 72 16 96  1506         .db     0x4a,0x22,0x82,0x07,0x72,0x16,0x96,0x09 ;J"..r...
             09
      00BDC3 28 50 85 A4 AC FF 2A  1507         .db     0x28,0x50,0x85,0xa4,0xac,0xff,0x2a,0x43 ;(P.$,.*C
             43
      00BDCB 06 46 2E 72 16 08 50  1508         .db     0x06,0x46,0x2e,0x72,0x16,0x08,0x50,0x85 ;.F.r..P.
             85
      00BDD3 A0 A8 FF 0A 02 06 46  1509         .db     0xa0,0xa8,0xff,0x0a,0x02,0x06,0x46,0x8e ; (....F.
             8E
      00BDDB 56 96 0D 2D 48 68 81  1510         .db     0x56,0x96,0x0d,0x2d,0x48,0x68,0x81,0xa0 ;V..-Hh. 
             A0
      00BDE3 FF 2A 82 0E 57 01 30  1511         .db     0xff,0x2a,0x82,0x0e,0x57,0x01,0x30,0x40 ;.*..W.0@
             40
      00BDEB 4C 61 88 A8 B0 FF 6A  1512         .db     0x4c,0x61,0x88,0xa8,0xb0,0xff,0x6a,0x22 ;La.(0.j"
             22
      00BDF3 92 77 00 24 44 4C 60  1513         .db     0x92,0x77,0x00,0x24,0x44,0x4c,0x60,0x6c ;.w.$DL`l
             6C
      00BDFB A1 FF 4A 42 82 46 0E  1514         .db     0xa1,0xff,0x4a,0x42,0x82,0x46,0x0e,0x92 ;!.JB.F..
             92
      00BE03 16 00 21 4C 70 88 A5  1515         .db     0x16,0x00,0x21,0x4c,0x70,0x88,0xa5,0xff ;..!Lp.%.
             FF
      00BE0B 0A 03 0E 92 37 10 44  1516         .db     0x0a,0x03,0x0e,0x92,0x37,0x10,0x44,0x4c ;....7.DL
             4C
      00BE13 81 A0 A8 FF 2A 0E 72  1517         .db     0x81,0xa0,0xa8,0xff,0x2a,0x0e,0x72,0x76 ;. (.*.rv
             76
      00BE1B 04 30 4D 65 85 A4 FF  1518         .db     0x04,0x30,0x4d,0x65,0x85,0xa4,0xff,0x0a ;.0Me.$..
             0A
      00BE23 23 4E 96 00 0C 2D 44  1519         .db     0x23,0x4e,0x96,0x00,0x0c,0x2d,0x44,0x70 ;#N...-Dp
             70
      00BE2B 80 88 A0 FF 2A 02 07  1520         .db     0x80,0x88,0xa0,0xff,0x2a,0x02,0x07,0x6e ;.. .*..n
             6E
      00BE33 72 37 08 10 4C 81 A8  1521         .db     0x72,0x37,0x08,0x10,0x4c,0x81,0xa8,0xb0 ;r7..L.(0
             B0
      00BE3B FF 0A 23 8E 32 37 00  1522         .db     0xff,0x0a,0x23,0x8e,0x32,0x37,0x00,0x45 ;..#.27.E
             45
      00BE43 64 6C 90 A1 FF 0A 42  1523         .db     0x64,0x6c,0x90,0xa1,0xff,0x0a,0x42,0x82 ;dl.!..B.
             82
      00BE4B 46 0E 6E 13 17 00 48  1524         .db     0x46,0x0e,0x6e,0x13,0x17,0x00,0x48,0x70 ;F.n...Hp
             70
      00BE53 84 A5 FF 0A 43 4E 92  1525         .db     0x84,0xa5,0xff,0x0a,0x43,0x4e,0x92,0x16 ;.%..CN..
             16
      00BE5B 0C 20 2C 50 85 A0 FF  1526         .db     0x0c,0x20,0x2c,0x50,0x85,0xa0,0xff,0x2a ;. ,P. .*
             2A
      00BE63 63 4E 16 76 01 2C 40  1527         .db     0x63,0x4e,0x16,0x76,0x01,0x2c,0x40,0x50 ;cN.v.,@P
             50
      00BE6B 64 A5 FF 0A 86 6E 33  1528         .db     0x64,0xa5,0xff,0x0a,0x86,0x6e,0x33,0x16 ;d%...n3.
             16
      00BE73 56 0C 45 60 90 A9 FF  1529         .db     0x56,0x0c,0x45,0x60,0x90,0xa9,0xff,0x6a ;V.E`.).j
             6A
      00BE7B 02 82 66 2E 92 37 0D  1530         .db     0x02,0x82,0x66,0x2e,0x92,0x37,0x0d,0x24 ;..f..7.$
             24
      00BE83 41 6C A5 FF 6A 23 0F  1531         .db     0x41,0x6c,0xa5,0xff,0x6a,0x23,0x0f,0x92 ;Al%.j#..
             92
      00BE8B 77 01 30 44 6C A1 FF  1532         .db     0x77,0x01,0x30,0x44,0x6c,0xa1,0xff,0x0a ;w.0Dl!..
             0A
      00BE93 02 42 06 32 36 0C 45  1533         .db     0x02,0x42,0x06,0x32,0x36,0x0c,0x45,0x64 ;.B.26.Ed
             64
      00BE9B 6C 80 A0 FF 0A 22 62  1534         .db     0x6c,0x80,0xa0,0xff,0x0a,0x22,0x62,0x0e ;l. .."b.
             0E
      00BEA3 4E 72 16 00 50 85 A4  1535         .db     0x4e,0x72,0x16,0x00,0x50,0x85,0xa4,0xff ;Nr..P.$.
             FF
      00BEAB 2A 63 06 8E 12 52 16  1536         .db     0x2a,0x63,0x06,0x8e,0x12,0x52,0x16,0x56 ;*c...R.V
             56
      00BEB3 08 40 68 90 FF 4A 42  1537         .db     0x08,0x40,0x68,0x90,0xff,0x4a,0x42,0x82 ;.@h..JB.
             82
      00BEBB 0E 92 37 10 21 6C 88  1538         .db     0x0e,0x92,0x37,0x10,0x21,0x6c,0x88,0xa5 ;..7.!l.%
             A5
      00BEC3 FF 0A 03 06 32 72 16  1539         .db     0xff,0x0a,0x03,0x06,0x32,0x72,0x16,0x56 ;....2r.V
             56
      00BECB 0C 44 60 68 A0 FF 0A  1540         .db     0x0c,0x44,0x60,0x68,0xa0,0xff,0x0a,0x03 ;.D`h ...
             03
      00BED3 8E 52 37 10 45 60 68  1541         .db     0x8e,0x52,0x37,0x10,0x45,0x60,0x68,0x90 ;.R7.E`h.
             90
      00BEDB A0 FF 0A 22 62 27 0E  1542         .db     0xa0,0xff,0x0a,0x22,0x62,0x27,0x0e,0x56 ; .."b'.V
             56
      00BEE3 96 00 10 30 68 85 FF  1543         .db     0x96,0x00,0x10,0x30,0x68,0x85,0xff,0x0a ;...0h...
             0A
      00BEEB 02 8E 52 56 96 0D 30  1544         .db     0x02,0x8e,0x52,0x56,0x96,0x0d,0x30,0x60 ;..RV..0`
             60
      00BEF3 68 81 A0 FF 0A 23 46  1545         .db     0x68,0x81,0xa0,0xff,0x0a,0x23,0x46,0x8e ;h. ..#F.
             8E
      00BEFB 13 16 56 00 48 68 81  1546         .db     0x13,0x16,0x56,0x00,0x48,0x68,0x81,0xa4 ;..V.Hh.$
             A4
      00BF03 B0 FF 4A 02 0F 92 96  1547         .db     0xb0,0xff,0x4a,0x02,0x0f,0x92,0x96,0x24 ;0.J....$
             24
      00BF0B 40 50 6D A0 A8 FF 0A  1548         .db     0x40,0x50,0x6d,0xa0,0xa8,0xff,0x0a,0x42 ;@Pm (..B
             42
      00BF13 82 46 8E 52 17 00 0C  1549         .db     0x82,0x46,0x8e,0x52,0x17,0x00,0x0c,0x20 ;.F.R... 
             20
      00BF1B 2C 48 68 90 B0 FF 2A  1550         .db     0x2c,0x48,0x68,0x90,0xb0,0xff,0x2a,0x62 ;,Hh.0.*b
             62
      00BF23 0E 4E 52 57 04 10 30  1551         .db     0x0e,0x4e,0x52,0x57,0x04,0x10,0x30,0x40 ;.NRW..0@
             40
      00BF2B 85 A5 FF 2A 02 4F 92  1552         .db     0x85,0xa5,0xff,0x2a,0x02,0x4f,0x92,0x16 ;.%.*.O..
             16
      00BF33 96 04 0C 2C 50 70 81  1553         .db     0x96,0x04,0x0c,0x2c,0x50,0x70,0x81,0xa5 ;...,Pp.%
             A5
      00BF3B FF 0A 22 62 86 2F 92  1554         .db     0xff,0x0a,0x22,0x62,0x86,0x2f,0x92,0x16 ;.."b./..
             16
      00BF43 0C 50 64 70 88 FF 2A  1555         .db     0x0c,0x50,0x64,0x70,0x88,0xff,0x2a,0x02 ;.Pdp..*.
             02
      00BF4B 72 56 96 04 30 40 4C  1556         .db     0x72,0x56,0x96,0x04,0x30,0x40,0x4c,0x61 ;rV..0@La
             61
      00BF53 80 A4 AC FF 0A 02 42  1557         .db     0x80,0xa4,0xac,0xff,0x0a,0x02,0x42,0x07 ;.$,...B.
             07
      00BF5B 6E 56 96 10 2D 48 64  1558         .db     0x6e,0x56,0x96,0x10,0x2d,0x48,0x64,0x81 ;nV..-Hd.
             81
      00BF63 A8 FF 0A 82 06 0F 36  1559         .db     0xa8,0xff,0x0a,0x82,0x06,0x0f,0x36,0x76 ;(.....6v
             76
      00BF6B 10 41 60 68 AD FF 4A  1560         .db     0x10,0x41,0x60,0x68,0xad,0xff,0x4a,0x22 ;.A`h-.J"
             22
      00BF73 62 0E 92 16 01 4C 70  1561         .db     0x62,0x0e,0x92,0x16,0x01,0x4c,0x70,0x85 ;b....Lp.
             85
      00BF7B A4 FF 0A 42 6F 32 0C  1562         .db     0xa4,0xff,0x0a,0x42,0x6f,0x32,0x0c,0x20 ;$..Bo2. 
             20
      00BF83 45 64 70 80 A0 FF 2A  1563         .db     0x45,0x64,0x70,0x80,0xa0,0xff,0x2a,0x02 ;Edp. .*.
             02
      00BF8B 82 86 4E 76 2D 40 61  1564         .db     0x82,0x86,0x4e,0x76,0x2d,0x40,0x61,0x88 ;..Nv-@a.
             88
      00BF93 A8 FF 2A 0F 72 16 76  1565         .db     0xa8,0xff,0x2a,0x0f,0x72,0x16,0x76,0x01 ;(.*.r.v.
             01
      00BF9B 50 60 68 85 A4 FF 0A  1566         .db     0x50,0x60,0x68,0x85,0xa4,0xff,0x0a,0x03 ;P`h.$...
             03
      00BFA3 06 86 2E 6E 72 0C 44  1567         .db     0x06,0x86,0x2e,0x6e,0x72,0x0c,0x44,0x50 ;...nr.DP
             50
      00BFAB 60 A8 FF 2A 02 42 06  1568         .db     0x60,0xa8,0xff,0x2a,0x02,0x42,0x06,0x8e ;`(.*.B..
             8E
      00BFB3 12 37 08 4C 64 6C 80  1569         .db     0x12,0x37,0x08,0x4c,0x64,0x6c,0x80,0xa0 ;.7.Ldl. 
             A0
      00BFBB FF 0A 22 6F 52 92 00  1570         .db     0xff,0x0a,0x22,0x6f,0x52,0x92,0x00,0x2c ;.."oR..,
             2C
      00BFC3 48 60 81 A4 FF 0A 22  1571         .db     0x48,0x60,0x81,0xa4,0xff,0x0a,0x22,0x62 ;H`.$.."b
             62
      00BFCB 86 52 56 96 00 2D 44  1572         .db     0x86,0x52,0x56,0x96,0x00,0x2d,0x44,0x64 ;.RV..-Dd
             64
      00BFD3 89 FF 0A 27 6E 13 36  1573         .db     0x89,0xff,0x0a,0x27,0x6e,0x13,0x36,0x48 ;...'n.6H
             48
      00BFDB 70 81 A4 AC FF 0A 22  1574         .db     0x70,0x81,0xa4,0xac,0xff,0x0a,0x22,0x82 ;p.$,..".
             82
      00BFE3 26 0E 4E 73 77 00 50  1575         .db     0x26,0x0e,0x4e,0x73,0x77,0x00,0x50,0x60 ;&.Nsw.P`
             60
      00BFEB 85 A5 FF 2A 06 46 8E  1576         .db     0x85,0xa5,0xff,0x2a,0x06,0x46,0x8e,0x76 ;.%.*.F.v
             76
      00BFF3 08 10 50 68 81 B0 FF  1577         .db     0x08,0x10,0x50,0x68,0x81,0xb0,0xff,0x0a ;..Ph.0..
             0A
      00BFFB 22 62 2E 13 17 00 44  1578         .db     0x22,0x62,0x2e,0x13,0x17,0x00,0x44,0x69 ;"b....Di
             69
      00C003 89 A9 FF 0A 42 86 33  1579         .db     0x89,0xa9,0xff,0x0a,0x42,0x86,0x33,0x36 ;.)..B.36
             36
      00C00B 96 00 10 45 64 A9 FF  1580         .db     0x96,0x00,0x10,0x45,0x64,0xa9,0xff,0x0a ;...Ed)..
             0A
      00C013 22 62 86 33 56 00 44  1581         .db     0x22,0x62,0x86,0x33,0x56,0x00,0x44,0x65 ;"b.3V.De
             65
      00C01B 89 A9 FF 4A 03 06 72  1582         .db     0x89,0xa9,0xff,0x4a,0x03,0x06,0x72,0x36 ;.).J..r6
             36
      00C023 76 08 10 29 4C 81 A0  1583         .db     0x76,0x08,0x10,0x29,0x4c,0x81,0xa0,0xff ;v..)L. .
             FF
      00C02B 4A 02 67 0E 92 36 76  1584         .db     0x4a,0x02,0x67,0x0e,0x92,0x36,0x76,0x24 ;J.g..6v$
             24
      00C033 40 4C 6C 88 FF 4A 46  1585         .db     0x40,0x4c,0x6c,0x88,0xff,0x4a,0x46,0x0e ;@Ll..JF.
             0E
      00C03B 92 36 76 01 21 4C 6C  1586         .db     0x92,0x36,0x76,0x01,0x21,0x4c,0x6c,0xa5 ;.6v.!Ll%
             A5
      00C043 FF 2A 82 0E 4E 96 10  1587         .db     0xff,0x2a,0x82,0x0e,0x4e,0x96,0x10,0x30 ;.*..N..0
             30
      00C04B 40 50 60 70 85 A5 FF  1588         .db     0x40,0x50,0x60,0x70,0x85,0xa5,0xff,0x0a ;@P`p.%..
             0A
      00C053 43 46 0E 32 57 10 20  1589         .db     0x43,0x46,0x0e,0x32,0x57,0x10,0x20,0x48 ;CF.2W. H
             48
      00C05B 84 8C A0 A8 FF 2A 43  1590         .db     0x84,0x8c,0xa0,0xa8,0xff,0x2a,0x43,0x0e ;.. (.*C.
             0E
      00C063 72 16 56 01 4C 85 FF  1591         .db     0x72,0x16,0x56,0x01,0x4c,0x85,0xff,0x4a ;r.V.L..J
             4A
      00C06B 62 06 8E 32 36 76 28  1592         .db     0x62,0x06,0x8e,0x32,0x36,0x76,0x28,0x40 ;b..26v(@
             40
      00C073 6C 84 A1 FF 0A 02 66  1593         .db     0x6c,0x84,0xa1,0xff,0x0a,0x02,0x66,0x32 ;l.!...f2
             32
      00C07B 36 96 10 41 68 70 8C  1594         .db     0x36,0x96,0x10,0x41,0x68,0x70,0x8c,0xa1 ;6..Ahp.!
             A1
      00C083 FF 4A 02 86 0E 12 16  1595         .db     0xff,0x4a,0x02,0x86,0x0e,0x12,0x16,0x56 ;.J.....V
             56
      00C08B 24 4C 60 A8 B0 FF 2A  1596         .db     0x24,0x4c,0x60,0xa8,0xb0,0xff,0x2a,0x62 ;$L`(0.*b
             62
      00C093 0E 36 01 20 40 4C 64  1597         .db     0x0e,0x36,0x01,0x20,0x40,0x4c,0x64,0x70 ;.6. @Ldp
             70
      00C09B 84 A0 A8 FF 6A 22 86  1598         .db     0x84,0xa0,0xa8,0xff,0x6a,0x22,0x86,0x0e ;. (.j"..
             0E
      00C0A3 36 76 00 10 45 60 A8  1599         .db     0x36,0x76,0x00,0x10,0x45,0x60,0xa8,0xb0 ;6v..E`(0
             B0
      00C0AB FF 0A 22 82 26 0E 4E  1600         .db     0xff,0x0a,0x22,0x82,0x26,0x0e,0x4e,0x73 ;..".&.Ns
             73
      00C0B3 77 00 50 60 85 A4 FF  1601         .db     0x77,0x00,0x50,0x60,0x85,0xa4,0xff,0x0a ;w.P`.$..
             0A
      00C0BB 22 26 0E 52 92 56 96  1602         .db     0x22,0x26,0x0e,0x52,0x92,0x56,0x96,0x00 ;"&.R.V..
             00
      00C0C3 30 48 60 A0 A8 FF 2A  1603         .db     0x30,0x48,0x60,0xa0,0xa8,0xff,0x2a,0x46 ;0H` (.*F
             46
      00C0CB 0F 72 01 20 50 68 85  1604         .db     0x0f,0x72,0x01,0x20,0x50,0x68,0x85,0xa4 ;.r. Ph.$
             A4
      00C0D3 AC FF 0A 42 66 32 36  1605         .db     0xac,0xff,0x0a,0x42,0x66,0x32,0x36,0x96 ;,..Bf26.
             96
      00C0DB 00 10 20 45 68 70 8C  1606         .db     0x00,0x10,0x20,0x45,0x68,0x70,0x8c,0xa0 ;.. Ehp. 
             A0
      00C0E3 FF 0A 03 07 32 72 56  1607         .db     0xff,0x0a,0x03,0x07,0x32,0x72,0x56,0x0c ;....2rV.
             0C
      00C0EB 48 60 68 80 A0 FF 0A  1608         .db     0x48,0x60,0x68,0x80,0xa0,0xff,0x0a,0x22 ;H`h. .."
             22
      00C0F3 82 07 6E 12 37 49 60  1609         .db     0x82,0x07,0x6e,0x12,0x37,0x49,0x60,0x90 ;..n.7I`.
             90
      00C0FB A5 FF 0A 03 0E 8E 32  1610         .db     0xa5,0xff,0x0a,0x03,0x0e,0x8e,0x32,0x72 ;%.....2r
             72
      00C103 36 76 10 44 60 68 80  1611         .db     0x36,0x76,0x10,0x44,0x60,0x68,0x80,0xa0 ;6v.D`h. 
             A0
      00C10B FF 4A 46 0E 72 36 76  1612         .db     0xff,0x4a,0x46,0x0e,0x72,0x36,0x76,0x01 ;.JF.r6v.
             01
      00C113 21 4C 85 AD FF 2A 03  1613         .db     0x21,0x4c,0x85,0xad,0xff,0x2a,0x03,0x07 ;!L.-.*..
             07
      00C11B 73 16 09 50 60 81 A0  1614         .db     0x73,0x16,0x09,0x50,0x60,0x81,0xa0,0xa8 ;s..P`. (
             A8
      00C123 FF 4A 62 0E 92 36 76  1615         .db     0xff,0x4a,0x62,0x0e,0x92,0x36,0x76,0x21 ;.Jb..6v!
             21
      00C12B 4C 6C 85 A4 FF 4A 02  1616         .db     0x4c,0x6c,0x85,0xa4,0xff,0x4a,0x02,0x72 ;Ll.$.J.r
             72
      00C133 36 76 04 24 40 4C 60  1617         .db     0x36,0x76,0x04,0x24,0x40,0x4c,0x60,0x81 ;6v.$@L`.
             81
      00C13B A0 FF 4A 82 26 4E 73  1618         .db     0xa0,0xff,0x4a,0x82,0x26,0x4e,0x73,0x16 ; .J.&Ns.
             16
      00C143 01 28 50 60 85 A4 FF  1619         .db     0x01,0x28,0x50,0x60,0x85,0xa4,0xff,0x4a ;.(P`.$.J
             4A
      00C14B 02 06 8E 12 92 36 76  1620         .db     0x02,0x06,0x8e,0x12,0x92,0x36,0x76,0x08 ;.....6v.
             08
      00C153 28 4C 6C 81 A1 FF 2A  1621         .db     0x28,0x4c,0x6c,0x81,0xa1,0xff,0x2a,0x62 ;(Ll.!.*b
             62
      00C15B 0E 4E 53 57 04 30 40  1622         .db     0x0e,0x4e,0x53,0x57,0x04,0x30,0x40,0x85 ;.NSW.0@.
             85
      00C163 FF 4A 22 62 27 4E 92  1623         .db     0xff,0x4a,0x22,0x62,0x27,0x4e,0x92,0x16 ;.J"b'N..
             16
      00C16B 96 01 29 70 85 A5 FF  1624         .db     0x96,0x01,0x29,0x70,0x85,0xa5,0xff,0x0a ;..)p.%..
             0A
      00C173 02 2E 73 16 76 0C 50  1625         .db     0x02,0x2e,0x73,0x16,0x76,0x0c,0x50,0x60 ;..s.v.P`
             60
      00C17B 80 88 FF 6A 02 42 06  1626         .db     0x80,0x88,0xff,0x6a,0x02,0x42,0x06,0x92 ;...j.B..
             92
      00C183 36 0D 45 70 A0 A8 FF  1627         .db     0x36,0x0d,0x45,0x70,0xa0,0xa8,0xff,0x0a ;6.Ep (..
             0A
      00C18B 22 62 86 33 37 00 44  1628         .db     0x22,0x62,0x86,0x33,0x37,0x00,0x44,0x65 ;"b.37.De
             65
      00C193 89 A9 FF 0A 82 06 2E  1629         .db     0x89,0xa9,0xff,0x0a,0x82,0x06,0x2e,0x6e ;.).....n
             6E
      00C19B 33 16 0C 41 60 90 A4  1630         .db     0x33,0x16,0x0c,0x41,0x60,0x90,0xa4,0xac ;3..A`.$,
             AC
      00C1A3 FF 0A 03 0E 4E 72 57  1631         .db     0xff,0x0a,0x03,0x0e,0x4e,0x72,0x57,0x10 ;....NrW.
             10
      00C1AB 44 61 80 88 A0 FF 4A  1632         .db     0x44,0x61,0x80,0x88,0xa0,0xff,0x4a,0x82 ;Da.. .J.
             82
      00C1B3 6F 12 16 56 00 25 4C  1633         .db     0x6f,0x12,0x16,0x56,0x00,0x25,0x4c,0x60 ;o..V.%L`
             60
      00C1BB 90 A4 B0 FF 0A 02 42  1634         .db     0x90,0xa4,0xb0,0xff,0x0a,0x02,0x42,0x27 ;.$0...B'
             27
      00C1C3 6E 13 36 48 70 81 A4  1635         .db     0x6e,0x13,0x36,0x48,0x70,0x81,0xa4,0xac ;n.6Hp.$,
             AC
      00C1CB FF 6A 82 13 16 00 08  1636         .db     0xff,0x6a,0x82,0x13,0x16,0x00,0x08,0x21 ;.j.....!
             21
      00C1D3 44 60 8C A4 AC FF 6A  1637         .db     0x44,0x60,0x8c,0xa4,0xac,0xff,0x6a,0x02 ;D`.$,.j.
             02
      00C1DB 42 06 96 08 28 30 45  1638         .db     0x42,0x06,0x96,0x08,0x28,0x30,0x45,0x6d ;B...(0Em
             6D
      00C1E3 80 8C A1 FF 4A 62 0E  1639         .db     0x80,0x8c,0xa1,0xff,0x4a,0x62,0x0e,0x96 ;..!.Jb..
             96
      00C1EB 01 24 40 6D 84 8C A1  1640         .db     0x01,0x24,0x40,0x6d,0x84,0x8c,0xa1,0xff ;.$@m..!.
             FF
      00C1F3 6A 62 06 2E 6E 92 16  1641         .db     0x6a,0x62,0x06,0x2e,0x6e,0x92,0x16,0x96 ;jb..n...
             96
      00C1FB 08 41 70 A5 FF 0A 03  1642         .db     0x08,0x41,0x70,0xa5,0xff,0x0a,0x03,0x0e ;.Ap%....
             0E
      00C203 8E 52 10 44 60 68 80  1643         .db     0x8e,0x52,0x10,0x44,0x60,0x68,0x80,0x90 ;.R.D`h..
             90
      00C20B A0 FF 0A 23 8E 32 17  1644         .db     0xa0,0xff,0x0a,0x23,0x8e,0x32,0x17,0x00 ; ..#.2..
             00
      00C213 0C 44 69 81 FF 6A 22  1645         .db     0x0c,0x44,0x69,0x81,0xff,0x6a,0x22,0x86 ;.Di..j".
             86
      00C21B 12 16 56 01 24 44 4C  1646         .db     0x12,0x16,0x56,0x01,0x24,0x44,0x4c,0x60 ;..V.$DL`
             60
      00C223 A8 B0 FF 0A 02 07 0E  1647         .db     0xa8,0xb0,0xff,0x0a,0x02,0x07,0x0e,0x6e ;(0.....n
             6E
      00C22B 32 36 10 48 60 81 A4  1648         .db     0x32,0x36,0x10,0x48,0x60,0x81,0xa4,0xac ;26.H`.$,
             AC
      00C233 FF 0A 23 46 6E 13 00  1649         .db     0xff,0x0a,0x23,0x46,0x6e,0x13,0x00,0x48 ;..#Fn..H
             48
      00C23B 70 81 A4 AC FF 0A 22  1650         .db     0x70,0x81,0xa4,0xac,0xff,0x0a,0x22,0x26 ;p.$,.."&
             26
      00C243 66 0E 13 16 00 48 68  1651         .db     0x66,0x0e,0x13,0x16,0x00,0x48,0x68,0x70 ;f....Hhp
             70
      00C24B A0 FF 0A 22 82 0F 72  1652         .db     0xa0,0xff,0x0a,0x22,0x82,0x0f,0x72,0x16 ; .."..r.
             16
      00C253 00 50 60 68 A9 FF 0A  1653         .db     0x00,0x50,0x60,0x68,0xa9,0xff,0x0a,0x22 ;.P`h).."
             22
      00C25B 0F 56 00 30 44 60 68  1654         .db     0x0f,0x56,0x00,0x30,0x44,0x60,0x68,0x81 ;.V.0D`h.
             81
      00C263 A4 B0 FF 4A 42 82 0E  1655         .db     0xa4,0xb0,0xff,0x4a,0x42,0x82,0x0e,0x73 ;$0.JB..s
             73
      00C26B 17 00 21 4C 85 A5 FF  1656         .db     0x17,0x00,0x21,0x4c,0x85,0xa5,0xff,0x2a ;..!L.%.*
             2A
      00C273 62 66 92 16 01 20 40  1657         .db     0x62,0x66,0x92,0x16,0x01,0x20,0x40,0x50 ;bf... @P
             50
      00C27B 68 70 A0 FF 0A 02 42  1658         .db     0x68,0x70,0xa0,0xff,0x0a,0x02,0x42,0x06 ;hp ...B.
             06
      00C283 46 0E 8E 73 77 48 50  1659         .db     0x46,0x0e,0x8e,0x73,0x77,0x48,0x50,0x68 ;F..swHPh
             68
      00C28B A0 FF 2A 82 2E 72 16  1660         .db     0xa0,0xff,0x2a,0x82,0x2e,0x72,0x16,0x00 ; .*..r..
             00
      00C293 08 50 60 68 85 AC FF  1661         .db     0x08,0x50,0x60,0x68,0x85,0xac,0xff,0x0a ;.P`h.,..
             0A
      00C29B 43 46 0E 32 57 10 20  1662         .db     0x43,0x46,0x0e,0x32,0x57,0x10,0x20,0x48 ;CF.2W. H
             48
      00C2A3 69 84 8C A1 FF 0A 22  1663         .db     0x69,0x84,0x8c,0xa1,0xff,0x0a,0x22,0x0e ;i..!..".
             0E
      00C2AB 17 00 44 4C 61 80 88  1664         .db     0x17,0x00,0x44,0x4c,0x61,0x80,0x88,0xff ;..DLa...
             FF
      00C2B3 0A 26 0E 6E 13 16 00  1665         .db     0x0a,0x26,0x0e,0x6e,0x13,0x16,0x00,0x48 ;.&.n...H
             48
      00C2BB 64 70 84 A5 FF 2A 0F  1666         .db     0x64,0x70,0x84,0xa5,0xff,0x2a,0x0f,0x72 ;dp.%.*.r
             72
      00C2C3 16 76 01 50 60 68 85  1667         .db     0x16,0x76,0x01,0x50,0x60,0x68,0x85,0xa5 ;.v.P`h.%
             A5
      00C2CB FF 4A 02 86 0E 92 37  1668         .db     0xff,0x4a,0x02,0x86,0x0e,0x92,0x37,0x10 ;.J....7.
             10
      00C2D3 24 40 60 6C 88 FF 0A  1669         .db     0x24,0x40,0x60,0x6c,0x88,0xff,0x0a,0x62 ;$@`l...b
             62
      00C2DB 66 2E 32 16 96 0C 41  1670         .db     0x66,0x2e,0x32,0x16,0x96,0x0c,0x41,0x68 ;f.2...Ah
             68
      00C2E3 70 8C FF 2A 02 67 12  1671         .db     0x70,0x8c,0xff,0x2a,0x02,0x67,0x12,0x52 ;p..*.g.R
             52
      00C2EB 96 04 40 68 8C A9 FF  1672         .db     0x96,0x04,0x40,0x68,0x8c,0xa9,0xff,0x0a ;..@h.)..
             0A
      00C2F3 03 86 6E 92 56 96 30  1673         .db     0x03,0x86,0x6e,0x92,0x56,0x96,0x30,0x44 ;..n.V.0D
             44
      00C2FB 4C 60 A8 FF 0A 22 26  1674         .db     0x4c,0x60,0xa8,0xff,0x0a,0x22,0x26,0x76 ;L`(.."&v
             76
      00C303 00 48 50 60 68 81 A4  1675         .db     0x00,0x48,0x50,0x60,0x68,0x81,0xa4,0xb0 ;.HP`h.$0
             B0
      00C30B FF 0A 22 62 0E 4E 92  1676         .db     0xff,0x0a,0x22,0x62,0x0e,0x4e,0x92,0x16 ;.."b.N..
             16
      00C313 00 50 70 85 A4 FF 0A  1677         .db     0x00,0x50,0x70,0x85,0xa4,0xff,0x0a,0x0e ;.Pp.$...
             0E
      00C31B 32 37 10 41 64 6C A9  1678         .db     0x32,0x37,0x10,0x41,0x64,0x6c,0xa9,0xff ;27.Adl).
             FF
      00C323 0A 22 46 8E 33 00 0C  1679         .db     0x0a,0x22,0x46,0x8e,0x33,0x00,0x0c,0x48 ;."F.3..H
             48
      00C32B 68 81 A4 B0 FF 2A 43  1680         .db     0x68,0x81,0xa4,0xb0,0xff,0x2a,0x43,0x0f ;h.$0.*C.
             0F
      00C333 72 16 96 01 50 85 A5  1681         .db     0x72,0x16,0x96,0x01,0x50,0x85,0xa5,0xff ;r...P.%.
             FF
      00C33B 0A 42 66 0E 32 96 10  1682         .db     0x0a,0x42,0x66,0x0e,0x32,0x96,0x10,0x20 ;.Bf.2.. 
             20
      00C343 45 68 70 A0 FF 0A 22  1683         .db     0x45,0x68,0x70,0xa0,0xff,0x0a,0x22,0x4f ;Ehp .."O
             4F
      00C34B 52 92 17 00 2C 44 81  1684         .db     0x52,0x92,0x17,0x00,0x2c,0x44,0x81,0xa0 ;R...,D. 
             A0
      00C353 A8 FF 0A 03 8E 52 0C  1685         .db     0xa8,0xff,0x0a,0x03,0x8e,0x52,0x0c,0x2c ;(....R.,
             2C
      00C35B 44 68 81 A4 B0 FF 0A  1686         .db     0x44,0x68,0x81,0xa4,0xb0,0xff,0x0a,0x03 ;Dh.$0...
             03
      00C363 8E 36 76 10 2C 44 4C  1687         .db     0x8e,0x36,0x76,0x10,0x2c,0x44,0x4c,0x68 ;.6v.,DLh
             68
      00C36B 81 B0 FF 0A 42 8E 56  1688         .db     0x81,0xb0,0xff,0x0a,0x42,0x8e,0x56,0x0d ;.0..B.V.
             0D
      00C373 20 45 64 6C 90 A0 B0  1689         .db     0x20,0x45,0x64,0x6c,0x90,0xa0,0xb0,0xff ; Edl. 0.
             FF
      00C37B 4A 42 82 0E 73 17 01  1690         .db     0x4a,0x42,0x82,0x0e,0x73,0x17,0x01,0x21 ;JB..s..!
             21
      00C383 4C 85 A5 FF 0A 43 0E  1691         .db     0x4c,0x85,0xa5,0xff,0x0a,0x43,0x0e,0x32 ;L.%..C.2
             32
      00C38B 36 76 10 20 45 68 88  1692         .db     0x36,0x76,0x10,0x20,0x45,0x68,0x88,0xa0 ;6v. Eh. 
             A0
      00C393 A8 FF 6A 82 06 8E 32  1693         .db     0xa8,0xff,0x6a,0x82,0x06,0x8e,0x32,0x72 ;(.j...2r
             72
      00C39B 17 0C 40 48 60 A4 B0  1694         .db     0x17,0x0c,0x40,0x48,0x60,0xa4,0xb0,0xff ;..@H`$0.
             FF
      00C3A3 0A 42 66 0E 00 20 44  1695         .db     0x0a,0x42,0x66,0x0e,0x00,0x20,0x44,0x4c ;.Bf.. DL
             4C
      00C3AB 68 70 89 A0 A8 FF 2A  1696         .db     0x68,0x70,0x89,0xa0,0xa8,0xff,0x2a,0x63 ;hp. (.*c
             63
      00C3B3 52 57 30 40 65 89 A4  1697         .db     0x52,0x57,0x30,0x40,0x65,0x89,0xa4,0xac ;RW0@e.$,
             AC
      00C3BB FF 2A 82 52 56 96 04  1698         .db     0xff,0x2a,0x82,0x52,0x56,0x96,0x04,0x30 ;.*.RV..0
             30
      00C3C3 40 61 84 8C A4 AC FF  1699         .db     0x40,0x61,0x84,0x8c,0xa4,0xac,0xff,0x4a ;@a..$,.J
             4A
      00C3CB 62 0E 4E 17 01 24 40  1700         .db     0x62,0x0e,0x4e,0x17,0x01,0x24,0x40,0x70 ;b.N..$@p
             70
      00C3D3 84 8C A0 A8 FF 2A 63  1701         .db     0x84,0x8c,0xa0,0xa8,0xff,0x2a,0x63,0x4e ;.. (.*cN
             4E
      00C3DB 76 00 08 2D 40 50 64  1702         .db     0x76,0x00,0x08,0x2d,0x40,0x50,0x64,0x88 ;v..-@Pd.
             88
      00C3E3 A5 FF 0A 82 07 6E 37  1703         .db     0xa5,0xff,0x0a,0x82,0x07,0x6e,0x37,0x10 ;%....n7.
             10
      00C3EB 49 60 90 A5 FF 4A 02  1704         .db     0x49,0x60,0x90,0xa5,0xff,0x4a,0x02,0x0f ;I`.%.J..
             0F
      00C3F3 92 10 24 40 50 6D A0  1705         .db     0x92,0x10,0x24,0x40,0x50,0x6d,0xa0,0xa8 ;..$@Pm (
             A8
      00C3FB FF 0A 82 26 6E 73 96  1706         .db     0xff,0x0a,0x82,0x26,0x6e,0x73,0x96,0x00 ;...&ns..
             00
      00C403 2C 48 50 60 A5 FF 2A  1707         .db     0x2c,0x48,0x50,0x60,0xa5,0xff,0x2a,0x63 ;,HP`%.*c
             63
      00C40B 06 0F 96 40 50 65 85  1708         .db     0x06,0x0f,0x96,0x40,0x50,0x65,0x85,0xa4 ;...@Pe.$
             A4
      00C413 AC FF 0A 03 06 4E 8E  1709         .db     0xac,0xff,0x0a,0x03,0x06,0x4e,0x8e,0x52 ;,....N.R
             52
      00C41B 92 2C 44 A1 FF 2A 03  1710         .db     0x92,0x2c,0x44,0xa1,0xff,0x2a,0x03,0x06 ;.,D!.*..
             06
      00C423 72 56 96 08 30 4C 80  1711         .db     0x72,0x56,0x96,0x08,0x30,0x4c,0x80,0x88 ;rV..0L..
             88
      00C42B FF 2A 02 62 52 04 2C  1712         .db     0xff,0x2a,0x02,0x62,0x52,0x04,0x2c,0x40 ;.*.bR.,@
             40
      00C433 65 89 A1 FF 6A 82 13  1713         .db     0x65,0x89,0xa1,0xff,0x6a,0x82,0x13,0x17 ;e.!.j...
             17
      00C43B 00 08 21 44 60 8C A4  1714         .db     0x00,0x08,0x21,0x44,0x60,0x8c,0xa4,0xac ;..!D`.$,
             AC
      00C443 FF 0A 22 62 67 2E 32  1715         .db     0xff,0x0a,0x22,0x62,0x67,0x2e,0x32,0x96 ;.."bg.2.
             96
      00C44B 00 44 68 70 89 A9 FF  1716         .db     0x00,0x44,0x68,0x70,0x89,0xa9,0xff,0x4a ;.Dhp.).J
             4A
      00C453 03 06 72 36 76 08 10  1717         .db     0x03,0x06,0x72,0x36,0x76,0x08,0x10,0x29 ;..r6v..)
             29
      00C45B 4C 81 A1 FF 4A 82 86  1718         .db     0x4c,0x81,0xa1,0xff,0x4a,0x82,0x86,0x2f ;L.!.J../
             2F
      00C463 76 24 50 60 89 B0 FF  1719         .db     0x76,0x24,0x50,0x60,0x89,0xb0,0xff,0x4a ;v$P`.0.J
             4A
      00C46B 82 0E 72 57 01 24 30  1720         .db     0x82,0x0e,0x72,0x57,0x01,0x24,0x30,0x4c ;..rW.$0L
             4C
      00C473 60 85 AD FF 4A 66 2E  1721         .db     0x60,0x85,0xad,0xff,0x4a,0x66,0x2e,0x13 ;`.-.Jf..
             13
      00C47B 16 24 40 88 90 A4 FF  1722         .db     0x16,0x24,0x40,0x88,0x90,0xa4,0xff,0x0a ;.$@..$..
             0A
      00C483 42 0E 4E 73 16 00 20  1723         .db     0x42,0x0e,0x4e,0x73,0x16,0x00,0x20,0x44 ;B.Ns.. D
             44
      00C48B 50 80 A5 FF 4A 03 07  1724         .db     0x50,0x80,0xa5,0xff,0x4a,0x03,0x07,0x72 ;P.%.J..r
             72
      00C493 76 08 28 4C 80 88 FF  1725         .db     0x76,0x08,0x28,0x4c,0x80,0x88,0xff,0x6a ;v.(L...j
             6A
      00C49B 02 42 96 04 10 24 30  1726         .db     0x02,0x42,0x96,0x04,0x10,0x24,0x30,0x45 ;.B...$0E
             45
      00C4A3 6D 80 8C A1 FF 0A 03  1727         .db     0x6d,0x80,0x8c,0xa1,0xff,0x0a,0x03,0x26 ;m..!...&
             26
      00C4AB 8E 92 0C 48 50 68 80  1728         .db     0x8e,0x92,0x0c,0x48,0x50,0x68,0x80,0xa1 ;...HPh.!
             A1
      00C4B3 FF 0A 43 46 0E 32 72  1729         .db     0xff,0x0a,0x43,0x46,0x0e,0x32,0x72,0x36 ;..CF.2r6
             36
      00C4BB 76 10 20 48 68 84 A0  1730         .db     0x76,0x10,0x20,0x48,0x68,0x84,0xa0,0xff ;v. Hh. .
             FF
      00C4C3 0A 42 0E 36 00 20 44  1731         .db     0x0a,0x42,0x0e,0x36,0x00,0x20,0x44,0x4c ;.B.6. DL
             4C
      00C4CB 64 6C 80 88 A0 FF 2A  1732         .db     0x64,0x6c,0x80,0x88,0xa0,0xff,0x2a,0x82 ;dl.. .*.
             82
      00C4D3 8E 72 01 20 40 4C 60  1733         .db     0x8e,0x72,0x01,0x20,0x40,0x4c,0x60,0x68 ;.r. @L`h
             68
      00C4DB B0 FF 0A 22 62 67 2E  1734         .db     0xb0,0xff,0x0a,0x22,0x62,0x67,0x2e,0x13 ;0.."bg..
             13
      00C4E3 17 00 44 89 AC FF 2A  1735         .db     0x17,0x00,0x44,0x89,0xac,0xff,0x2a,0x63 ;..D.,.*c
             63
      00C4EB 06 8E 13 16 56 08 40  1736         .db     0x06,0x8e,0x13,0x16,0x56,0x08,0x40,0x69 ;....V.@i
             69
      00C4F3 A4 B0 FF 4A 22 46 0E  1737         .db     0xa4,0xb0,0xff,0x4a,0x22,0x46,0x0e,0x6e ;$0.J"F.n
             6E
      00C4FB 92 16 01 24 4D 70 A5  1738         .db     0x92,0x16,0x01,0x24,0x4d,0x70,0xa5,0xff ;...$Mp%.
             FF
      00C503 0A 02 82 67 8E 52 56  1739         .db     0x0a,0x02,0x82,0x67,0x8e,0x52,0x56,0x30 ;...g.RV0
             30
      00C50B 40 48 68 B0 FF 0A 22  1740         .db     0x40,0x48,0x68,0xb0,0xff,0x0a,0x22,0x62 ;@Hh0.."b
             62
      00C513 26 86 53 96 00 2C 48  1741         .db     0x26,0x86,0x53,0x96,0x00,0x2c,0x48,0x64 ;&.S..,Hd
             64
      00C51B 88 A9 FF 0A 22 46 0E  1742         .db     0x88,0xa9,0xff,0x0a,0x22,0x46,0x0e,0x6e ;.).."F.n
             6E
      00C523 13 17 00 48 70 81 A5  1743         .db     0x13,0x17,0x00,0x48,0x70,0x81,0xa5,0xff ;...Hp.%.
             FF
      00C52B 0A 23 2E 73 16 00 0C  1744         .db     0x0a,0x23,0x2e,0x73,0x16,0x00,0x0c,0x50 ;.#.s...P
             50
      00C533 65 A1 FF 0A 82 52 2C  1745         .db     0x65,0xa1,0xff,0x0a,0x82,0x52,0x2c,0x41 ;e!...R,A
             41
      00C53B 60 84 8C A4 AC FF 0A  1746         .db     0x60,0x84,0x8c,0xa4,0xac,0xff,0x0a,0x02 ;`..$,...
             02
      00C543 42 07 92 36 96 10 49  1747         .db     0x42,0x07,0x92,0x36,0x96,0x10,0x49,0x64 ;B..6..Id
             64
      00C54B 80 A0 A8 FF 0A 23 46  1748         .db     0x80,0xa0,0xa8,0xff,0x0a,0x23,0x46,0x0f ;. (..#F.
             0F
      00C553 92 00 50 69 88 A0 A8  1749         .db     0x92,0x00,0x50,0x69,0x88,0xa0,0xa8,0xff ;..Pi. (.
             FF
      00C55B 4A 82 6F 12 16 56 01  1750         .db     0x4a,0x82,0x6f,0x12,0x16,0x56,0x01,0x25 ;J.o..V.%
             25
      00C563 4C 60 90 A4 B0 FF 2A  1751         .db     0x4c,0x60,0x90,0xa4,0xb0,0xff,0x2a,0x02 ;L`.$0.*.
             02
      00C56B 07 72 57 30 4C 80 88  1752         .db     0x07,0x72,0x57,0x30,0x4c,0x80,0x88,0xa1 ;.rW0L..!
             A1
      00C573 FF 4A 22 62 66 0E 92  1753         .db     0xff,0x4a,0x22,0x62,0x66,0x0e,0x92,0x36 ;.J"bf..6
             36
      00C57B 96 01 4C 6C 88 A1 FF  1754         .db     0x96,0x01,0x4c,0x6c,0x88,0xa1,0xff,0x0a ;..Ll.!..
             0A
      00C583 22 82 0E 4E 73 77 00  1755         .db     0x22,0x82,0x0e,0x4e,0x73,0x77,0x00,0x50 ;"..Nsw.P
             50
      00C58B 60 85 A5 FF 4A 66 13  1756         .db     0x60,0x85,0xa5,0xff,0x4a,0x66,0x13,0x17 ;`.%.Jf..
             17
      00C593 01 24 40 88 90 A4 AC  1757         .db     0x01,0x24,0x40,0x88,0x90,0xa4,0xac,0xff ;.$@..$,.
             FF
      00C59B 6A 22 86 0F 12 36 76  1758         .db     0x6a,0x22,0x86,0x0f,0x12,0x36,0x76,0x24 ;j"...6v$
             24
      00C5A3 44 60 8C A8 B0 FF 0A  1759         .db     0x44,0x60,0x8c,0xa8,0xb0,0xff,0x0a,0x22 ;D`.(0.."
             22
      00C5AB 62 46 86 0E 13 00 48  1760         .db     0x62,0x46,0x86,0x0e,0x13,0x00,0x48,0x6c ;bF....Hl
             6C
      00C5B3 8C A9 FF 6A 82 06 2F  1761         .db     0x8c,0xa9,0xff,0x6a,0x82,0x06,0x2f,0x32 ;.).j../2
             32
      00C5BB 96 09 44 60 70 A5 FF  1762         .db     0x96,0x09,0x44,0x60,0x70,0xa5,0xff,0x2a ;..D`p%.*
             2A
      00C5C3 63 06 72 36 08 2C 40  1763         .db     0x63,0x06,0x72,0x36,0x08,0x2c,0x40,0x4c ;c.r6.,@L
             4C
      00C5CB 64 84 A9 FF 2A 63 4E  1764         .db     0x64,0x84,0xa9,0xff,0x2a,0x63,0x4e,0x76 ;d.).*cNv
             76
      00C5D3 04 2D 40 50 64 88 A5  1765         .db     0x04,0x2d,0x40,0x50,0x64,0x88,0xa5,0xff ;.-@Pd.%.
             FF
      00C5DB 6A 02 2E 6E 92 17 08  1766         .db     0x6a,0x02,0x2e,0x6e,0x92,0x17,0x08,0x24 ;j..n...$
             24
      00C5E3 41 70 A5 FF 4A 22 82  1767         .db     0x41,0x70,0xa5,0xff,0x4a,0x22,0x82,0x0e ;Ap%.J"..
             0E
      00C5EB 73 16 56 24 4C 60 85  1768         .db     0x73,0x16,0x56,0x24,0x4c,0x60,0x85,0xa5 ;s.V$L`.%
             A5
      00C5F3 FF 0A 82 26 6E 73 77  1769         .db     0xff,0x0a,0x82,0x26,0x6e,0x73,0x77,0x00 ;...&nsw.
             00
      00C5FB 2D 48 50 60 A5 FF 4A  1770         .db     0x2d,0x48,0x50,0x60,0xa5,0xff,0x4a,0x63 ;-HP`%.Jc
             63
      00C603 06 86 4F 32 36 96 09  1771         .db     0x06,0x86,0x4f,0x32,0x36,0x96,0x09,0x28 ;..O26..(
             28
      00C60B 40 70 A9 FF 4A 03 06  1772         .db     0x40,0x70,0xa9,0xff,0x4a,0x03,0x06,0x73 ;@p).J..s
             73
      00C613 36 76 08 10 4C 60 81  1773         .db     0x36,0x76,0x08,0x10,0x4c,0x60,0x81,0xa0 ;6v..L`. 
             A0
      00C61B FF 0A 63 52 56 30 41  1774         .db     0xff,0x0a,0x63,0x52,0x56,0x30,0x41,0x65 ;..cRV0Ae
             65
      00C623 89 A4 AC FF 4A 22 86  1775         .db     0x89,0xa4,0xac,0xff,0x4a,0x22,0x86,0x0e ;.$,.J"..
             0E
      00C62B 12 16 76 00 24 4D 60  1776         .db     0x12,0x16,0x76,0x00,0x24,0x4d,0x60,0xa8 ;..v.$M`(
             A8
      00C633 B0 FF 0A 03 4E 96 2D  1777         .db     0xb0,0xff,0x0a,0x03,0x4e,0x96,0x2d,0x44 ;0...N.-D
             44
      00C63B 70 80 88 A0 A8 FF 0A  1778         .db     0x70,0x80,0x88,0xa0,0xa8,0xff,0x0a,0x42 ;p.. (..B
             42
      00C643 0E 32 37 10 20 45 64  1779         .db     0x0e,0x32,0x37,0x10,0x20,0x45,0x64,0x6c ;.27. Edl
             6C
      00C64B 80 FF 4A 03 07 73 76  1780         .db     0x80,0xff,0x4a,0x03,0x07,0x73,0x76,0x08 ;..J..sv.
             08
      00C653 4C 60 81 A0 A8 FF 0A  1781         .db     0x4c,0x60,0x81,0xa0,0xa8,0xff,0x0a,0x42 ;L`. (..B
             42
      00C65B 82 2E 32 0C 20 44 6C  1782         .db     0x82,0x2e,0x32,0x0c,0x20,0x44,0x6c,0x89 ;..2. Dl.
             89
      00C663 A4 AC FF 0A 03 6E 92  1783         .db     0xa4,0xac,0xff,0x0a,0x03,0x6e,0x92,0x36 ;$,...n.6
             36
      00C66B 76 10 44 4C 81 A0 A8  1784         .db     0x76,0x10,0x44,0x4c,0x81,0xa0,0xa8,0xff ;v.DL. (.
             FF
      00C673 6A 22 82 0E 32 92 36  1785         .db     0x6a,0x22,0x82,0x0e,0x32,0x92,0x36,0x76 ;j"..2.6v
             76
      00C67B 00 10 45 6C A5 FF 0A  1786         .db     0x00,0x10,0x45,0x6c,0xa5,0xff,0x0a,0x43 ;..El%..C
             43
      00C683 0E 8E 32 72 37 10 20  1787         .db     0x0e,0x8e,0x32,0x72,0x37,0x10,0x20,0x44 ;..2r7. D
             44
      00C68B 68 84 B0 FF 0A 63 66  1788         .db     0x68,0x84,0xb0,0xff,0x0a,0x63,0x66,0x32 ;h.0..cf2
             32
      00C693 0C 20 40 48 69 8C A4  1789         .db     0x0c,0x20,0x40,0x48,0x69,0x8c,0xa4,0xac ;. @Hi.$,
             AC
      00C69B FF 0A 67 0E 8E 12 52  1790         .db     0xff,0x0a,0x67,0x0e,0x8e,0x12,0x52,0x16 ;..g...R.
             16
      00C6A3 56 40 48 68 B0 FF 0A  1791         .db     0x56,0x40,0x48,0x68,0xb0,0xff,0x0a,0x23 ;V@Hh0..#
             23
      00C6AB 86 8E 72 00 2C 44 4C  1792         .db     0x86,0x8e,0x72,0x00,0x2c,0x44,0x4c,0x65 ;..r.,DLe
             65
      00C6B3 B0 FF 2A 07 72 57 08  1793         .db     0xb0,0xff,0x2a,0x07,0x72,0x57,0x08,0x30 ;0.*.rW.0
             30
      00C6BB 4C 80 88 A0 A8 FF 6A  1794         .db     0x4c,0x80,0x88,0xa0,0xa8,0xff,0x6a,0x03 ;L.. (.j.
             03
      00C6C3 8E 32 36 76 0C 45 60  1795         .db     0x8e,0x32,0x36,0x76,0x0c,0x45,0x60,0x6c ;.26v.E`l
             6C
      00C6CB A1 FF 2A 43 46 0E 73  1796         .db     0xa1,0xff,0x2a,0x43,0x46,0x0e,0x73,0x01 ;!.*CF.s.
             01
      00C6D3 20 4C 85 A1 FF 6A 22  1797         .db     0x20,0x4c,0x85,0xa1,0xff,0x6a,0x22,0x86 ; L.!.j".
             86
      00C6DB 0F 16 00 24 44 50 60  1798         .db     0x0f,0x16,0x00,0x24,0x44,0x50,0x60,0xa8 ;...$DP`(
             A8
      00C6E3 B0 FF 4A 42 82 0E 73  1799         .db     0xb0,0xff,0x4a,0x42,0x82,0x0e,0x73,0x17 ;0.JB..s.
             17
      00C6EB 01 21 4C 85 FF 0A 82  1800         .db     0x01,0x21,0x4c,0x85,0xff,0x0a,0x82,0x26 ;.!L....&
             26
      00C6F3 6E 32 00 0C 48 60 70  1801         .db     0x6e,0x32,0x00,0x0c,0x48,0x60,0x70,0x84 ;n2..H`p.
             84
      00C6FB A5 FF 2A 42 06 46 0E  1802         .db     0xa5,0xff,0x2a,0x42,0x06,0x46,0x0e,0x8e ;%.*B.F..
             8E
      00C703 73 77 4D 68 A0 FF 6A  1803         .db     0x73,0x77,0x4d,0x68,0xa0,0xff,0x6a,0x02 ;swMh .j.
             02
      00C70B 82 66 2E 6E 32 92 17  1804         .db     0x82,0x66,0x2e,0x6e,0x32,0x92,0x17,0x08 ;.f.n2...
             08
      00C713 41 70 A5 FF 4A 03 07  1805         .db     0x41,0x70,0xa5,0xff,0x4a,0x03,0x07,0x72 ;Ap%.J..r
             72
      00C71B 28 4C 80 88 A0 FF 2A  1806         .db     0x28,0x4c,0x80,0x88,0xa0,0xff,0x2a,0x02 ;(L.. .*.
             02
      00C723 42 0F 12 77 04 50 65  1807         .db     0x42,0x0f,0x12,0x77,0x04,0x50,0x65,0x80 ;B..w.Pe.
             80
      00C72B FF 0A 23 0E 8E 72 56  1808         .db     0xff,0x0a,0x23,0x0e,0x8e,0x72,0x56,0x00 ;..#..rV.
             00
      00C733 30 44 4C 65 B0 FF 0A  1809         .db     0x30,0x44,0x4c,0x65,0xb0,0xff,0x0a,0x42 ;0DLe0..B
             42
      00C73B 2F 16 96 0C 20 44 70  1810         .db     0x2f,0x16,0x96,0x0c,0x20,0x44,0x70,0x80 ;/... Dp.
             80
      00C743 88 A0 A8 FF 0A 42 82  1811         .db     0x88,0xa0,0xa8,0xff,0x0a,0x42,0x82,0x47 ;. (..B.G
             47
      00C74B 6E 12 52 17 00 20 48  1812         .db     0x6e,0x12,0x52,0x17,0x00,0x20,0x48,0x90 ;n.R.. H.
             90
      00C753 A5 FF 2A 02 82 86 6E  1813         .db     0xa5,0xff,0x2a,0x02,0x82,0x86,0x6e,0x17 ;%.*...n.
             17
      00C75B 04 0C 4C 61 A8 B0 FF  1814         .db     0x04,0x0c,0x4c,0x61,0xa8,0xb0,0xff,0x0a ;..La(0..
             0A
      00C763 03 06 52 92 17 0C 44  1815         .db     0x03,0x06,0x52,0x92,0x17,0x0c,0x44,0x60 ;..R...D`
             60
      00C76B 80 A0 A8 FF 2A 22 62  1816         .db     0x80,0xa0,0xa8,0xff,0x2a,0x22,0x62,0x0e ;. (.*"b.
             0E
      00C773 73 16 56 01 4C 85 A4  1817         .db     0x73,0x16,0x56,0x01,0x4c,0x85,0xa4,0xff ;s.V.L.$.
             FF
      00C77B 0A 02 2E 36 76 10 41  1818         .db     0x0a,0x02,0x2e,0x36,0x76,0x10,0x41,0x65 ;...6v.Ae
             65
      00C783 A0 A8 FF 0A 82 52 0C  1819         .db     0xa0,0xa8,0xff,0x0a,0x82,0x52,0x0c,0x41 ; (...R.A
             41
      00C78B 60 68 84 8C A4 AC FF  1820         .db     0x60,0x68,0x84,0x8c,0xa4,0xac,0xff,0x0a ;`h..$,..
             0A
      00C793 22 62 66 52 77 00 2D  1821         .db     0x22,0x62,0x66,0x52,0x77,0x00,0x2d,0x44 ;"bfRw.-D
             44
      00C79B 68 89 A1 FF 4A 02 67  1822         .db     0x68,0x89,0xa1,0xff,0x4a,0x02,0x67,0x0e ;h.!.J.g.
             0E
      00C7A3 72 36 96 04 24 40 4C  1823         .db     0x72,0x36,0x96,0x04,0x24,0x40,0x4c,0x88 ;r6..$@L.
             88
      00C7AB A9 FF 4A 46 0E 92 37  1824         .db     0xa9,0xff,0x4a,0x46,0x0e,0x92,0x37,0x10 ;).JF..7.
             10
      00C7B3 21 6C 85 A5 FF 0A 03  1825         .db     0x21,0x6c,0x85,0xa5,0xff,0x0a,0x03,0x0f ;!l.%....
             0F
      00C7BB 92 96 30 44 50 80 A0  1826         .db     0x92,0x96,0x30,0x44,0x50,0x80,0xa0,0xa8 ;..0DP. (
             A8
      00C7C3 FF 6A 82 06 4E 16 56  1827         .db     0xff,0x6a,0x82,0x06,0x4e,0x16,0x56,0x29 ;.j..N.V)
             29
      00C7CB 44 60 8D A8 B0 FF 0A  1828         .db     0x44,0x60,0x8d,0xa8,0xb0,0xff,0x0a,0x42 ;D`.(0..B
             42
      00C7D3 82 4E 8E 53 16 00 0C  1829         .db     0x82,0x4e,0x8e,0x53,0x16,0x00,0x0c,0x2c ;.N.S...,
             2C
      00C7DB 44 84 A4 B0 FF 2A 02  1830         .db     0x44,0x84,0xa4,0xb0,0xff,0x2a,0x02,0x26 ;D.$0.*.&
             26
      00C7E3 0E 56 96 04 10 30 4C  1831         .db     0x0e,0x56,0x96,0x04,0x10,0x30,0x4c,0x61 ;.V...0La
             61
      00C7EB A0 FF 0A 22 62 26 86  1832         .db     0xa0,0xff,0x0a,0x22,0x62,0x26,0x86,0x0e ; .."b&..
             0E
      00C7F3 53 57 00 30 48 64 A9  1833         .db     0x53,0x57,0x00,0x30,0x48,0x64,0xa9,0xff ;SW.0Hd).
             FF
      00C7FB 6A 82 06 4E 16 56 08  1834         .db     0x6a,0x82,0x06,0x4e,0x16,0x56,0x08,0x29 ;j..N.V.)
             29
      00C803 44 60 8D A8 B0 FF 6A  1835         .db     0x44,0x60,0x8d,0xa8,0xb0,0xff,0x6a,0x22 ;D`.(0.j"
             22
      00C80B 86 0F 12 00 24 44 60  1836         .db     0x86,0x0f,0x12,0x00,0x24,0x44,0x60,0xa8 ;....$D`(
             A8
      00C813 B0 FF 0A 22 82 0F 72  1837         .db     0xb0,0xff,0x0a,0x22,0x82,0x0f,0x72,0x00 ;0.."..r.
             00
      00C81B 50 60 68 85 A8 FF 2A  1838         .db     0x50,0x60,0x68,0x85,0xa8,0xff,0x2a,0x23 ;P`h.(.*#
             23
      00C823 0E 73 17 01 4C 65 80  1839         .db     0x0e,0x73,0x17,0x01,0x4c,0x65,0x80,0xff ;.s..Le..
             FF
      00C82B 4A 02 42 26 6E 17 04  1840         .db     0x4a,0x02,0x42,0x26,0x6e,0x17,0x04,0x29 ;J.B&n..)
             29
      00C833 4C 70 81 A5 FF 4A 66  1841         .db     0x4c,0x70,0x81,0xa5,0xff,0x4a,0x66,0x13 ;Lp.%.Jf.
             13
      00C83B 17 01 24 40 88 90 FF  1842         .db     0x17,0x01,0x24,0x40,0x88,0x90,0xff,0x2a ;..$@...*
             2A
      00C843 43 26 0E 72 36 96 01  1843         .db     0x43,0x26,0x0e,0x72,0x36,0x96,0x01,0x4c ;C&.r6..L
             4C
      00C84B 85 A1 FF 2A 02 4F 92  1844         .db     0x85,0xa1,0xff,0x2a,0x02,0x4f,0x92,0x16 ;.!.*.O..
             16
      00C853 05 2C 40 50 70 A0 A8  1845         .db     0x05,0x2c,0x40,0x50,0x70,0xa0,0xa8,0xff ;.,@Pp (.
             FF
      00C85B 0A 22 62 26 66 13 16  1846         .db     0x0a,0x22,0x62,0x26,0x66,0x13,0x16,0x96 ;."b&f...
             96
      00C863 00 48 68 70 8C A0 FF  1847         .db     0x00,0x48,0x68,0x70,0x8c,0xa0,0xff,0x6a ;.Hhp. .j
             6A
      00C86B 82 2E 6E 13 05 21 44  1848         .db     0x82,0x2e,0x6e,0x13,0x05,0x21,0x44,0x60 ;..n..!D`
             60
      00C873 90 A4 AC FF 0A 26 6E  1849         .db     0x90,0xa4,0xac,0xff,0x0a,0x26,0x6e,0x13 ;.$,..&n.
             13
      00C87B 36 96 00 48 64 70 81  1850         .db     0x36,0x96,0x00,0x48,0x64,0x70,0x81,0xa5 ;6..Hdp.%
             A5
      00C883 FF 4A 03 06 73 76 08  1851         .db     0xff,0x4a,0x03,0x06,0x73,0x76,0x08,0x10 ;.J..sv..
             10
      00C88B 4C 60 81 A0 A8 FF 0A  1852         .db     0x4c,0x60,0x81,0xa0,0xa8,0xff,0x0a,0x22 ;L`. (.."
             22
      00C893 62 27 8E 13 17 00 48  1853         .db     0x62,0x27,0x8e,0x13,0x17,0x00,0x48,0x90 ;b'....H.
             90
      00C89B A1 FF 4A 03 0E 72 24  1854         .db     0xa1,0xff,0x4a,0x03,0x0e,0x72,0x24,0x4c ;!.J..r$L
             4C
      00C8A3 80 88 FF 6A 22 86 72  1855         .db     0x80,0x88,0xff,0x6a,0x22,0x86,0x72,0x17 ;...j".r.
             17
      00C8AB 00 08 44 4C 60 A8 B0  1856         .db     0x00,0x08,0x44,0x4c,0x60,0xa8,0xb0,0xff ;..DL`(0.
             FF
      00C8B3 4A 63 0F 53 56 96 04  1857         .db     0x4a,0x63,0x0f,0x53,0x56,0x96,0x04,0x24 ;Jc.SV..$
             24
      00C8BB 30 40 88 A5 FF 0A 22  1858         .db     0x30,0x40,0x88,0xa5,0xff,0x0a,0x22,0x62 ;0@.%.."b
             62
      00C8C3 26 66 13 17 00 48 68  1859         .db     0x26,0x66,0x13,0x17,0x00,0x48,0x68,0x70 ;&f...Hhp
             70
      00C8CB 8C A0 FF 2A 63 4E 96  1860         .db     0x8c,0xa0,0xff,0x2a,0x63,0x4e,0x96,0x04 ;. .*cN..
             04
      00C8D3 10 2D 40 64 70 85 A4  1861         .db     0x10,0x2d,0x40,0x64,0x70,0x85,0xa4,0xff ;.-@dp.$.
             FF
      00C8DB 0A 02 07 0E 92 10 30  1862         .db     0x0a,0x02,0x07,0x0e,0x92,0x10,0x30,0x48 ;......0H
             48
      00C8E3 50 80 A0 A8 FF 4A 02  1863         .db     0x50,0x80,0xa0,0xa8,0xff,0x4a,0x02,0x0e ;P. (.J..
             0E
      00C8EB 92 36 76 10 24 4C 6C  1864         .db     0x92,0x36,0x76,0x10,0x24,0x4c,0x6c,0x80 ;.6v.$Ll.
             80
      00C8F3 88 FF 4A 02 06 8E 12  1865         .db     0x88,0xff,0x4a,0x02,0x06,0x8e,0x12,0x92 ;..J.....
             92
      00C8FB 36 76 08 28 4C 6C 81  1866         .db     0x36,0x76,0x08,0x28,0x4c,0x6c,0x81,0xa0 ;6v.(Ll. 
             A0
      00C903 FF 4A 43 0E 92 16 56  1867         .db     0xff,0x4a,0x43,0x0e,0x92,0x16,0x56,0x01 ;.JC...V.
             01
      00C90B 21 6C 85 FF 2A 63 86  1868         .db     0x21,0x6c,0x85,0xff,0x2a,0x63,0x86,0x4e ;!l..*c.N
             4E
      00C913 53 04 0C 2C 40 64 A8  1869         .db     0x53,0x04,0x0c,0x2c,0x40,0x64,0xa8,0xb0 ;S..,@d(0
             B0
      00C91B FF 0A 82 2E 6E 17 00  1870         .db     0xff,0x0a,0x82,0x2e,0x6e,0x17,0x00,0x0c ;....n...
             0C
      00C923 41 60 70 A5 FF 0A 22  1871         .db     0x41,0x60,0x70,0xa5,0xff,0x0a,0x22,0x82 ;A`p%..".
             82
      00C92B 26 0F 72 00 50 60 68  1872         .db     0x26,0x0f,0x72,0x00,0x50,0x60,0x68,0xa9 ;&.r.P`h)
             A9
      00C933 FF 0A 03 06 6E 33 37  1873         .db     0xff,0x0a,0x03,0x06,0x6e,0x33,0x37,0x0d ;....n37.
             0D
      00C93B 45 60 90 A0 A8 FF 2A  1874         .db     0x45,0x60,0x90,0xa0,0xa8,0xff,0x2a,0x63 ;E`. (.*c
             63
      00C943 86 4E 72 16 76 00 08  1875         .db     0x86,0x4e,0x72,0x16,0x76,0x00,0x08,0x20 ;.Nr.v.. 
             20
      00C94B 50 64 88 A9 FF 0A 03  1876         .db     0x50,0x64,0x88,0xa9,0xff,0x0a,0x03,0x86 ;Pd.)....
             86
      00C953 6E 56 0D 45 60 90 A8  1877         .db     0x6e,0x56,0x0d,0x45,0x60,0x90,0xa8,0xb0 ;nV.E`.(0
             B0
      00C95B FF 2A 63 86 4E 53 04  1878         .db     0xff,0x2a,0x63,0x86,0x4e,0x53,0x04,0x0c ;.*c.NS..
             0C
      00C963 2C 40 64 88 A9 FF 2A  1879         .db     0x2c,0x40,0x64,0x88,0xa9,0xff,0x2a,0x03 ;,@d.).*.
             03
      00C96B 26 2E 73 77 30 50 81  1880         .db     0x26,0x2e,0x73,0x77,0x30,0x50,0x81,0xa0 ;&.sw0P. 
             A0
      00C973 A8 FF 4A 02 0F 92 96  1881         .db     0xa8,0xff,0x4a,0x02,0x0f,0x92,0x96,0x04 ;(.J.....
             04
      00C97B 10 24 50 6D 80 A0 A8  1882         .db     0x10,0x24,0x50,0x6d,0x80,0xa0,0xa8,0xff ;.$Pm. (.
             FF
      00C983 6A 22 82 06 2F 16 96  1883         .db     0x6a,0x22,0x82,0x06,0x2f,0x16,0x96,0x09 ;j"../...
             09
      00C98B 44 60 70 8C A5 FF 4A  1884         .db     0x44,0x60,0x70,0x8c,0xa5,0xff,0x4a,0x82 ;D`p.%.J.
             82
      00C993 07 4E 76 08 10 29 50  1885         .db     0x07,0x4e,0x76,0x08,0x10,0x29,0x50,0x60 ;.Nv..)P`
             60
      00C99B 85 A5 FF 2A 07 72 56  1886         .db     0x85,0xa5,0xff,0x2a,0x07,0x72,0x56,0x96 ;.%.*.rV.
             96
      00C9A3 08 30 4C 80 88 A0 A8  1887         .db     0x08,0x30,0x4c,0x80,0x88,0xa0,0xa8,0xff ;.0L.. (.
             FF
      00C9AB 0A 22 62 13 36 76 00  1888         .db     0x0a,0x22,0x62,0x13,0x36,0x76,0x00,0x44 ;."b.6v.D
             44
      00C9B3 64 6C 89 A0 FF 0A 23  1889         .db     0x64,0x6c,0x89,0xa0,0xff,0x0a,0x23,0x92 ;dl. ..#.
             92
      00C9BB 00 44 64 6C A1 FF 2A  1890         .db     0x00,0x44,0x64,0x6c,0xa1,0xff,0x2a,0x02 ;.Ddl!.*.
             02
      00C9C3 46 2E 73 16 04 0C 50  1891         .db     0x46,0x2e,0x73,0x16,0x04,0x0c,0x50,0x68 ;F.s...Ph
             68
      00C9CB 85 A1 FF 2A 43 0E 73  1892         .db     0x85,0xa1,0xff,0x2a,0x43,0x0e,0x73,0x17 ;.!.*C.s.
             17
      00C9D3 01 4C 85 A0 A8 FF 2A  1893         .db     0x01,0x4c,0x85,0xa0,0xa8,0xff,0x2a,0x02 ;.L. (.*.
             02
      00C9DB 2F 12 17 05 40 61 FF  1894         .db     0x2f,0x12,0x17,0x05,0x40,0x61,0xff,0x0a ;/...@a..
             0A
      00C9E3 23 6E 33 17 00 0C 45  1895         .db     0x23,0x6e,0x33,0x17,0x00,0x0c,0x45,0x64 ;#n3...Ed
             64
      00C9EB 90 A0 A8 FF 4A 42 82  1896         .db     0x90,0xa0,0xa8,0xff,0x4a,0x42,0x82,0x46 ;. (.JB.F
             46
      00C9F3 0E 72 16 01 21 50 85  1897         .db     0x0e,0x72,0x16,0x01,0x21,0x50,0x85,0xa4 ;.r..!P.$
             A4
      00C9FB FF 2A 63 67 2E 92 17  1898         .db     0xff,0x2a,0x63,0x67,0x2e,0x92,0x17,0x04 ;.*cg....
             04
      00CA03 0C 40 6D 88 A8 FF 0A  1899         .db     0x0c,0x40,0x6d,0x88,0xa8,0xff,0x0a,0x03 ;.@m.(...
             03
      00CA0B 07 8E 13 36 48 81 A4  1900         .db     0x07,0x8e,0x13,0x36,0x48,0x81,0xa4,0xb0 ;...6H.$0
             B0
      00CA13 FF 0A 82 86 0E 53 00  1901         .db     0xff,0x0a,0x82,0x86,0x0e,0x53,0x00,0x30 ;.....S.0
             30
      00CA1B 40 48 60 A8 B0 FF 0A  1902         .db     0x40,0x48,0x60,0xa8,0xb0,0xff,0x0a,0x62 ;@H`(0..b
             62
      00CA23 66 0E 13 17 00 20 40  1903         .db     0x66,0x0e,0x13,0x17,0x00,0x20,0x40,0x48 ;f.... @H
             48
      00CA2B 68 8C A0 FF 0A 22 06  1904         .db     0x68,0x8c,0xa0,0xff,0x0a,0x22,0x06,0x66 ;h. ..".f
             66
      00CA33 6E 92 36 96 10 44 4C  1905         .db     0x6e,0x92,0x36,0x96,0x10,0x44,0x4c,0x70 ;n.6..DLp
             70
      00CA3B A0 A8 FF 0A 02 62 86  1906         .db     0xa0,0xa8,0xff,0x0a,0x02,0x62,0x86,0x2e ; (...b..
             2E
      00CA43 6E 17 41 64 70 A8 FF  1907         .db     0x6e,0x17,0x41,0x64,0x70,0xa8,0xff,0x4a ;n.Adp(.J
             4A
      00CA4B 22 62 06 46 92 16 76  1908         .db     0x22,0x62,0x06,0x46,0x92,0x16,0x76,0x29 ;"b.F..v)
             29
      00CA53 50 6C 85 A1 FF 4A 43  1909         .db     0x50,0x6c,0x85,0xa1,0xff,0x4a,0x43,0x0e ;Pl.!.JC.
             0E
      00CA5B 92 16 56 00 21 6C 85  1910         .db     0x92,0x16,0x56,0x00,0x21,0x6c,0x85,0xff ;..V.!l..
             FF
      00CA63 0A 42 82 0F 32 77 10  1911         .db     0x0a,0x42,0x82,0x0f,0x32,0x77,0x10,0x20 ;.B..2w. 
             20
      00CA6B 44 68 A4 AC FF 0A 02  1912         .db     0x44,0x68,0xa4,0xac,0xff,0x0a,0x02,0x2e ;Dh$,....
             2E
      00CA73 6E 73 16 76 0C 50 61  1913         .db     0x6e,0x73,0x16,0x76,0x0c,0x50,0x61,0x80 ;ns.v.Pa.
             80
      00CA7B A4 FF 0A 03 0E 32 72  1914         .db     0xa4,0xff,0x0a,0x03,0x0e,0x32,0x72,0x56 ;$....2rV
             56
      00CA83 10 44 60 68 80 A0 FF  1915         .db     0x10,0x44,0x60,0x68,0x80,0xa0,0xff,0x0a ;.D`h. ..
             0A
      00CA8B 42 66 6E 32 96 10 20  1916         .db     0x42,0x66,0x6e,0x32,0x96,0x10,0x20,0x45 ;Bfn2.. E
             45
      00CA93 70 A4 AC FF 0A 02 42  1917         .db     0x70,0xa4,0xac,0xff,0x0a,0x02,0x42,0x06 ;p$,...B.
             06
      00CA9B 46 8E 56 96 10 2D 48  1918         .db     0x46,0x8e,0x56,0x96,0x10,0x2d,0x48,0x68 ;F.V..-Hh
             68
      00CAA3 81 A1 FF 0A 43 0E 4E  1919         .db     0x81,0xa1,0xff,0x0a,0x43,0x0e,0x4e,0x92 ;.!..C.N.
             92
      00CAAB 77 10 20 44 50 88 A0  1920         .db     0x77,0x10,0x20,0x44,0x50,0x88,0xa0,0xa8 ;w. DP. (
             A8
      00CAB3 FF 6A 22 0F 92 16 56  1921         .db     0xff,0x6a,0x22,0x0f,0x92,0x16,0x56,0x00 ;.j"...V.
             00
      00CABB 24 44 6C 80 A0 A8 FF  1922         .db     0x24,0x44,0x6c,0x80,0xa0,0xa8,0xff,0x0a ;$Dl. (..
             0A
      00CAC3 02 07 6E 56 96 0D 30  1923         .db     0x02,0x07,0x6e,0x56,0x96,0x0d,0x30,0x48 ;..nV..0H
             48
      00CACB 60 81 FF 0A 42 82 46  1924         .db     0x60,0x81,0xff,0x0a,0x42,0x82,0x46,0x86 ;`...B.F.
             86
      00CAD3 13 00 48 6C A8 B0 FF  1925         .db     0x13,0x00,0x48,0x6c,0xa8,0xb0,0xff,0x2a ;..Hl(0.*
             2A
      00CADB 43 26 2F 92 16 96 50  1926         .db     0x43,0x26,0x2f,0x92,0x16,0x96,0x50,0x70 ;C&/...Pp
             70
      00CAE3 85 A0 A8 FF 2A 02 82  1927         .db     0x85,0xa0,0xa8,0xff,0x2a,0x02,0x82,0x67 ;. (.*..g
             67
      00CAEB 8E 12 52 16 56 04 40  1928         .db     0x8e,0x12,0x52,0x16,0x56,0x04,0x40,0x68 ;..R.V.@h
             68
      00CAF3 B0 FF 0A 82 6E 13 16  1929         .db     0xb0,0xff,0x0a,0x82,0x6e,0x13,0x16,0x00 ;0...n...
             00
      00CAFB 40 48 70 A4 AC FF 4A  1930         .db     0x40,0x48,0x70,0xa4,0xac,0xff,0x4a,0x06 ;@Hp$,.J.
             06
      00CB03 8E 32 92 36 76 28 40  1931         .db     0x8e,0x32,0x92,0x36,0x76,0x28,0x40,0x6c ;.2.6v(@l
             6C
      00CB0B 84 A1 FF 0A 22 62 86  1932         .db     0x84,0xa1,0xff,0x0a,0x22,0x62,0x86,0x8e ;.!.."b..
             8E
      00CB13 13 37 00 48 64 6C B0  1933         .db     0x13,0x37,0x00,0x48,0x64,0x6c,0xb0,0xff ;.7.Hdl0.
             FF
      00CB1B 0A 03 26 0E 73 56 96  1934         .db     0x0a,0x03,0x26,0x0e,0x73,0x56,0x96,0x10 ;..&.sV..
             10
      00CB23 30 49 A0 A8 FF 4A 06  1935         .db     0x30,0x49,0xa0,0xa8,0xff,0x4a,0x06,0x8e ;0I (.J..
             8E
      00CB2B 32 92 36 76 0C 28 40  1936         .db     0x32,0x92,0x36,0x76,0x0c,0x28,0x40,0x6c ;2.6v.(@l
             6C
      00CB33 84 A1 FF 6A 42 82 66  1937         .db     0x84,0xa1,0xff,0x6a,0x42,0x82,0x66,0x0e ;.!.jB.f.
             0E
      00CB3B 6E 92 17 00 44 4C 70  1938         .db     0x6e,0x92,0x17,0x00,0x44,0x4c,0x70,0xa5 ;n...DLp%
             A5
      00CB43 FF 2A 02 67 12 52 04  1939         .db     0xff,0x2a,0x02,0x67,0x12,0x52,0x04,0x40 ;.*.g.R.@
             40
      00CB4B 68 8C A9 FF 0A 22 62  1940         .db     0x68,0x8c,0xa9,0xff,0x0a,0x22,0x62,0x86 ;h.).."b.
             86
      00CB53 13 00 44 64 6C 8C A9  1941         .db     0x13,0x00,0x44,0x64,0x6c,0x8c,0xa9,0xff ;..Ddl.).
             FF
      00CB5B 4A 03 73 16 76 05 25  1942         .db     0x4a,0x03,0x73,0x16,0x76,0x05,0x25,0x50 ;J.s.v.%P
             50
      00CB63 81 A0 A8 FF 2A 23 26  1943         .db     0x81,0xa0,0xa8,0xff,0x2a,0x23,0x26,0x0e ;. (.*#&.
             0E
      00CB6B 36 76 10 4C 64 6C 85  1944         .db     0x36,0x76,0x10,0x4c,0x64,0x6c,0x85,0xa4 ;6v.Ldl.$
             A4
      00CB73 FF 0A 22 62 4E 73 77  1945         .db     0xff,0x0a,0x22,0x62,0x4e,0x73,0x77,0x00 ;.."bNsw.
             00
      00CB7B 2D 50 64 85 A1 FF 0A  1946         .db     0x2d,0x50,0x64,0x85,0xa1,0xff,0x0a,0x82 ;-Pd.!...
             82
      00CB83 0F 56 00 10 30 41 60  1947         .db     0x0f,0x56,0x00,0x10,0x30,0x41,0x60,0x68 ;.V..0A`h
             68
      00CB8B 88 AD FF 2A 22 62 06  1948         .db     0x88,0xad,0xff,0x2a,0x22,0x62,0x06,0x46 ;.-.*"b.F
             46
      00CB93 4E 92 16 2C 50 70 85  1949         .db     0x4e,0x92,0x16,0x2c,0x50,0x70,0x85,0xff ;N..,Pp..
             FF
      00CB9B 4A 02 07 72 08 28 4C  1950         .db     0x4a,0x02,0x07,0x72,0x08,0x28,0x4c,0x80 ;J..r.(L.
             80
      00CBA3 88 A1 FF 0A 42 82 0E  1951         .db     0x88,0xa1,0xff,0x0a,0x42,0x82,0x0e,0x4e ;.!..B..N
             4E
      00CBAB 92 36 00 10 20 70 88  1952         .db     0x92,0x36,0x00,0x10,0x20,0x70,0x88,0xa5 ;.6.. p.%
             A5
      00CBB3 FF 0A 22 66 8E 32 16  1953         .db     0xff,0x0a,0x22,0x66,0x8e,0x32,0x16,0x56 ;.."f.2.V
             56
      00CBBB 0C 45 69 90 FF 2A 02  1954         .db     0x0c,0x45,0x69,0x90,0xff,0x2a,0x02,0x52 ;.Ei..*.R
             52
      00CBC3 57 04 30 40 61 81 A4  1955         .db     0x57,0x04,0x30,0x40,0x61,0x81,0xa4,0xac ;W.0@a.$,
             AC
      00CBCB FF 6A 82 6F 12 52 16  1956         .db     0xff,0x6a,0x82,0x6f,0x12,0x52,0x16,0x56 ;.j.o.R.V
             56
      00CBD3 00 40 48 60 A4 B0 FF  1957         .db     0x00,0x40,0x48,0x60,0xa4,0xb0,0xff,0x2a ;.@H`$0.*
             2A
      00CBDB 03 0E 72 56 96 30 4C  1958         .db     0x03,0x0e,0x72,0x56,0x96,0x30,0x4c,0x80 ;..rV.0L.
             80
      00CBE3 88 A0 A8 FF 0A 26 0E  1959         .db     0x88,0xa0,0xa8,0xff,0x0a,0x26,0x0e,0x76 ;. (..&.v
             76
      00CBEB 00 30 48 50 60 68 81  1960         .db     0x00,0x30,0x48,0x50,0x60,0x68,0x81,0xa4 ;.0HP`h.$
             A4
      00CBF3 B0 FF 0A 62 86 4E 53  1961         .db     0xb0,0xff,0x0a,0x62,0x86,0x4e,0x53,0x16 ;0..b.NS.
             16
      00CBFB 56 0C 2C 41 88 A9 FF  1962         .db     0x56,0x0c,0x2c,0x41,0x88,0xa9,0xff,0x4a ;V.,A.).J
             4A
      00CC03 03 6E 73 04 0C 24 2C  1963         .db     0x03,0x6e,0x73,0x04,0x0c,0x24,0x2c,0x4c ;.ns..$,L
             4C
      00CC0B 81 A0 A8 FF 0A 23 27  1964         .db     0x81,0xa0,0xa8,0xff,0x0a,0x23,0x27,0x8e ;. (..#'.
             8E
      00CC13 13 36 48 69 81 A4 B0  1965         .db     0x13,0x36,0x48,0x69,0x81,0xa4,0xb0,0xff ;.6Hi.$0.
             FF
      00CC1B 0A 42 2E 16 76 00 0C  1966         .db     0x0a,0x42,0x2e,0x16,0x76,0x00,0x0c,0x20 ;.B..v.. 
             20
      00CC23 50 64 6C 80 88 A1 FF  1967         .db     0x50,0x64,0x6c,0x80,0x88,0xa1,0xff,0x0a ;Pdl..!..
             0A
      00CC2B 22 62 46 8E 52 37 00  1968         .db     0x22,0x62,0x46,0x8e,0x52,0x37,0x00,0x10 ;"bF.R7..
             10
      00CC33 48 68 90 A4 FF 0A 03  1969         .db     0x48,0x68,0x90,0xa4,0xff,0x0a,0x03,0x6e ;Hh.$...n
             6E
      00CC3B 92 16 56 44 4C 60 81  1970         .db     0x92,0x16,0x56,0x44,0x4c,0x60,0x81,0xa0 ;..VDL`. 
             A0
      00CC43 A8 FF 0A 43 0E 32 56  1971         .db     0xa8,0xff,0x0a,0x43,0x0e,0x32,0x56,0x96 ;(..C.2V.
             96
      00CC4B 10 20 45 68 88 A1 FF  1972         .db     0x10,0x20,0x45,0x68,0x88,0xa1,0xff,0x0a ;. Eh.!..
             0A
      00CC53 03 8E 37 45 60 68 80  1973         .db     0x03,0x8e,0x37,0x45,0x60,0x68,0x80,0x90 ;..7E`h..
             90
      00CC5B A1 FF 0A 42 46 92 77  1974         .db     0xa1,0xff,0x0a,0x42,0x46,0x92,0x77,0x0d ;!..BF.w.
             0D
      00CC63 20 48 50 69 80 FF 4A  1975         .db     0x20,0x48,0x50,0x69,0x80,0xff,0x4a,0x43 ; HPi..JC
             43
      00CC6B 0E 73 36 76 04 21 4C  1976         .db     0x0e,0x73,0x36,0x76,0x04,0x21,0x4c,0x85 ;.s6v.!L.
             85
      00CC73 A0 FF 0A 42 2E 36 76  1977         .db     0xa0,0xff,0x0a,0x42,0x2e,0x36,0x76,0x20 ; ..B.6v 
             20
      00CC7B 44 64 6C 81 A0 A8 FF  1978         .db     0x44,0x64,0x6c,0x81,0xa0,0xa8,0xff,0x6a ;Ddl. (.j
             6A
      00CC83 22 0E 92 36 10 24 44  1979         .db     0x22,0x0e,0x92,0x36,0x10,0x24,0x44,0x4c ;"..6.$DL
             4C
      00CC8B 60 70 80 A1 FF 0A 63  1980         .db     0x60,0x70,0x80,0xa1,0xff,0x0a,0x63,0x46 ;`p.!..cF
             46
      00CC93 86 13 17 00 48 6C A8  1981         .db     0x86,0x13,0x17,0x00,0x48,0x6c,0xa8,0xb0 ;....Hl(0
             B0
      00CC9B FF 0A 03 06 2E 6E 52  1982         .db     0xff,0x0a,0x03,0x06,0x2e,0x6e,0x52,0x92 ;.....nR.
             92
      00CCA3 17 0C 44 60 A0 A8 FF  1983         .db     0x17,0x0c,0x44,0x60,0xa0,0xa8,0xff,0x4a ;..D` (.J
             4A
      00CCAB 43 0E 73 36 76 01 21  1984         .db     0x43,0x0e,0x73,0x36,0x76,0x01,0x21,0x4c ;C.s6v.!L
             4C
      00CCB3 85 A0 FF 0A 22 07 6E  1985         .db     0x85,0xa0,0xff,0x0a,0x22,0x07,0x6e,0x52 ;. ..".nR
             52
      00CCBB 17 0C 2C 48 81 A8 B0  1986         .db     0x17,0x0c,0x2c,0x48,0x81,0xa8,0xb0,0xff ;..,H.(0.
             FF
      00CCC3 4A 43 0E 73 17 01 21  1987         .db     0x4a,0x43,0x0e,0x73,0x17,0x01,0x21,0x4c ;JC.s..!L
             4C
      00CCCB 85 A0 A8 FF 0A 23 27  1988         .db     0x85,0xa0,0xa8,0xff,0x0a,0x23,0x27,0x92 ;. (..#'.
             92
      00CCD3 96 00 48 68 70 80 A1  1989         .db     0x96,0x00,0x48,0x68,0x70,0x80,0xa1,0xff ;..Hhp.!.
             FF
      00CCDB 2A 62 66 2E 8E 13 04  1990         .db     0x2a,0x62,0x66,0x2e,0x8e,0x13,0x04,0x40 ;*bf....@
             40
      00CCE3 68 70 A1 FF 2A 23 86  1991         .db     0x68,0x70,0xa1,0xff,0x2a,0x23,0x86,0x6e ;hp!.*#.n
             6E
      00CCEB 12 16 01 4D 64 A8 B0  1992         .db     0x12,0x16,0x01,0x4d,0x64,0xa8,0xb0,0xff ;...Md(0.
             FF
      00CCF3 0A 03 46 8E 52 2C 48  1993         .db     0x0a,0x03,0x46,0x8e,0x52,0x2c,0x48,0x68 ;..F.R,Hh
             68
      00CCFB 81 A4 B0 FF 0A 23 27  1994         .db     0x81,0xa4,0xb0,0xff,0x0a,0x23,0x27,0x0e ;.$0..#'.
             0E
      00CD03 92 00 48 69 80 88 A1  1995         .db     0x92,0x00,0x48,0x69,0x80,0x88,0xa1,0xff ;..Hi..!.
             FF
      00CD0B 0A 03 86 6E 33 16 56  1996         .db     0x0a,0x03,0x86,0x6e,0x33,0x16,0x56,0x0c ;...n3.V.
             0C
      00CD13 45 60 90 A9 FF 0A 03  1997         .db     0x45,0x60,0x90,0xa9,0xff,0x0a,0x03,0x06 ;E`.)....
             06
      00CD1B 2E 6E 52 92 16 0C 44  1998         .db     0x2e,0x6e,0x52,0x92,0x16,0x0c,0x44,0x60 ;.nR...D`
             60
      00CD23 A0 A8 FF 4A 42 82 47  1999         .db     0xa0,0xa8,0xff,0x4a,0x42,0x82,0x47,0x0e ; (.JB.G.
             0E
      00CD2B 92 36 76 00 21 4C 6C  2000         .db     0x92,0x36,0x76,0x00,0x21,0x4c,0x6c,0xa5 ;.6v.!Ll%
             A5
      00CD33 FF 6A 22 0E 6E 92 36  2001         .db     0xff,0x6a,0x22,0x0e,0x6e,0x92,0x36,0x96 ;.j".n.6.
             96
      00CD3B 24 44 4C 70 80 A5 FF  2002         .db     0x24,0x44,0x4c,0x70,0x80,0xa5,0xff,0x2a ;$DLp.%.*
             2A
      00CD43 02 66 0E 92 37 04 10  2003         .db     0x02,0x66,0x0e,0x92,0x37,0x04,0x10,0x40 ;.f..7..@
             40
      00CD4B 69 A0 A8 FF 0A 02 42  2004         .db     0x69,0xa0,0xa8,0xff,0x0a,0x02,0x42,0x8e ;i (...B.
             8E
      00CD53 32 56 10 45 64 6C A1  2005         .db     0x32,0x56,0x10,0x45,0x64,0x6c,0xa1,0xff ;2V.Edl!.
             FF
      00CD5B 0A 23 26 8E 53 17 00  2006         .db     0x0a,0x23,0x26,0x8e,0x53,0x17,0x00,0x0c ;.#&.S...
             0C
      00CD63 2C 48 81 A4 B0 FF 6A  2007         .db     0x2c,0x48,0x81,0xa4,0xb0,0xff,0x6a,0x02 ;,H.$0.j.
             02
      00CD6B 06 8E 32 92 37 0C 28  2008         .db     0x06,0x8e,0x32,0x92,0x37,0x0c,0x28,0x41 ;..2.7.(A
             41
      00CD73 6C A1 FF 2A 86 8E 72  2009         .db     0x6c,0xa1,0xff,0x2a,0x86,0x8e,0x72,0x76 ;l!.*..rv
             76
      00CD7B 04 0C 20 4D 60 68 B0  2010         .db     0x04,0x0c,0x20,0x4d,0x60,0x68,0xb0,0xff ;.. M`h0.
             FF
      00CD83 0A 42 2E 96 0D 20 44  2011         .db     0x0a,0x42,0x2e,0x96,0x0d,0x20,0x44,0x50 ;.B... DP
             50
      00CD8B 65 80 88 A0 A8 FF 0A  2012         .db     0x65,0x80,0x88,0xa0,0xa8,0xff,0x0a,0x43 ;e.. (..C
             43
      00CD93 46 0E 4E 92 16 00 20  2013         .db     0x46,0x0e,0x4e,0x92,0x16,0x00,0x20,0x50 ;F.N... P
             50
      00CD9B 85 A0 A8 FF 0A 23 26  2014         .db     0x85,0xa0,0xa8,0xff,0x0a,0x23,0x26,0x92 ;. (..#&.
             92
      00CDA3 37 00 48 64 6C 80 A0  2015         .db     0x37,0x00,0x48,0x64,0x6c,0x80,0xa0,0xa8 ;7.Hdl. (
             A8
      00CDAB FF 0A 23 27 92 16 96  2016         .db     0xff,0x0a,0x23,0x27,0x92,0x16,0x96,0x00 ;..#'....
             00
      00CDB3 48 68 70 A1 FF 6A 22  2017         .db     0x48,0x68,0x70,0xa1,0xff,0x6a,0x22,0x86 ;Hhp!.j".
             86
      00CDBB 0E 16 56 01 24 44 4C  2018         .db     0x0e,0x16,0x56,0x01,0x24,0x44,0x4c,0x60 ;..V.$DL`
             60
      00CDC3 A8 B0 FF 6A 06 4E 92  2019         .db     0xa8,0xb0,0xff,0x6a,0x06,0x4e,0x92,0x36 ;(0.j.N.6
             36
      00CDCB 96 09 28 41 70 A0 A8  2020         .db     0x96,0x09,0x28,0x41,0x70,0xa0,0xa8,0xff ;..(Ap (.
             FF
      00CDD3 0A 22 82 86 2E 33 17  2021         .db     0x0a,0x22,0x82,0x86,0x2e,0x33,0x17,0x00 ;."...3..
             00
      00CDDB 44 61 89 AC FF 0A 63  2022         .db     0x44,0x61,0x89,0xac,0xff,0x0a,0x63,0x0e ;Da.,..c.
             0E
      00CDE3 6E 56 30 40 48 64 AD  2023         .db     0x6e,0x56,0x30,0x40,0x48,0x64,0xad,0xff ;nV0@Hd-.
             FF
      00CDEB 4A 22 86 4E 12 16 76  2024         .db     0x4a,0x22,0x86,0x4e,0x12,0x16,0x76,0x00 ;J".N..v.
             00
      00CDF3 28 50 60 88 A8 B0 FF  2025         .db     0x28,0x50,0x60,0x88,0xa8,0xb0,0xff,0x2a ;(P`.(0.*
             2A
      00CDFB 02 42 2E 77 04 0C 30  2026         .db     0x02,0x42,0x2e,0x77,0x04,0x0c,0x30,0x50 ;.B.w..0P
             50
      00CE03 65 80 88 A0 A8 FF 2A  2027         .db     0x65,0x80,0x88,0xa0,0xa8,0xff,0x2a,0x82 ;e.. (.*.
             82
      00CE0B 0F 72 16 76 01 50 60  2028         .db     0x0f,0x72,0x16,0x76,0x01,0x50,0x60,0x68 ;.r.v.P`h
             68
      00CE13 85 A8 FF 2A 03 66 0E  2029         .db     0x85,0xa8,0xff,0x2a,0x03,0x66,0x0e,0x4e ;.(.*.f.N
             4E
      00CE1B 12 77 04 50 89 A0 A8  2030         .db     0x12,0x77,0x04,0x50,0x89,0xa0,0xa8,0xff ;.w.P. (.
             FF
      00CE23 4A 02 42 46 6E 17 04  2031         .db     0x4a,0x02,0x42,0x46,0x6e,0x17,0x04,0x0c ;J.BFn...
             0C
      00CE2B 24 4C 70 81 A5 FF 0A  2032         .db     0x24,0x4c,0x70,0x81,0xa5,0xff,0x0a,0x42 ;$Lp.%..B
             42
      00CE33 27 92 96 00 48 68 70  2033         .db     0x27,0x92,0x96,0x00,0x48,0x68,0x70,0x80 ;'...Hhp.
             80
      00CE3B 88 FF 0A 86 33 0C 44  2034         .db     0x88,0xff,0x0a,0x86,0x33,0x0c,0x44,0x60 ;....3.D`
             60
      00CE43 68 88 90 FF 0A 42 82  2035         .db     0x68,0x88,0x90,0xff,0x0a,0x42,0x82,0x26 ;h....B.&
             26
      00CE4B 6E 33 00 48 64 90 A4  2036         .db     0x6e,0x33,0x00,0x48,0x64,0x90,0xa4,0xac ;n3.Hd.$,
             AC
      00CE53 FF 4A 42 82 0E 92 36  2037         .db     0xff,0x4a,0x42,0x82,0x0e,0x92,0x36,0x76 ;.JB...6v
             76
      00CE5B 00 10 21 4C 6C A5 FF  2038         .db     0x00,0x10,0x21,0x4c,0x6c,0xa5,0xff,0x0a ;..!Ll%..
             0A
      00CE63 23 0E 6E 13 36 00 45  2039         .db     0x23,0x0e,0x6e,0x13,0x36,0x00,0x45,0x70 ;#.n.6.Ep
             70
      00CE6B 90 A0 A8 FF 2A 23 0E  2040         .db     0x90,0xa0,0xa8,0xff,0x2a,0x23,0x0e,0x73 ;. (.*#.s
             73
      00CE73 01 4C 65 88 A0 A8 FF  2041         .db     0x01,0x4c,0x65,0x88,0xa0,0xa8,0xff,0x0a ;.Le. (..
             0A
      00CE7B 42 82 46 86 0E 6E 13  2042         .db     0x42,0x82,0x46,0x86,0x0e,0x6e,0x13,0x17 ;B.F..n..
             17
      00CE83 00 48 70 A9 FF 0A 23  2043         .db     0x00,0x48,0x70,0xa9,0xff,0x0a,0x23,0x27 ;.Hp)..#'
             27
      00CE8B 2E 92 16 00 50 6D 81  2044         .db     0x2e,0x92,0x16,0x00,0x50,0x6d,0x81,0xa0 ;....Pm. 
             A0
      00CE93 A8 FF 6A 82 2F 12 96  2045         .db     0xa8,0xff,0x6a,0x82,0x2f,0x12,0x96,0x00 ;(.j./...
             00
      00CE9B 08 21 50 60 8C A4 AC  2046         .db     0x08,0x21,0x50,0x60,0x8c,0xa4,0xac,0xff ;.!P`.$,.
             FF
      00CEA3 0A 03 66 2E 92 36 0D  2047         .db     0x0a,0x03,0x66,0x2e,0x92,0x36,0x0d,0x44 ;..f..6.D
             44
      00CEAB 6D A1 FF 2A 62 46 0E  2048         .db     0x6d,0xa1,0xff,0x2a,0x62,0x46,0x0e,0x72 ;m!.*bF.r
             72
      00CEB3 36 76 01 20 4C 68 85  2049         .db     0x36,0x76,0x01,0x20,0x4c,0x68,0x85,0xa5 ;6v. Lh.%
             A5
      00CEBB FF 4A 02 0E 92 36 76  2050         .db     0xff,0x4a,0x02,0x0e,0x92,0x36,0x76,0x04 ;.J...6v.
             04
      00CEC3 24 40 4C 6C 81 A1 FF  2051         .db     0x24,0x40,0x4c,0x6c,0x81,0xa1,0xff,0x0a ;$@Ll.!..
             0A
      00CECB 42 82 2E 13 16 56 00  2052         .db     0x42,0x82,0x2e,0x13,0x16,0x56,0x00,0x20 ;B....V. 
             20
      00CED3 44 89 AC FF 0A 42 27  2053         .db     0x44,0x89,0xac,0xff,0x0a,0x42,0x27,0x92 ;D.,..B'.
             92
      00CEDB 17 00 48 68 70 80 88  2054         .db     0x17,0x00,0x48,0x68,0x70,0x80,0x88,0xa0 ;..Hhp.. 
             A0
      00CEE3 FF 4A 82 86 2F 76 05  2055         .db     0xff,0x4a,0x82,0x86,0x2f,0x76,0x05,0x24 ;.J../v.$
             24
      00CEEB 50 60 89 AD FF 4A 22  2056         .db     0x50,0x60,0x89,0xad,0xff,0x4a,0x22,0x0e ;P`.-.J".
             0E
      00CEF3 92 36 76 01 24 4C 60  2057         .db     0x92,0x36,0x76,0x01,0x24,0x4c,0x60,0x6c ;.6v.$L`l
             6C
      00CEFB 88 A1 FF 0A 03 07 0E  2058         .db     0x88,0xa1,0xff,0x0a,0x03,0x07,0x0e,0x52 ;.!.....R
             52
      00CF03 92 56 96 10 48 60 80  2059         .db     0x92,0x56,0x96,0x10,0x48,0x60,0x80,0xa0 ;.V..H`. 
             A0
      00CF0B A8 FF 0A 03 26 86 6E  2060         .db     0xa8,0xff,0x0a,0x03,0x26,0x86,0x6e,0x32 ;(...&.n2
             32
      00CF13 72 36 76 0D 48 60 A9  2061         .db     0x72,0x36,0x76,0x0d,0x48,0x60,0xa9,0xff ;r6v.H`).
             FF
      00CF1B 2A 02 82 2E 8E 72 76  2062         .db     0x2a,0x02,0x82,0x2e,0x8e,0x72,0x76,0x04 ;*....rv.
             04
      00CF23 0C 50 60 68 B0 FF 2A  2063         .db     0x0c,0x50,0x60,0x68,0xb0,0xff,0x2a,0x43 ;.P`h0.*C
             43
      00CF2B 0E 73 01 20 4C 85 A0  2064         .db     0x0e,0x73,0x01,0x20,0x4c,0x85,0xa0,0xa8 ;.s. L. (
             A8
      00CF33 FF 0A 03 86 6E 52 16  2065         .db     0xff,0x0a,0x03,0x86,0x6e,0x52,0x16,0x56 ;....nR.V
             56
      00CF3B 2C 45 60 90 AD FF 0A  2066         .db     0x2c,0x45,0x60,0x90,0xad,0xff,0x0a,0x82 ;,E`.-...
             82
      00CF43 26 0E 6E 13 00 48 61  2067         .db     0x26,0x0e,0x6e,0x13,0x00,0x48,0x61,0x84 ;&.n..Ha.
             84
      00CF4B A4 AC FF 0A 42 66 0E  2068         .db     0xa4,0xac,0xff,0x0a,0x42,0x66,0x0e,0x32 ;$,..Bf.2
             32
      00CF53 36 96 10 20 45 6D A0  2069         .db     0x36,0x96,0x10,0x20,0x45,0x6d,0xa0,0xa8 ;6.. Em (
             A8
      00CF5B FF 0A 22 62 67 2E 13  2070         .db     0xff,0x0a,0x22,0x62,0x67,0x2e,0x13,0x00 ;.."bg...
             00
      00CF63 44 6C 89 AC FF 0A 23  2071         .db     0x44,0x6c,0x89,0xac,0xff,0x0a,0x23,0x46 ;Dl.,..#F
             46
      00CF6B 0E 8E 13 00 48 69 80  2072         .db     0x0e,0x8e,0x13,0x00,0x48,0x69,0x80,0xff ;....Hi..
             FF
      00CF73 6A 03 66 2E 8E 32 16  2073         .db     0x6a,0x03,0x66,0x2e,0x8e,0x32,0x16,0x56 ;j.f..2.V
             56
      00CF7B 04 0C 44 6C A1 FF 0A  2074         .db     0x04,0x0c,0x44,0x6c,0xa1,0xff,0x0a,0x02 ;..Dl!...
             02
      00CF83 42 66 6E 32 36 96 10  2075         .db     0x42,0x66,0x6e,0x32,0x36,0x96,0x10,0x45 ;Bfn26..E
             45
      00CF8B 70 A0 AC FF 2A 22 62  2076         .db     0x70,0xa0,0xac,0xff,0x2a,0x22,0x62,0x26 ;p ,.*"b&
             26
      00CF93 0E 73 36 96 01 4C 68  2077         .db     0x0e,0x73,0x36,0x96,0x01,0x4c,0x68,0x85 ;.s6..Lh.
             85
      00CF9B A1 FF 4A 82 0F 16 76  2078         .db     0xa1,0xff,0x4a,0x82,0x0f,0x16,0x76,0x01 ;!.J...v.
             01
      00CFA3 24 50 60 6C 85 FF 0A  2079         .db     0x24,0x50,0x60,0x6c,0x85,0xff,0x0a,0x03 ;$P`l....
             03
      00CFAB 8E 56 0D 45 60 68 90  2080         .db     0x8e,0x56,0x0d,0x45,0x60,0x68,0x90,0xa1 ;.V.E`h.!
             A1
      00CFB3 FF 0A 82 86 33 0C 44  2081         .db     0xff,0x0a,0x82,0x86,0x33,0x0c,0x44,0x60 ;....3.D`
             60
      00CFBB 68 88 A8 B0 FF 4A 62  2082         .db     0x68,0x88,0xa8,0xb0,0xff,0x4a,0x62,0x66 ;h.(0.Jbf
             66
      00CFC3 2E 13 17 24 40 88 90  2083         .db     0x2e,0x13,0x17,0x24,0x40,0x88,0x90,0xa4 ;...$@..$
             A4
      00CFCB FF 0A 22 27 8E 32 17  2084         .db     0xff,0x0a,0x22,0x27,0x8e,0x32,0x17,0x00 ;.."'.2..
             00
      00CFD3 0C 48 6C 81 B0 FF 2A  2085         .db     0x0c,0x48,0x6c,0x81,0xb0,0xff,0x2a,0x62 ;.Hl.0.*b
             62
      00CFDB 06 2F 92 16 09 40 70  2086         .db     0x06,0x2f,0x92,0x16,0x09,0x40,0x70,0x85 ;./...@p.
             85
      00CFE3 A5 FF 2A 03 4F 92 16  2087         .db     0xa5,0xff,0x2a,0x03,0x4f,0x92,0x16,0x05 ;%.*.O...
             05
      00CFEB 2C 50 70 A0 A8 FF 4A  2088         .db     0x2c,0x50,0x70,0xa0,0xa8,0xff,0x4a,0x62 ;,Pp (.Jb
             62
      00CFF3 66 13 17 01 24 40 88  2089         .db     0x66,0x13,0x17,0x01,0x24,0x40,0x88,0x90 ;f...$@..
             90
      00CFFB A4 AC FF 2A 63 52 16  2090         .db     0xa4,0xac,0xff,0x2a,0x63,0x52,0x16,0x01 ;$,.*cR..
             01
      00D003 2C 40 65 8C A4 AC FF  2091         .db     0x2c,0x40,0x65,0x8c,0xa4,0xac,0xff,0x4a ;,@e.$,.J
             4A
      00D00B 66 2E 13 17 04 24 40  2092         .db     0x66,0x2e,0x13,0x17,0x04,0x24,0x40,0x88 ;f....$@.
             88
      00D013 90 A9 FF 0A 23 2E 92  2093         .db     0x90,0xa9,0xff,0x0a,0x23,0x2e,0x92,0x00 ;.)..#...
             00
      00D01B 44 64 6C A0 A8 FF 2A  2094         .db     0x44,0x64,0x6c,0xa0,0xa8,0xff,0x2a,0x63 ;Ddl (.*c
             63
      00D023 86 4E 17 2C 40 64 8D  2095         .db     0x86,0x4e,0x17,0x2c,0x40,0x64,0x8d,0xa8 ;.N.,@d.(
             A8
      00D02B B0 FF 6A 22 86 0E 12  2096         .db     0xb0,0xff,0x6a,0x22,0x86,0x0e,0x12,0x01 ;0.j"....
             01
      00D033 24 44 4C 60 A8 B0 FF  2097         .db     0x24,0x44,0x4c,0x60,0xa8,0xb0,0xff,0x4a ;$DL`(0.J
             4A
      00D03B 62 2E 13 16 04 24 40  2098         .db     0x62,0x2e,0x13,0x16,0x04,0x24,0x40,0x84 ;b....$@.
             84
      00D043 8C A4 FF 4A 82 0E 92  2099         .db     0x8c,0xa4,0xff,0x4a,0x82,0x0e,0x92,0x36 ;.$.J...6
             36
      00D04B 76 01 21 40 4C 6C 88  2100         .db     0x76,0x01,0x21,0x40,0x4c,0x6c,0x88,0xa5 ;v.!@Ll.%
             A5
      00D053 FF 0A 42 82 2E 13 17  2101         .db     0xff,0x0a,0x42,0x82,0x2e,0x13,0x17,0x00 ;..B.....
             00
      00D05B 44 69 89 A4 AC FF 4A  2102         .db     0x44,0x69,0x89,0xa4,0xac,0xff,0x4a,0x03 ;Di.$,.J.
             03
      00D063 4E 16 76 08 25 50 60  2103         .db     0x4e,0x16,0x76,0x08,0x25,0x50,0x60,0x85 ;N.v.%P`.
             85
      00D06B A5 FF 4A 22 82 0F 73  2104         .db     0xa5,0xff,0x4a,0x22,0x82,0x0f,0x73,0x16 ;%.J"..s.
             16
      00D073 96 01 24 50 60 88 A5  2105         .db     0x96,0x01,0x24,0x50,0x60,0x88,0xa5,0xff ;..$P`.%.
             FF
      00D07B 0A 42 82 46 0E 4E 92  2106         .db     0x0a,0x42,0x82,0x46,0x0e,0x4e,0x92,0x16 ;.B.F.N..
             16
      00D083 00 20 50 70 85 A5 FF  2107         .db     0x00,0x20,0x50,0x70,0x85,0xa5,0xff,0x0a ;. Pp.%..
             0A
      00D08B 23 92 96 00 44 64 6C  2108         .db     0x23,0x92,0x96,0x00,0x44,0x64,0x6c,0x80 ;#...Ddl.
             80
      00D093 88 A1 FF 2A 62 0E 16  2109         .db     0x88,0xa1,0xff,0x2a,0x62,0x0e,0x16,0x56 ;.!.*b..V
             56
      00D09B 01 20 40 64 6C 88 90  2110         .db     0x01,0x20,0x40,0x64,0x6c,0x88,0x90,0xa1 ;. @dl..!
             A1
      00D0A3 FF 4A 43 0E 73 37 04  2111         .db     0xff,0x4a,0x43,0x0e,0x73,0x37,0x04,0x10 ;.JC.s7..
             10
      00D0AB 21 4C 85 A0 A8 FF 2A  2112         .db     0x21,0x4c,0x85,0xa0,0xa8,0xff,0x2a,0x43 ;!L. (.*C
             43
      00D0B3 0E 73 16 56 01 20 4C  2113         .db     0x0e,0x73,0x16,0x56,0x01,0x20,0x4c,0x68 ;.s.V. Lh
             68
      00D0BB 88 A0 A8 FF 0A 27 0E  2114         .db     0x88,0xa0,0xa8,0xff,0x0a,0x27,0x0e,0x92 ;. (..'..
             92
      00D0C3 00 48 69 80 88 A1 FF  2115         .db     0x00,0x48,0x69,0x80,0x88,0xa1,0xff,0x0a ;.Hi..!..
             0A
      00D0CB 42 82 0E 4E 92 16 00  2116         .db     0x42,0x82,0x0e,0x4e,0x92,0x16,0x00,0x20 ;B..N... 
             20
      00D0D3 44 70 88 A5 FF 0A 03  2117         .db     0x44,0x70,0x88,0xa5,0xff,0x0a,0x03,0x26 ;Dp.%...&
             26
      00D0DB 8E 32 72 17 0C 48 68  2118         .db     0x8e,0x32,0x72,0x17,0x0c,0x48,0x68,0x80 ;.2r..Hh.
             80
      00D0E3 A0 FF 0A 42 72 77 0D  2119         .db     0xa0,0xff,0x0a,0x42,0x72,0x77,0x0d,0x20 ; ..Brw. 
             20
      00D0EB 44 50 65 80 A4 FF 4A  2120         .db     0x44,0x50,0x65,0x80,0xa4,0xff,0x4a,0x03 ;DPe.$.J.
             03
      00D0F3 06 4E 16 76 08 29 50  2121         .db     0x06,0x4e,0x16,0x76,0x08,0x29,0x50,0x60 ;.N.v.)P`
             60
      00D0FB 85 A5 FF 2A 62 2F 12  2122         .db     0x85,0xa5,0xff,0x2a,0x62,0x2f,0x12,0x00 ;.%.*b/..
             00
      00D103 08 20 40 50 64 A0 A8  2123         .db     0x08,0x20,0x40,0x50,0x64,0xa0,0xa8,0xff ;. @Pd (.
             FF
      00D10B 0A 27 92 36 96 00 48  2124         .db     0x0a,0x27,0x92,0x36,0x96,0x00,0x48,0x68 ;.'.6..Hh
             68
      00D113 70 81 FF 2A 23 0E 73  2125         .db     0x70,0x81,0xff,0x2a,0x23,0x0e,0x73,0x17 ;p..*#.s.
             17
      00D11B 01 4C 65 85 A0 A8 FF  2126         .db     0x01,0x4c,0x65,0x85,0xa0,0xa8,0xff,0x2a ;.Le. (.*
             2A
      00D123 02 6F 17 05 4C 61 80  2127         .db     0x02,0x6f,0x17,0x05,0x4c,0x61,0x80,0xb0 ;.o..La.0
             B0
      00D12B FF 2A 63 86 2E 6E 52  2128         .db     0xff,0x2a,0x63,0x86,0x2e,0x6e,0x52,0x92 ;.*c..nR.
             92
      00D133 16 56 04 0C 40 64 A8  2129         .db     0x16,0x56,0x04,0x0c,0x40,0x64,0xa8,0xff ;.V..@d(.
             FF
      00D13B 2A 43 26 0E 72 16 56  2130         .db     0x2a,0x43,0x26,0x0e,0x72,0x16,0x56,0x01 ;*C&.r.V.
             01
      00D143 4C 85 A0 A8 FF 4A 03  2131         .db     0x4c,0x85,0xa0,0xa8,0xff,0x4a,0x03,0x72 ;L. (.J.r
             72
      00D14B 16 05 24 50 60 81 A4  2132         .db     0x16,0x05,0x24,0x50,0x60,0x81,0xa4,0xac ;..$P`.$,
             AC
      00D153 FF 4A 02 07 4E 16 76  2133         .db     0xff,0x4a,0x02,0x07,0x4e,0x16,0x76,0x08 ;.J..N.v.
             08
      00D15B 29 50 60 85 A5 FF 2A  2134         .db     0x29,0x50,0x60,0x85,0xa5,0xff,0x2a,0x03 ;)P`.%.*.
             03
      00D163 46 8E 72 04 0C 2C 4C  2135         .db     0x46,0x8e,0x72,0x04,0x0c,0x2c,0x4c,0x68 ;F.r..,Lh
             68
      00D16B 81 B0 FF 0A 42 82 86  2136         .db     0x81,0xb0,0xff,0x0a,0x42,0x82,0x86,0x2e ;.0..B...
             2E
      00D173 33 00 44 65 89 A8 B0  2137         .db     0x33,0x00,0x44,0x65,0x89,0xa8,0xb0,0xff ;3.De.(0.
             FF
      00D17B 2A 63 86 4E 16 56 2C  2138         .db     0x2a,0x63,0x86,0x4e,0x16,0x56,0x2c,0x40 ;*c.N.V,@
             40
      00D183 64 8D B0 FF 0A 03 86  2139         .db     0x64,0x8d,0xb0,0xff,0x0a,0x03,0x86,0x4e ;d.0....N
             4E
      00D18B 52 16 2C 44 60 89 AD  2140         .db     0x52,0x16,0x2c,0x44,0x60,0x89,0xad,0xff ;R.,D`.-.
             FF
      00D193 0A 22 62 86 2E 33 00  2141         .db     0x0a,0x22,0x62,0x86,0x2e,0x33,0x00,0x44 ;."b..3.D
             44
      00D19B 65 89 A9 FF 0A 22 62  2142         .db     0x65,0x89,0xa9,0xff,0x0a,0x22,0x62,0x8e ;e.).."b.
             8E
      00D1A3 13 16 00 48 65 90 A0  2143         .db     0x13,0x16,0x00,0x48,0x65,0x90,0xa0,0xb0 ;...He. 0
             B0
      00D1AB FF 0A 63 66 32 16 96  2144         .db     0xff,0x0a,0x63,0x66,0x32,0x16,0x96,0x0c ;..cf2...
             0C
      00D1B3 20 40 48 6D 8C A4 AC  2145         .db     0x20,0x40,0x48,0x6d,0x8c,0xa4,0xac,0xff ; @Hm.$,.
             FF
      00D1BB 2A 02 42 26 0E 56 96  2146         .db     0x2a,0x02,0x42,0x26,0x0e,0x56,0x96,0x04 ;*.B&.V..
             04
      00D1C3 30 4C 65 A0 FF 2A 63  2147         .db     0x30,0x4c,0x65,0xa0,0xff,0x2a,0x63,0x0e ;0Le .*c.
             0E
      00D1CB 4E 52 01 30 40 64 A5  2148         .db     0x4e,0x52,0x01,0x30,0x40,0x64,0xa5,0xff ;NR.0@d%.
             FF
      00D1D3 0A 66 32 37 0D 20 40  2149         .db     0x0a,0x66,0x32,0x37,0x0d,0x20,0x40,0x48 ;.f27. @H
             48
      00D1DB 69 8C A0 FF 2A 06 46  2150         .db     0x69,0x8c,0xa0,0xff,0x2a,0x06,0x46,0x8e ;i. .*.F.
             8E
      00D1E3 76 08 10 2D 50 68 81  2151         .db     0x76,0x08,0x10,0x2d,0x50,0x68,0x81,0xb0 ;v..-Ph.0
             B0
      00D1EB FF 0A 03 26 86 6E 32  2152         .db     0xff,0x0a,0x03,0x26,0x86,0x6e,0x32,0x72 ;...&.n2r
             72
      00D1F3 0D 48 60 A9 FF 0A 42  2153         .db     0x0d,0x48,0x60,0xa9,0xff,0x0a,0x42,0x0e ;.H`)..B.
             0E
      00D1FB 8E 17 00 44 4C 65 80  2154         .db     0x8e,0x17,0x00,0x44,0x4c,0x65,0x80,0xb0 ;...DLe.0
             B0
      00D203 FF 4A 22 82 0E 73 16  2155         .db     0xff,0x4a,0x22,0x82,0x0e,0x73,0x16,0x56 ;.J"..s.V
             56
      00D20B 01 4C 60 85 A4 FF 2A  2156         .db     0x01,0x4c,0x60,0x85,0xa4,0xff,0x2a,0x23 ;.L`.$.*#
             23
      00D213 0E 73 36 76 01 4C 65  2157         .db     0x0e,0x73,0x36,0x76,0x01,0x4c,0x65,0xa0 ;.s6v.Le 
             A0
      00D21B A8 FF 4A 02 42 27 8E  2158         .db     0xa8,0xff,0x4a,0x02,0x42,0x27,0x8e,0x36 ;(.J.B'.6
             36
      00D223 76 05 28 4C 6C 81 B0  2159         .db     0x76,0x05,0x28,0x4c,0x6c,0x81,0xb0,0xff ;v.(Ll.0.
             FF
      00D22B 0A 63 2F 76 00 0C 20  2160         .db     0x0a,0x63,0x2f,0x76,0x00,0x0c,0x20,0x50 ;.c/v.. P
             50
      00D233 64 85 A8 B0 FF 0A 0E  2161         .db     0x64,0x85,0xa8,0xb0,0xff,0x0a,0x0e,0x72 ;d.(0...r
             72
      00D23B 57 30 44 4C 65 85 A5  2162         .db     0x57,0x30,0x44,0x4c,0x65,0x85,0xa5,0xff ;W0DLe.%.
             FF
      00D243 0A 4E 76 0D 2C 50 61  2163         .db     0x0a,0x4e,0x76,0x0d,0x2c,0x50,0x61,0x80 ;.Nv.,Pa.
             80
      00D24B 88 A5 FF 0A 42 82 4F  2164         .db     0x88,0xa5,0xff,0x0a,0x42,0x82,0x4f,0x92 ;.%..B.O.
             92
      00D253 16 00 0C 2C 44 70 A5  2165         .db     0x16,0x00,0x0c,0x2c,0x44,0x70,0xa5,0xff ;...,Dp%.
             FF
      00D25B 0A 63 67 2E 72 16 76  2166         .db     0x0a,0x63,0x67,0x2e,0x72,0x16,0x76,0x00 ;.cg.r.v.
             00
      00D263 0C 20 50 68 88 A9 FF  2167         .db     0x0c,0x20,0x50,0x68,0x88,0xa9,0xff,0x0a ;. Ph.)..
             0A
      00D26B 23 0E 8E 32 37 00 45  2168         .db     0x23,0x0e,0x8e,0x32,0x37,0x00,0x45,0x64 ;#..27.Ed
             64
      00D273 6C 90 A1 FF 2A 02 82  2169         .db     0x6c,0x90,0xa1,0xff,0x2a,0x02,0x82,0x06 ;l.!.*...
             06
      00D27B 8E 72 56 08 10 4C 60  2170         .db     0x8e,0x72,0x56,0x08,0x10,0x4c,0x60,0x68 ;.rV..L`h
             68
      00D283 B0 FF 0A 27 8E 32 17  2171         .db     0xb0,0xff,0x0a,0x27,0x8e,0x32,0x17,0x00 ;0..'.2..
             00
      00D28B 0C 48 6C 81 B0 FF 0A  2172         .db     0x0c,0x48,0x6c,0x81,0xb0,0xff,0x0a,0x23 ;.Hl.0..#
             23
      00D293 92 00 44 64 6C 80 88  2173         .db     0x92,0x00,0x44,0x64,0x6c,0x80,0x88,0xa0 ;..Ddl.. 
             A0
      00D29B FF 4A 03 0E 92 77 04  2174         .db     0xff,0x4a,0x03,0x0e,0x92,0x77,0x04,0x10 ;.J...w..
             10
      00D2A3 24 4D 6C A1 FF 4A 42  2175         .db     0x24,0x4d,0x6c,0xa1,0xff,0x4a,0x42,0x82 ;$Ml!.JB.
             82
      00D2AB 2E 92 77 00 08 21 50  2176         .db     0x2e,0x92,0x77,0x00,0x08,0x21,0x50,0x6c ;..w..!Pl
             6C
      00D2B3 A5 FF 4A 03 0E 72 17  2177         .db     0xa5,0xff,0x4a,0x03,0x0e,0x72,0x17,0x04 ;%.J..r..
             04
      00D2BB 24 4C 80 88 AD FF 2A  2178         .db     0x24,0x4c,0x80,0x88,0xad,0xff,0x2a,0x02 ;$L..-.*.
             02
      00D2C3 92 76 04 0C 4C 64 6C  2179         .db     0x92,0x76,0x04,0x0c,0x4c,0x64,0x6c,0x81 ;.v..Ldl.
             81
      00D2CB A0 A8 FF 4A 22 82 86  2180         .db     0xa0,0xa8,0xff,0x4a,0x22,0x82,0x86,0x0e ; (.J"...
             0E
      00D2D3 57 24 4C 60 89 A8 B0  2181         .db     0x57,0x24,0x4c,0x60,0x89,0xa8,0xb0,0xff ;W$L`.(0.
             FF
      00D2DB 4A 82 66 0E 92 36 76  2182         .db     0x4a,0x82,0x66,0x0e,0x92,0x36,0x76,0x01 ;J.f..6v.
             01
      00D2E3 21 40 4C 6C A5 FF 0A  2183         .db     0x21,0x40,0x4c,0x6c,0xa5,0xff,0x0a,0x42 ;!@Ll%..B
             42
      00D2EB 66 0E 8E 73 36 10 20  2184         .db     0x66,0x0e,0x8e,0x73,0x36,0x10,0x20,0x44 ;f..s6. D
             44
      00D2F3 4C 68 A0 FF 2A 82 86  2185         .db     0x4c,0x68,0xa0,0xff,0x2a,0x82,0x86,0x8e ;Lh .*...
             8E
      00D2FB 72 76 04 0C 20 4D 60  2186         .db     0x72,0x76,0x04,0x0c,0x20,0x4d,0x60,0x68 ;rv.. M`h
             68
      00D303 B0 FF 4A 02 62 06 8E  2187         .db     0xb0,0xff,0x4a,0x02,0x62,0x06,0x8e,0x17 ;0.J.b...
             17
      00D30B 08 40 4C 6D 84 A0 B0  2188         .db     0x08,0x40,0x4c,0x6d,0x84,0xa0,0xb0,0xff ;.@Lm. 0.
             FF
      00D313 0A 03 66 2E 8E 32 72  2189         .db     0x0a,0x03,0x66,0x2e,0x8e,0x32,0x72,0x36 ;..f..2r6
             36
      00D31B 76 0D 44 68 A1 FF 2A  2190         .db     0x76,0x0d,0x44,0x68,0xa1,0xff,0x2a,0x02 ;v.Dh!.*.
             02
      00D323 82 2E 8E 72 04 0C 50  2191         .db     0x82,0x2e,0x8e,0x72,0x04,0x0c,0x50,0x60 ;...r..P`
             60
      00D32B 68 B0 FF 0A 03 86 4E  2192         .db     0x68,0xb0,0xff,0x0a,0x03,0x86,0x4e,0x72 ;h0....Nr
             72
      00D333 16 0C 2C 44 50 60 AD  2193         .db     0x16,0x0c,0x2c,0x44,0x50,0x60,0xad,0xff ;..,DP`-.
             FF
      00D33B 4A 02 86 0F 32 36 76  2194         .db     0x4a,0x02,0x86,0x0f,0x32,0x36,0x76,0x04 ;J...26v.
             04
      00D343 10 24 60 88 A8 B0 FF  2195         .db     0x10,0x24,0x60,0x88,0xa8,0xb0,0xff,0x0a ;.$`.(0..
             0A
      00D34B 42 82 0F 52 56 96 00  2196         .db     0x42,0x82,0x0f,0x52,0x56,0x96,0x00,0x30 ;B..RV..0
             30
      00D353 44 68 88 A5 FF 0A 03  2197         .db     0x44,0x68,0x88,0xa5,0xff,0x0a,0x03,0x4e ;Dh.%...N
             4E
      00D35B 8E 33 17 0C 44 60 81  2198         .db     0x8e,0x33,0x17,0x0c,0x44,0x60,0x81,0xb0 ;.3..D`.0
             B0
      00D363 FF 0A 22 62 66 8E 32  2199         .db     0xff,0x0a,0x22,0x62,0x66,0x8e,0x32,0x16 ;.."bf.2.
             16
      00D36B 56 0C 45 69 90 B0 FF  2200         .db     0x56,0x0c,0x45,0x69,0x90,0xb0,0xff,0x0a ;V.Ei.0..
             0A
      00D373 03 06 2E 92 16 0C 44  2201         .db     0x03,0x06,0x2e,0x92,0x16,0x0c,0x44,0x50 ;......DP
             50
      00D37B 88 A0 A8 FF 4A 02 2E  2202         .db     0x88,0xa0,0xa8,0xff,0x4a,0x02,0x2e,0x92 ;. (.J...
             92
      00D383 77 24 50 60 6C 84 A1  2203         .db     0x77,0x24,0x50,0x60,0x6c,0x84,0xa1,0xff ;w$P`l.!.
             FF
      00D38B 2A 23 26 86 6E 16 01  2204         .db     0x2a,0x23,0x26,0x86,0x6e,0x16,0x01,0x2c ;*#&.n..,
             2C
      00D393 4D 64 A8 B0 FF 0A 42  2205         .db     0x4d,0x64,0xa8,0xb0,0xff,0x0a,0x42,0x82 ;Md(0..B.
             82
      00D39B 86 33 56 00 44 65 89  2206         .db     0x86,0x33,0x56,0x00,0x44,0x65,0x89,0xa8 ;.3V.De.(
             A8
      00D3A3 B0 FF 0A 27 0E 92 00  2207         .db     0xb0,0xff,0x0a,0x27,0x0e,0x92,0x00,0x48 ;0..'...H
             48
      00D3AB 69 80 88 A0 A8 FF 4A  2208         .db     0x69,0x80,0x88,0xa0,0xa8,0xff,0x4a,0x43 ;i.. (.JC
             43
      00D3B3 0E 72 36 76 04 21 4C  2209         .db     0x0e,0x72,0x36,0x76,0x04,0x21,0x4c,0x85 ;.r6v.!L.
             85
      00D3BB A1 FF 6A 03 26 0E 53  2210         .db     0xa1,0xff,0x6a,0x03,0x26,0x0e,0x53,0x56 ;!.j.&.SV
             56
      00D3C3 96 04 30 48 60 80 A1  2211         .db     0x96,0x04,0x30,0x48,0x60,0x80,0xa1,0xff ;..0H`.!.
             FF
      00D3CB 2A 03 6E 73 17 04 0C  2212         .db     0x2a,0x03,0x6e,0x73,0x17,0x04,0x0c,0x4c ;*.ns...L
             4C
      00D3D3 61 80 A0 A8 FF 2A 02  2213         .db     0x61,0x80,0xa0,0xa8,0xff,0x2a,0x02,0x27 ;a. (.*.'
             27
      00D3DB 8E 73 16 04 0C 50 68  2214         .db     0x8e,0x73,0x16,0x04,0x0c,0x50,0x68,0x81 ;.s...Ph.
             81
      00D3E3 FF 0A 67 0E 8E 52 56  2215         .db     0xff,0x0a,0x67,0x0e,0x8e,0x52,0x56,0x00 ;..g..RV.
             00
      00D3EB 30 40 48 68 B0 FF 2A  2216         .db     0x30,0x40,0x48,0x68,0xb0,0xff,0x2a,0x02 ;0@Hh0.*.
             02
      00D3F3 06 46 8E 76 08 10 2D  2217         .db     0x06,0x46,0x8e,0x76,0x08,0x10,0x2d,0x50 ;.F.v..-P
             50
      00D3FB 68 81 B0 FF 0A 23 8E  2218         .db     0x68,0x81,0xb0,0xff,0x0a,0x23,0x8e,0x72 ;h.0..#.r
             72
      00D403 17 0C 44 4C 65 81 A0  2219         .db     0x17,0x0c,0x44,0x4c,0x65,0x81,0xa0,0xb0 ;..DLe. 0
             B0
      00D40B FF 4A 82 4E 16 76 25  2220         .db     0xff,0x4a,0x82,0x4e,0x16,0x76,0x25,0x50 ;.J.N.v%P
             50
      00D413 60 85 A8 B0 FF 0A 82  2221         .db     0x60,0x85,0xa8,0xb0,0xff,0x0a,0x82,0x4f ;`.(0...O
             4F
      00D41B 16 56 0C 20 41 60 90  2222         .db     0x16,0x56,0x0c,0x20,0x41,0x60,0x90,0xad ;.V. A`.-
             AD
      00D423 FF 2A 63 06 0E 6E 56  2223         .db     0xff,0x2a,0x63,0x06,0x0e,0x6e,0x56,0x10 ;.*c..nV.
             10
      00D42B 30 40 4C 64 AD FF 0A  2224         .db     0x30,0x40,0x4c,0x64,0xad,0xff,0x0a,0x42 ;0@Ld-..B
             42
      00D433 82 66 2E 6E 92 16 00  2225         .db     0x82,0x66,0x2e,0x6e,0x92,0x16,0x00,0x0c ;.f.n....
             0C
      00D43B 20 44 70 A5 FF 2A 02  2226         .db     0x20,0x44,0x70,0xa5,0xff,0x2a,0x02,0x92 ; Dp%.*..
             92
      00D443 36 76 04 10 4C 64 6C  2227         .db     0x36,0x76,0x04,0x10,0x4c,0x64,0x6c,0x81 ;6v..Ldl.
             81
      00D44B A0 A8 FF 0A 2F 32 16  2228         .db     0xa0,0xa8,0xff,0x0a,0x2f,0x32,0x16,0x96 ; (../2..
             96
      00D453 0C 41 64 70 A5 FF 4A  2229         .db     0x0c,0x41,0x64,0x70,0xa5,0xff,0x4a,0x23 ;.Adp%.J#
             23
      00D45B 26 0E 92 16 01 4C 6D  2230         .db     0x26,0x0e,0x92,0x16,0x01,0x4c,0x6d,0x88 ;&....Lm.
             88
      00D463 A0 A8 FF 2A 82 0E 4E  2231         .db     0xa0,0xa8,0xff,0x2a,0x82,0x0e,0x4e,0x53 ; (.*..NS
             53
      00D46B 04 30 40 60 85 A5 FF  2232         .db     0x04,0x30,0x40,0x60,0x85,0xa5,0xff,0x2a ;.0@`.%.*
             2A
      00D473 62 0E 4E 53 56 04 30  2233         .db     0x62,0x0e,0x4e,0x53,0x56,0x04,0x30,0x40 ;b.NSV.0@
             40
      00D47B 85 A4 AC FF 0A 03 86  2234         .db     0x85,0xa4,0xac,0xff,0x0a,0x03,0x86,0x6e ;.$,....n
             6E
      00D483 53 16 56 2C 45 60 AD  2235         .db     0x53,0x16,0x56,0x2c,0x45,0x60,0xad,0xff ;S.V,E`-.
             FF
      00D48B 0A 42 82 67 13 36 76  2236         .db     0x0a,0x42,0x82,0x67,0x13,0x36,0x76,0x00 ;.B.g.6v.
             00
      00D493 44 89 A8 B0 FF 0A 23  2237         .db     0x44,0x89,0xa8,0xb0,0xff,0x0a,0x23,0x46 ;D.(0..#F
             46
      00D49B 92 96 00 48 68 70 81  2238         .db     0x92,0x96,0x00,0x48,0x68,0x70,0x81,0xff ;...Hhp..
             FF
      00D4A3 4A 03 26 4E 72 16 04  2239         .db     0x4a,0x03,0x26,0x4e,0x72,0x16,0x04,0x0c ;J.&Nr...
             0C
      00D4AB 28 50 60 85 A0 FF 0A  2240         .db     0x28,0x50,0x60,0x85,0xa0,0xff,0x0a,0x63 ;(P`. ..c
             63
      00D4B3 46 86 13 16 56 00 48  2241         .db     0x46,0x86,0x13,0x16,0x56,0x00,0x48,0x6c ;F...V.Hl
             6C
      00D4BB A8 B0 FF 0A 23 67 8E  2242         .db     0xa8,0xb0,0xff,0x0a,0x23,0x67,0x8e,0x72 ;(0..#g.r
             72
      00D4C3 16 56 00 2C 44 4C 68  2243         .db     0x16,0x56,0x00,0x2c,0x44,0x4c,0x68,0xb0 ;.V.,DLh0
             B0
      00D4CB FF 0A 43 0E 73 56 96  2244         .db     0xff,0x0a,0x43,0x0e,0x73,0x56,0x96,0x00 ;..C.sV..
             00
      00D4D3 10 20 30 49 88 A0 A8  2245         .db     0x10,0x20,0x30,0x49,0x88,0xa0,0xa8,0xff ;. 0I. (.
             FF
      00D4DB 0A 26 66 6E 92 17 00  2246         .db     0x0a,0x26,0x66,0x6e,0x92,0x17,0x00,0x49 ;.&fn...I
             49
      00D4E3 70 A5 FF 0A 63 06 6E  2247         .db     0x70,0xa5,0xff,0x0a,0x63,0x06,0x6e,0x52 ;p%..c.nR
             52
      00D4EB 36 76 2C 40 48 64 A9  2248         .db     0x36,0x76,0x2c,0x40,0x48,0x64,0xa9,0xff ;6v,@Hd).
             FF
      00D4F3 2A 03 6E 92 17 05 2C  2249         .db     0x2a,0x03,0x6e,0x92,0x17,0x05,0x2c,0x4c ;*.n...,L
             4C
      00D4FB 70 A0 A8 FF 2A 43 0E  2250         .db     0x70,0xa0,0xa8,0xff,0x2a,0x43,0x0e,0x72 ;p (.*C.r
             72
      00D503 01 20 4C 64 85 A1 FF  2251         .db     0x01,0x20,0x4c,0x64,0x85,0xa1,0xff,0x0a ;. Ld.!..
             0A
      00D50B 23 92 16 00 44 64 6C  2252         .db     0x23,0x92,0x16,0x00,0x44,0x64,0x6c,0xa0 ;#...Ddl 
             A0
      00D513 A8 FF 0A 02 2E 73 16  2253         .db     0xa8,0xff,0x0a,0x02,0x2e,0x73,0x16,0x76 ;(....s.v
             76
      00D51B 0C 50 61 80 88 A4 FF  2254         .db     0x0c,0x50,0x61,0x80,0x88,0xa4,0xff,0x4a ;.Pa..$.J
             4A
      00D523 03 06 4E 72 16 08 28  2255         .db     0x03,0x06,0x4e,0x72,0x16,0x08,0x28,0x50 ;..Nr..(P
             50
      00D52B 60 85 A4 AC FF 6A 02  2256         .db     0x60,0x85,0xa4,0xac,0xff,0x6a,0x02,0x0f ;`.$,.j..
             0F
      00D533 32 92 36 76 10 41 6C  2257         .db     0x32,0x92,0x36,0x76,0x10,0x41,0x6c,0x80 ;2.6v.Al.
             80
      00D53B A5 FF 6A 82 4E 16 08  2258         .db     0xa5,0xff,0x6a,0x82,0x4e,0x16,0x08,0x25 ;%.j.N..%
             25
      00D543 44 50 60 8D A4 AC FF  2259         .db     0x44,0x50,0x60,0x8d,0xa4,0xac,0xff,0x4a ;DP`.$,.J
             4A
      00D54B 03 0E 72 56 96 04 10  2260         .db     0x03,0x0e,0x72,0x56,0x96,0x04,0x10,0x30 ;..rV...0
             30
      00D553 4C 60 85 FF 0A 23 92  2261         .db     0x4c,0x60,0x85,0xff,0x0a,0x23,0x92,0x17 ;L`...#..
             17
      00D55B 00 44 64 6C 80 88 FF  2262         .db     0x00,0x44,0x64,0x6c,0x80,0x88,0xff,0x2a ;.Ddl...*
             2A
      00D563 43 4E 72 16 00 08 20  2263         .db     0x43,0x4e,0x72,0x16,0x00,0x08,0x20,0x50 ;CNr... P
             50
      00D56B 64 85 A1 FF 0A 22 62  2264         .db     0x64,0x85,0xa1,0xff,0x0a,0x22,0x62,0x26 ;d.!.."b&
             26
      00D573 8E 33 17 00 48 65 90  2265         .db     0x8e,0x33,0x17,0x00,0x48,0x65,0x90,0xff ;.3..He..
             FF
      00D57B 2A 86 6E 17 00 08 2C  2266         .db     0x2a,0x86,0x6e,0x17,0x00,0x08,0x2c,0x4c ;*.n...,L
             4C
      00D583 61 90 A8 B0 FF 4A 02  2267         .db     0x61,0x90,0xa8,0xb0,0xff,0x4a,0x02,0x07 ;a.(0.J..
             07
      00D58B 4E 16 76 29 50 60 85  2268         .db     0x4e,0x16,0x76,0x29,0x50,0x60,0x85,0xa5 ;N.v)P`.%
             A5
      00D593 FF 0A 23 26 8E 52 17  2269         .db     0xff,0x0a,0x23,0x26,0x8e,0x52,0x17,0x0c ;..#&.R..
             0C
      00D59B 48 65 84 90 A1 FF 0A  2270         .db     0x48,0x65,0x84,0x90,0xa1,0xff,0x0a,0x02 ;He..!...
             02
      00D5A3 42 07 0E 6E 32 37 10  2271         .db     0x42,0x07,0x0e,0x6e,0x32,0x37,0x10,0x48 ;B..n27.H
             48
      00D5AB 64 80 A5 FF 0A 62 2E  2272         .db     0x64,0x80,0xa5,0xff,0x0a,0x62,0x2e,0x6e ;d.%..b.n
             6E
      00D5B3 32 17 0C 20 41 70 A0  2273         .db     0x32,0x17,0x0c,0x20,0x41,0x70,0xa0,0xa8 ;2.. Ap (
             A8
      00D5BB FF 0A 22 62 26 86 0E  2274         .db     0xff,0x0a,0x22,0x62,0x26,0x86,0x0e,0x53 ;.."b&..S
             53
      00D5C3 57 00 30 48 64 88 A9  2275         .db     0x57,0x00,0x30,0x48,0x64,0x88,0xa9,0xff ;W.0Hd.).
             FF
      00D5CB 2A 02 4F 16 96 05 2C  2276         .db     0x2a,0x02,0x4f,0x16,0x96,0x05,0x2c,0x50 ;*.O...,P
             50
      00D5D3 70 81 A4 AC FF 0A 23  2277         .db     0x70,0x81,0xa4,0xac,0xff,0x0a,0x23,0x66 ;p.$,..#f
             66
      00D5DB 8E 52 37 00 10 45 68  2278         .db     0x8e,0x52,0x37,0x00,0x10,0x45,0x68,0x90 ;.R7..Eh.
             90
      00D5E3 A1 FF 6A 22 0E 92 36  2279         .db     0xa1,0xff,0x6a,0x22,0x0e,0x92,0x36,0x76 ;!.j"..6v
             76
      00D5EB 24 44 4C 60 6C 80 A1  2280         .db     0x24,0x44,0x4c,0x60,0x6c,0x80,0xa1,0xff ;$DL`l.!.
             FF
      00D5F3 4A 42 82 46 0E 72 36  2281         .db     0x4a,0x42,0x82,0x46,0x0e,0x72,0x36,0x76 ;JB.F.r6v
             76
      00D5FB 00 21 4C 85 AD FF 0A  2282         .db     0x00,0x21,0x4c,0x85,0xad,0xff,0x0a,0x23 ;.!L.-..#
             23
      00D603 92 57 00 44 64 6C 81  2283         .db     0x92,0x57,0x00,0x44,0x64,0x6c,0x81,0xa1 ;.W.Ddl.!
             A1
      00D60B FF 0A 42 27 8E 17 00  2284         .db     0xff,0x0a,0x42,0x27,0x8e,0x17,0x00,0x0c ;..B'....
             0C
      00D613 48 6D 81 A1 FF 4A 63  2285         .db     0x48,0x6d,0x81,0xa1,0xff,0x4a,0x63,0x06 ;Hm.!.Jc.
             06
      00D61B 6E 92 36 08 40 4C 70  2286         .db     0x6e,0x92,0x36,0x08,0x40,0x4c,0x70,0x84 ;n.6.@Lp.
             84
      00D623 A5 FF 0A 02 07 0E 52  2287         .db     0xa5,0xff,0x0a,0x02,0x07,0x0e,0x52,0x92 ;%.....R.
             92
      00D62B 77 10 48 60 A0 A8 FF  2288         .db     0x77,0x10,0x48,0x60,0xa0,0xa8,0xff,0x2a ;w.H` (.*
             2A
      00D633 22 82 26 0F 72 76 50  2289         .db     0x22,0x82,0x26,0x0f,0x72,0x76,0x50,0x60 ;".&.rvP`
             60
      00D63B 68 85 A9 FF 0A 03 06  2290         .db     0x68,0x85,0xa9,0xff,0x0a,0x03,0x06,0x86 ;h.).....
             86
      00D643 2F 32 72 16 0C 44 60  2291         .db     0x2f,0x32,0x72,0x16,0x0c,0x44,0x60,0xa9 ;/2r..D`)
             A9
      00D64B FF 4A 62 66 2E 13 17  2292         .db     0xff,0x4a,0x62,0x66,0x2e,0x13,0x17,0x04 ;.Jbf....
             04
      00D653 24 40 88 90 A4 AC FF  2293         .db     0x24,0x40,0x88,0x90,0xa4,0xac,0xff,0x0a ;$@..$,..
             0A
      00D65B 22 62 86 0F 76 00 30  2294         .db     0x22,0x62,0x86,0x0f,0x76,0x00,0x30,0x50 ;"b..v.0P
             50
      00D663 64 6C 89 B0 FF 2A 63  2295         .db     0x64,0x6c,0x89,0xb0,0xff,0x2a,0x63,0x0e ;dl.0.*c.
             0E
      00D66B 4E 12 52 01 40 64 A9  2296         .db     0x4e,0x12,0x52,0x01,0x40,0x64,0xa9,0xff ;N.R.@d).
             FF
      00D673 0A 42 27 0E 92 96 00  2297         .db     0x0a,0x42,0x27,0x0e,0x92,0x96,0x00,0x48 ;.B'....H
             48
      00D67B 68 70 80 88 A0 FF 0A  2298         .db     0x68,0x70,0x80,0x88,0xa0,0xff,0x0a,0x02 ;hp.. ...
             02
      00D683 07 4E 72 16 0C 50 61  2299         .db     0x07,0x4e,0x72,0x16,0x0c,0x50,0x61,0x80 ;.Nr..Pa.
             80
      00D68B 88 FF 0A 86 0E 33 37  2300         .db     0x88,0xff,0x0a,0x86,0x0e,0x33,0x37,0x10 ;.....37.
             10
      00D693 44 60 68 88 90 A8 FF  2301         .db     0x44,0x60,0x68,0x88,0x90,0xa8,0xff,0x0a ;D`h..(..
             0A
      00D69B 42 82 67 2E 13 00 44  2302         .db     0x42,0x82,0x67,0x2e,0x13,0x00,0x44,0x6c ;B.g...Dl
             6C
      00D6A3 89 A8 B0 FF 2A 03 26  2303         .db     0x89,0xa8,0xb0,0xff,0x2a,0x03,0x26,0x8e ;.(0.*.&.
             8E
      00D6AB 72 17 05 4C 60 68 80  2304         .db     0x72,0x17,0x05,0x4c,0x60,0x68,0x80,0xb0 ;r..L`h.0
             B0
      00D6B3 FF 0A 42 82 86 2F 76  2305         .db     0xff,0x0a,0x42,0x82,0x86,0x2f,0x76,0x0d ;..B../v.
             0D
      00D6BB 20 50 64 89 AD FF 0A  2306         .db     0x20,0x50,0x64,0x89,0xad,0xff,0x0a,0x42 ; Pd.-..B
             42
      00D6C3 27 0E 92 00 48 68 70  2307         .db     0x27,0x0e,0x92,0x00,0x48,0x68,0x70,0x80 ;'...Hhp.
             80
      00D6CB 88 FF 2A 02 62 2F 92  2308         .db     0x88,0xff,0x2a,0x02,0x62,0x2f,0x92,0x16 ;..*.b/..
             16
      00D6D3 96 05 40 70 85 A5 FF  2309         .db     0x96,0x05,0x40,0x70,0x85,0xa5,0xff,0x0a ;..@p.%..
             0A
      00D6DB 22 62 66 8E 13 00 44  2310         .db     0x22,0x62,0x66,0x8e,0x13,0x00,0x44,0x68 ;"bf...Dh
             68
      00D6E3 70 90 A0 FF 0A 07 6E  2311         .db     0x70,0x90,0xa0,0xff,0x0a,0x07,0x6e,0x32 ;p. ...n2
             32
      00D6EB 0C 48 64 70 81 A5 FF  2312         .db     0x0c,0x48,0x64,0x70,0x81,0xa5,0xff,0x0a ;.Hdp.%..
             0A
      00D6F3 23 27 0E 92 00 48 68  2313         .db     0x23,0x27,0x0e,0x92,0x00,0x48,0x68,0x70 ;#'...Hhp
             70
      00D6FB 81 A0 A8 FF 2A 03 07  2314         .db     0x81,0xa0,0xa8,0xff,0x2a,0x03,0x07,0x8e ;. (.*...
             8E
      00D703 72 08 4C 60 68 81 B0  2315         .db     0x72,0x08,0x4c,0x60,0x68,0x81,0xb0,0xff ;r.L`h.0.
             FF
      00D70B 0A 42 82 47 8E 52 37  2316         .db     0x0a,0x42,0x82,0x47,0x8e,0x52,0x37,0x10 ;.B.G.R7.
             10
      00D713 20 48 68 90 A4 B0 FF  2317         .db     0x20,0x48,0x68,0x90,0xa4,0xb0,0xff,0x0a ; Hh.$0..
             0A
      00D71B 42 27 92 36 96 00 48  2318         .db     0x42,0x27,0x92,0x36,0x96,0x00,0x48,0x68 ;B'.6..Hh
             68
      00D723 70 81 A0 FF 2A 02 62  2319         .db     0x70,0x81,0xa0,0xff,0x2a,0x02,0x62,0x2f ;p. .*.b/
             2F
      00D72B 92 05 40 70 85 A5 FF  2320         .db     0x92,0x05,0x40,0x70,0x85,0xa5,0xff,0x0a ;..@p.%..
             0A
      00D733 42 27 92 96 00 48 68  2321         .db     0x42,0x27,0x92,0x96,0x00,0x48,0x68,0x70 ;B'...Hhp
             70
      00D73B 80 A0 A8 FF 0A 03 86  2322         .db     0x80,0xa0,0xa8,0xff,0x0a,0x03,0x86,0x2f ;. (..../
             2F
      00D743 32 72 36 76 0D 44 60  2323         .db     0x32,0x72,0x36,0x76,0x0d,0x44,0x60,0xa9 ;2r6v.D`)
             A9
      00D74B FF 0A 42 46 8E 72 37  2324         .db     0xff,0x0a,0x42,0x46,0x8e,0x72,0x37,0x10 ;..BF.r7.
             10
      00D753 20 49 68 A4 B0 FF 0A  2325         .db     0x20,0x49,0x68,0xa4,0xb0,0xff,0x0a,0x03 ; Ih$0...
             03
      00D75B 06 2E 8E 72 16 0C 50  2326         .db     0x06,0x2e,0x8e,0x72,0x16,0x0c,0x50,0x60 ;...r..P`
             60
      00D763 68 80 A0 B0 FF 0A 22  2327         .db     0x68,0x80,0xa0,0xb0,0xff,0x0a,0x22,0x62 ;h. 0.."b
             62
      00D76B 86 2E 13 37 00 44 64  2328         .db     0x86,0x2e,0x13,0x37,0x00,0x44,0x64,0x6c ;...7.Ddl
             6C
      00D773 8C A9 FF 2A 63 86 52  2329         .db     0x8c,0xa9,0xff,0x2a,0x63,0x86,0x52,0x57 ;.).*c.RW
             57
      00D77B 00 08 2C 40 64 89 A8  2330         .db     0x00,0x08,0x2c,0x40,0x64,0x89,0xa8,0xb0 ;..,@d.(0
             B0
      00D783 FF 4A 02 66 0E 13 17  2331         .db     0xff,0x4a,0x02,0x66,0x0e,0x13,0x17,0x04 ;.J.f....
             04
      00D78B 40 6D 88 90 A0 A8 FF  2332         .db     0x40,0x6d,0x88,0x90,0xa0,0xa8,0xff,0x0a ;@m.. (..
             0A
      00D793 23 27 0E 92 00 48 68  2333         .db     0x23,0x27,0x0e,0x92,0x00,0x48,0x68,0x70 ;#'...Hhp
             70
      00D79B 80 88 A1 FF 2A 02 6F  2334         .db     0x80,0x88,0xa1,0xff,0x2a,0x02,0x6f,0x13 ;..!.*.o.
             13
      00D7A3 16 56 05 40 61 B0 FF  2335         .db     0x16,0x56,0x05,0x40,0x61,0xb0,0xff,0x0a ;.V.@a0..
             0A
      00D7AB 42 82 86 2F 72 0D 20  2336         .db     0x42,0x82,0x86,0x2f,0x72,0x0d,0x20,0x50 ;B../r. P
             50
      00D7B3 64 88 A9 FF 2A 62 66  2337         .db     0x64,0x88,0xa9,0xff,0x2a,0x62,0x66,0x8e ;d.).*bf.
             8E
      00D7BB 12 17 00 08 40 68 70  2338         .db     0x12,0x17,0x00,0x08,0x40,0x68,0x70,0xa1 ;....@hp!
             A1
      00D7C3 FF 0A 82 0E 33 36 10  2339         .db     0xff,0x0a,0x82,0x0e,0x33,0x36,0x10,0x44 ;....36.D
             44
      00D7CB 60 68 84 A4 AC FF 4A  2340         .db     0x60,0x68,0x84,0xa4,0xac,0xff,0x4a,0x03 ;`h.$,.J.
             03
      00D7D3 26 0E 72 56 96 04 30  2341         .db     0x26,0x0e,0x72,0x56,0x96,0x04,0x30,0x4c ;&.rV..0L
             4C
      00D7DB 60 81 A0 FF 0A 03 06  2342         .db     0x60,0x81,0xa0,0xff,0x0a,0x03,0x06,0x2e ;`. .....
             2E
      00D7E3 8E 72 16 0C 50 60 68  2343         .db     0x8e,0x72,0x16,0x0c,0x50,0x60,0x68,0xa0 ;.r..P`h 
             A0
      00D7EB B0 FF 4A 02 66 0E 13  2344         .db     0xb0,0xff,0x4a,0x02,0x66,0x0e,0x13,0x04 ;0.J.f...
             04
      00D7F3 40 6D 88 90 A1 FF 0A  2345         .db     0x40,0x6d,0x88,0x90,0xa1,0xff,0x0a,0x22 ;@m..!.."
             22
      00D7FB 62 86 2E 6E 13 17 00  2346         .db     0x62,0x86,0x2e,0x6e,0x13,0x17,0x00,0x44 ;b..n...D
             44
      00D803 64 70 A8 FF 0A 23 27  2347         .db     0x64,0x70,0xa8,0xff,0x0a,0x23,0x27,0x92 ;dp(..#'.
             92
      00D80B 96 00 48 68 70 80 88  2348         .db     0x96,0x00,0x48,0x68,0x70,0x80,0x88,0xa0 ;..Hhp.. 
             A0
      00D813 FF 6A 03 27 0E 92 17  2349         .db     0xff,0x6a,0x03,0x27,0x0e,0x92,0x17,0x04 ;.j.'....
             04
      00D81B 48 6D A0 A8 FF 2A 03  2350         .db     0x48,0x6d,0xa0,0xa8,0xff,0x2a,0x03,0x0e ;Hm (.*..
             0E
      00D823 72 36 76 04 4C 60 68  2351         .db     0x72,0x36,0x76,0x04,0x4c,0x60,0x68,0xa4 ;r6v.L`h$
             A4
      00D82B AC FF 0A 23 46 0E 92  2352         .db     0xac,0xff,0x0a,0x23,0x46,0x0e,0x92,0x16 ;,..#F...
             16
      00D833 00 48 68 70 81 A1 FF  2353         .db     0x00,0x48,0x68,0x70,0x81,0xa1,0xff,0x0a ;.Hhp.!..
             0A
      00D83B 62 2F 32 16 0C 41 64  2354         .db     0x62,0x2f,0x32,0x16,0x0c,0x41,0x64,0x70 ;b/2..Adp
             70
      00D843 A1 FF 4A 42 82 0E 92  2355         .db     0xa1,0xff,0x4a,0x42,0x82,0x0e,0x92,0x36 ;!.JB...6
             36
      00D84B 76 01 21 4C 6C 88 A5  2356         .db     0x76,0x01,0x21,0x4c,0x6c,0x88,0xa5,0xff ;v.!Ll.%.
             FF
      00D853 4A 02 86 4E 12 16 76  2357         .db     0x4a,0x02,0x86,0x4e,0x12,0x16,0x76,0x05 ;J..N..v.
             05
      00D85B 28 50 60 89 A8 B0 FF  2358         .db     0x28,0x50,0x60,0x89,0xa8,0xb0,0xff,0x0a ;(P`.(0..
             0A
      00D863 42 27 0E 92 96 00 48  2359         .db     0x42,0x27,0x0e,0x92,0x96,0x00,0x48,0x68 ;B'....Hh
             68
      00D86B 70 A0 A8 FF 4A 02 66  2360         .db     0x70,0xa0,0xa8,0xff,0x4a,0x02,0x66,0x0e ;p (.J.f.
             0E
      00D873 13 16 04 40 6D 88 90  2361         .db     0x13,0x16,0x04,0x40,0x6d,0x88,0x90,0xa0 ;...@m.. 
             A0
      00D87B A8 FF 2A 02 82 0E 8E  2362         .db     0xa8,0xff,0x2a,0x02,0x82,0x0e,0x8e,0x72 ;(.*....r
             72
      00D883 37 04 10 4C 60 68 B0  2363         .db     0x37,0x04,0x10,0x4c,0x60,0x68,0xb0,0xff ;7..L`h0.
             FF
      00D88B 0A 07 4E 72 16 0C 50  2364         .db     0x0a,0x07,0x4e,0x72,0x16,0x0c,0x50,0x61 ;..Nr..Pa
             61
      00D893 80 88 A9 FF 0A 23 27  2365         .db     0x80,0x88,0xa9,0xff,0x0a,0x23,0x27,0x0e ;..)..#'.
             0E
      00D89B 92 36 00 48 68 70 85  2366         .db     0x92,0x36,0x00,0x48,0x68,0x70,0x85,0xa8 ;.6.Hhp.(
             A8
      00D8A3 FF 6A 03 0E 8E 92 36  2367         .db     0xff,0x6a,0x03,0x0e,0x8e,0x92,0x36,0x10 ;.j....6.
             10
      00D8AB 44 4C 70 A1 FF 4A 82  2368         .db     0x44,0x4c,0x70,0xa1,0xff,0x4a,0x82,0x4e ;DLp!.J.N
             4E
      00D8B3 16 76 05 25 50 60 85  2369         .db     0x16,0x76,0x05,0x25,0x50,0x60,0x85,0xa8 ;.v.%P`.(
             A8
      00D8BB B0 FF 0A 23 46 0E 92  2370         .db     0xb0,0xff,0x0a,0x23,0x46,0x0e,0x92,0x00 ;0..#F...
             00
      00D8C3 48 68 70 80 88 A1 FF  2371         .db     0x48,0x68,0x70,0x80,0x88,0xa1,0xff,0x6a ;Hhp..!.j
             6A
      00D8CB 03 66 2E 92 17 05 44  2372         .db     0x03,0x66,0x2e,0x92,0x17,0x05,0x44,0x6d ;.f....Dm
             6D
      00D8D3 A0 A8 FF 0A 42 82 66  2373         .db     0xa0,0xa8,0xff,0x0a,0x42,0x82,0x66,0x2e ; (..B.f.
             2E
      00D8DB 92 37 0D 20 44 6C A5  2374         .db     0x92,0x37,0x0d,0x20,0x44,0x6c,0xa5,0xff ;.7. Dl%.
             FF
      00D8E3 2A 63 0E 4E 12 16 56  2375         .db     0x2a,0x63,0x0e,0x4e,0x12,0x16,0x56,0x01 ;*c.N..V.
             01
      00D8EB 40 64 AD FF 0A 42 82  2376         .db     0x40,0x64,0xad,0xff,0x0a,0x42,0x82,0x86 ;@d-..B..
             86
      00D8F3 2E 33 16 00 44 65 89  2377         .db     0x2e,0x33,0x16,0x00,0x44,0x65,0x89,0xa8 ;.3..De.(
             A8
      00D8FB B0 FF 4A 02 66 0E 13  2378         .db     0xb0,0xff,0x4a,0x02,0x66,0x0e,0x13,0x17 ;0.J.f...
             17
      00D903 04 40 6D 88 90 A1 FF  2379         .db     0x04,0x40,0x6d,0x88,0x90,0xa1,0xff,0x2a ;.@m..!.*
             2A
      00D90B 02 66 13 56 04 40 69  2380         .db     0x02,0x66,0x13,0x56,0x04,0x40,0x69,0x88 ;.f.V.@i.
             88
      00D913 90 A0 FF 0A 42 82 46  2381         .db     0x90,0xa0,0xff,0x0a,0x42,0x82,0x46,0x0e ;. ..B.F.
             0E
      00D91B 6E 13 16 00 48 70 84  2382         .db     0x6e,0x13,0x16,0x00,0x48,0x70,0x84,0xa4 ;n...Hp.$
             A4
      00D923 AC FF 4A 02 66 0E 13  2383         .db     0xac,0xff,0x4a,0x02,0x66,0x0e,0x13,0x16 ;,.J.f...
             16
      00D92B 04 40 6D 88 90 FF 2A  2384         .db     0x04,0x40,0x6d,0x88,0x90,0xff,0x2a,0x22 ;.@m...*"
             22
      00D933 82 0E 72 36 76 01 4C  2385         .db     0x82,0x0e,0x72,0x36,0x76,0x01,0x4c,0x60 ;..r6v.L`
             60
      00D93B 68 85 FF 2A 42 82 86  2386         .db     0x68,0x85,0xff,0x2a,0x42,0x82,0x86,0x0e ;h..*B...
             0E
      00D943 72 36 76 01 20 4C 64  2387         .db     0x72,0x36,0x76,0x01,0x20,0x4c,0x64,0x88 ;r6v. Ld.
             88
      00D94B A9 FF 0A 22 62 86 8E  2388         .db     0xa9,0xff,0x0a,0x22,0x62,0x86,0x8e,0x52 ;).."b..R
             52
      00D953 36 76 00 2C 45 65 B0  2389         .db     0x36,0x76,0x00,0x2c,0x45,0x65,0xb0,0xff ;6v.,Ee0.
             FF
      00D95B 0A 86 0E 33 10 44 60  2390         .db     0x0a,0x86,0x0e,0x33,0x10,0x44,0x60,0x68 ;...3.D`h
             68
      00D963 A8 B0 FF 2A 62 0E 4E  2391         .db     0xa8,0xb0,0xff,0x2a,0x62,0x0e,0x4e,0x53 ;(0.*b.NS
             53
      00D96B 57 04 30 40 85 A4 AC  2392         .db     0x57,0x04,0x30,0x40,0x85,0xa4,0xac,0xff ;W.0@.$,.
             FF
      00D973 0A 82 86 0E 33 37 10  2393         .db     0x0a,0x82,0x86,0x0e,0x33,0x37,0x10,0x44 ;....37.D
             44
      00D97B 60 68 88 90 A8 FF 2A  2394         .db     0x60,0x68,0x88,0x90,0xa8,0xff,0x2a,0x22 ;`h..(.*"
             22
      00D983 82 0E 72 36 76 01 4C  2395         .db     0x82,0x0e,0x72,0x36,0x76,0x01,0x4c,0x60 ;..r6v.L`
             60
      00D98B 68 85 A9 FF 4A 02 2F  2396         .db     0x68,0x85,0xa9,0xff,0x4a,0x02,0x2f,0x96 ;h.).J./.
             96
      00D993 05 24 40 50 70 85 A5  2397         .db     0x05,0x24,0x40,0x50,0x70,0x85,0xa5,0xff ;.$@Pp.%.
             FF
      00D99B 0A 22 62 86 2E 13 56  2398         .db     0x0a,0x22,0x62,0x86,0x2e,0x13,0x56,0x00 ;."b...V.
             00
      00D9A3 44 64 6C 8D AC FF 0A  2399         .db     0x44,0x64,0x6c,0x8d,0xac,0xff,0x0a,0x03 ;Ddl.,...
             03
      00D9AB 2E 6E 32 17 0C 44 70  2400         .db     0x2e,0x6e,0x32,0x17,0x0c,0x44,0x70,0x81 ;.n2..Dp.
             81
      00D9B3 A0 A8 FF 0A 43 2E 92  2401         .db     0xa0,0xa8,0xff,0x0a,0x43,0x2e,0x92,0x56 ; (..C..V
             56
      00D9BB 00 44 64 6C 85 A0 A8  2402         .db     0x00,0x44,0x64,0x6c,0x85,0xa0,0xa8,0xff ;.Ddl. (.
             FF
      00D9C3 0A 22 27 6E 32 17 00  2403         .db     0x0a,0x22,0x27,0x6e,0x32,0x17,0x00,0x0c ;."'n2...
             0C
      00D9CB 48 70 81 A0 A8 FF 2A  2404         .db     0x48,0x70,0x81,0xa0,0xa8,0xff,0x2a,0x02 ;Hp. (.*.
             02
      00D9D3 86 0E 4E 13 56 96 04  2405         .db     0x86,0x0e,0x4e,0x13,0x56,0x96,0x04,0x40 ;..N.V..@
             40
      00D9DB 61 A8 FF 2A 43 86 6E  2406         .db     0x61,0xa8,0xff,0x2a,0x43,0x86,0x6e,0x72 ;a(.*C.nr
             72
      00D9E3 77 04 10 20 4D 64 A9  2407         .db     0x77,0x04,0x10,0x20,0x4d,0x64,0xa9,0xff ;w.. Md).
             FF
      00D9EB 0A 23 27 92 00 48 68  2408         .db     0x0a,0x23,0x27,0x92,0x00,0x48,0x68,0x70 ;.#'..Hhp
             70
      00D9F3 80 88 A0 A8 FF 2A 23  2409         .db     0x80,0x88,0xa0,0xa8,0xff,0x2a,0x23,0x0e ;.. (.*#.
             0E
      00D9FB 92 36 76 04 4C 64 6C  2410         .db     0x92,0x36,0x76,0x04,0x4c,0x64,0x6c,0x85 ;.6v.Ldl.
             85
      00DA03 FF 2A 63 0F 76 01 50  2411         .db     0xff,0x2a,0x63,0x0f,0x76,0x01,0x50,0x64 ;.*c.v.Pd
             64
      00DA0B 6C A5 FF 0A 23 2E 92  2412         .db     0x6c,0xa5,0xff,0x0a,0x23,0x2e,0x92,0x00 ;l%..#...
             00
      00DA13 44 64 6C 80 88 A0 A8  2413         .db     0x44,0x64,0x6c,0x80,0x88,0xa0,0xa8,0xff ;Ddl.. (.
             FF
      00DA1B 0A 42 82 46 8E 52 37  2414         .db     0x0a,0x42,0x82,0x46,0x8e,0x52,0x37,0x10 ;.B.F.R7.
             10
      00DA23 20 48 68 90 A4 B0 FF  2415         .db     0x20,0x48,0x68,0x90,0xa4,0xb0,0xff,0x0a ; Hh.$0..
             0A
      00DA2B 63 66 2E 53 56 96 0C  2416         .db     0x63,0x66,0x2e,0x53,0x56,0x96,0x0c,0x30 ;cf.SV..0
             30
      00DA33 41 68 A4 AC FF 0A 82  2417         .db     0x41,0x68,0xa4,0xac,0xff,0x0a,0x82,0x86 ;Ah$,....
             86
      00DA3B 0E 33 37 10 44 60 68  2418         .db     0x0e,0x33,0x37,0x10,0x44,0x60,0x68,0x89 ;.37.D`h.
             89
      00DA43 A8 B0 FF 0A 27 0E 92  2419         .db     0xa8,0xb0,0xff,0x0a,0x27,0x0e,0x92,0x00 ;(0..'...
             00
      00DA4B 48 68 70 80 88 A0 A8  2420         .db     0x48,0x68,0x70,0x80,0x88,0xa0,0xa8,0xff ;Hhp.. (.
             FF
      00DA53 4A 42 82 46 0E 92 36  2421         .db     0x4a,0x42,0x82,0x46,0x0e,0x92,0x36,0x76 ;JB.F..6v
             76
      00DA5B 21 4C 6C 85 A8 FF 0A  2422         .db     0x21,0x4c,0x6c,0x85,0xa8,0xff,0x0a,0x22 ;!Ll.(.."
             22
      00DA63 82 6E 92 17 00 45 60  2423         .db     0x82,0x6e,0x92,0x17,0x00,0x45,0x60,0x70 ;.n...E`p
             70
      00DA6B A5 FF 2A 46 8E 72 17  2424         .db     0xa5,0xff,0x2a,0x46,0x8e,0x72,0x17,0x04 ;%.*F.r..
             04
      00DA73 0C 2C 4C 68 81 A0 B0  2425         .db     0x0c,0x2c,0x4c,0x68,0x81,0xa0,0xb0,0xff ;.,Lh. 0.
             FF
      00DA7B 0A 26 0E 72 56 96 00  2426         .db     0x0a,0x26,0x0e,0x72,0x56,0x96,0x00,0x30 ;.&.rV..0
             30
      00DA83 49 61 A0 FF 4A 02 27  2427         .db     0x49,0x61,0xa0,0xff,0x4a,0x02,0x27,0x0e ;Ia .J.'.
             0E
      00DA8B 92 17 04 4C 6D 80 88  2428         .db     0x92,0x17,0x04,0x4c,0x6d,0x80,0x88,0xa0 ;...Lm.. 
             A0
      00DA93 A8 FF 0A 86 0E 33 36  2429         .db     0xa8,0xff,0x0a,0x86,0x0e,0x33,0x36,0x10 ;(....36.
             10
      00DA9B 44 61 88 90 A9 FF 4A  2430         .db     0x44,0x61,0x88,0x90,0xa9,0xff,0x4a,0x02 ;Da..).J.
             02
      00DAA3 27 0E 92 17 04 4C 6D  2431         .db     0x27,0x0e,0x92,0x17,0x04,0x4c,0x6d,0x80 ;'....Lm.
             80
      00DAAB 88 A1 FF 2A 42 82 46  2432         .db     0x88,0xa1,0xff,0x2a,0x42,0x82,0x46,0x0e ;.!.*B.F.
             0E
      00DAB3 72 36 76 01 20 4C 68  2433         .db     0x72,0x36,0x76,0x01,0x20,0x4c,0x68,0x85 ;r6v. Lh.
             85
      00DABB A8 FF 4A 43 0E 72 36  2434         .db     0xa8,0xff,0x4a,0x43,0x0e,0x72,0x36,0x76 ;(.JC.r6v
             76
      00DAC3 04 21 4C 85 A0 A8 FF  2435         .db     0x04,0x21,0x4c,0x85,0xa0,0xa8,0xff,0x0a ;.!L. (..
             0A
      00DACB 42 27 0E 92 96 00 48  2436         .db     0x42,0x27,0x0e,0x92,0x96,0x00,0x48,0x68 ;B'....Hh
             68
      00DAD3 70 81 A0 A8 FF 0A 23  2437         .db     0x70,0x81,0xa0,0xa8,0xff,0x0a,0x23,0x0e ;p. (..#.
             0E
      00DADB 92 17 00 48 68 70 88  2438         .db     0x92,0x17,0x00,0x48,0x68,0x70,0x88,0xa0 ;...Hhp. 
             A0
      00DAE3 A8 FF 2A 62 06 2E 6E  2439         .db     0xa8,0xff,0x2a,0x62,0x06,0x2e,0x6e,0x13 ;(.*b..n.
             13
      00DAEB 08 40 64 70 84 FF 0A  2440         .db     0x08,0x40,0x64,0x70,0x84,0xff,0x0a,0x23 ;.@dp...#
             23
      00DAF3 27 0E 92 96 00 48 68  2441         .db     0x27,0x0e,0x92,0x96,0x00,0x48,0x68,0x70 ;'....Hhp
             70
      00DAFB 80 88 A0 A8 FF 0A 23  2442         .db     0x80,0x88,0xa0,0xa8,0xff,0x0a,0x23,0x2e ;.. (..#.
             2E
      00DB03 92 17 00 44 68 70 80  2443         .db     0x92,0x17,0x00,0x44,0x68,0x70,0x80,0x88 ;...Dhp..
             88
      00DB0B A1 FF 4A 02 66 0E 13  2444         .db     0xa1,0xff,0x4a,0x02,0x66,0x0e,0x13,0x17 ;!.J.f...
             17
      00DB13 04 40 6D 88 90 A0 FF  2445         .db     0x04,0x40,0x6d,0x88,0x90,0xa0,0xff,0x0a ;.@m.. ..
             0A
      00DB1B 23 8E 12 16 56 00 44  2446         .db     0x23,0x8e,0x12,0x16,0x56,0x00,0x44,0x4c ;#...V.DL
             4C
      00DB23 69 A0 B0 FF 4A 82 26  2447         .db     0x69,0xa0,0xb0,0xff,0x4a,0x82,0x26,0x4e ;i 0.J.&N
             4E
      00DB2B 72 16 04 0C 28 50 60  2448         .db     0x72,0x16,0x04,0x0c,0x28,0x50,0x60,0x85 ;r...(P`.
             85
      00DB33 A4 AC FF 2A 02 8E 72  2449         .db     0xa4,0xac,0xff,0x2a,0x02,0x8e,0x72,0x04 ;$,.*..r.
             04
      00DB3B 40 4C 60 68 81 B0 FF  2450         .db     0x40,0x4c,0x60,0x68,0x81,0xb0,0xff,0x4a ;@L`h.0.J
             4A
      00DB43 42 82 46 0E 92 36 76  2451         .db     0x42,0x82,0x46,0x0e,0x92,0x36,0x76,0x01 ;B.F..6v.
             01
      00DB4B 21 4C 6C 88 A5 FF 2A  2452         .db     0x21,0x4c,0x6c,0x88,0xa5,0xff,0x2a,0x02 ;!Ll.%.*.
             02
      00DB53 6F 12 17 04 4C 61 80  2453         .db     0x6f,0x12,0x17,0x04,0x4c,0x61,0x80,0x90 ;o...La..
             90
      00DB5B A0 FF 2A 22 82 0E 72  2454         .db     0xa0,0xff,0x2a,0x22,0x82,0x0e,0x72,0x36 ; .*"..r6
             36
      00DB63 76 01 4C 60 68 85 AC  2455         .db     0x76,0x01,0x4c,0x60,0x68,0x85,0xac,0xff ;v.L`h.,.
             FF
      00DB6B 2A 02 62 06 2F 92 16  2456         .db     0x2a,0x02,0x62,0x06,0x2f,0x92,0x16,0x09 ;*.b./...
             09
      00DB73 40 70 85 FF 0A 86 0E  2457         .db     0x40,0x70,0x85,0xff,0x0a,0x86,0x0e,0x33 ;@p.....3
             33
      00DB7B 37 10 44 61 88 90 A8  2458         .db     0x37,0x10,0x44,0x61,0x88,0x90,0xa8,0xb0 ;7.Da..(0
             B0
      00DB83 FF                    2459         .db     0xff
                                   2460 ;
                                   2461 ; _DATA wird zur Berechnung Programmgröße verwendet
                                   2462 ;
                                   2463         .area    _DATA
                                   2464 ;
                                   2465 ; das hier sind wahrscheinlich nur Füllbytes, um
                                   2466 ; auf die 128-Byte Blockgröße aufzufüllen
                                   2467 ; im KCC-Header steht eadr als Endeaddresse
                                   2468 ;
      008000                       2469 prfsum:
      008000 00                    2470         .db     0x00
      008001                       2471 hidden:
      008001 00                    2472         .db     0x00
      008002                       2473 toggled:
      008002 00                    2474         .db     0x00
      008003                       2475 field:
      008003 00 00 00 00 00 00 00  2476         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      00800B 00 00 00 00 00 00 00  2477         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      008013 00 00 00 00 00 00 00  2478         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      00801B 00 00 00 00 00 00 00  2479         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
             00
      008023 00 00 00 00           2480         .db     0x00,0x00,0x00,0x00
      008027                       2481 level:
      008027 00                    2482         .db     0x00
      008028                       2483 puzzle:
      008028 00 00                 2484         .db     0x00,0x00
      00802A                       2485 moves:
      00802A 00 00                 2486         .db     0x00,0x00
      00802C                       2487 pptr:
      00802C 00 00                 2488         .db     0x00,0x00
      00802E                       2489 custone:
      00802E 00 00                 2490         .db     0x00,0x00
      008030                       2491 pcnt:
      008030 00                    2492         .db     0x00
      008031                       2493 stones:
      008031 00 00                 2494         .db     0x00,0x00
      008033                       2495         .ds     17*4-2
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
    BG_BLUE                                                     =  000008 G
    BG_CYAN                                                     =  000028 G
    BG_GREEN                                                    =  000020 G
    BG_MAGENTA                                                  =  000018 G
    BG_RED                                                      =  000010 G
    BG_WHITE                                                    =  000038 G
    BG_YELLOW                                                   =  000030 G
    BOS                                                         =  000005 G
    BOTTOM_LEFT                                                 =  000080 G
    BOTTOM_MIDDLE                                               =  000080 G
    BOTTOM_RIGHT                                                =  000015 G
    BWS                                                         =  00F000 G
    CFG20                                                       =  000020 G
  0 CNVBN                                                          0009E0 GR
    CONBU                                                          ****** GX
    CRT_DATA                                                    =  000051 G
    CRT_REG                                                     =  000050 G
    CURS                                                           ****** GX
    DECODE_END                                                  =  000001 G
    EMPTY                                                       =  000000 G
    FG_BLACK                                                    =  000000 G
    FG_BLUE                                                     =  000001 G
    FG_CYAN                                                     =  000005 G
    FG_GREEN                                                    =  000004 G
    FG_MAGENTA                                                  =  000003 G
    FG_RED                                                      =  000002 G
    FG_WHITE                                                    =  000007 G
    FG_YELLOW                                                   =  000006 G
    FIELD_END                                                   =  0000FF G
    FIELD_SIZE                                                  =  00000C G
    FRAME_COLOR                                                 =  000033 G
    HORIZONTAL                                                  =  000000 G
    INPUT_LINE_size                                             =  00000F G
    LEFT                                                        =  000080 G
  0 Level0                                                         000586 GR
    Level0_size                                                 =  000008 G
  0 Level1                                                         00058E GR
    Level1_size                                                 =  000008 G
  0 Level2                                                         000596 GR
    Level2_size                                                 =  000008 G
  0 Level3                                                         00059E GR
    Level3_size                                                 =  000008 G
    MASK_CAPITAL_LETTERS                                        =  00003F G
    MASK_LEVEL_CODE                                             =  00001C G
    MASK_LOWER_BITS                                             =  000003 G
    MASK_LOWER_NIBBLE                                           =  00000F G
    MASK_UPPER_BITS                                             =  0000C0 G
    MAX_LEVEL                                                   =  000003 G
    MINIMUM_DISTANCE                                            =  0000FF G
  0 Num1                                                           0009C8 GR
  0 Num2                                                           0009CA GR
    OFFSET_COLOR                                                =  000800 G
  0 OUTH1                                                          000997 GR
  0 OUTH2                                                          0009A1 GR
  0 OUTHL                                                          000989 GR
    POSITION_FIELD                                              =  00F193 G
    POSITION_INPUT_LINE                                         =  00F35E G
    POSITION_LEVEL                                              =  00F185 G
    POSITION_MOVES                                              =  00F228 G
    POSITION_PUZZEL                                             =  00F1D8 G
    POSITION_SUCCESS                                            =  00F296 G
    POSX_INPUT_LINE                                             =  000016 G
    POSY_INPUT_LINE                                             =  000015 G
    POS_END_42                                                  =  000204 G
  0 PRS1                                                           0009D4 GR
  0 PRS2                                                           0009DE GR
    RED_STONE_COLOR                                             =  000033 G
    REG_10_CURSOR_START                                         =  00000A G
    RIGHT                                                       =  000015 G
    SCREEN_HEIGHT                                               =  000018 G
    SCREEN_WIDTH                                                =  000028 G
    SELC                                                        =  00001C G
    SELCR                                                       =  00001C G
    SIZE2                                                       =  000002 G
    STONE_COLOR                                                 =  000034 G
    STONE_RECT_size                                             =  000004 G
    TOP_LEFT                                                    =  000083 G
    TOP_MIDDLE                                                  =  000083 G
    TOP_RIGHT                                                   =  000014 G
    VERTICAL                                                    =  000001 G
    VK_CLS                                                      =  00000C G
    VK_DOWN                                                     =  00001F G
    VK_ENTER                                                    =  00000D G
    VK_LEFT                                                     =  00001D G
    VK_RIGHT                                                    =  00001C G
    VK_UP                                                       =  00001E G
  0 _main                                                          000000 GR
  0 atoh                                                           0009F1 GR
  0 calc_distance                                                  000671 GR
  0 calc_distance1                                                 00067C GR
  0 calc_distance2                                                 00068F GR
  0 calc_pos                                                       0008C8 GR
  0 calc_pos0                                                      0008CE GR
  0 calc_pos1                                                      0008D5 GR
    cfg20_settings                                              =  00E469 G
    cls_small_window                                               ****** GX
  0 cmd                                                            000003 GR
  0 cmd_end_marker                                                 00000B GR
    cmd_size                                                    =  000008 G
  0 codeinp                                                        0004BF GR
    color_stone                                                    ****** GX
    color_window                                                   ****** GX
    crt_cls                                                     =  00E9E8 G
    crt_cursor_disable                                             ****** GX
  0 cu_down                                                        000611 GR
  0 cu_down1                                                       000617 GR
  0 cu_init                                                        0005D7 GR
  0 cu_left                                                        000631 GR
  0 cu_left1                                                       000637 GR
  0 cu_right                                                       000651 GR
  0 cu_right1                                                      000657 GR
  0 cu_up                                                          0005F1 GR
  0 cu_up1                                                         0005F7 GR
  1 custone                                                        00002E GR
  0 decode                                                         0007CF GR
  0 decomp                                                         000490 GR
  0 draw                                                           00095C GR
  0 draw1                                                          000963 GR
  0 draw2                                                          000962 GR
  0 encode                                                         0007A2 GR
  0 ende                                                           000055 GR
    exit                                                           ****** GX
  1 field                                                          000003 GR
    field_size                                                  =  000024 G
  0 fullwindw                                                      0000A4 GR
  0 geschafft                                                      0005C8 GR
    geschafft_size                                              =  00000F G
  0 getpuzzle                                                      0007FD GR
  0 gp1                                                            000811 GR
  0 gp2                                                            000800 GR
  0 gp3                                                            000814 GR
  1 hidden                                                         000001 GR
  0 hlkon                                                          0009A5 GR
    inch                                                           ****** GX
    inline                                                         ****** GX
  0 kdo                                                            000064 GR
  0 kdotab                                                         00007E GR
  1 level                                                          000027 GR
  0 lvl0cnt                                                        000A04 GR
  0 lvl1cnt                                                        000A06 GR
  0 lvl2cnt                                                        000A08 GR
  0 lvl3cnt                                                        000A0A GR
  0 mainloop                                                       00002D GR
  0 mainpic                                                        0000A8 GR
    mainpic_size                                                =  0001AA G
  0 move_down                                                      0006E9 GR
  0 move_left                                                      00070F GR
  0 move_right                                                     000732 GR
  0 move_up                                                        0006C6 GR
  1 moves                                                          00002A GR
  0 mv_right0                                                      00074A GR
  0 next_stone                                                     0006AA GR
  0 next_stone1                                                    0006BE GR
  0 next_window                                                    00049D GR
  0 nextpuzzle                                                     000770 GR
  0 np1                                                            000778 GR
  0 np2                                                            000790 GR
  0 outhx                                                          00098E GR
  1 pcnt                                                           000030 GR
  1 pptr                                                           00002C GR
  1 prfsum                                                         000000 GR
  0 prnst0                                                         0009D3 GR
    putchar                                                        ****** GX
  1 puzzle                                                         000028 GR
  0 puzzles                                                        000A0C GR
    puzzles_size                                                =  003169 G
  0 qtab                                                           0006A3 GR
    qtab_size                                                   =  000006 G
  0 red2                                                           00090C GR
    red2_size                                                   =  00000A G
  0 res1                                                           000570 GR
  0 reset                                                          000548 GR
  0 ret_from_prnst0                                                0004C4 GR
  0 s2                                                             000538 GR
  0 sadr                                                           000000 GR
  0 senk                                                           00094D GR
  0 senk2                                                          0008F4 GR
    senk2_size                                                  =  00000A G
  0 senk3                                                          0008FE GR
    senk3_size                                                  =  00000E G
  0 show                                                           00086B GR
  0 show0                                                          000872 GR
  0 show1                                                          000886 GR
  0 show2                                                          000884 GR
  0 show3                                                          00089E GR
  0 show_mv                                                        00085E GR
  0 show_stone                                                     000916 GR
  0 show_stone1                                                    000938 GR
  0 showcu1                                                        0008C6 GR
  0 smallwindw                                                     0000A0 GR
  0 solved                                                         0005A6 GR
  0 sp0                                                            0004EA GR
  0 sp1                                                            00050D GR
  0 sp2                                                            000515 GR
  0 sp2a                                                           00051F GR
  0 start                                                          00000D GR
  1 stones                                                         000031 GR
    ta_alpha                                                    =  000001 G
  0 toggle                                                         000098 GR
  1 toggled                                                        000002 GR
  0 txt_prompt                                                     0004C2 GR
    txt_prompt_size                                             =  000002 G
  0 unp1                                                           00085A GR
  0 unp2                                                           000826 GR
  0 unpack                                                         00081E GR
  0 vers                                                           00005B GR
    vers_size                                                   =  000009 G
  0 waag2                                                          0008DC GR
    waag2_size                                                  =  00000A G
  0 waag3                                                          0008E6 GR
    waag3_size                                                  =  00000E G
  0 window_list                                                    000468 GR
    window_list_size                                            =  000008 G
    z1013                                                       =  000000 G
    z9001                                                       =  000000 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size   3B75   flags    0
   1 _DATA                                      size     75   flags    0


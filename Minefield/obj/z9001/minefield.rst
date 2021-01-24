                                      1 ;**********************************
                                      2 ;
                                      3 ; minefield.z80
                                      4 ;
                                      5 ; erstellt am: 2017-06-22 11:30:03
                                      6 ;
                                      7 ;**********************************
                                      8 
                                      9         .module  minefield
                                     10         .include 'platform.s'
                           000000     1 z9001                           =       0
                           000001     2 z1013                           =       1
                           000000     3 ta_alpha                        =       0
                                      4 ;
                                      5 ; z9001 os specific constants
                                      6 ;
                           00EC00     7 BWS                             =       0xec00
                           000028     8 BWS_LINE_WIDTH                  =       40
                           000018     9 BWS_HEIGHT                      =       24
                           0003C0    10 BWS_SIZE                        =       40*24
                                     11 
                           00000C    12 VK_CLS                          =       0x0c
                           00000D    13 VK_ENTER                        =       0x0d
                           000008    14 VK_LEFT                         =       0x08
                           000009    15 VK_RIGHT                        =       0x09
                           00000B    16 VK_UP                           =       0x0b
                           00000A    17 VK_DOWN                         =       0x0a
                                     18 
                           000005    19 BOS                             =       0x0005
                                     20 
                           000001    21 UP_CONSI                        =       1; console input
                           000009    22 UP_PRNST                        =       9; print string
                           00000B    23 UP_CSTS                         =       11; console status
                                     24 ;
                                     25 ; application specific constants
                                     26 ;
                           0000C4    27 CHR_MAN                         =       0xc4
                           0000FF    28 CHR_VISITED                     =       0xff
                           000020    29 CHR_FREE                        =       ' '
                           0000CA    30 CHR_BONUS                       =       0xca
                           0000C9    31 CHR_MINE                        =       0xc9
                           000002    32 END_ROW                         =       2
                           000005    33 END_SCREEN_CORRECTION           =       5 ; starting line of the text
                           000016    34 START_ROW                       =       BWS_HEIGHT-2
                           000013    35 START_COLUMN                    =       (BWS_LINE_WIDTH/2)-1
                           000013    36 END_COLUMN                      =       (BWS_LINE_WIDTH/2)-1
                           0002A8    37 CUT_OFF                         =       (START_ROW-END_ROW-3)*BWS_LINE_WIDTH
                                     38 
                                     39 .macro  PROGRAM_HEADER
                                     40         jp START
                                     41         .ascii 'MINES   '
                                     42         .dw 0
                                     43 START:
                                     44 .endm
                                     45 
                                     46 .macro  JOYSTICK_INIT
                                     47 .endm
                                     48 
                                     49 .macro  FILL_BACKGROUND_COLOR
                                     50         ld de,#BWS-0x3ff
                                     51         ld hl,#BWS-0x400
                                     52         ld bc,#BWS_SIZE-1
                                     53         ld a,#0x70 ; white
                                     54         ld (hl),a
                                     55         ldir
                                     56 .endm
                                     57 
                                     58 .macro  END_MESSAGE
                                     59         ld c,#UP_PRNST
                                     60         ld de,#str_exit
                                     61         call BOS
                                     62         xor a
                                     63         ret
                                     64 str_exit:
                                     65         .asciz 'Auf Wiedersehen! Und weg... '
                                     66 .endm
                                     67 
                                     68 .macro  QUIT_SOUND
                                     69 .endm
                                     70 
                                     71 .macro  CLICK_SOUND
                                     72 .endm
                                     73 
                                     74 .macro  INKEY
                                     75         ld c,#UP_CSTS
                                     76         call BOS
                                     77         or a
                                     78         jr z,up_inch
                                     79         ld c,#UP_CONSI
                                     80         call BOS
                                     81 .endm
                                     82 
                                     83 .macro  JOYSTICK
                                     84 .endm
                                     85 
                                     86 .macro  TXT_MINES
                                     87         .ascii 'MINEN:'
                                     88 .endm
                                     89 
                                     90 .macro  TXT_PUNKTE
                                     91         .ascii '     PUNKTE:'
                                     92 .endm
                                     93 
                                     94 .macro  TXT_EMPTY_SCREEN
                                     95         .ascii '     '
                                     96 ofs_vorsicht   .equ .-txt_empty_screen
                                     97         .ascii '                 '
                                     98 
                                     99         .db 0xa8
                                    100         .rept (BWS_LINE_WIDTH/2-3)
                                    101         .db 0xa0
                                    102         .endm
                                    103         .db 0xa4,0xa0,0xa4
                                    104         .rept (BWS_LINE_WIDTH/2-2)
                                    105         .db 0xa0
                                    106         .endm
                                    107         .db 0xa9
                                    108 
                                    109         .db 0xa3
                                    110         .rept (BWS_LINE_WIDTH/2-3)
                                    111         .db 0xa0
                                    112         .endm
                                    113         .db 0xaa,0x20,0xa7
                                    114         .rept (BWS_LINE_WIDTH/2-2)
                                    115         .db 0xa0
                                    116         .endm
                                    117         .db 0xa5
                                    118 
                                    119         .rept (BWS_HEIGHT-5)
                                    120                 .db 0xa1
                                    121                 .rept (BWS_LINE_WIDTH-2)
                                    122                 .db 0x20
                                    123                 .endm
                                    124                 .db 0xa1
                                    125         .endm
                                    126 
                                    127         .db 0xa3
                                    128         .rept (BWS_LINE_WIDTH/2-3)
                                    129         .db 0xa0
                                    130         .endm
                                    131         .db 0xa9,0x20,0xa8
                                    132         .rept (BWS_LINE_WIDTH/2-2)
                                    133         .db 0xa0
                                    134         .endm
                                    135         .db 0xa5
                                    136 
                                    137         .db 0xa7
                                    138         .rept (BWS_LINE_WIDTH/2-3)
                                    139         .db 0xa0
                                    140         .endm
                                    141         .db 0xa2,0xa0,0xa2
                                    142         .rept (BWS_LINE_WIDTH/2-2)
                                    143         .db 0xa0
                                    144         .endm
                                    145         .db 0xaa
                                    146 .endm
                                    147 
                                    148 .macro TITLE_IMG_CONTENT
                                    149         .ascii '\256\236\236\236\236\236\236\236\236\236\255           \212   \212\212  \212         '
                                    150         .ascii '\237\271\266\263\262\266\270 \275\260\300          \212 \212\222\223\236\236\226\225\212\212        '
                                    151         .db 0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20
                                    152         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20
                                    153         .db 0x20,0x20,0x20,0x20,0x20,0x8a,0x20,0x99
                                    154         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x9b
                                    155         .ascii '         '
                                    156         .db 0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20
                                    157         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20
                                    158         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x98
                                    159         .db 0x20,0xc9,0x20,0x20,0xc9,0x20,0x9c
                                    160         .ascii ' S Start '
                                    161 
                                    162         .db 0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20
                                    163         .db 0xb6,0xb0,0xc0,0x20,0x92,0x93,0x9e,0x9e
                                    164         .db 0x96,0x95,0x20,0x20,0x20,0x20,0x20,0x9f
                                    165         .db 0x20,0x20,0x86,0x87,0x20,0x20,0xc0
                                    166         .ascii '         '
                                    167         
                                    168         .db 0x9f
                                    169         .ascii 'presents:'
                                    170         .db 0xc0,0x99,0x20,0x20,0x20,0x20
                                    171         .db 0x20,0x20,0x9b,0x20,0x20,0x20,0x20,0x9b
                                    172         .db 0x20,0x20,0x85,0x84,0x20,0x20,0x99
                                    173         .ascii ' \235 Hoch  '
                                    174 
                                    175         .db 0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8
                                    176         .db 0xf8,0xf8,0xac,0x98,0x20,0xc9,0x20,0x20
                                    177         .db 0xc9,0x20,0x9c,0x20,0x20,0x20,0x20,0x9c
                                    178         .db 0x20,0x86,0x92,0x95,0x87,0x20,0x98
                                    179         .ascii '         '
                                    180         
                                    181         .ascii '           '
                                    182         .db 0x9f,0x20,0x20,0x86,0x87
                                    183         .db 0x20,0x20,0xc0,0x20,0x20,0x20,0x20,0x20
                                    184         .db 0x96,0x95,0xf8,0xf8,0x92,0x93
                                    185         .ascii '  \232 Runter'
                                    186 
                                    187         .ascii '           '
                                    188         .db 0x9b,0x20,0x20,0x85,0x84 ;   .  ..
                                    189         .db 0x20,0x20,0x99,0x20,0x20,0x20,0x20,0x20 ;  .     
                                    190         .db 0x20,0x20,0x9f,0xc0
                                    191         .ascii '            '
                                    192         
                                    193         .ascii ' Now you   '
                                    194         .db 0x9c,0x20,0x85,0x95,0x92 ;   . ...
                                    195         .db 0x84,0x20,0x98,0x20,0x20,0x20,0x20,0x20 ;. .     
                                    196         .db 0x20,0xdf,0x9f,0xc0,0xdc,0x20,0x20,0x20 ; _.@\   
                                    197         .ascii '\224 Links '
                                    198 
                                    199         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    200         .db 0x20,0x20,0x20,0x20,0x96,0x95,0xf8,0xf8 ;    ..xx
                                    201         .db 0x92,0x93,0x20,0x20,0x20,0x20,0x20,0x20 ;..      
                                    202         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    203         .ascii '        '
                                    204         
                                    205         .ascii ' are happy '
                                    206         .db 0xdb,0xf8,0x90,0x20,0x20,0x9e,0x96,0xd8
                                    207         .ascii '   but be    \227 Rechts'
                                    208 
                                    209         .ascii '                 '
                                    210         .db 0xb7,0xff,0xff,0xb7
                                    211         .ascii '  carefull!        '
                                    212 
                                    213         .ascii '                                        '
                                    214         .ascii '                                 oder   '
                                    215 
                                    216         .db 0x20,0x20,0x20,0x20,0xb2,0x20,0xb2,0x20 ;    2 2 
                                    217         .db 0xb3,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;3       
                                    218         .db 0xb2,0xb3,0xb3,0x20,0x20,0x20,0xb2,0x20 ;233   2 
                                    219         .db 0x20,0x20,0xb3,0x20,0x20,0x20,0x20,0x20 ;  3     
                                    220         .ascii '        '
                                    221         .db 0x20,0xb8,0x20,0x20,0xb5,0xb8,0xbd,0x20 ; 8  58= 
                                    222         .db 0xb3,0xb2,0xb2,0x20,0x20,0xb7,0xb3,0x20 ;322  73 
                                    223         .db 0xb4,0x20,0xb3,0x20,0xb7,0xb3,0xb5,0x20 ;4 3 735 
                                    224         .db 0xb2,0xb7,0xb4,0x20,0xb2,0xb0,0x20,0x20 ;274 20  
                                    225         .ascii 'Joystick'
                                    226 
                                    227         .db 0x20,0xb2,0xb0,0x20,0xb5,0x20,0xb5,0x20 ; 20 5 5 
                                    228         .db 0xb4,0xb5,0xb0,0xb4,0xb5,0xb7,0xb9,0xb1 ;45045791
                                    229         .db 0xbc,0x20,0xb4,0xb5,0xb7,0xb9,0xb5,0x20 ;< 45795 
                                    230         .db 0xb4,0x20,0xb4,0x20,0xb8,0x20,0x20,0x20 ;4 4 8   
                                    231         .ascii '        '
                                    232         .db 0x20,0xb0,0x20,0x20,0xb5,0x20,0xb5,0xb2 ; 0  5 52
                                    233         .db 0xbb,0xb5,0x20,0xbb,0xb1,0xb7,0xb7,0x20 ;;5 ;177 
                                    234         .db 0xb4,0xb2,0xbb,0xb1,0xb7,0xb7,0xb5,0xb3 ;42;17753
                                    235         .db 0xb8,0xb7,0xb4,0x20,0x20,0xb0
                                    236 
                                    237         .ascii '          '
                                    238         .ascii '                                        '
                                    239         .ascii '                                        '
                                    240         .ascii '     C-1987 SOFTWARE CENTER ILMENAU     '
                                    241         .ascii '          by DIRK STREHLE               '
                                    242         .ascii '     2017 MOD by Andreas Ziermann       '
                                    243 .endm
                                    244 
                                     11         
                                     12         .globl  _main
                                     13 
                           000347    14 LOG_BUFFER_INIT        .equ (LOG_BUFFER-1)
                                     15 
                           00EC06    16 BWS_ADR_MINES          .equ BWS+ofs_minen
                           00EC12    17 BWS_ADR_POINTS         .equ BWS+ofs_points
                           00EC17    18 BWS_ADR_HINT           .equ BWS+ofs_vorsicht
                                     19 
                           00ECD2    20 BWS_A_SIE_HABEN        .equ BWS+(END_SCREEN_CORRECTION*BWS_LINE_WIDTH+10)
                           00ED25    21 BWS_A_TOTAL_POI        .equ BWS+((END_SCREEN_CORRECTION+2)*BWS_LINE_WIDTH+13)
                           00ED6F    22 BWS_A_PUNKTE_ER        .equ BWS+((END_SCREEN_CORRECTION+4)*BWS_LINE_WIDTH+7)
                           00EE88    23 BWS_A_NOCH_EIN         .equ BWS+((END_SCREEN_CORRECTION+11)*BWS_LINE_WIDTH+8)
                           00EEDE    24 BWS_A_JA               .equ BWS+((END_SCREEN_CORRECTION+13)*BWS_LINE_WIDTH+14)
                                     25 
                           00EDC0    26 BWS_ADR_BONUS_L        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
                           00EDD7    27 BWS_ADR_BONUS_R        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)
                           000170    28 INT_ADR_BONUS_L        .equ INTERNAL_ARRAY+((START_ROW-END_ROW)/2-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
                           000187    29 INT_ADR_BONUS_R        .equ INTERNAL_ARRAY+((START_ROW-END_ROW)/2-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)
                                     30 
                           000047    31 KEY_UP                 .equ 'G' ; G
                           000050    32 KEY_LEFT               .equ 'P' ; P
                           000051    33 KEY_RIGHT              .equ 'Q' ; Q
                           00004F    34 KEY_DOWN               .equ 'O' ; O
                           000053    35 KEY_START              .equ 'S' ; S
                           000003    36 KEY_QUIT               .equ 0x03 ; vorher ^E
                           000001    37 KEY_NEXT               .equ 0x01 ; vorher ^J
                           000001    38 RECORD_UP              .equ 0x01
                           000002    39 RECORD_DOWN            .equ 0x02
                           000003    40 RECORD_RIGHT           .equ 0x03
                           000004    41 RECORD_LEFT            .equ 0x04
                           000037    42 RECORD_END             .equ 0x37
                           000000    43 IS_FREE                .equ 0x00
                           000064    44 IS_MINE                .equ 0x64
                           000000    45 NO_MINE                .equ 0x00
                           000003    46 RANDOM_MASK            .equ 0x03
                           000000    47 SET_TO_ZERO            .equ 0x0000
                           00EA60    48 WAIT_750MS             .equ 0xea60; 2 MHz
                           004E20    49 WAIT_250MS             .equ 0x4e20; 2 MHz
                           002710    50 WAIT_130MS             .equ 0x2710; 2 MHz
                           003A98    51 REC_DELAY_190MS        .equ 0x3a98; 2 MHz
                           000064    52 WAVE_LEN_285Hz         .equ 0x64; 2 MHz
                           000050    53 WAVE_PERIODS           .equ 0x50; 2 MHz
                           000060    54 QUIT_SOUND_P1          .equ 0x60
                           0000E0    55 QUIT_SOUND_P2          .equ 0xe0
                           000001    56 QUIT_SOUND_P3          .equ 0x01
                           0000EE    57 QUIT_SOUND_P4          .equ 0xee
                           00000A    58 BLINK_COUNTER          .equ 10
                           000026    59 MINEFIELD_WIDTH        .equ BWS_LINE_WIDTH-2
                           000015    60 MINEFIELD_ARRAY_HEIGHT .equ (START_ROW-END_ROW+1)
                           000014    61 size_of_vorsicht_minen .equ 20
                           00000C    62 size_of_sie_haben      .equ 12
                           000012    63 size_of_punkte_erreich .equ 18
                           000010    64 size_of_noch_ein_spiel .equ 16
                                     65 
                                     66         .area  _CODE
      000300                         67 _main:
      000000                         68         PROGRAM_HEADER
      000300 C3 0D 03         [10]    1         jp START
      000303 4D 49 4E 45 53 20 20     2         .ascii 'MINES   '
             20
      00030B 00 00                    3         .dw 0
      00030D                          4 START:
      00000D                         69         JOYSTICK_INIT
      00030D CD 19 06         [17]   70         call show_title
      000310                         71 wait_to_start:
      000310 CD A4 07         [17]   72         call up_inch
      000313 FE 53            [ 7]   73         cp #KEY_START
      000315 20 F9            [12]   74         jr nz,wait_to_start
      000317                         75 new_game:
      000317 CD 4F 06         [17]   76         call clear_data
      00031A 21 00 00         [10]   77         ld hl,#SET_TO_ZERO
      00031D 22 A2 0B         [16]   78         ld (points_count),hl
      000320 21 32 00         [10]   79         ld hl,#50
      000323 22 A4 0B         [16]   80         ld (mines_count),hl
      000326                         81 start_level:
      000326 21 83 EF         [10]   82         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      000329 22 9E 0B         [16]   83         ld (ptr_cursor),hl
      00032C 21 DD 12         [10]   84         ld hl,#INTERNAL_ARRAY+(START_ROW-END_ROW)*BWS_LINE_WIDTH+START_COLUMN
      00032F 22 A0 0B         [16]   85         ld (ptr_internal_array),hl
      000332 21 F1 12         [10]   86         ld hl,#LOG_BUFFER_INIT
      000335 22 A6 0B         [16]   87         ld (ptr_log_buffer),hl
      000338 CD 27 05         [17]   88         call clear_screen
      00033B CD 60 05         [17]   89         call show_empty_field
      00033E 21 83 EF         [10]   90         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      000341 3E C4            [ 7]   91         ld a,#CHR_MAN
      000343 77               [ 7]   92         ld (hl),a
      000344 2A A2 0B         [16]   93         ld hl,(points_count)
      000347 11 12 EC         [10]   94         ld de,#BWS_ADR_POINTS
      00034A CD A3 05         [17]   95         call hex2int
      00034D 2A A4 0B         [16]   96         ld hl,(mines_count)
      000350 11 06 EC         [10]   97         ld de,#BWS_ADR_MINES
      000353 CD A3 05         [17]   98         call hex2int
      000356 CD 33 06         [17]   99         call check_for_bonus
      000359 CD C3 06         [17]  100         call distribute_mines
      00035C                        101 main_loop:
      00035C CD A4 07         [17]  102         call up_inch
      00035F FE 47            [ 7]  103         cp #KEY_UP
      000361 CC 89 03         [17]  104         call z,do_up
      000364 FE 4F            [ 7]  105         cp #KEY_DOWN
      000366 CC 13 04         [17]  106         call z,do_down
      000369 FE 51            [ 7]  107         cp #KEY_RIGHT
      00036B CC 65 04         [17]  108         call z,do_right
      00036E FE 50            [ 7]  109         cp #KEY_LEFT
      000370 CC B3 04         [17]  110         call z,do_left
      000373 CD 89 07         [17]  111         call click_sound
      000376 FE 03            [ 7]  112         cp #KEY_QUIT
      000378 CA FB 06         [10]  113         jp z,do_quit
      00037B FE 01            [ 7]  114         cp #KEY_NEXT
      00037D CA 01 05         [10]  115         jp z,do_skip_level
      000380 01 20 4E         [10]  116         ld bc,#WAIT_250MS
      000383 CD CB 05         [17]  117         call wait
      000386 C3 5C 03         [10]  118         jp main_loop
      000389                        119 do_up:
      000389 CD D1 05         [17]  120         call clear_status_line
      00038C 2A 9E 0B         [16]  121         ld hl,(ptr_cursor)
      00038F 3E FF            [ 7]  122         ld a,#CHR_VISITED
      000391 77               [ 7]  123         ld (hl),a
      000392 01 28 00         [10]  124         ld bc,#BWS_LINE_WIDTH
      000395 ED 42            [15]  125         sbc hl,bc
      000397 7E               [ 7]  126         ld a,(hl)
      000398 FE 20            [ 7]  127         cp #CHR_FREE
      00039A 28 11            [12]  128         jr z,test_end_up
      00039C FE FF            [ 7]  129         cp #CHR_VISITED
      00039E 28 0D            [12]  130         jr z,test_end_up
      0003A0 FE CA            [ 7]  131         cp #CHR_BONUS
      0003A2 28 06            [12]  132         jr z,add_bonus_up
      0003A4 09               [11]  133         add hl,bc
      0003A5 3E C4            [ 7]  134         ld a,#CHR_MAN
      0003A7 77               [ 7]  135         ld (hl),a
      0003A8 AF               [ 4]  136         xor a
      0003A9 C9               [10]  137         ret
      0003AA                        138 add_bonus_up:
      0003AA CD 02 06         [17]  139         call show_points_plus_100
      0003AD                        140 test_end_up:
      0003AD 01 63 EC         [10]  141         ld bc,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
      0003B0 ED 42            [15]  142         sbc hl,bc
      0003B2 20 03            [12]  143         jr nz,continue_up
      0003B4 3E 01            [ 7]  144         ld a,#KEY_NEXT
      0003B6 C9               [10]  145         ret
      0003B7                        146 continue_up:
      0003B7 09               [11]  147         add hl,bc
      0003B8 01 28 00         [10]  148         ld bc,#BWS_LINE_WIDTH
      0003BB ED 5B A0 0B      [20]  149         ld de,(ptr_internal_array)
      0003BF EB               [ 4]  150         ex de,hl
      0003C0 ED 42            [15]  151         sbc hl,bc
      0003C2 EB               [ 4]  152         ex de,hl
      0003C3 ED 53 A0 0B      [20]  153         ld (ptr_internal_array),de
      0003C7 1A               [ 7]  154         ld a,(de)
      0003C8 FE 64            [ 7]  155         cp #IS_MINE
      0003CA 20 03            [12]  156         jr nz,update_screen_up
      0003CC 3E 03            [ 7]  157         ld a,#KEY_QUIT
      0003CE C9               [10]  158         ret
      0003CF                        159 update_screen_up:
      0003CF CD E4 03         [17]  160         call count_mines
      0003D2 FE 00            [ 7]  161         cp #NO_MINE
      0003D4 C4 EC 05         [17]  162         call nz,print_mines_count
      0003D7 3E 01            [ 7]  163         ld a,#RECORD_UP
      0003D9 CD E0 05         [17]  164         call append_key
      0003DC 22 9E 0B         [16]  165         ld (ptr_cursor),hl
      0003DF 3E C4            [ 7]  166         ld a,#CHR_MAN
      0003E1 77               [ 7]  167         ld (hl),a
      0003E2 AF               [ 4]  168         xor a
      0003E3 C9               [10]  169         ret
      0003E4                        170 count_mines:
      0003E4 EB               [ 4]  171         ex de,hl
      0003E5 D5               [11]  172         push de
      0003E6 16 00            [ 7]  173         ld d,#SET_TO_ZERO
      0003E8 01 28 00         [10]  174         ld bc,#BWS_LINE_WIDTH
      0003EB 09               [11]  175         add hl,bc
      0003EC CD 0D 04         [17]  176         call test_inc_mine_count
      0003EF 2A A0 0B         [16]  177         ld hl,(ptr_internal_array)
      0003F2 2B               [ 6]  178         dec hl
      0003F3 CD 0D 04         [17]  179         call test_inc_mine_count
      0003F6 2A A0 0B         [16]  180         ld hl,(ptr_internal_array)
      0003F9 06 28            [ 7]  181         ld b,#BWS_LINE_WIDTH
      0003FB                        182 $sub_line_width_up:
      0003FB 2B               [ 6]  183         dec hl
      0003FC 10 FD            [13]  184         djnz $sub_line_width_up
      0003FE CD 0D 04         [17]  185         call test_inc_mine_count
      000401 2A A0 0B         [16]  186         ld hl,(ptr_internal_array)
      000404 23               [ 6]  187         inc hl
      000405 CD 0D 04         [17]  188         call test_inc_mine_count
      000408 2B               [ 6]  189         dec hl
      000409 7A               [ 4]  190         ld a,d
      00040A D1               [10]  191         pop de
      00040B EB               [ 4]  192         ex de,hl
      00040C C9               [10]  193         ret
      00040D                        194 test_inc_mine_count:
      00040D 7E               [ 7]  195         ld a,(hl)
      00040E FE 64            [ 7]  196         cp #IS_MINE
      000410 C0               [11]  197         ret nz
      000411 14               [ 4]  198         inc d
      000412 C9               [10]  199         ret
      000413                        200 do_down:
      000413 CD D1 05         [17]  201         call clear_status_line
      000416 2A 9E 0B         [16]  202         ld hl,(ptr_cursor)
      000419 3E FF            [ 7]  203         ld a,#CHR_VISITED
      00041B 77               [ 7]  204         ld (hl),a
      00041C 01 28 00         [10]  205         ld bc,#BWS_LINE_WIDTH
      00041F 09               [11]  206         add hl,bc
      000420 7E               [ 7]  207         ld a,(hl)
      000421 FE 20            [ 7]  208         cp #CHR_FREE
      000423 28 15            [12]  209         jr z,test_end_down
      000425 FE FF            [ 7]  210         cp #CHR_VISITED
      000427 28 11            [12]  211         jr z,test_end_down
      000429 FE CA            [ 7]  212         cp #CHR_BONUS
      00042B 28 0A            [12]  213         jr z,add_bonus_down
      00042D 06 28            [ 7]  214         ld b,#BWS_LINE_WIDTH
      00042F                        215 $sub_line_width_down:
      00042F 2B               [ 6]  216         dec hl
      000430 10 FD            [13]  217         djnz $sub_line_width_down
      000432 3E C4            [ 7]  218         ld a,#CHR_MAN
      000434 77               [ 7]  219         ld (hl),a
      000435 AF               [ 4]  220         xor a
      000436 C9               [10]  221         ret
      000437                        222 add_bonus_down:
      000437 CD 02 06         [17]  223         call show_points_plus_100
      00043A                        224 test_end_down:
      00043A ED 5B A0 0B      [20]  225         ld de,(ptr_internal_array)
      00043E 01 28 00         [10]  226         ld bc,#BWS_LINE_WIDTH
      000441 EB               [ 4]  227         ex de,hl
      000442 09               [11]  228         add hl,bc
      000443 EB               [ 4]  229         ex de,hl
      000444 ED 53 A0 0B      [20]  230         ld (ptr_internal_array),de
      000448 1A               [ 7]  231         ld a,(de)
      000449 FE 64            [ 7]  232         cp #IS_MINE
      00044B 20 03            [12]  233         jr nz,update_screen_down
      00044D 3E 03            [ 7]  234         ld a,#KEY_QUIT
      00044F C9               [10]  235         ret
      000450                        236 update_screen_down:
      000450 CD E4 03         [17]  237         call count_mines
      000453 FE 00            [ 7]  238         cp #NO_MINE
      000455 C4 EC 05         [17]  239         call nz,print_mines_count
      000458 3E 02            [ 7]  240         ld a,#RECORD_DOWN
      00045A CD E0 05         [17]  241         call append_key
      00045D 22 9E 0B         [16]  242         ld (ptr_cursor),hl
      000460 3E C4            [ 7]  243         ld a,#CHR_MAN
      000462 77               [ 7]  244         ld (hl),a
      000463 AF               [ 4]  245         xor a
      000464 C9               [10]  246         ret
      000465                        247 do_right:
      000465 CD D1 05         [17]  248         call clear_status_line
      000468 2A 9E 0B         [16]  249         ld hl,(ptr_cursor)
      00046B 3E FF            [ 7]  250         ld a,#CHR_VISITED
      00046D 77               [ 7]  251         ld (hl),a
      00046E 23               [ 6]  252         inc hl
      00046F 7E               [ 7]  253         ld a,(hl)
      000470 FE 20            [ 7]  254         cp #CHR_FREE
      000472 28 19            [12]  255         jr z,test_end_right
      000474 FE FF            [ 7]  256         cp #CHR_VISITED
      000476 28 15            [12]  257         jr z,test_end_right
      000478 FE CA            [ 7]  258         cp #CHR_BONUS
      00047A 28 0E            [12]  259         jr z,add_bonus_right
      00047C 2B               [ 6]  260         dec hl
      00047D 3E C4            [ 7]  261         ld a,#CHR_MAN
      00047F 77               [ 7]  262         ld (hl),a
      000480 CD E4 03         [17]  263         call count_mines
      000483 FE 00            [ 7]  264         cp #NO_MINE
      000485 C4 EC 05         [17]  265         call nz,print_mines_count
      000488 AF               [ 4]  266         xor a
      000489 C9               [10]  267         ret
      00048A                        268 add_bonus_right:
      00048A CD 02 06         [17]  269         call show_points_plus_100
      00048D                        270 test_end_right:
      00048D ED 5B A0 0B      [20]  271         ld de,(ptr_internal_array)
      000491 13               [ 6]  272         inc de
      000492 ED 53 A0 0B      [20]  273         ld (ptr_internal_array),de
      000496 1A               [ 7]  274         ld a,(de)
      000497 FE 64            [ 7]  275         cp #IS_MINE
      000499 20 03            [12]  276         jr nz,update_screen_right
      00049B 3E 03            [ 7]  277         ld a,#KEY_QUIT
      00049D C9               [10]  278         ret
      00049E                        279 update_screen_right:
      00049E CD E4 03         [17]  280         call count_mines
      0004A1 FE 00            [ 7]  281         cp #NO_MINE
      0004A3 C4 EC 05         [17]  282         call nz,print_mines_count
      0004A6 3E 03            [ 7]  283         ld a,#RECORD_RIGHT
      0004A8 CD E0 05         [17]  284         call append_key
      0004AB 22 9E 0B         [16]  285         ld (ptr_cursor),hl
      0004AE 3E C4            [ 7]  286         ld a,#CHR_MAN
      0004B0 77               [ 7]  287         ld (hl),a
      0004B1 AF               [ 4]  288         xor a
      0004B2 C9               [10]  289         ret
      0004B3                        290 do_left:
      0004B3 CD D1 05         [17]  291         call clear_status_line
      0004B6 2A 9E 0B         [16]  292         ld hl,(ptr_cursor)
      0004B9 3E FF            [ 7]  293         ld a,#CHR_VISITED
      0004BB 77               [ 7]  294         ld (hl),a
      0004BC 2B               [ 6]  295         dec hl
      0004BD 7E               [ 7]  296         ld a,(hl)
      0004BE FE 20            [ 7]  297         cp #CHR_FREE
      0004C0 28 19            [12]  298         jr z,test_end_left
      0004C2 FE FF            [ 7]  299         cp #CHR_VISITED
      0004C4 28 15            [12]  300         jr z,test_end_left
      0004C6 FE CA            [ 7]  301         cp #CHR_BONUS
      0004C8 28 0E            [12]  302         jr z,add_bonus_left
      0004CA 23               [ 6]  303         inc hl
      0004CB 3E C4            [ 7]  304         ld a,#CHR_MAN
      0004CD 77               [ 7]  305         ld (hl),a
      0004CE CD E4 03         [17]  306         call count_mines
      0004D1 FE 00            [ 7]  307         cp #NO_MINE
      0004D3 C4 EC 05         [17]  308         call nz,print_mines_count
      0004D6 AF               [ 4]  309         xor a
      0004D7 C9               [10]  310         ret
      0004D8                        311 add_bonus_left:
      0004D8 CD 02 06         [17]  312         call show_points_plus_100
      0004DB                        313 test_end_left:
      0004DB ED 5B A0 0B      [20]  314         ld de,(ptr_internal_array)
      0004DF 1B               [ 6]  315         dec de
      0004E0 ED 53 A0 0B      [20]  316         ld (ptr_internal_array),de
      0004E4 1A               [ 7]  317         ld a,(de)
      0004E5 FE 64            [ 7]  318         cp #IS_MINE
      0004E7 20 03            [12]  319         jr nz,update_screen_left
      0004E9 3E 03            [ 7]  320         ld a,#KEY_QUIT
      0004EB C9               [10]  321         ret
      0004EC                        322 update_screen_left:
      0004EC CD E4 03         [17]  323         call count_mines
      0004EF FE 00            [ 7]  324         cp #NO_MINE
      0004F1 C4 EC 05         [17]  325         call nz,print_mines_count
      0004F4 3E 04            [ 7]  326         ld a,#RECORD_LEFT
      0004F6 CD E0 05         [17]  327         call append_key
      0004F9 22 9E 0B         [16]  328         ld (ptr_cursor),hl
      0004FC 3E C4            [ 7]  329         ld a,#CHR_MAN
      0004FE 77               [ 7]  330         ld (hl),a
      0004FF AF               [ 4]  331         xor a
      000500 C9               [10]  332         ret
      000501                        333 do_skip_level:
      000501 3E 37            [ 7]  334         ld a,#RECORD_END
      000503 CD E0 05         [17]  335         call append_key
      000506 CD 27 05         [17]  336         call clear_screen
      000509 CD 60 05         [17]  337         call show_empty_field
      00050C CD 72 05         [17]  338         call show_mine_field
      00050F CD 74 06         [17]  339         call show_recording_history
      000512 21 63 EC         [10]  340         ld hl,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
      000515 CD 3D 05         [17]  341         call show_win_animation
      000518 CD 4F 06         [17]  342         call clear_data
      00051B CD 27 05         [17]  343         call clear_screen
      00051E CD 5E 06         [17]  344         call points_plus_50
      000521 CD 69 06         [17]  345         call points_plus_25
      000524 C3 26 03         [10]  346         jp start_level
      000527                        347 clear_screen:
      000527 E5               [11]  348         push hl
      000528 D5               [11]  349         push de
      000529 C5               [11]  350         push bc
      00052A 3E 20            [ 7]  351         ld a,#' '
      00052C 21 00 EC         [10]  352         ld hl,#BWS
      00052F 77               [ 7]  353         ld (hl),a
      000530 11 01 EC         [10]  354         ld de,#BWS+1
      000533 01 BF 03         [10]  355         ld bc,#BWS_SIZE-1
      000536 ED B0            [21]  356         ldir
      000538 AF               [ 4]  357         xor a
      000539 C1               [10]  358         pop bc
      00053A D1               [10]  359         pop de
      00053B E1               [10]  360         pop hl
      00053C C9               [10]  361         ret
      00053D                        362 show_win_animation:
      00053D D5               [11]  363         push de
      00053E C5               [11]  364         push bc
      00053F 7E               [ 7]  365         ld a,(hl)
      000540 4F               [ 4]  366         ld c,a
      000541 06 0A            [ 7]  367         ld b,#BLINK_COUNTER
      000543                        368 animate_end:
      000543 3E FF            [ 7]  369         ld a,#CHR_VISITED
      000545 77               [ 7]  370         ld (hl),a
      000546 11 20 4E         [10]  371         ld de,#WAIT_250MS
      000549                        372 animate$delay_visited:
      000549 1B               [ 6]  373         dec de
      00054A AF               [ 4]  374         xor a
      00054B BA               [ 4]  375         cp d
      00054C 20 FB            [12]  376         jr nz,animate$delay_visited
      00054E 3E 20            [ 7]  377         ld a,#CHR_FREE
      000550 77               [ 7]  378         ld (hl),a
      000551 11 20 4E         [10]  379         ld de,#WAIT_250MS
      000554                        380 animate$delay_free:
      000554 1B               [ 6]  381         dec de
      000555 AF               [ 4]  382         xor a
      000556 BA               [ 4]  383         cp d
      000557 20 FB            [12]  384         jr nz,animate$delay_free
      000559 10 E8            [13]  385         djnz animate_end
      00055B 79               [ 4]  386         ld a,c
      00055C 77               [ 7]  387         ld (hl),a
      00055D C1               [10]  388         pop bc
      00055E D1               [10]  389         pop de
      00055F C9               [10]  390         ret
      000560                        391 show_empty_field:
      000560 E5               [11]  392         push hl
      000561 D5               [11]  393         push de
      000562 C5               [11]  394         push bc
      000563 21 DE 07         [10]  395         ld hl,#txt_empty_screen
      000566 11 00 EC         [10]  396         ld de,#BWS
      000569 01 C0 03         [10]  397         ld bc,#BWS_SIZE
      00056C ED B0            [21]  398         ldir
      00056E C1               [10]  399         pop bc
      00056F D1               [10]  400         pop de
      000570 E1               [10]  401         pop hl
      000571 C9               [10]  402         ret
      000572                        403 show_mine_field:
      000572 E5               [11]  404         push hl
      000573 D5               [11]  405         push de
      000574 C5               [11]  406         push bc
      000575 21 FA 0F         [10]  407         ld hl,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
      000578 11 A0 EC         [10]  408         ld de,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
      00057B 0E 11            [ 7]  409         ld c,#START_ROW-END_ROW-3; NET HEIGHT MINEFIELD
      00057D                        410 $show_new_line:
      00057D 06 26            [ 7]  411         ld b,#MINEFIELD_WIDTH
      00057F                        412 $get_character:
      00057F 23               [ 6]  413         inc hl
      000580 13               [ 6]  414         inc de
      000581 7E               [ 7]  415         ld a,(hl)
      000582 FE 64            [ 7]  416         cp #IS_MINE
      000584 20 03            [12]  417         jr nz,$draw_character
      000586 3E C9            [ 7]  418         ld a,#CHR_MINE
      000588 12               [ 7]  419         ld (de),a
      000589                        420 $draw_character:
      000589 05               [ 4]  421         dec b
      00058A 20 F3            [12]  422         jr nz,$get_character
      00058C C5               [11]  423         push bc
      00058D 01 10 27         [10]  424         ld bc,#WAIT_130MS
      000590 CD CB 05         [17]  425         call wait
      000593 C1               [10]  426         pop bc
      000594 0D               [ 4]  427         dec c
      000595 20 04            [12]  428         jr nz,line_correction_ptr
      000597 C1               [10]  429         pop bc
      000598 D1               [10]  430         pop de
      000599 E1               [10]  431         pop hl
      00059A C9               [10]  432         ret
      00059B                        433 line_correction_ptr:
      00059B 06 02            [ 7]  434         ld b,#BWS_LINE_WIDTH-MINEFIELD_WIDTH
      00059D                        435 $correct_ptr:
      00059D 23               [ 6]  436         inc hl
      00059E 13               [ 6]  437         inc de
      00059F 10 FC            [13]  438         djnz $correct_ptr
      0005A1 18 DA            [12]  439         jr $show_new_line
      0005A3                        440 hex2int:
      0005A3 AF               [ 4]  441         xor a
      0005A4 01 E8 03         [10]  442         ld bc,#1000
      0005A7 CD BD 05         [17]  443         call convert_digit_to_ascii
      0005AA 01 64 00         [10]  444         ld bc,#100
      0005AD CD BD 05         [17]  445         call convert_digit_to_ascii
      0005B0 01 0A 00         [10]  446         ld bc,#10
      0005B3 CD BD 05         [17]  447         call convert_digit_to_ascii
      0005B6 01 01 00         [10]  448         ld bc,#1
      0005B9 CD BD 05         [17]  449         call convert_digit_to_ascii
      0005BC C9               [10]  450         ret
      0005BD                        451 convert_digit_to_ascii:
      0005BD AF               [ 4]  452         xor a
      0005BE                        453 convert$sub_digit:
      0005BE ED 42            [15]  454         sbc hl,bc
      0005C0 38 03            [12]  455         jr c,convert$hex_to_ascii
      0005C2 3C               [ 4]  456         inc a
      0005C3 18 F9            [12]  457         jr convert$sub_digit
      0005C5                        458 convert$hex_to_ascii:
      0005C5 09               [11]  459         add hl,bc
      0005C6 C6 30            [ 7]  460         add #'0'
      0005C8 12               [ 7]  461         ld (de),a
      0005C9 13               [ 6]  462         inc de
      0005CA C9               [10]  463         ret
      0005CB                        464 wait:
      0005CB 0B               [ 6]  465         dec bc
      0005CC 79               [ 4]  466         ld a,c
      0005CD B0               [ 4]  467         or b
      0005CE 20 FB            [12]  468         jr nz,wait
      0005D0 C9               [10]  469         ret
      0005D1                        470 clear_status_line:
      0005D1 3E 20            [ 7]  471         ld a,#' '
      0005D3 21 17 EC         [10]  472         ld hl,#BWS_ADR_HINT
      0005D6 77               [ 7]  473         ld (hl),a
      0005D7 11 18 EC         [10]  474         ld de,#BWS_ADR_HINT+1
      0005DA 01 10 00         [10]  475         ld bc,#len_vorsicht_minen-1
      0005DD ED B0            [21]  476         ldir
      0005DF C9               [10]  477         ret
      0005E0                        478 append_key:
      0005E0 E5               [11]  479         push hl
      0005E1 2A A6 0B         [16]  480         ld hl,(ptr_log_buffer)
      0005E4 23               [ 6]  481         inc hl
      0005E5 77               [ 7]  482         ld (hl),a
      0005E6 22 A6 0B         [16]  483         ld (ptr_log_buffer),hl
      0005E9 E1               [10]  484         pop hl
      0005EA AF               [ 4]  485         xor a
      0005EB C9               [10]  486         ret
      0005EC                        487 print_mines_count:
      0005EC E5               [11]  488         push hl
      0005ED D5               [11]  489         push de
      0005EE 21 AB 0B         [10]  490         ld hl,#str_vorsicht_minen
      0005F1 11 17 EC         [10]  491         ld de,#BWS_ADR_HINT
      0005F4 01 11 00         [10]  492         ld bc,#len_vorsicht_minen
      0005F7 ED B0            [21]  493         ldir
      0005F9 21 20 EC         [10]  494         ld hl,#BWS_ADR_HINT+9; 'VORSICHT '
      0005FC C6 30            [ 7]  495         add #'0'
      0005FE 77               [ 7]  496         ld (hl),a
      0005FF D1               [10]  497         pop de
      000600 E1               [10]  498         pop hl
      000601 C9               [10]  499         ret
      000602                        500 show_points_plus_100:
      000602 E5               [11]  501         push hl
      000603 C5               [11]  502         push bc
      000604 D5               [11]  503         push de
      000605 01 64 00         [10]  504         ld bc,#100
      000608 2A A2 0B         [16]  505         ld hl,(points_count)
      00060B 09               [11]  506         add hl,bc
      00060C 22 A2 0B         [16]  507         ld (points_count),hl
      00060F 11 12 EC         [10]  508         ld de,#BWS_ADR_POINTS
      000612 CD A3 05         [17]  509         call hex2int
      000615 D1               [10]  510         pop de
      000616 C1               [10]  511         pop bc
      000617 E1               [10]  512         pop hl
      000618 C9               [10]  513         ret
      000619                        514 show_title:
      000619 21 EA 0B         [10]  515         ld hl,#txt_title
      00061C 11 00 EC         [10]  516         ld de,#BWS
      00061F 01 C0 03         [10]  517         ld bc,#BWS_SIZE
      000622 ED B0            [21]  518         ldir
      000324                        519         FILL_BACKGROUND_COLOR
      000624 11 01 E8         [10]    1         ld de,#BWS-0x3ff
      000627 21 00 E8         [10]    2         ld hl,#BWS-0x400
      00062A 01 BF 03         [10]    3         ld bc,#BWS_SIZE-1
      00062D 3E 70            [ 7]    4         ld a,#0x70 ; white
      00062F 77               [ 7]    5         ld (hl),a
      000630 ED B0            [21]    6         ldir
      000632 C9               [10]  520         ret
      000633                        521 check_for_bonus:
      000633 2A A4 0B         [16]  522         ld hl,(mines_count)
      000636 01 64 00         [10]  523         ld bc,#100
      000639 ED 42            [15]  524         sbc hl,bc
      00063B D8               [11]  525         ret c
      00063C 3E CA            [ 7]  526         ld a,#CHR_BONUS
      00063E 21 C0 ED         [10]  527         ld hl,#BWS_ADR_BONUS_L
      000641 77               [ 7]  528         ld (hl),a
      000642 21 D7 ED         [10]  529         ld hl,#BWS_ADR_BONUS_R
      000645 77               [ 7]  530         ld (hl),a
      000646 21 1A 11         [10]  531         ld hl,#INT_ADR_BONUS_L
      000649 77               [ 7]  532         ld (hl),a
      00064A 21 31 11         [10]  533         ld hl,#INT_ADR_BONUS_R
      00064D 77               [ 7]  534         ld (hl),a
      00064E C9               [10]  535         ret
      00064F                        536 clear_data:
      00064F 21 AA 0F         [10]  537         ld hl,#INTERNAL_ARRAY
      000652 3E 00            [ 7]  538         ld a,#IS_FREE
      000654 77               [ 7]  539         ld (hl),a
      000655 11 AB 0F         [10]  540         ld de,#INTERNAL_ARRAY+1
      000658 01 47 03         [10]  541         ld bc,#BWS_LINE_WIDTH*(START_ROW-END_ROW+1)-1
      00065B ED B0            [21]  542         ldir
      00065D C9               [10]  543         ret
      00065E                        544 points_plus_50:
      00065E 2A A2 0B         [16]  545         ld hl,(points_count)
      000661 01 32 00         [10]  546         ld bc,#50
      000664 09               [11]  547         add hl,bc
      000665 22 A2 0B         [16]  548         ld (points_count),hl
      000668 C9               [10]  549         ret
      000669                        550 points_plus_25:
      000669 2A A4 0B         [16]  551         ld hl,(mines_count)
      00066C 01 19 00         [10]  552         ld bc,#25
      00066F 09               [11]  553         add hl,bc
      000670 22 A4 0B         [16]  554         ld (mines_count),hl
      000673 C9               [10]  555         ret
      000674                        556 show_recording_history:
      000674 21 83 EF         [10]  557         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      000677 11 F2 12         [10]  558         ld de,#LOG_BUFFER
      00067A 01 28 00         [10]  559         ld bc,#BWS_LINE_WIDTH
      00067D                        560 animate_recording:
      00067D C5               [11]  561         push bc
      00067E 01 98 3A         [10]  562         ld bc,#REC_DELAY_190MS
      000681                        563 recording$delay:
      000681 0B               [ 6]  564         dec bc
      000682 AF               [ 4]  565         xor a
      000683 B8               [ 4]  566         cp b
      000684 20 FB            [12]  567         jr nz,recording$delay
      000686 C1               [10]  568         pop bc
      000687 1A               [ 7]  569         ld a,(de)
      000688 13               [ 6]  570         inc de
      000689 FE 01            [ 7]  571         cp #RECORD_UP
      00068B CC A2 06         [17]  572         call z,animate_up
      00068E FE 02            [ 7]  573         cp #RECORD_DOWN
      000690 CC AB 06         [17]  574         call z,animate_down
      000693 FE 03            [ 7]  575         cp #RECORD_RIGHT
      000695 CC B3 06         [17]  576         call z,animate_right
      000698 FE 04            [ 7]  577         cp #RECORD_LEFT
      00069A CC BB 06         [17]  578         call z,animate_left
      00069D FE 37            [ 7]  579         cp #RECORD_END
      00069F C8               [11]  580         ret z
      0006A0 18 DB            [12]  581         jr animate_recording
      0006A2                        582 animate_up:
      0006A2 3E FF            [ 7]  583         ld a,#CHR_VISITED
      0006A4 77               [ 7]  584         ld (hl),a
      0006A5 3E C4            [ 7]  585         ld a,#CHR_MAN
      0006A7 ED 42            [15]  586         sbc hl,bc
      0006A9 77               [ 7]  587         ld (hl),a
      0006AA C9               [10]  588         ret
      0006AB                        589 animate_down:
      0006AB 3E FF            [ 7]  590         ld a,#CHR_VISITED
      0006AD 77               [ 7]  591         ld (hl),a
      0006AE 3E C4            [ 7]  592         ld a,#CHR_MAN
      0006B0 09               [11]  593         add hl,bc
      0006B1 77               [ 7]  594         ld (hl),a
      0006B2 C9               [10]  595         ret
      0006B3                        596 animate_right:
      0006B3 3E FF            [ 7]  597         ld a,#CHR_VISITED
      0006B5 77               [ 7]  598         ld (hl),a
      0006B6 3E C4            [ 7]  599         ld a,#CHR_MAN
      0006B8 23               [ 6]  600         inc hl
      0006B9 77               [ 7]  601         ld (hl),a
      0006BA C9               [10]  602         ret
      0006BB                        603 animate_left:
      0006BB 3E FF            [ 7]  604         ld a,#CHR_VISITED
      0006BD 77               [ 7]  605         ld (hl),a
      0006BE 3E C4            [ 7]  606         ld a,#CHR_MAN
      0006C0 2B               [ 6]  607         dec hl
      0006C1 77               [ 7]  608         ld (hl),a
      0006C2 C9               [10]  609         ret
                                    610 
      0006C3                        611 distribute_mines:
      0006C3 ED 4B A4 0B      [20]  612         ld bc,(mines_count)
      0006C7                        613 $put_mine:
      0006C7 C5               [11]  614         push bc
      0006C8                        615 distribute$new_number:
      0006C8 CD 8A 07         [17]  616         call rand16
      0006CB 7C               [ 4]  617         ld a,h
      0006CC E6 03            [ 7]  618         and #RANDOM_MASK ; bc <0x400
                                    619         ; while HL >= CUT_OFF call rand16
      0006CE 67               [ 4]  620         ld h,a
      0006CF FE 02            [ 7]  621         cp #>CUT_OFF   ; H>=HIGH(CUT_OFF)
      0006D1 38 08            [12]  622         jr c,distribute$is_smaller
      0006D3 20 F3            [12]  623         jr nz,distribute$new_number
      0006D5 7D               [ 4]  624         ld a,l
      0006D6 FE A8            [ 7]  625         cp #<CUT_OFF
      0006D8 F2 C8 06         [10]  626         jp p,distribute$new_number
      0006DB                        627 distribute$is_smaller:
      0006DB 01 FA 0F         [10]  628         ld bc,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
      0006DE 5D               [ 4]  629         ld e,l
      0006DF 54               [ 4]  630         ld d,h
      0006E0 09               [11]  631         add hl,bc
      0006E1 7E               [ 7]  632         ld a,(hl)
      0006E2 FE 00            [ 7]  633         cp #IS_FREE
                                    634 
      0006E4 20 E2            [12]  635         jr nz,distribute$new_number
      0006E6 21 A0 EC         [10]  636         ld hl,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
      0006E9 19               [11]  637         add hl,de
      0006EA 7E               [ 7]  638         ld a,(hl)
      0006EB FE 20            [ 7]  639         cp #CHR_FREE
      0006ED 20 D9            [12]  640         jr nz,distribute$new_number
                                    641         ;AZ check distribution
                                    642         ;ld a,#0x55
                                    643         ;ld (hl),a
      0006EF EB               [ 4]  644         ex de,hl
      0006F0 09               [11]  645         add hl,bc
      0006F1 3E 64            [ 7]  646         ld a,#IS_MINE
      0006F3 77               [ 7]  647         ld (hl),a
      0006F4 C1               [10]  648         pop bc
      0006F5 0B               [ 6]  649         dec bc
      0006F6 79               [ 4]  650         ld a,c
      0006F7 B0               [ 4]  651         or b
      0006F8 20 CD            [12]  652         jr nz,$put_mine
      0006FA C9               [10]  653         ret
      0006FB                        654 do_quit:
      0006FB 3E 37            [ 7]  655         ld a,#RECORD_END
      0006FD CD E0 05         [17]  656         call append_key
      000700 CD 88 07         [17]  657         call quit_sound
      000703 CD 27 05         [17]  658         call clear_screen
      000706 CD 60 05         [17]  659         call show_empty_field
      000709 CD 72 05         [17]  660         call show_mine_field
      00070C CD 74 06         [17]  661         call show_recording_history
      00070F CD 4F 06         [17]  662         call clear_data
      000712 01 60 EA         [10]  663         ld bc,#WAIT_750MS
      000715 CD CB 05         [17]  664         call wait
      000718 CD 27 05         [17]  665         call clear_screen
      00071B C3 1E 07         [10]  666         jp go_next
      00071E                        667 go_next:
      00071E 11 D2 EC         [10]  668         ld de,#BWS_A_SIE_HABEN
      000721 21 BC 0B         [10]  669         ld hl,#str_sie_haben
      000724 01 0C 00         [10]  670         ld bc,#size_of_sie_haben
      000727 ED B0            [21]  671         ldir
      000729 11 6F ED         [10]  672         ld de,#BWS_A_PUNKTE_ER
      00072C 21 C8 0B         [10]  673         ld hl,#str_punkte_erreicht
      00072F 01 12 00         [10]  674         ld bc,#size_of_punkte_erreich
      000732 ED B0            [21]  675         ldir
      000734 2A A2 0B         [16]  676         ld hl,(points_count)
      000737 11 25 ED         [10]  677         ld de,#BWS_A_TOTAL_POI
      00073A CD A3 05         [17]  678         call hex2int
      00073D 11 88 EE         [10]  679         ld de,#BWS_A_NOCH_EIN
      000740 21 DA 0B         [10]  680         ld hl,#str_noch_ein_spiel
      000743 01 10 00         [10]  681         ld bc,#size_of_noch_ein_spiel
      000746 ED B0            [21]  682         ldir
      000748 21 DE EE         [10]  683         ld hl,#BWS_A_JA
      00074B 3E 4A            [ 7]  684         ld a,#'J'
      00074D 77               [ 7]  685         ld (hl),a
      00074E 23               [ 6]  686         inc hl
      00074F 3E 2F            [ 7]  687         ld a,#'/'
      000751 77               [ 7]  688         ld (hl),a
      000752 23               [ 6]  689         inc hl
      000753 3E 4E            [ 7]  690         ld a,#'N'
      000755 77               [ 7]  691         ld (hl),a
      000756 CD A4 07         [17]  692         call up_inch
      000759 FE 4A            [ 7]  693         cp #'J'
      00075B CA 17 03         [10]  694         jp z,new_game
      00075E C3 61 07         [10]  695         jp kill_all_and_halt
                                    696 
      000761                        697 kill_all_and_halt:
      000461                        698         END_MESSAGE
      000761 0E 09            [ 7]    1         ld c,#UP_PRNST
      000763 11 6B 07         [10]    2         ld de,#str_exit
      000766 CD 05 00         [17]    3         call BOS
      000769 AF               [ 4]    4         xor a
      00076A C9               [10]    5         ret
      00076B                          6 str_exit:
      00076B 41 75 66 20 57 69 65     7         .asciz 'Auf Wiedersehen! Und weg... '
             64 65 72 73 65 68 65
             6E 21 20 55 6E 64 20
             77 65 67 2E 2E 2E 20
             00
                                    699 
      000788                        700 quit_sound:
      000488                        701         QUIT_SOUND
      000788 C9               [10]  702         ret
      000789                        703 click_sound:
      000489                        704         CLICK_SOUND
      000789 C9               [10]  705         ret
                                    706 ;
                                    707 ; Galois LFSRs
                                    708 ;
      00078A                        709 rand16:
      00078A 2A A2 07         [16]  710         ld hl,(seed)
      00078D ED 5F            [ 9]  711         ld a,r
      00078F 84               [ 4]  712         add h
      000790 67               [ 4]  713         ld h,a
      000791 AF               [ 4]  714         xor a ; CF=0
      000792 CB 1C            [ 8]  715         rr h
      000794 CB 1D            [ 8]  716         rr l
      000796 30 06            [12]  717         jr  nc,rand16$write_seed
      000798 AD               [ 4]  718         xor l
      000799 6F               [ 4]  719         ld l,a
      00079A 3E B4            [ 7]  720         ld a,#0xB4
      00079C AC               [ 4]  721         xor h
      00079D 67               [ 4]  722         ld h,a
      00079E                        723 rand16$write_seed:
      00079E 22 A2 07         [16]  724         ld (seed),hl
      0007A1 C9               [10]  725         ret
      0007A2                        726 seed:
      0007A2 E1 AC                  727         .dw 0xace1
                                    728 
      0007A4                        729 up_inch:
      0007A4 CD 8A 07         [17]  730         call rand16
      0004A7                        731         INKEY
      0007A7 0E 0B            [ 7]    1         ld c,#UP_CSTS
      0007A9 CD 05 00         [17]    2         call BOS
      0007AC B7               [ 4]    3         or a
      0007AD 28 F5            [12]    4         jr z,up_inch
      0007AF 0E 01            [ 7]    5         ld c,#UP_CONSI
      0007B1 CD 05 00         [17]    6         call BOS
      0007B4 FE 0B            [ 7]  732         cp #VK_UP; CURSOR UP
      0007B6 20 03            [12]  733         jr nz,up_inch$test_down
      0007B8                        734 up_inch$is_up:
      0007B8 3E 47            [ 7]  735         ld a,#'G'
      0007BA C9               [10]  736         ret
      0007BB                        737 up_inch$test_down:
      0007BB FE 0A            [ 7]  738         cp #VK_DOWN; CURSOR DOWN
      0007BD 20 03            [12]  739         jr nz,up_inch$test_left
      0007BF                        740 up_inch$is_down:
      0007BF 3E 4F            [ 7]  741         ld a,#'O'
      0007C1 C9               [10]  742         ret
      0007C2                        743 up_inch$test_left:
      0007C2 FE 08            [ 7]  744         cp #VK_LEFT; CURSOR LEFT
      0007C4 20 03            [12]  745         jr nz,up_inch$test_right
      0007C6                        746 up_inch$is_left:
      0007C6 3E 50            [ 7]  747         ld a,#'P'
      0007C8 C9               [10]  748         ret
      0007C9                        749 up_inch$test_right:
      0007C9 FE 09            [ 7]  750         cp #VK_RIGHT; CURSOR RIGHT
      0007CB 20 03            [12]  751         jr nz,up_inch$test_enter
      0007CD                        752 up_inch$is_right:
      0007CD 3E 51            [ 7]  753         ld a,#'Q'
      0007CF C9               [10]  754         ret
      0007D0                        755 up_inch$test_enter:
      0007D0 FE 0D            [ 7]  756         cp #0x0d; enter
      0007D2 20 03            [12]  757         jr nz,up_inch$fire
      0007D4                        758 up_inch$is_start:
      0007D4 3E 53            [ 7]  759         ld a,#'S'
      0007D6 C9               [10]  760         ret
      0007D7                        761 up_inch$fire:
      0007D7 FE 1B            [ 7]  762         cp #0x1b; joystick fire
      0007D9 20 02            [12]  763         jr nz,up_inch$end
      0007DB 18 F7            [12]  764         jr up_inch$is_start
      0007DD                        765 up_inch$end:
      0007DD C9               [10]  766         ret
      0007DE                        767 	JOYSTICK
      0004DE                        768 txt_empty_screen:
      0004DE                        769         TXT_MINES
      0007DE 4D 49 4E 45 4E 3A        1         .ascii 'MINEN:'
                           000006   770 ofs_minen   .equ .-txt_empty_screen
                                    771 
      0004E4                        772         TXT_PUNKTE
      0007E4 20 20 20 20 20 50 55     1         .ascii '     PUNKTE:'
             4E 4B 54 45 3A
                           000012   773 ofs_points   .equ .-txt_empty_screen
                                    774 
      0004F0                        775         TXT_EMPTY_SCREEN
      0007F0 20 20 20 20 20           1         .ascii '     '
                           000017     2 ofs_vorsicht   .equ .-txt_empty_screen
      0007F5 20 20 20 20 20 20 20     3         .ascii '                 '
             20 20 20 20 20 20 20
             20 20 20
                                      4 
      000806 A8                       5         .db 0xa8
                                      6         .rept (BWS_LINE_WIDTH/2-3)
                                      7         .db 0xa0
                                      8         .endm
      000807 A0                       1         .db 0xa0
      000808 A0                       1         .db 0xa0
      000809 A0                       1         .db 0xa0
      00080A A0                       1         .db 0xa0
      00080B A0                       1         .db 0xa0
      00080C A0                       1         .db 0xa0
      00080D A0                       1         .db 0xa0
      00080E A0                       1         .db 0xa0
      00080F A0                       1         .db 0xa0
      000810 A0                       1         .db 0xa0
      000811 A0                       1         .db 0xa0
      000812 A0                       1         .db 0xa0
      000813 A0                       1         .db 0xa0
      000814 A0                       1         .db 0xa0
      000815 A0                       1         .db 0xa0
      000816 A0                       1         .db 0xa0
      000817 A0                       1         .db 0xa0
      000818 A4 A0 A4                 9         .db 0xa4,0xa0,0xa4
                                     10         .rept (BWS_LINE_WIDTH/2-2)
                                     11         .db 0xa0
                                     12         .endm
      00081B A0                       1         .db 0xa0
      00081C A0                       1         .db 0xa0
      00081D A0                       1         .db 0xa0
      00081E A0                       1         .db 0xa0
      00081F A0                       1         .db 0xa0
      000820 A0                       1         .db 0xa0
      000821 A0                       1         .db 0xa0
      000822 A0                       1         .db 0xa0
      000823 A0                       1         .db 0xa0
      000824 A0                       1         .db 0xa0
      000825 A0                       1         .db 0xa0
      000826 A0                       1         .db 0xa0
      000827 A0                       1         .db 0xa0
      000828 A0                       1         .db 0xa0
      000829 A0                       1         .db 0xa0
      00082A A0                       1         .db 0xa0
      00082B A0                       1         .db 0xa0
      00082C A0                       1         .db 0xa0
      00082D A9                      13         .db 0xa9
                                     14 
      00082E A3                      15         .db 0xa3
                                     16         .rept (BWS_LINE_WIDTH/2-3)
                                     17         .db 0xa0
                                     18         .endm
      00082F A0                       1         .db 0xa0
      000830 A0                       1         .db 0xa0
      000831 A0                       1         .db 0xa0
      000832 A0                       1         .db 0xa0
      000833 A0                       1         .db 0xa0
      000834 A0                       1         .db 0xa0
      000835 A0                       1         .db 0xa0
      000836 A0                       1         .db 0xa0
      000837 A0                       1         .db 0xa0
      000838 A0                       1         .db 0xa0
      000839 A0                       1         .db 0xa0
      00083A A0                       1         .db 0xa0
      00083B A0                       1         .db 0xa0
      00083C A0                       1         .db 0xa0
      00083D A0                       1         .db 0xa0
      00083E A0                       1         .db 0xa0
      00083F A0                       1         .db 0xa0
      000840 AA 20 A7                19         .db 0xaa,0x20,0xa7
                                     20         .rept (BWS_LINE_WIDTH/2-2)
                                     21         .db 0xa0
                                     22         .endm
      000843 A0                       1         .db 0xa0
      000844 A0                       1         .db 0xa0
      000845 A0                       1         .db 0xa0
      000846 A0                       1         .db 0xa0
      000847 A0                       1         .db 0xa0
      000848 A0                       1         .db 0xa0
      000849 A0                       1         .db 0xa0
      00084A A0                       1         .db 0xa0
      00084B A0                       1         .db 0xa0
      00084C A0                       1         .db 0xa0
      00084D A0                       1         .db 0xa0
      00084E A0                       1         .db 0xa0
      00084F A0                       1         .db 0xa0
      000850 A0                       1         .db 0xa0
      000851 A0                       1         .db 0xa0
      000852 A0                       1         .db 0xa0
      000853 A0                       1         .db 0xa0
      000854 A0                       1         .db 0xa0
      000855 A5                      23         .db 0xa5
                                     24 
                                     25         .rept (BWS_HEIGHT-5)
                                     26                 .db 0xa1
                                     27                 .rept (BWS_LINE_WIDTH-2)
                                     28                 .db 0x20
                                     29                 .endm
                                     30                 .db 0xa1
                                     31         .endm
      000856 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000857 20                       1                 .db 0x20
      000858 20                       1                 .db 0x20
      000859 20                       1                 .db 0x20
      00085A 20                       1                 .db 0x20
      00085B 20                       1                 .db 0x20
      00085C 20                       1                 .db 0x20
      00085D 20                       1                 .db 0x20
      00085E 20                       1                 .db 0x20
      00085F 20                       1                 .db 0x20
      000860 20                       1                 .db 0x20
      000861 20                       1                 .db 0x20
      000862 20                       1                 .db 0x20
      000863 20                       1                 .db 0x20
      000864 20                       1                 .db 0x20
      000865 20                       1                 .db 0x20
      000866 20                       1                 .db 0x20
      000867 20                       1                 .db 0x20
      000868 20                       1                 .db 0x20
      000869 20                       1                 .db 0x20
      00086A 20                       1                 .db 0x20
      00086B 20                       1                 .db 0x20
      00086C 20                       1                 .db 0x20
      00086D 20                       1                 .db 0x20
      00086E 20                       1                 .db 0x20
      00086F 20                       1                 .db 0x20
      000870 20                       1                 .db 0x20
      000871 20                       1                 .db 0x20
      000872 20                       1                 .db 0x20
      000873 20                       1                 .db 0x20
      000874 20                       1                 .db 0x20
      000875 20                       1                 .db 0x20
      000876 20                       1                 .db 0x20
      000877 20                       1                 .db 0x20
      000878 20                       1                 .db 0x20
      000879 20                       1                 .db 0x20
      00087A 20                       1                 .db 0x20
      00087B 20                       1                 .db 0x20
      00087C 20                       1                 .db 0x20
      00087D A1                       5                 .db 0xa1
      00087E A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00087F 20                       1                 .db 0x20
      000880 20                       1                 .db 0x20
      000881 20                       1                 .db 0x20
      000882 20                       1                 .db 0x20
      000883 20                       1                 .db 0x20
      000884 20                       1                 .db 0x20
      000885 20                       1                 .db 0x20
      000886 20                       1                 .db 0x20
      000887 20                       1                 .db 0x20
      000888 20                       1                 .db 0x20
      000889 20                       1                 .db 0x20
      00088A 20                       1                 .db 0x20
      00088B 20                       1                 .db 0x20
      00088C 20                       1                 .db 0x20
      00088D 20                       1                 .db 0x20
      00088E 20                       1                 .db 0x20
      00088F 20                       1                 .db 0x20
      000890 20                       1                 .db 0x20
      000891 20                       1                 .db 0x20
      000892 20                       1                 .db 0x20
      000893 20                       1                 .db 0x20
      000894 20                       1                 .db 0x20
      000895 20                       1                 .db 0x20
      000896 20                       1                 .db 0x20
      000897 20                       1                 .db 0x20
      000898 20                       1                 .db 0x20
      000899 20                       1                 .db 0x20
      00089A 20                       1                 .db 0x20
      00089B 20                       1                 .db 0x20
      00089C 20                       1                 .db 0x20
      00089D 20                       1                 .db 0x20
      00089E 20                       1                 .db 0x20
      00089F 20                       1                 .db 0x20
      0008A0 20                       1                 .db 0x20
      0008A1 20                       1                 .db 0x20
      0008A2 20                       1                 .db 0x20
      0008A3 20                       1                 .db 0x20
      0008A4 20                       1                 .db 0x20
      0008A5 A1                       5                 .db 0xa1
      0008A6 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      0008A7 20                       1                 .db 0x20
      0008A8 20                       1                 .db 0x20
      0008A9 20                       1                 .db 0x20
      0008AA 20                       1                 .db 0x20
      0008AB 20                       1                 .db 0x20
      0008AC 20                       1                 .db 0x20
      0008AD 20                       1                 .db 0x20
      0008AE 20                       1                 .db 0x20
      0008AF 20                       1                 .db 0x20
      0008B0 20                       1                 .db 0x20
      0008B1 20                       1                 .db 0x20
      0008B2 20                       1                 .db 0x20
      0008B3 20                       1                 .db 0x20
      0008B4 20                       1                 .db 0x20
      0008B5 20                       1                 .db 0x20
      0008B6 20                       1                 .db 0x20
      0008B7 20                       1                 .db 0x20
      0008B8 20                       1                 .db 0x20
      0008B9 20                       1                 .db 0x20
      0008BA 20                       1                 .db 0x20
      0008BB 20                       1                 .db 0x20
      0008BC 20                       1                 .db 0x20
      0008BD 20                       1                 .db 0x20
      0008BE 20                       1                 .db 0x20
      0008BF 20                       1                 .db 0x20
      0008C0 20                       1                 .db 0x20
      0008C1 20                       1                 .db 0x20
      0008C2 20                       1                 .db 0x20
      0008C3 20                       1                 .db 0x20
      0008C4 20                       1                 .db 0x20
      0008C5 20                       1                 .db 0x20
      0008C6 20                       1                 .db 0x20
      0008C7 20                       1                 .db 0x20
      0008C8 20                       1                 .db 0x20
      0008C9 20                       1                 .db 0x20
      0008CA 20                       1                 .db 0x20
      0008CB 20                       1                 .db 0x20
      0008CC 20                       1                 .db 0x20
      0008CD A1                       5                 .db 0xa1
      0008CE A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      0008CF 20                       1                 .db 0x20
      0008D0 20                       1                 .db 0x20
      0008D1 20                       1                 .db 0x20
      0008D2 20                       1                 .db 0x20
      0008D3 20                       1                 .db 0x20
      0008D4 20                       1                 .db 0x20
      0008D5 20                       1                 .db 0x20
      0008D6 20                       1                 .db 0x20
      0008D7 20                       1                 .db 0x20
      0008D8 20                       1                 .db 0x20
      0008D9 20                       1                 .db 0x20
      0008DA 20                       1                 .db 0x20
      0008DB 20                       1                 .db 0x20
      0008DC 20                       1                 .db 0x20
      0008DD 20                       1                 .db 0x20
      0008DE 20                       1                 .db 0x20
      0008DF 20                       1                 .db 0x20
      0008E0 20                       1                 .db 0x20
      0008E1 20                       1                 .db 0x20
      0008E2 20                       1                 .db 0x20
      0008E3 20                       1                 .db 0x20
      0008E4 20                       1                 .db 0x20
      0008E5 20                       1                 .db 0x20
      0008E6 20                       1                 .db 0x20
      0008E7 20                       1                 .db 0x20
      0008E8 20                       1                 .db 0x20
      0008E9 20                       1                 .db 0x20
      0008EA 20                       1                 .db 0x20
      0008EB 20                       1                 .db 0x20
      0008EC 20                       1                 .db 0x20
      0008ED 20                       1                 .db 0x20
      0008EE 20                       1                 .db 0x20
      0008EF 20                       1                 .db 0x20
      0008F0 20                       1                 .db 0x20
      0008F1 20                       1                 .db 0x20
      0008F2 20                       1                 .db 0x20
      0008F3 20                       1                 .db 0x20
      0008F4 20                       1                 .db 0x20
      0008F5 A1                       5                 .db 0xa1
      0008F6 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      0008F7 20                       1                 .db 0x20
      0008F8 20                       1                 .db 0x20
      0008F9 20                       1                 .db 0x20
      0008FA 20                       1                 .db 0x20
      0008FB 20                       1                 .db 0x20
      0008FC 20                       1                 .db 0x20
      0008FD 20                       1                 .db 0x20
      0008FE 20                       1                 .db 0x20
      0008FF 20                       1                 .db 0x20
      000900 20                       1                 .db 0x20
      000901 20                       1                 .db 0x20
      000902 20                       1                 .db 0x20
      000903 20                       1                 .db 0x20
      000904 20                       1                 .db 0x20
      000905 20                       1                 .db 0x20
      000906 20                       1                 .db 0x20
      000907 20                       1                 .db 0x20
      000908 20                       1                 .db 0x20
      000909 20                       1                 .db 0x20
      00090A 20                       1                 .db 0x20
      00090B 20                       1                 .db 0x20
      00090C 20                       1                 .db 0x20
      00090D 20                       1                 .db 0x20
      00090E 20                       1                 .db 0x20
      00090F 20                       1                 .db 0x20
      000910 20                       1                 .db 0x20
      000911 20                       1                 .db 0x20
      000912 20                       1                 .db 0x20
      000913 20                       1                 .db 0x20
      000914 20                       1                 .db 0x20
      000915 20                       1                 .db 0x20
      000916 20                       1                 .db 0x20
      000917 20                       1                 .db 0x20
      000918 20                       1                 .db 0x20
      000919 20                       1                 .db 0x20
      00091A 20                       1                 .db 0x20
      00091B 20                       1                 .db 0x20
      00091C 20                       1                 .db 0x20
      00091D A1                       5                 .db 0xa1
      00091E A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00091F 20                       1                 .db 0x20
      000920 20                       1                 .db 0x20
      000921 20                       1                 .db 0x20
      000922 20                       1                 .db 0x20
      000923 20                       1                 .db 0x20
      000924 20                       1                 .db 0x20
      000925 20                       1                 .db 0x20
      000926 20                       1                 .db 0x20
      000927 20                       1                 .db 0x20
      000928 20                       1                 .db 0x20
      000929 20                       1                 .db 0x20
      00092A 20                       1                 .db 0x20
      00092B 20                       1                 .db 0x20
      00092C 20                       1                 .db 0x20
      00092D 20                       1                 .db 0x20
      00092E 20                       1                 .db 0x20
      00092F 20                       1                 .db 0x20
      000930 20                       1                 .db 0x20
      000931 20                       1                 .db 0x20
      000932 20                       1                 .db 0x20
      000933 20                       1                 .db 0x20
      000934 20                       1                 .db 0x20
      000935 20                       1                 .db 0x20
      000936 20                       1                 .db 0x20
      000937 20                       1                 .db 0x20
      000938 20                       1                 .db 0x20
      000939 20                       1                 .db 0x20
      00093A 20                       1                 .db 0x20
      00093B 20                       1                 .db 0x20
      00093C 20                       1                 .db 0x20
      00093D 20                       1                 .db 0x20
      00093E 20                       1                 .db 0x20
      00093F 20                       1                 .db 0x20
      000940 20                       1                 .db 0x20
      000941 20                       1                 .db 0x20
      000942 20                       1                 .db 0x20
      000943 20                       1                 .db 0x20
      000944 20                       1                 .db 0x20
      000945 A1                       5                 .db 0xa1
      000946 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000947 20                       1                 .db 0x20
      000948 20                       1                 .db 0x20
      000949 20                       1                 .db 0x20
      00094A 20                       1                 .db 0x20
      00094B 20                       1                 .db 0x20
      00094C 20                       1                 .db 0x20
      00094D 20                       1                 .db 0x20
      00094E 20                       1                 .db 0x20
      00094F 20                       1                 .db 0x20
      000950 20                       1                 .db 0x20
      000951 20                       1                 .db 0x20
      000952 20                       1                 .db 0x20
      000953 20                       1                 .db 0x20
      000954 20                       1                 .db 0x20
      000955 20                       1                 .db 0x20
      000956 20                       1                 .db 0x20
      000957 20                       1                 .db 0x20
      000958 20                       1                 .db 0x20
      000959 20                       1                 .db 0x20
      00095A 20                       1                 .db 0x20
      00095B 20                       1                 .db 0x20
      00095C 20                       1                 .db 0x20
      00095D 20                       1                 .db 0x20
      00095E 20                       1                 .db 0x20
      00095F 20                       1                 .db 0x20
      000960 20                       1                 .db 0x20
      000961 20                       1                 .db 0x20
      000962 20                       1                 .db 0x20
      000963 20                       1                 .db 0x20
      000964 20                       1                 .db 0x20
      000965 20                       1                 .db 0x20
      000966 20                       1                 .db 0x20
      000967 20                       1                 .db 0x20
      000968 20                       1                 .db 0x20
      000969 20                       1                 .db 0x20
      00096A 20                       1                 .db 0x20
      00096B 20                       1                 .db 0x20
      00096C 20                       1                 .db 0x20
      00096D A1                       5                 .db 0xa1
      00096E A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00096F 20                       1                 .db 0x20
      000970 20                       1                 .db 0x20
      000971 20                       1                 .db 0x20
      000972 20                       1                 .db 0x20
      000973 20                       1                 .db 0x20
      000974 20                       1                 .db 0x20
      000975 20                       1                 .db 0x20
      000976 20                       1                 .db 0x20
      000977 20                       1                 .db 0x20
      000978 20                       1                 .db 0x20
      000979 20                       1                 .db 0x20
      00097A 20                       1                 .db 0x20
      00097B 20                       1                 .db 0x20
      00097C 20                       1                 .db 0x20
      00097D 20                       1                 .db 0x20
      00097E 20                       1                 .db 0x20
      00097F 20                       1                 .db 0x20
      000980 20                       1                 .db 0x20
      000981 20                       1                 .db 0x20
      000982 20                       1                 .db 0x20
      000983 20                       1                 .db 0x20
      000984 20                       1                 .db 0x20
      000985 20                       1                 .db 0x20
      000986 20                       1                 .db 0x20
      000987 20                       1                 .db 0x20
      000988 20                       1                 .db 0x20
      000989 20                       1                 .db 0x20
      00098A 20                       1                 .db 0x20
      00098B 20                       1                 .db 0x20
      00098C 20                       1                 .db 0x20
      00098D 20                       1                 .db 0x20
      00098E 20                       1                 .db 0x20
      00098F 20                       1                 .db 0x20
      000990 20                       1                 .db 0x20
      000991 20                       1                 .db 0x20
      000992 20                       1                 .db 0x20
      000993 20                       1                 .db 0x20
      000994 20                       1                 .db 0x20
      000995 A1                       5                 .db 0xa1
      000996 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000997 20                       1                 .db 0x20
      000998 20                       1                 .db 0x20
      000999 20                       1                 .db 0x20
      00099A 20                       1                 .db 0x20
      00099B 20                       1                 .db 0x20
      00099C 20                       1                 .db 0x20
      00099D 20                       1                 .db 0x20
      00099E 20                       1                 .db 0x20
      00099F 20                       1                 .db 0x20
      0009A0 20                       1                 .db 0x20
      0009A1 20                       1                 .db 0x20
      0009A2 20                       1                 .db 0x20
      0009A3 20                       1                 .db 0x20
      0009A4 20                       1                 .db 0x20
      0009A5 20                       1                 .db 0x20
      0009A6 20                       1                 .db 0x20
      0009A7 20                       1                 .db 0x20
      0009A8 20                       1                 .db 0x20
      0009A9 20                       1                 .db 0x20
      0009AA 20                       1                 .db 0x20
      0009AB 20                       1                 .db 0x20
      0009AC 20                       1                 .db 0x20
      0009AD 20                       1                 .db 0x20
      0009AE 20                       1                 .db 0x20
      0009AF 20                       1                 .db 0x20
      0009B0 20                       1                 .db 0x20
      0009B1 20                       1                 .db 0x20
      0009B2 20                       1                 .db 0x20
      0009B3 20                       1                 .db 0x20
      0009B4 20                       1                 .db 0x20
      0009B5 20                       1                 .db 0x20
      0009B6 20                       1                 .db 0x20
      0009B7 20                       1                 .db 0x20
      0009B8 20                       1                 .db 0x20
      0009B9 20                       1                 .db 0x20
      0009BA 20                       1                 .db 0x20
      0009BB 20                       1                 .db 0x20
      0009BC 20                       1                 .db 0x20
      0009BD A1                       5                 .db 0xa1
      0009BE A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      0009BF 20                       1                 .db 0x20
      0009C0 20                       1                 .db 0x20
      0009C1 20                       1                 .db 0x20
      0009C2 20                       1                 .db 0x20
      0009C3 20                       1                 .db 0x20
      0009C4 20                       1                 .db 0x20
      0009C5 20                       1                 .db 0x20
      0009C6 20                       1                 .db 0x20
      0009C7 20                       1                 .db 0x20
      0009C8 20                       1                 .db 0x20
      0009C9 20                       1                 .db 0x20
      0009CA 20                       1                 .db 0x20
      0009CB 20                       1                 .db 0x20
      0009CC 20                       1                 .db 0x20
      0009CD 20                       1                 .db 0x20
      0009CE 20                       1                 .db 0x20
      0009CF 20                       1                 .db 0x20
      0009D0 20                       1                 .db 0x20
      0009D1 20                       1                 .db 0x20
      0009D2 20                       1                 .db 0x20
      0009D3 20                       1                 .db 0x20
      0009D4 20                       1                 .db 0x20
      0009D5 20                       1                 .db 0x20
      0009D6 20                       1                 .db 0x20
      0009D7 20                       1                 .db 0x20
      0009D8 20                       1                 .db 0x20
      0009D9 20                       1                 .db 0x20
      0009DA 20                       1                 .db 0x20
      0009DB 20                       1                 .db 0x20
      0009DC 20                       1                 .db 0x20
      0009DD 20                       1                 .db 0x20
      0009DE 20                       1                 .db 0x20
      0009DF 20                       1                 .db 0x20
      0009E0 20                       1                 .db 0x20
      0009E1 20                       1                 .db 0x20
      0009E2 20                       1                 .db 0x20
      0009E3 20                       1                 .db 0x20
      0009E4 20                       1                 .db 0x20
      0009E5 A1                       5                 .db 0xa1
      0009E6 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      0009E7 20                       1                 .db 0x20
      0009E8 20                       1                 .db 0x20
      0009E9 20                       1                 .db 0x20
      0009EA 20                       1                 .db 0x20
      0009EB 20                       1                 .db 0x20
      0009EC 20                       1                 .db 0x20
      0009ED 20                       1                 .db 0x20
      0009EE 20                       1                 .db 0x20
      0009EF 20                       1                 .db 0x20
      0009F0 20                       1                 .db 0x20
      0009F1 20                       1                 .db 0x20
      0009F2 20                       1                 .db 0x20
      0009F3 20                       1                 .db 0x20
      0009F4 20                       1                 .db 0x20
      0009F5 20                       1                 .db 0x20
      0009F6 20                       1                 .db 0x20
      0009F7 20                       1                 .db 0x20
      0009F8 20                       1                 .db 0x20
      0009F9 20                       1                 .db 0x20
      0009FA 20                       1                 .db 0x20
      0009FB 20                       1                 .db 0x20
      0009FC 20                       1                 .db 0x20
      0009FD 20                       1                 .db 0x20
      0009FE 20                       1                 .db 0x20
      0009FF 20                       1                 .db 0x20
      000A00 20                       1                 .db 0x20
      000A01 20                       1                 .db 0x20
      000A02 20                       1                 .db 0x20
      000A03 20                       1                 .db 0x20
      000A04 20                       1                 .db 0x20
      000A05 20                       1                 .db 0x20
      000A06 20                       1                 .db 0x20
      000A07 20                       1                 .db 0x20
      000A08 20                       1                 .db 0x20
      000A09 20                       1                 .db 0x20
      000A0A 20                       1                 .db 0x20
      000A0B 20                       1                 .db 0x20
      000A0C 20                       1                 .db 0x20
      000A0D A1                       5                 .db 0xa1
      000A0E A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000A0F 20                       1                 .db 0x20
      000A10 20                       1                 .db 0x20
      000A11 20                       1                 .db 0x20
      000A12 20                       1                 .db 0x20
      000A13 20                       1                 .db 0x20
      000A14 20                       1                 .db 0x20
      000A15 20                       1                 .db 0x20
      000A16 20                       1                 .db 0x20
      000A17 20                       1                 .db 0x20
      000A18 20                       1                 .db 0x20
      000A19 20                       1                 .db 0x20
      000A1A 20                       1                 .db 0x20
      000A1B 20                       1                 .db 0x20
      000A1C 20                       1                 .db 0x20
      000A1D 20                       1                 .db 0x20
      000A1E 20                       1                 .db 0x20
      000A1F 20                       1                 .db 0x20
      000A20 20                       1                 .db 0x20
      000A21 20                       1                 .db 0x20
      000A22 20                       1                 .db 0x20
      000A23 20                       1                 .db 0x20
      000A24 20                       1                 .db 0x20
      000A25 20                       1                 .db 0x20
      000A26 20                       1                 .db 0x20
      000A27 20                       1                 .db 0x20
      000A28 20                       1                 .db 0x20
      000A29 20                       1                 .db 0x20
      000A2A 20                       1                 .db 0x20
      000A2B 20                       1                 .db 0x20
      000A2C 20                       1                 .db 0x20
      000A2D 20                       1                 .db 0x20
      000A2E 20                       1                 .db 0x20
      000A2F 20                       1                 .db 0x20
      000A30 20                       1                 .db 0x20
      000A31 20                       1                 .db 0x20
      000A32 20                       1                 .db 0x20
      000A33 20                       1                 .db 0x20
      000A34 20                       1                 .db 0x20
      000A35 A1                       5                 .db 0xa1
      000A36 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000A37 20                       1                 .db 0x20
      000A38 20                       1                 .db 0x20
      000A39 20                       1                 .db 0x20
      000A3A 20                       1                 .db 0x20
      000A3B 20                       1                 .db 0x20
      000A3C 20                       1                 .db 0x20
      000A3D 20                       1                 .db 0x20
      000A3E 20                       1                 .db 0x20
      000A3F 20                       1                 .db 0x20
      000A40 20                       1                 .db 0x20
      000A41 20                       1                 .db 0x20
      000A42 20                       1                 .db 0x20
      000A43 20                       1                 .db 0x20
      000A44 20                       1                 .db 0x20
      000A45 20                       1                 .db 0x20
      000A46 20                       1                 .db 0x20
      000A47 20                       1                 .db 0x20
      000A48 20                       1                 .db 0x20
      000A49 20                       1                 .db 0x20
      000A4A 20                       1                 .db 0x20
      000A4B 20                       1                 .db 0x20
      000A4C 20                       1                 .db 0x20
      000A4D 20                       1                 .db 0x20
      000A4E 20                       1                 .db 0x20
      000A4F 20                       1                 .db 0x20
      000A50 20                       1                 .db 0x20
      000A51 20                       1                 .db 0x20
      000A52 20                       1                 .db 0x20
      000A53 20                       1                 .db 0x20
      000A54 20                       1                 .db 0x20
      000A55 20                       1                 .db 0x20
      000A56 20                       1                 .db 0x20
      000A57 20                       1                 .db 0x20
      000A58 20                       1                 .db 0x20
      000A59 20                       1                 .db 0x20
      000A5A 20                       1                 .db 0x20
      000A5B 20                       1                 .db 0x20
      000A5C 20                       1                 .db 0x20
      000A5D A1                       5                 .db 0xa1
      000A5E A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000A5F 20                       1                 .db 0x20
      000A60 20                       1                 .db 0x20
      000A61 20                       1                 .db 0x20
      000A62 20                       1                 .db 0x20
      000A63 20                       1                 .db 0x20
      000A64 20                       1                 .db 0x20
      000A65 20                       1                 .db 0x20
      000A66 20                       1                 .db 0x20
      000A67 20                       1                 .db 0x20
      000A68 20                       1                 .db 0x20
      000A69 20                       1                 .db 0x20
      000A6A 20                       1                 .db 0x20
      000A6B 20                       1                 .db 0x20
      000A6C 20                       1                 .db 0x20
      000A6D 20                       1                 .db 0x20
      000A6E 20                       1                 .db 0x20
      000A6F 20                       1                 .db 0x20
      000A70 20                       1                 .db 0x20
      000A71 20                       1                 .db 0x20
      000A72 20                       1                 .db 0x20
      000A73 20                       1                 .db 0x20
      000A74 20                       1                 .db 0x20
      000A75 20                       1                 .db 0x20
      000A76 20                       1                 .db 0x20
      000A77 20                       1                 .db 0x20
      000A78 20                       1                 .db 0x20
      000A79 20                       1                 .db 0x20
      000A7A 20                       1                 .db 0x20
      000A7B 20                       1                 .db 0x20
      000A7C 20                       1                 .db 0x20
      000A7D 20                       1                 .db 0x20
      000A7E 20                       1                 .db 0x20
      000A7F 20                       1                 .db 0x20
      000A80 20                       1                 .db 0x20
      000A81 20                       1                 .db 0x20
      000A82 20                       1                 .db 0x20
      000A83 20                       1                 .db 0x20
      000A84 20                       1                 .db 0x20
      000A85 A1                       5                 .db 0xa1
      000A86 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000A87 20                       1                 .db 0x20
      000A88 20                       1                 .db 0x20
      000A89 20                       1                 .db 0x20
      000A8A 20                       1                 .db 0x20
      000A8B 20                       1                 .db 0x20
      000A8C 20                       1                 .db 0x20
      000A8D 20                       1                 .db 0x20
      000A8E 20                       1                 .db 0x20
      000A8F 20                       1                 .db 0x20
      000A90 20                       1                 .db 0x20
      000A91 20                       1                 .db 0x20
      000A92 20                       1                 .db 0x20
      000A93 20                       1                 .db 0x20
      000A94 20                       1                 .db 0x20
      000A95 20                       1                 .db 0x20
      000A96 20                       1                 .db 0x20
      000A97 20                       1                 .db 0x20
      000A98 20                       1                 .db 0x20
      000A99 20                       1                 .db 0x20
      000A9A 20                       1                 .db 0x20
      000A9B 20                       1                 .db 0x20
      000A9C 20                       1                 .db 0x20
      000A9D 20                       1                 .db 0x20
      000A9E 20                       1                 .db 0x20
      000A9F 20                       1                 .db 0x20
      000AA0 20                       1                 .db 0x20
      000AA1 20                       1                 .db 0x20
      000AA2 20                       1                 .db 0x20
      000AA3 20                       1                 .db 0x20
      000AA4 20                       1                 .db 0x20
      000AA5 20                       1                 .db 0x20
      000AA6 20                       1                 .db 0x20
      000AA7 20                       1                 .db 0x20
      000AA8 20                       1                 .db 0x20
      000AA9 20                       1                 .db 0x20
      000AAA 20                       1                 .db 0x20
      000AAB 20                       1                 .db 0x20
      000AAC 20                       1                 .db 0x20
      000AAD A1                       5                 .db 0xa1
      000AAE A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000AAF 20                       1                 .db 0x20
      000AB0 20                       1                 .db 0x20
      000AB1 20                       1                 .db 0x20
      000AB2 20                       1                 .db 0x20
      000AB3 20                       1                 .db 0x20
      000AB4 20                       1                 .db 0x20
      000AB5 20                       1                 .db 0x20
      000AB6 20                       1                 .db 0x20
      000AB7 20                       1                 .db 0x20
      000AB8 20                       1                 .db 0x20
      000AB9 20                       1                 .db 0x20
      000ABA 20                       1                 .db 0x20
      000ABB 20                       1                 .db 0x20
      000ABC 20                       1                 .db 0x20
      000ABD 20                       1                 .db 0x20
      000ABE 20                       1                 .db 0x20
      000ABF 20                       1                 .db 0x20
      000AC0 20                       1                 .db 0x20
      000AC1 20                       1                 .db 0x20
      000AC2 20                       1                 .db 0x20
      000AC3 20                       1                 .db 0x20
      000AC4 20                       1                 .db 0x20
      000AC5 20                       1                 .db 0x20
      000AC6 20                       1                 .db 0x20
      000AC7 20                       1                 .db 0x20
      000AC8 20                       1                 .db 0x20
      000AC9 20                       1                 .db 0x20
      000ACA 20                       1                 .db 0x20
      000ACB 20                       1                 .db 0x20
      000ACC 20                       1                 .db 0x20
      000ACD 20                       1                 .db 0x20
      000ACE 20                       1                 .db 0x20
      000ACF 20                       1                 .db 0x20
      000AD0 20                       1                 .db 0x20
      000AD1 20                       1                 .db 0x20
      000AD2 20                       1                 .db 0x20
      000AD3 20                       1                 .db 0x20
      000AD4 20                       1                 .db 0x20
      000AD5 A1                       5                 .db 0xa1
      000AD6 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000AD7 20                       1                 .db 0x20
      000AD8 20                       1                 .db 0x20
      000AD9 20                       1                 .db 0x20
      000ADA 20                       1                 .db 0x20
      000ADB 20                       1                 .db 0x20
      000ADC 20                       1                 .db 0x20
      000ADD 20                       1                 .db 0x20
      000ADE 20                       1                 .db 0x20
      000ADF 20                       1                 .db 0x20
      000AE0 20                       1                 .db 0x20
      000AE1 20                       1                 .db 0x20
      000AE2 20                       1                 .db 0x20
      000AE3 20                       1                 .db 0x20
      000AE4 20                       1                 .db 0x20
      000AE5 20                       1                 .db 0x20
      000AE6 20                       1                 .db 0x20
      000AE7 20                       1                 .db 0x20
      000AE8 20                       1                 .db 0x20
      000AE9 20                       1                 .db 0x20
      000AEA 20                       1                 .db 0x20
      000AEB 20                       1                 .db 0x20
      000AEC 20                       1                 .db 0x20
      000AED 20                       1                 .db 0x20
      000AEE 20                       1                 .db 0x20
      000AEF 20                       1                 .db 0x20
      000AF0 20                       1                 .db 0x20
      000AF1 20                       1                 .db 0x20
      000AF2 20                       1                 .db 0x20
      000AF3 20                       1                 .db 0x20
      000AF4 20                       1                 .db 0x20
      000AF5 20                       1                 .db 0x20
      000AF6 20                       1                 .db 0x20
      000AF7 20                       1                 .db 0x20
      000AF8 20                       1                 .db 0x20
      000AF9 20                       1                 .db 0x20
      000AFA 20                       1                 .db 0x20
      000AFB 20                       1                 .db 0x20
      000AFC 20                       1                 .db 0x20
      000AFD A1                       5                 .db 0xa1
      000AFE A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000AFF 20                       1                 .db 0x20
      000B00 20                       1                 .db 0x20
      000B01 20                       1                 .db 0x20
      000B02 20                       1                 .db 0x20
      000B03 20                       1                 .db 0x20
      000B04 20                       1                 .db 0x20
      000B05 20                       1                 .db 0x20
      000B06 20                       1                 .db 0x20
      000B07 20                       1                 .db 0x20
      000B08 20                       1                 .db 0x20
      000B09 20                       1                 .db 0x20
      000B0A 20                       1                 .db 0x20
      000B0B 20                       1                 .db 0x20
      000B0C 20                       1                 .db 0x20
      000B0D 20                       1                 .db 0x20
      000B0E 20                       1                 .db 0x20
      000B0F 20                       1                 .db 0x20
      000B10 20                       1                 .db 0x20
      000B11 20                       1                 .db 0x20
      000B12 20                       1                 .db 0x20
      000B13 20                       1                 .db 0x20
      000B14 20                       1                 .db 0x20
      000B15 20                       1                 .db 0x20
      000B16 20                       1                 .db 0x20
      000B17 20                       1                 .db 0x20
      000B18 20                       1                 .db 0x20
      000B19 20                       1                 .db 0x20
      000B1A 20                       1                 .db 0x20
      000B1B 20                       1                 .db 0x20
      000B1C 20                       1                 .db 0x20
      000B1D 20                       1                 .db 0x20
      000B1E 20                       1                 .db 0x20
      000B1F 20                       1                 .db 0x20
      000B20 20                       1                 .db 0x20
      000B21 20                       1                 .db 0x20
      000B22 20                       1                 .db 0x20
      000B23 20                       1                 .db 0x20
      000B24 20                       1                 .db 0x20
      000B25 A1                       5                 .db 0xa1
      000B26 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      000B27 20                       1                 .db 0x20
      000B28 20                       1                 .db 0x20
      000B29 20                       1                 .db 0x20
      000B2A 20                       1                 .db 0x20
      000B2B 20                       1                 .db 0x20
      000B2C 20                       1                 .db 0x20
      000B2D 20                       1                 .db 0x20
      000B2E 20                       1                 .db 0x20
      000B2F 20                       1                 .db 0x20
      000B30 20                       1                 .db 0x20
      000B31 20                       1                 .db 0x20
      000B32 20                       1                 .db 0x20
      000B33 20                       1                 .db 0x20
      000B34 20                       1                 .db 0x20
      000B35 20                       1                 .db 0x20
      000B36 20                       1                 .db 0x20
      000B37 20                       1                 .db 0x20
      000B38 20                       1                 .db 0x20
      000B39 20                       1                 .db 0x20
      000B3A 20                       1                 .db 0x20
      000B3B 20                       1                 .db 0x20
      000B3C 20                       1                 .db 0x20
      000B3D 20                       1                 .db 0x20
      000B3E 20                       1                 .db 0x20
      000B3F 20                       1                 .db 0x20
      000B40 20                       1                 .db 0x20
      000B41 20                       1                 .db 0x20
      000B42 20                       1                 .db 0x20
      000B43 20                       1                 .db 0x20
      000B44 20                       1                 .db 0x20
      000B45 20                       1                 .db 0x20
      000B46 20                       1                 .db 0x20
      000B47 20                       1                 .db 0x20
      000B48 20                       1                 .db 0x20
      000B49 20                       1                 .db 0x20
      000B4A 20                       1                 .db 0x20
      000B4B 20                       1                 .db 0x20
      000B4C 20                       1                 .db 0x20
      000B4D A1                       5                 .db 0xa1
                                     32 
      000B4E A3                      33         .db 0xa3
                                     34         .rept (BWS_LINE_WIDTH/2-3)
                                     35         .db 0xa0
                                     36         .endm
      000B4F A0                       1         .db 0xa0
      000B50 A0                       1         .db 0xa0
      000B51 A0                       1         .db 0xa0
      000B52 A0                       1         .db 0xa0
      000B53 A0                       1         .db 0xa0
      000B54 A0                       1         .db 0xa0
      000B55 A0                       1         .db 0xa0
      000B56 A0                       1         .db 0xa0
      000B57 A0                       1         .db 0xa0
      000B58 A0                       1         .db 0xa0
      000B59 A0                       1         .db 0xa0
      000B5A A0                       1         .db 0xa0
      000B5B A0                       1         .db 0xa0
      000B5C A0                       1         .db 0xa0
      000B5D A0                       1         .db 0xa0
      000B5E A0                       1         .db 0xa0
      000B5F A0                       1         .db 0xa0
      000B60 A9 20 A8                37         .db 0xa9,0x20,0xa8
                                     38         .rept (BWS_LINE_WIDTH/2-2)
                                     39         .db 0xa0
                                     40         .endm
      000B63 A0                       1         .db 0xa0
      000B64 A0                       1         .db 0xa0
      000B65 A0                       1         .db 0xa0
      000B66 A0                       1         .db 0xa0
      000B67 A0                       1         .db 0xa0
      000B68 A0                       1         .db 0xa0
      000B69 A0                       1         .db 0xa0
      000B6A A0                       1         .db 0xa0
      000B6B A0                       1         .db 0xa0
      000B6C A0                       1         .db 0xa0
      000B6D A0                       1         .db 0xa0
      000B6E A0                       1         .db 0xa0
      000B6F A0                       1         .db 0xa0
      000B70 A0                       1         .db 0xa0
      000B71 A0                       1         .db 0xa0
      000B72 A0                       1         .db 0xa0
      000B73 A0                       1         .db 0xa0
      000B74 A0                       1         .db 0xa0
      000B75 A5                      41         .db 0xa5
                                     42 
      000B76 A7                      43         .db 0xa7
                                     44         .rept (BWS_LINE_WIDTH/2-3)
                                     45         .db 0xa0
                                     46         .endm
      000B77 A0                       1         .db 0xa0
      000B78 A0                       1         .db 0xa0
      000B79 A0                       1         .db 0xa0
      000B7A A0                       1         .db 0xa0
      000B7B A0                       1         .db 0xa0
      000B7C A0                       1         .db 0xa0
      000B7D A0                       1         .db 0xa0
      000B7E A0                       1         .db 0xa0
      000B7F A0                       1         .db 0xa0
      000B80 A0                       1         .db 0xa0
      000B81 A0                       1         .db 0xa0
      000B82 A0                       1         .db 0xa0
      000B83 A0                       1         .db 0xa0
      000B84 A0                       1         .db 0xa0
      000B85 A0                       1         .db 0xa0
      000B86 A0                       1         .db 0xa0
      000B87 A0                       1         .db 0xa0
      000B88 A2 A0 A2                47         .db 0xa2,0xa0,0xa2
                                     48         .rept (BWS_LINE_WIDTH/2-2)
                                     49         .db 0xa0
                                     50         .endm
      000B8B A0                       1         .db 0xa0
      000B8C A0                       1         .db 0xa0
      000B8D A0                       1         .db 0xa0
      000B8E A0                       1         .db 0xa0
      000B8F A0                       1         .db 0xa0
      000B90 A0                       1         .db 0xa0
      000B91 A0                       1         .db 0xa0
      000B92 A0                       1         .db 0xa0
      000B93 A0                       1         .db 0xa0
      000B94 A0                       1         .db 0xa0
      000B95 A0                       1         .db 0xa0
      000B96 A0                       1         .db 0xa0
      000B97 A0                       1         .db 0xa0
      000B98 A0                       1         .db 0xa0
      000B99 A0                       1         .db 0xa0
      000B9A A0                       1         .db 0xa0
      000B9B A0                       1         .db 0xa0
      000B9C A0                       1         .db 0xa0
      000B9D AA                      51         .db 0xaa
                                    776 
      000B9E                        777 ptr_cursor:
      000B9E CF EF                  778         .db 0xcf,0xef                               ;Oo
      000BA0                        779 ptr_internal_array:
      000BA0 2F 17                  780         .db 0x2f,0x17                               ;/.
      000BA2                        781 points_count:
      000BA2 32 00                  782         .db 0x32,0x00                               ;2.
      000BA4                        783 mines_count:
      000BA4 4B 00                  784         .db 0x4b,0x00                               ;K.
      000BA6                        785 ptr_log_buffer:
      000BA6 FF 1F                  786         .db 0xff,0x1f                               ;..
      000BA8                        787 ptr_random_buffer:
      000BA8 BE 14                  788         .db 0xbe,0x14                               ;>.
      000BAA                        789 last_joystick:
      000BAA 00                     790         .db 0x00
      000BAB                        791 str_vorsicht_minen:
      000BAB 56 4F 52 53 49 43 48   792         .ascii 'VORSICHT   MINE/N'
             54 20 20 20 4D 49 4E
             45 2F 4E
                           000011   793 len_vorsicht_minen .equ .-str_vorsicht_minen
      000BBC                        794 str_sie_haben:
      000BBC 53 49 45 20 20 20 20   795         .ascii 'SIE    HABEN'
             48 41 42 45 4E
      000BC8                        796 str_punkte_erreicht:
      000BC8 50 55 4E 4B 54 45 20   797         .ascii 'PUNKTE    ERREICHT'
             20 20 20 45 52 52 45
             49 43 48 54
      000BDA                        798 str_noch_ein_spiel:
      000BDA 4E 4F 43 48 20 45 49   799         .ascii 'NOCH EIN SPIEL ?'
             4E 20 53 50 49 45 4C
             20 3F
      000BEA                        800 txt_title:
      0008EA                        801         TITLE_IMG_CONTENT
      000BEA AE 9E 9E 9E 9E 9E 9E     1         .ascii '\256\236\236\236\236\236\236\236\236\236\255           \212   \212\212  \212         '
             9E 9E 9E AD 20 20 20
             20 20 20 20 20 20 20
             20 8A 20 20 20 8A 8A
             20 20 8A 20 20 20 20
             20 20 20 20 20
      000C12 9F B9 B6 B3 B2 B6 B8     2         .ascii '\237\271\266\263\262\266\270 \275\260\300          \212 \212\222\223\236\236\226\225\212\212        '
             20 BD B0 C0 20 20 20
             20 20 20 20 20 20 20
             8A 20 8A 92 93 9E 9E
             96 95 8A 8A 20 20 20
             20 20 20 20 20
      000C3A 9F B8 B7 20 B5 20 20     3         .db 0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20
             20
      000C42 B5 20 C0 20 20 20 20     4         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20
             20
      000C4A 20 20 20 20 20 8A 20     5         .db 0x20,0x20,0x20,0x20,0x20,0x8a,0x20,0x99
             99
      000C52 20 20 20 20 20 20 9B     6         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x9b
      000C59 20 20 20 20 20 20 20     7         .ascii '         '
             20 20
      000C62 9F B3 20 B4 B5 20 B2     8         .db 0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20
             20
      000C6A B5 20 C0 20 20 20 20     9         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20
             20
      000C72 20 20 20 20 20 20 20    10         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x98
             98
      000C7A 20 C9 20 20 C9 20 9C    11         .db 0x20,0xc9,0x20,0x20,0xc9,0x20,0x9c
      000C81 20 53 20 53 74 61 72    12         .ascii ' S Start '
             74 20
                                     13 
      000C8A 9F B1 B6 20 20 B6 B0    14         .db 0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20
             20
      000C92 B6 B0 C0 20 92 93 9E    15         .db 0xb6,0xb0,0xc0,0x20,0x92,0x93,0x9e,0x9e
             9E
      000C9A 96 95 20 20 20 20 20    16         .db 0x96,0x95,0x20,0x20,0x20,0x20,0x20,0x9f
             9F
      000CA2 20 20 86 87 20 20 C0    17         .db 0x20,0x20,0x86,0x87,0x20,0x20,0xc0
      000CA9 20 20 20 20 20 20 20    18         .ascii '         '
             20 20
                                     19         
      000CB2 9F                      20         .db 0x9f
      000CB3 70 72 65 73 65 6E 74    21         .ascii 'presents:'
             73 3A
      000CBC C0 99 20 20 20 20       22         .db 0xc0,0x99,0x20,0x20,0x20,0x20
      000CC2 20 20 9B 20 20 20 20    23         .db 0x20,0x20,0x9b,0x20,0x20,0x20,0x20,0x9b
             9B
      000CCA 20 20 85 84 20 20 99    24         .db 0x20,0x20,0x85,0x84,0x20,0x20,0x99
      000CD1 20 9D 20 48 6F 63 68    25         .ascii ' \235 Hoch  '
             20 20
                                     26 
      000CDA AB F8 F8 F8 F8 F8 F8    27         .db 0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8
             F8
      000CE2 F8 F8 AC 98 20 C9 20    28         .db 0xf8,0xf8,0xac,0x98,0x20,0xc9,0x20,0x20
             20
      000CEA C9 20 9C 20 20 20 20    29         .db 0xc9,0x20,0x9c,0x20,0x20,0x20,0x20,0x9c
             9C
      000CF2 20 86 92 95 87 20 98    30         .db 0x20,0x86,0x92,0x95,0x87,0x20,0x98
      000CF9 20 20 20 20 20 20 20    31         .ascii '         '
             20 20
                                     32         
      000D02 20 20 20 20 20 20 20    33         .ascii '           '
             20 20 20 20
      000D0D 9F 20 20 86 87          34         .db 0x9f,0x20,0x20,0x86,0x87
      000D12 20 20 C0 20 20 20 20    35         .db 0x20,0x20,0xc0,0x20,0x20,0x20,0x20,0x20
             20
      000D1A 96 95 F8 F8 92 93       36         .db 0x96,0x95,0xf8,0xf8,0x92,0x93
      000D20 20 20 9A 20 52 75 6E    37         .ascii '  \232 Runter'
             74 65 72
                                     38 
      000D2A 20 20 20 20 20 20 20    39         .ascii '           '
             20 20 20 20
      000D35 9B 20 20 85 84          40         .db 0x9b,0x20,0x20,0x85,0x84 ;   .  ..
      000D3A 20 20 99 20 20 20 20    41         .db 0x20,0x20,0x99,0x20,0x20,0x20,0x20,0x20 ;  .     
             20
      000D42 20 20 9F C0             42         .db 0x20,0x20,0x9f,0xc0
      000D46 20 20 20 20 20 20 20    43         .ascii '            '
             20 20 20 20 20
                                     44         
      000D52 20 4E 6F 77 20 79 6F    45         .ascii ' Now you   '
             75 20 20 20
      000D5D 9C 20 85 95 92          46         .db 0x9c,0x20,0x85,0x95,0x92 ;   . ...
      000D62 84 20 98 20 20 20 20    47         .db 0x84,0x20,0x98,0x20,0x20,0x20,0x20,0x20 ;. .     
             20
      000D6A 20 DF 9F C0 DC 20 20    48         .db 0x20,0xdf,0x9f,0xc0,0xdc,0x20,0x20,0x20 ; _.@\   
             20
      000D72 94 20 4C 69 6E 6B 73    49         .ascii '\224 Links '
             20
                                     50 
      000D7A 20 20 20 20 20 20 20    51         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000D82 20 20 20 20 96 95 F8    52         .db 0x20,0x20,0x20,0x20,0x96,0x95,0xf8,0xf8 ;    ..xx
             F8
      000D8A 92 93 20 20 20 20 20    53         .db 0x92,0x93,0x20,0x20,0x20,0x20,0x20,0x20 ;..      
             20
      000D92 20 20 20 20 20 20 20    54         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000D9A 20 20 20 20 20 20 20    55         .ascii '        '
             20
                                     56         
      000DA2 20 61 72 65 20 68 61    57         .ascii ' are happy '
             70 70 79 20
      000DAD DB F8 90 20 20 9E 96    58         .db 0xdb,0xf8,0x90,0x20,0x20,0x9e,0x96,0xd8
             D8
      000DB5 20 20 20 62 75 74 20    59         .ascii '   but be    \227 Rechts'
             62 65 20 20 20 20 97
             20 52 65 63 68 74 73
                                     60 
      000DCA 20 20 20 20 20 20 20    61         .ascii '                 '
             20 20 20 20 20 20 20
             20 20 20
      000DDB B7 FF FF B7             62         .db 0xb7,0xff,0xff,0xb7
      000DDF 20 20 63 61 72 65 66    63         .ascii '  carefull!        '
             75 6C 6C 21 20 20 20
             20 20 20 20 20
                                     64 
      000DF2 20 20 20 20 20 20 20    65         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      000E1A 20 20 20 20 20 20 20    66         .ascii '                                 oder   '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 6F 64
             65 72 20 20 20
                                     67 
      000E42 20 20 20 20 B2 20 B2    68         .db 0x20,0x20,0x20,0x20,0xb2,0x20,0xb2,0x20 ;    2 2 
             20
      000E4A B3 20 20 20 20 20 20    69         .db 0xb3,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;3       
             20
      000E52 B2 B3 B3 20 20 20 B2    70         .db 0xb2,0xb3,0xb3,0x20,0x20,0x20,0xb2,0x20 ;233   2 
             20
      000E5A 20 20 B3 20 20 20 20    71         .db 0x20,0x20,0xb3,0x20,0x20,0x20,0x20,0x20 ;  3     
             20
      000E62 20 20 20 20 20 20 20    72         .ascii '        '
             20
      000E6A 20 B8 20 20 B5 B8 BD    73         .db 0x20,0xb8,0x20,0x20,0xb5,0xb8,0xbd,0x20 ; 8  58= 
             20
      000E72 B3 B2 B2 20 20 B7 B3    74         .db 0xb3,0xb2,0xb2,0x20,0x20,0xb7,0xb3,0x20 ;322  73 
             20
      000E7A B4 20 B3 20 B7 B3 B5    75         .db 0xb4,0x20,0xb3,0x20,0xb7,0xb3,0xb5,0x20 ;4 3 735 
             20
      000E82 B2 B7 B4 20 B2 B0 20    76         .db 0xb2,0xb7,0xb4,0x20,0xb2,0xb0,0x20,0x20 ;274 20  
             20
      000E8A 4A 6F 79 73 74 69 63    77         .ascii 'Joystick'
             6B
                                     78 
      000E92 20 B2 B0 20 B5 20 B5    79         .db 0x20,0xb2,0xb0,0x20,0xb5,0x20,0xb5,0x20 ; 20 5 5 
             20
      000E9A B4 B5 B0 B4 B5 B7 B9    80         .db 0xb4,0xb5,0xb0,0xb4,0xb5,0xb7,0xb9,0xb1 ;45045791
             B1
      000EA2 BC 20 B4 B5 B7 B9 B5    81         .db 0xbc,0x20,0xb4,0xb5,0xb7,0xb9,0xb5,0x20 ;< 45795 
             20
      000EAA B4 20 B4 20 B8 20 20    82         .db 0xb4,0x20,0xb4,0x20,0xb8,0x20,0x20,0x20 ;4 4 8   
             20
      000EB2 20 20 20 20 20 20 20    83         .ascii '        '
             20
      000EBA 20 B0 20 20 B5 20 B5    84         .db 0x20,0xb0,0x20,0x20,0xb5,0x20,0xb5,0xb2 ; 0  5 52
             B2
      000EC2 BB B5 20 BB B1 B7 B7    85         .db 0xbb,0xb5,0x20,0xbb,0xb1,0xb7,0xb7,0x20 ;;5 ;177 
             20
      000ECA B4 B2 BB B1 B7 B7 B5    86         .db 0xb4,0xb2,0xbb,0xb1,0xb7,0xb7,0xb5,0xb3 ;42;17753
             B3
      000ED2 B8 B7 B4 20 20 B0       87         .db 0xb8,0xb7,0xb4,0x20,0x20,0xb0
                                     88 
      000ED8 20 20 20 20 20 20 20    89         .ascii '          '
             20 20 20
      000EE2 20 20 20 20 20 20 20    90         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      000F0A 20 20 20 20 20 20 20    91         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      000F32 20 20 20 20 20 43 2D    92         .ascii '     C-1987 SOFTWARE CENTER ILMENAU     '
             31 39 38 37 20 53 4F
             46 54 57 41 52 45 20
             43 45 4E 54 45 52 20
             49 4C 4D 45 4E 41 55
             20 20 20 20 20
      000F5A 20 20 20 20 20 20 20    93         .ascii '          by DIRK STREHLE               '
             20 20 20 62 79 20 44
             49 52 4B 20 53 54 52
             45 48 4C 45 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      000F82 20 20 20 20 20 32 30    94         .ascii '     2017 MOD by Andreas Ziermann       '
             31 37 20 4D 4F 44 20
             62 79 20 41 6E 64 72
             65 61 73 20 5A 69 65
             72 6D 61 6E 6E 20 20
             20 20 20 20 20
                                    802 ;
                                    803 ;
                                    804 ;
                                    805 	.area _DATA 
      000FAA                        806 INTERNAL_ARRAY:
      000FAA                        807         .ds BWS_LINE_WIDTH*MINEFIELD_ARRAY_HEIGHT
      0012F2                        808 LOG_BUFFER:
      0012F2                        809         .ds 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

  0 $correct_ptr                                                   00029D GR
  0 $draw_character                                                000289 GR
  0 $get_character                                                 00027F GR
  0 $put_mine                                                      0003C7 GR
  0 $show_new_line                                                 00027D GR
  0 $sub_line_width_down                                           00012F GR
  0 $sub_line_width_up                                             0000FB GR
    .__.$$$.                                                    =  002710 GL
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 GL
    .__.H$L.                                                    =  000000 GL
    BLINK_COUNTER                                               =  00000A G
    BOS                                                         =  000005 G
    BWS                                                         =  00EC00 G
    BWS_ADR_BONUS_L                                             =  00EDC0 G
    BWS_ADR_BONUS_R                                             =  00EDD7 G
    BWS_ADR_HINT                                                =  00EC17 G
    BWS_ADR_MINES                                               =  00EC06 G
    BWS_ADR_POINTS                                              =  00EC12 G
    BWS_A_JA                                                    =  00EEDE G
    BWS_A_NOCH_EIN                                              =  00EE88 G
    BWS_A_PUNKTE_ER                                             =  00ED6F G
    BWS_A_SIE_HABEN                                             =  00ECD2 G
    BWS_A_TOTAL_POI                                             =  00ED25 G
    BWS_HEIGHT                                                  =  000018 G
    BWS_LINE_WIDTH                                              =  000028 G
    BWS_SIZE                                                    =  0003C0 G
    CHR_BONUS                                                   =  0000CA G
    CHR_FREE                                                    =  000020 G
    CHR_MAN                                                     =  0000C4 G
    CHR_MINE                                                    =  0000C9 G
    CHR_VISITED                                                 =  0000FF G
    CUT_OFF                                                     =  0002A8 G
    END_COLUMN                                                  =  000013 G
    END_ROW                                                     =  000002 G
    END_SCREEN_CORRECTION                                       =  000005 G
  1 INTERNAL_ARRAY                                                 000000 GR
  1 INT_ADR_BONUS_L                                             =  000170 GR
  1 INT_ADR_BONUS_R                                             =  000187 GR
    IS_FREE                                                     =  000000 G
    IS_MINE                                                     =  000064 G
    KEY_DOWN                                                    =  00004F G
    KEY_LEFT                                                    =  000050 G
    KEY_NEXT                                                    =  000001 G
    KEY_QUIT                                                    =  000003 G
    KEY_RIGHT                                                   =  000051 G
    KEY_START                                                   =  000053 G
    KEY_UP                                                      =  000047 G
  1 LOG_BUFFER                                                     000348 GR
  1 LOG_BUFFER_INIT                                             =  000347 GR
    MINEFIELD_ARRAY_HEIGHT                                      =  000015 G
    MINEFIELD_WIDTH                                             =  000026 G
    NO_MINE                                                     =  000000 G
    QUIT_SOUND_P1                                               =  000060 G
    QUIT_SOUND_P2                                               =  0000E0 G
    QUIT_SOUND_P3                                               =  000001 G
    QUIT_SOUND_P4                                               =  0000EE G
    RANDOM_MASK                                                 =  000003 G
    RECORD_DOWN                                                 =  000002 G
    RECORD_END                                                  =  000037 G
    RECORD_LEFT                                                 =  000004 G
    RECORD_RIGHT                                                =  000003 G
    RECORD_UP                                                   =  000001 G
    REC_DELAY_190MS                                             =  003A98 G
    SET_TO_ZERO                                                 =  000000 G
  0 START                                                          00000D GR
    START_COLUMN                                                =  000013 G
    START_ROW                                                   =  000016 G
    UP_CONSI                                                    =  000001 G
    UP_CSTS                                                     =  00000B G
    UP_PRNST                                                    =  000009 G
    VK_CLS                                                      =  00000C G
    VK_DOWN                                                     =  00000A G
    VK_ENTER                                                    =  00000D G
    VK_LEFT                                                     =  000008 G
    VK_RIGHT                                                    =  000009 G
    VK_UP                                                       =  00000B G
    WAIT_130MS                                                  =  002710 G
    WAIT_250MS                                                  =  004E20 G
    WAIT_750MS                                                  =  00EA60 G
    WAVE_LEN_285Hz                                              =  000064 G
    WAVE_PERIODS                                                =  000050 G
  0 _main                                                          000000 GR
  0 add_bonus_down                                                 000137 GR
  0 add_bonus_left                                                 0001D8 GR
  0 add_bonus_right                                                00018A GR
  0 add_bonus_up                                                   0000AA GR
  0 animate$delay_free                                             000254 GR
  0 animate$delay_visited                                          000249 GR
  0 animate_down                                                   0003AB GR
  0 animate_end                                                    000243 GR
  0 animate_left                                                   0003BB GR
  0 animate_recording                                              00037D GR
  0 animate_right                                                  0003B3 GR
  0 animate_up                                                     0003A2 GR
  0 append_key                                                     0002E0 GR
  0 check_for_bonus                                                000333 GR
  0 clear_data                                                     00034F GR
  0 clear_screen                                                   000227 GR
  0 clear_status_line                                              0002D1 GR
  0 click_sound                                                    000489 GR
  0 continue_up                                                    0000B7 GR
  0 convert$hex_to_ascii                                           0002C5 GR
  0 convert$sub_digit                                              0002BE GR
  0 convert_digit_to_ascii                                         0002BD GR
  0 count_mines                                                    0000E4 GR
  0 distribute$is_smaller                                          0003DB GR
  0 distribute$new_number                                          0003C8 GR
  0 distribute_mines                                               0003C3 GR
  0 do_down                                                        000113 GR
  0 do_left                                                        0001B3 GR
  0 do_quit                                                        0003FB GR
  0 do_right                                                       000165 GR
  0 do_skip_level                                                  000201 GR
  0 do_up                                                          000089 GR
  0 go_next                                                        00041E GR
  0 hex2int                                                        0002A3 GR
  0 kill_all_and_halt                                              000461 GR
  0 last_joystick                                                  0008AA GR
    len_vorsicht_minen                                          =  000011 G
  0 line_correction_ptr                                            00029B GR
  0 main_loop                                                      00005C GR
  0 mines_count                                                    0008A4 GR
  0 new_game                                                       000017 GR
    ofs_minen                                                   =  000006 G
    ofs_points                                                  =  000012 G
    ofs_vorsicht                                                =  000017 G
  0 points_count                                                   0008A2 GR
  0 points_plus_25                                                 000369 GR
  0 points_plus_50                                                 00035E GR
  0 print_mines_count                                              0002EC GR
  0 ptr_cursor                                                     00089E GR
  0 ptr_internal_array                                             0008A0 GR
  0 ptr_log_buffer                                                 0008A6 GR
  0 ptr_random_buffer                                              0008A8 GR
  0 quit_sound                                                     000488 GR
  0 rand16                                                         00048A GR
  0 rand16$write_seed                                              00049E GR
  0 recording$delay                                                000381 GR
  0 seed                                                           0004A2 GR
  0 show_empty_field                                               000260 GR
  0 show_mine_field                                                000272 GR
  0 show_points_plus_100                                           000302 GR
  0 show_recording_history                                         000374 GR
  0 show_title                                                     000319 GR
  0 show_win_animation                                             00023D GR
    size_of_noch_ein_spiel                                      =  000010 G
    size_of_punkte_erreich                                      =  000012 G
    size_of_sie_haben                                           =  00000C G
    size_of_vorsicht_minen                                      =  000014 G
  0 start_level                                                    000026 GR
  0 str_exit                                                       00046B GR
  0 str_noch_ein_spiel                                             0008DA GR
  0 str_punkte_erreicht                                            0008C8 GR
  0 str_sie_haben                                                  0008BC GR
  0 str_vorsicht_minen                                             0008AB GR
    ta_alpha                                                    =  000000 G
  0 test_end_down                                                  00013A GR
  0 test_end_left                                                  0001DB GR
  0 test_end_right                                                 00018D GR
  0 test_end_up                                                    0000AD GR
  0 test_inc_mine_count                                            00010D GR
  0 txt_empty_screen                                               0004DE GR
  0 txt_title                                                      0008EA GR
  0 up_inch                                                        0004A4 GR
  0 up_inch$end                                                    0004DD GR
  0 up_inch$fire                                                   0004D7 GR
  0 up_inch$is_down                                                0004BF GR
  0 up_inch$is_left                                                0004C6 GR
  0 up_inch$is_right                                               0004CD GR
  0 up_inch$is_start                                               0004D4 GR
  0 up_inch$is_up                                                  0004B8 GR
  0 up_inch$test_down                                              0004BB GR
  0 up_inch$test_enter                                             0004D0 GR
  0 up_inch$test_left                                              0004C2 GR
  0 up_inch$test_right                                             0004C9 GR
  0 update_screen_down                                             000150 GR
  0 update_screen_left                                             0001EC GR
  0 update_screen_right                                            00019E GR
  0 update_screen_up                                               0000CF GR
  0 wait                                                           0002CB GR
  0 wait_to_start                                                  000010 GR
    z1013                                                       =  000001 G
    z9001                                                       =  000000 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    CAA   flags    0
   1 _DATA                                      size    349   flags    0


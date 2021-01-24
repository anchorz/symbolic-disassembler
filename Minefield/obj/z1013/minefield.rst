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
                           000001     1 z9001                           =       1
                           000000     2 z1013                           =       0
                           000000     3 ta_alpha                        =       0
                                      4 ;
                                      5 ; z1013 os specific constants
                                      6 ;
                           00EC00     7 BWS                             =       0xec00
                           000020     8 BWS_LINE_WIDTH                  =       32
                           000020     9 BWS_HEIGHT                      =       32
                           000400    10 BWS_SIZE                        =       32*32
                                     11 
                           00000C    12 VK_CLS                          =       0x0c
                           00000D    13 VK_ENTER                        =       0x0d
                           000008    14 VK_LEFT                         =       0x08
                           000009    15 VK_RIGHT                        =       0x09
                           00000B    16 VK_UP                           =       0x0b
                           00000A    17 VK_DOWN                         =       0x0a
                                     18 
                           000004    19 KEY_CODE                        =       0x0004
                                     20 
                           000002    21 UP_PRST7               .equ 0x02
                           000004    22 UP_INKEY               .equ 0x04
                                     23 
                           000080    24 TAPE_OUT               .equ 0x80
                           000002    25 PIOB_DATA              .equ 0x02
                                     26 ;
                                     27 ; application specific constants
                                     28 ;
                           000017    29 CHR_MAN                         =       0x17
                           0000FF    30 CHR_VISITED                     =       0xff
                           000020    31 CHR_FREE                        =       ' '
                           0000CA    32 CHR_BONUS                       =       0xca
                           0000C9    33 CHR_MINE                        =       0xc9
                           000005    34 END_ROW                         =       5
                           000009    35 END_SCREEN_CORRECTION           =       9 ; starting line of the text
                           00001E    36 START_ROW                       =       BWS_HEIGHT-2
                           00000F    37 START_COLUMN                    =       (BWS_LINE_WIDTH/2)-1
                           00000F    38 END_COLUMN                      =       (BWS_LINE_WIDTH/2)-1
                           0002A0    39 CUT_OFF                         =       (START_ROW-END_ROW-4)*BWS_LINE_WIDTH
                                     40 
                                     41 .macro  FILL_SPACES
                                     42 .endm
                                     43 
                                     44 .macro  PROGRAM_HEADER
                                     45 .endm
                                     46 
                                     47 .macro  JOYSTICK_INIT
                                     48         call joystick_init
                                     49 .endm
                                     50 
                                     51 .macro  FILL_BACKGROUND_COLOR
                                     52 .endm
                                     53 
                                     54 .macro  END_MESSAGE
                                     55         rst 0x20
                                     56         .db UP_PRST7
                                     57         .ascis 'Auf Wiedersehen! Und weg... '
                                     58         rst 0x38
                                     59 .endm
                                     60 
                                     61 .macro  QUIT_SOUND
                                     62         ld l,#QUIT_SOUND_P1
                                     63         ld d,#QUIT_SOUND_P2
                                     64         ld e,#QUIT_SOUND_P3
                                     65 quit$play_effect1:
                                     66         ld c,e
                                     67 quit$play_period1:
                                     68         xor #TAPE_OUT
                                     69         out (PIOB_DATA),a
                                     70         ld b,d
                                     71         nop
                                     72         cp #QUIT_SOUND_P4
                                     73         add b
                                     74         out (PIOB_DATA),a
                                     75         ld b,d
                                     76 quit$play_half_wave1:
                                     77         djnz quit$play_half_wave1
                                     78         dec c
                                     79         jr nz,quit$play_period1
                                     80         dec d
                                     81         inc e
                                     82         dec l
                                     83         jr nz,quit$play_effect1
                                     84         ld l,#QUIT_SOUND_P1
                                     85 quit$play_effect2:
                                     86         ld c,e
                                     87 quit$play_period2:
                                     88         xor #TAPE_OUT
                                     89         out (PIOB_DATA),a
                                     90         ld b,d
                                     91         nop
                                     92         cp #QUIT_SOUND_P4
                                     93         add b
                                     94         out (PIOB_DATA),a
                                     95         ld b,d
                                     96 quit$play_half_wave2:
                                     97         djnz quit$play_half_wave2
                                     98         dec c
                                     99         jr nz,quit$play_period2
                                    100         inc d
                                    101         dec e
                                    102         dec l
                                    103         jr nz,quit$play_effect2
                                    104 .endm
                                    105 
                                    106 .macro  CLICK_SOUND
                                    107         push af
                                    108         ld b,#WAVE_PERIODS
                                    109         xor a
                                    110 $click_next_period:
                                    111         ld c,#WAVE_LEN_285Hz; 1-half wave has 3500 clock cycles
                                    112 $click_keep_level:
                                    113         out (PIOB_DATA),a
                                    114         nop
                                    115         nop
                                    116         dec c
                                    117         jr nz,$click_keep_level
                                    118         xor #TAPE_OUT
                                    119         djnz $click_next_period
                                    120         pop af
                                    121 .endm
                                    122 
                                    123 .macro  INKEY
                                    124         xor     a
                                    125         ld      (KEY_CODE),a
                                    126         rst     0x20
                                    127         .db     UP_INKEY
                                    128         or      a
                                    129         jr      z,up_inch$joystick
                                    130 .endm
                                    131 
                                    132 .macro  JOYSTICK
                                    133 up_inch$joystick:
                                    134         in a,(0x00)
                                    135         and #0x1f
                                    136         ld c,a
                                    137         ld b,#0x80
                                    138 up_inch$debounce1:
                                    139         djnz up_inch$debounce1
                                    140         in a,(0x00)
                                    141         and #0x1f;
                                    142         cp c
                                    143         jr nz,up_inch$joystick
                                    144 joystick:
                                    145         ld a,(last_joystick)
                                    146         cp c
                                    147         jr z,up_inch
                                    148         ld a,c
                                    149         ld (last_joystick),a
                                    150         cp #0x1e; left
                                    151         jr z,up_inch$is_left
                                    152         cp #0x1d; right
                                    153         jr z,up_inch$is_right
                                    154         cp #0x1b; right
                                    155         jr z,up_inch$is_down
                                    156         cp #0x17; up
                                    157         jr z,up_inch$is_up
                                    158         and #0x10
                                    159         ret nz
                                    160         ld a,#'S'
                                    161         ret
                                    162 joystick_init:
                                    163         ld a,#0xcf; bitwise input
                                    164         out (0x01),a
                                    165         ld a,#0x1f;
                                    166         out (0x01),a
                                    167         xor a
                                    168         ld (last_joystick),a
                                    169         ld a,#0x60 ; both enabled
                                    170         out (0x00),a
                                    171         ret
                                    172 .endm
                                    173 
                                    174 .macro  TXT_MINES
                                    175         .ascii '                                '
                                    176         FILL_SPACES
                                    177         .ascii '   '
                                    178         .ascii 'MINEN:'
                                    179 .endm
                                    180 
                                    181 .macro  TXT_PUNKTE
                                    182         .ascii '    '
                                    183         .ascii '     PUNKTE:'
                                    184 .endm
                                    185 
                                    186 .macro  TXT_EMPTY_SCREEN
                                    187         .ascii '       '
                                    188         .db 0xa8
                                    189         .rept (BWS_LINE_WIDTH-2)
                                    190         .db 0xa0
                                    191         .endm
                                    192         .db 0xa9
                                    193         
                                    194         .db 0xa1
                                    195 ofs_vorsicht   .equ .-txt_empty_screen+6; 5 is intentionally move right
                                    196         .rept (BWS_LINE_WIDTH-2)
                                    197         .db ' '
                                    198         .endm
                                    199         .db 0xa1
                                    200         
                                    201         .db 0xa3
                                    202         .rept (BWS_LINE_WIDTH/2-3)
                                    203         .db 0xa0
                                    204         .endm
                                    205         .db 0xa4,0xa0,0xa4
                                    206         .rept (BWS_LINE_WIDTH/2-2)
                                    207         .db 0xa0
                                    208         .endm
                                    209         .db 0xa5
                                    210         
                                    211          .db 0xa3
                                    212         .rept (BWS_LINE_WIDTH/2-3)
                                    213         .db 0xa0
                                    214         .endm
                                    215         .db 0xaa,0x20,0xa7
                                    216         .rept (BWS_LINE_WIDTH/2-2)
                                    217         .db 0xa0
                                    218         .endm
                                    219         .db 0xa5
                                    220 
                                    221         ;;22 times
                                    222         .rept (BWS_HEIGHT-9)
                                    223                 .db 0xa1
                                    224                 .rept (BWS_LINE_WIDTH-2)
                                    225                 .db ' '
                                    226                 .endm
                                    227                 .db 0xa1
                                    228         .endm
                                    229 
                                    230         .db 0xa3
                                    231         .rept (BWS_LINE_WIDTH/2-3)
                                    232         .db 0xa0
                                    233         .endm
                                    234         .db 0xa9,0x20,0xa8
                                    235         .rept (BWS_LINE_WIDTH/2-2)
                                    236         .db 0xa0
                                    237         .endm
                                    238         .db 0xa5
                                    239 
                                    240         .db 0xa1
                                    241         .ascii '     SCI     '
                                    242         .db 0xa1,0x20,0xa1
                                    243         .ascii '    GAMES     '
                                    244         .db 0xa1
                                    245 
                                    246         .db 0xa7
                                    247         .rept (BWS_LINE_WIDTH/2-3)
                                    248         .db 0xa0
                                    249         .endm
                                    250         .db 0xa2,0xa0,0xa2
                                    251         .rept (BWS_LINE_WIDTH/2-2)
                                    252         .db 0xa0
                                    253         .endm
                                    254         .db 0xaa
                                    255 .endm
                                    256 
                           000000   257 DEBUG=0
                                    258 
                                    259 .macro TITLE_IMG_CONTENT
                                    260         .ascii '\256\236\236\236\236\236\236\236\236\236\255           \212   \212\212  \212 '
                                    261         .ascii '\237\271\266\263\262\266\270 \275\260\300          \212 \212\222\223\236\236\226\225\212\212'
                                    262         .db 0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
                                    263         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
                                    264         .db 0x20,0x20,0x20,0x20,0x20,0x8a,0x20,0x99 ;     . .
                                    265         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x9b,0x20 ;      . 
                                    266         .db 0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
                                    267         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
                                    268         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x98 ;       .
                                    269         .db 0x20,0xc9,0x20,0x20,0xc9,0x20,0x9c,0x20 ; I  I . 
                                    270         .db 0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
                                    271         .db 0xb6,0xb0,0xc0,0x20,0x92,0x93,0x9e,0x9e ;60@ ....
                                    272         .db 0x96,0x95,0x20,0x20,0x20,0x20,0x20,0x9f ;..     .
                                    273         .db 0x20,0x20,0x86,0x87,0x20,0x20,0xc0,0x20 ;  ..  @ 
                                    274         .db 0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
                                    275         .db 0x73,0x3a,0xc0,0x99,0x20,0x20,0x20,0x20 ;s:@.    
                                    276         .db 0x20,0x20,0x9b,0x20,0x20,0x20,0x20,0x9b ;  .    .
                                    277         .db 0x20,0x20,0x85,0x84,0x20,0x20,0x99,0x20 ;  ..  . 
                                    278         .db 0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
                                    279         .db 0xf8,0xf8,0xac,0x98,0x20,0xc9,0x20,0x20 ;xx,. I  
                                    280         .db 0xc9,0x20,0x9c,0x20,0x20,0x20,0x20,0x9c ;I .    .
                                    281         .db 0x20,0x86,0x92,0x95,0x87,0x20,0x98,0x20 ; .... . 
                                    282         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    283         .db 0x20,0x20,0x20,0x9f,0x20,0x20,0x86,0x87 ;   .  ..
                                    284         .db 0x20,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;  @     
                                    285         .db 0x96,0x95,0xf8,0xf8,0x92,0x93,0x20,0x20 ;..xx..  
                                    286         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    287         .db 0x20,0x20,0x20,0x9b,0x20,0x20,0x85,0x84 ;   .  ..
                                    288         .db 0x20,0x20,0x99,0x20,0x20,0x20,0x20,0x20 ;  .     
                                    289         .db 0x20,0x20,0x9f,0xc0,0x20,0x20,0x20,0x20 ;  .@    
                                    290         .db 0x20,0x4e,0x6f,0x77,0x20,0x79,0x6f,0x75 ; Now you
                                    291         .db 0x20,0x20,0x20,0x9c,0x20,0x85,0x95,0x92 ;   . ...
                                    292         .db 0x84,0x20,0x98,0x20,0x20,0x20,0x20,0x20 ;. .     
                                    293         .db 0x20,0xdf,0x9f,0xc0,0xdc,0x20,0x20,0x20 ; _.@\   
                                    294         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    295         .db 0x20,0x20,0x20,0x20,0x96,0x95,0xf8,0xf8 ;    ..xx
                                    296         .db 0x92,0x93,0x20,0x20,0x20,0x20,0x20,0x20 ;..      
                                    297         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    298         .db 0x20,0x61,0x72,0x65,0x20,0x68,0x61,0x70 ; are hap
                                    299         .db 0x70,0x79,0x20,0xdb,0xf8,0x90,0x20,0x20 ;py [x.  
                                    300         .db 0x9e,0x96,0xd8,0x20,0x20,0x20,0x62,0x75 ;..X   bu
                                    301         .db 0x74,0x20,0x62,0x65,0x20,0x20,0x20,0x20 ;t be    
                                    302         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    303         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
                                    304         .db 0x20,0xb7,0xff,0xff,0xb7,0x20,0x20,0x63 ; 7..7  c
                                    305         .db 0x61,0x72,0x65,0x66,0x75,0x6c,0x6c,0x21 ;arefull!
                                    306         .ascii '                                '
                                    307         .ascii '                                '
                                    308         .db 0x20,0x20,0x20,0x20,0xb2,0x20,0xb2,0x20 ;    2 2 
                                    309         .db 0xb3,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;3       
                                    310         .db 0xb2,0xb3,0xb3,0x20,0x20,0x20,0xb2,0x20 ;233   2 
                                    311         .db 0x20,0x20,0xb3,0x20,0x20,0x20,0x20,0x20 ;  3     
                                    312         .db 0x20,0xb8,0x20,0x20,0xb5,0xb8,0xbd,0x20 ; 8  58= 
                                    313         .db 0xb3,0xb2,0xb2,0x20,0x20,0xb7,0xb3,0x20 ;322  73 
                                    314         .db 0xb4,0x20,0xb3,0x20,0xb7,0xb3,0xb5,0x20 ;4 3 735 
                                    315         .db 0xb2,0xb7,0xb4,0x20,0xb2,0xb0,0x20,0x20 ;274 20  
                                    316         .db 0x20,0xb2,0xb0,0x20,0xb5,0x20,0xb5,0x20 ; 20 5 5 
                                    317         .db 0xb4,0xb5,0xb0,0xb4,0xb5,0xb7,0xb9,0xb1 ;45045791
                                    318         .db 0xbc,0x20,0xb4,0xb5,0xb7,0xb9,0xb5,0x20 ;< 45795 
                                    319         .db 0xb4,0x20,0xb4,0x20,0xb8,0x20,0x20,0x20 ;4 4 8   
                                    320         .db 0x20,0xb0,0x20,0x20,0xb5,0x20,0xb5,0xb2 ; 0  5 52
                                    321         .db 0xbb,0xb5,0x20,0xbb,0xb1,0xb7,0xb7,0x20 ;;5 ;177 
                                    322         .db 0xb4,0xb2,0xbb,0xb1,0xb7,0xb7,0xb5,0xb3 ;42;17753
                                    323         .db 0xb8,0xb7,0xb4,0x20,0x20,0xb0,0x20,0x20 ;874  0  
                                    324         .ascii '                                '
                                    325         .ascii '  fuer Brosig, A2 und Joystick  '
                                    326         .ascii '                         PA01/88'
                                    327         .ascii '        S   - START             '
                                    328         .ascii '        G \235 - AUFWAERTS         '
                                    329         .ascii '        O \232 - ABWAERTS          '
                                    330         .ascii '        P \224 - LINKS             '
                                    331         .ascii '        Q \227 - RECHTS            '
                                    332         .ascii '                                '
                                    333         .ascii '                                '
                                    334         .ascii ' C-1987 SOFTWARE CENTER ILMENAU '
                                    335         .ascii '      by DIRK STREHLE           '
                                    336         .ascii ' 2017 MOD by Andreas Ziermann    '
                                    337 .endm
                                     11         
                                     12         .globl  _main
                                     13 
                           00033F    14 LOG_BUFFER_INIT        .equ (LOG_BUFFER-1)
                                     15 
                           00EC29    16 BWS_ADR_MINES          .equ BWS+ofs_minen
                           00EC39    17 BWS_ADR_POINTS         .equ BWS+ofs_points
                           00EC67    18 BWS_ADR_HINT           .equ BWS+ofs_vorsicht
                                     19 
                           00ED2A    20 BWS_A_SIE_HABEN        .equ BWS+(END_SCREEN_CORRECTION*BWS_LINE_WIDTH+10)
                           00ED6D    21 BWS_A_TOTAL_POI        .equ BWS+((END_SCREEN_CORRECTION+2)*BWS_LINE_WIDTH+13)
                           00EDA7    22 BWS_A_PUNKTE_ER        .equ BWS+((END_SCREEN_CORRECTION+4)*BWS_LINE_WIDTH+7)
                           00EE88    23 BWS_A_NOCH_EIN         .equ BWS+((END_SCREEN_CORRECTION+11)*BWS_LINE_WIDTH+8)
                           00EECE    24 BWS_A_JA               .equ BWS+((END_SCREEN_CORRECTION+13)*BWS_LINE_WIDTH+14)
                                     25 
                           00EE06    26 BWS_ADR_BONUS_L        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
                           00EE19    27 BWS_ADR_BONUS_R        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)
                           000166    28 INT_ADR_BONUS_L        .equ INTERNAL_ARRAY+((START_ROW-END_ROW)/2-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
                           000179    29 INT_ADR_BONUS_R        .equ INTERNAL_ARRAY+((START_ROW-END_ROW)/2-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)
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
                           00001E    59 MINEFIELD_WIDTH        .equ BWS_LINE_WIDTH-2
                           00001A    60 MINEFIELD_ARRAY_HEIGHT .equ (START_ROW-END_ROW+1)
                           000014    61 size_of_vorsicht_minen .equ 20
                           00000C    62 size_of_sie_haben      .equ 12
                           000012    63 size_of_punkte_erreich .equ 18
                           000010    64 size_of_noch_ein_spiel .equ 16
                                     65 
                                     66         .area  _CODE
      000100                         67 _main:
      000000                         68         PROGRAM_HEADER
      000000                         69         JOYSTICK_INIT
      000100 CD 32 06         [17]    1         call joystick_init
      000103 CD 0F 04         [17]   70         call show_title
      000106                         71 wait_to_start:
      000106 CD CC 05         [17]   72         call up_inch
      000109 FE 53            [ 7]   73         cp #KEY_START
      00010B 20 F9            [12]   74         jr nz,wait_to_start
      00010D                         75 new_game:
      00010D CD 37 04         [17]   76         call clear_data
      000110 21 00 00         [10]   77         ld hl,#SET_TO_ZERO
      000113 22 47 0A         [16]   78         ld (points_count),hl
      000116 21 32 00         [10]   79         ld hl,#50
      000119 22 49 0A         [16]   80         ld (mines_count),hl
      00011C                         81 start_level:
      00011C 21 CF EF         [10]   82         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      00011F 22 43 0A         [16]   83         ld (ptr_cursor),hl
      000122 21 BF 11         [10]   84         ld hl,#INTERNAL_ARRAY+(START_ROW-END_ROW)*BWS_LINE_WIDTH+START_COLUMN
      000125 22 45 0A         [16]   85         ld (ptr_internal_array),hl
      000128 21 CF 11         [10]   86         ld hl,#LOG_BUFFER_INIT
      00012B 22 4B 0A         [16]   87         ld (ptr_log_buffer),hl
      00012E CD 1D 03         [17]   88         call clear_screen
      000131 CD 56 03         [17]   89         call show_empty_field
      000134 21 CF EF         [10]   90         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      000137 3E 17            [ 7]   91         ld a,#CHR_MAN
      000139 77               [ 7]   92         ld (hl),a
      00013A 2A 47 0A         [16]   93         ld hl,(points_count)
      00013D 11 39 EC         [10]   94         ld de,#BWS_ADR_POINTS
      000140 CD 99 03         [17]   95         call hex2int
      000143 2A 49 0A         [16]   96         ld hl,(mines_count)
      000146 11 29 EC         [10]   97         ld de,#BWS_ADR_MINES
      000149 CD 99 03         [17]   98         call hex2int
      00014C CD 1B 04         [17]   99         call check_for_bonus
      00014F CD AB 04         [17]  100         call distribute_mines
      000152                        101 main_loop:
      000152 CD CC 05         [17]  102         call up_inch
      000155 FE 47            [ 7]  103         cp #KEY_UP
      000157 CC 7F 01         [17]  104         call z,do_up
      00015A FE 4F            [ 7]  105         cp #KEY_DOWN
      00015C CC 09 02         [17]  106         call z,do_down
      00015F FE 51            [ 7]  107         cp #KEY_RIGHT
      000161 CC 5B 02         [17]  108         call z,do_right
      000164 FE 50            [ 7]  109         cp #KEY_LEFT
      000166 CC A9 02         [17]  110         call z,do_left
      000169 CD 9F 05         [17]  111         call click_sound
      00016C FE 03            [ 7]  112         cp #KEY_QUIT
      00016E CA E3 04         [10]  113         jp z,do_quit
      000171 FE 01            [ 7]  114         cp #KEY_NEXT
      000173 CA F7 02         [10]  115         jp z,do_skip_level
      000176 01 20 4E         [10]  116         ld bc,#WAIT_250MS
      000179 CD C1 03         [17]  117         call wait
      00017C C3 52 01         [10]  118         jp main_loop
      00017F                        119 do_up:
      00017F CD C7 03         [17]  120         call clear_status_line
      000182 2A 43 0A         [16]  121         ld hl,(ptr_cursor)
      000185 3E FF            [ 7]  122         ld a,#CHR_VISITED
      000187 77               [ 7]  123         ld (hl),a
      000188 01 20 00         [10]  124         ld bc,#BWS_LINE_WIDTH
      00018B ED 42            [15]  125         sbc hl,bc
      00018D 7E               [ 7]  126         ld a,(hl)
      00018E FE 20            [ 7]  127         cp #CHR_FREE
      000190 28 11            [12]  128         jr z,test_end_up
      000192 FE FF            [ 7]  129         cp #CHR_VISITED
      000194 28 0D            [12]  130         jr z,test_end_up
      000196 FE CA            [ 7]  131         cp #CHR_BONUS
      000198 28 06            [12]  132         jr z,add_bonus_up
      00019A 09               [11]  133         add hl,bc
      00019B 3E 17            [ 7]  134         ld a,#CHR_MAN
      00019D 77               [ 7]  135         ld (hl),a
      00019E AF               [ 4]  136         xor a
      00019F C9               [10]  137         ret
      0001A0                        138 add_bonus_up:
      0001A0 CD F8 03         [17]  139         call show_points_plus_100
      0001A3                        140 test_end_up:
      0001A3 01 AF EC         [10]  141         ld bc,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
      0001A6 ED 42            [15]  142         sbc hl,bc
      0001A8 20 03            [12]  143         jr nz,continue_up
      0001AA 3E 01            [ 7]  144         ld a,#KEY_NEXT
      0001AC C9               [10]  145         ret
      0001AD                        146 continue_up:
      0001AD 09               [11]  147         add hl,bc
      0001AE 01 20 00         [10]  148         ld bc,#BWS_LINE_WIDTH
      0001B1 ED 5B 45 0A      [20]  149         ld de,(ptr_internal_array)
      0001B5 EB               [ 4]  150         ex de,hl
      0001B6 ED 42            [15]  151         sbc hl,bc
      0001B8 EB               [ 4]  152         ex de,hl
      0001B9 ED 53 45 0A      [20]  153         ld (ptr_internal_array),de
      0001BD 1A               [ 7]  154         ld a,(de)
      0001BE FE 64            [ 7]  155         cp #IS_MINE
      0001C0 20 03            [12]  156         jr nz,update_screen_up
      0001C2 3E 03            [ 7]  157         ld a,#KEY_QUIT
      0001C4 C9               [10]  158         ret
      0001C5                        159 update_screen_up:
      0001C5 CD DA 01         [17]  160         call count_mines
      0001C8 FE 00            [ 7]  161         cp #NO_MINE
      0001CA C4 E2 03         [17]  162         call nz,print_mines_count
      0001CD 3E 01            [ 7]  163         ld a,#RECORD_UP
      0001CF CD D6 03         [17]  164         call append_key
      0001D2 22 43 0A         [16]  165         ld (ptr_cursor),hl
      0001D5 3E 17            [ 7]  166         ld a,#CHR_MAN
      0001D7 77               [ 7]  167         ld (hl),a
      0001D8 AF               [ 4]  168         xor a
      0001D9 C9               [10]  169         ret
      0001DA                        170 count_mines:
      0001DA EB               [ 4]  171         ex de,hl
      0001DB D5               [11]  172         push de
      0001DC 16 00            [ 7]  173         ld d,#SET_TO_ZERO
      0001DE 01 20 00         [10]  174         ld bc,#BWS_LINE_WIDTH
      0001E1 09               [11]  175         add hl,bc
      0001E2 CD 03 02         [17]  176         call test_inc_mine_count
      0001E5 2A 45 0A         [16]  177         ld hl,(ptr_internal_array)
      0001E8 2B               [ 6]  178         dec hl
      0001E9 CD 03 02         [17]  179         call test_inc_mine_count
      0001EC 2A 45 0A         [16]  180         ld hl,(ptr_internal_array)
      0001EF 06 20            [ 7]  181         ld b,#BWS_LINE_WIDTH
      0001F1                        182 $sub_line_width_up:
      0001F1 2B               [ 6]  183         dec hl
      0001F2 10 FD            [13]  184         djnz $sub_line_width_up
      0001F4 CD 03 02         [17]  185         call test_inc_mine_count
      0001F7 2A 45 0A         [16]  186         ld hl,(ptr_internal_array)
      0001FA 23               [ 6]  187         inc hl
      0001FB CD 03 02         [17]  188         call test_inc_mine_count
      0001FE 2B               [ 6]  189         dec hl
      0001FF 7A               [ 4]  190         ld a,d
      000200 D1               [10]  191         pop de
      000201 EB               [ 4]  192         ex de,hl
      000202 C9               [10]  193         ret
      000203                        194 test_inc_mine_count:
      000203 7E               [ 7]  195         ld a,(hl)
      000204 FE 64            [ 7]  196         cp #IS_MINE
      000206 C0               [11]  197         ret nz
      000207 14               [ 4]  198         inc d
      000208 C9               [10]  199         ret
      000209                        200 do_down:
      000209 CD C7 03         [17]  201         call clear_status_line
      00020C 2A 43 0A         [16]  202         ld hl,(ptr_cursor)
      00020F 3E FF            [ 7]  203         ld a,#CHR_VISITED
      000211 77               [ 7]  204         ld (hl),a
      000212 01 20 00         [10]  205         ld bc,#BWS_LINE_WIDTH
      000215 09               [11]  206         add hl,bc
      000216 7E               [ 7]  207         ld a,(hl)
      000217 FE 20            [ 7]  208         cp #CHR_FREE
      000219 28 15            [12]  209         jr z,test_end_down
      00021B FE FF            [ 7]  210         cp #CHR_VISITED
      00021D 28 11            [12]  211         jr z,test_end_down
      00021F FE CA            [ 7]  212         cp #CHR_BONUS
      000221 28 0A            [12]  213         jr z,add_bonus_down
      000223 06 20            [ 7]  214         ld b,#BWS_LINE_WIDTH
      000225                        215 $sub_line_width_down:
      000225 2B               [ 6]  216         dec hl
      000226 10 FD            [13]  217         djnz $sub_line_width_down
      000228 3E 17            [ 7]  218         ld a,#CHR_MAN
      00022A 77               [ 7]  219         ld (hl),a
      00022B AF               [ 4]  220         xor a
      00022C C9               [10]  221         ret
      00022D                        222 add_bonus_down:
      00022D CD F8 03         [17]  223         call show_points_plus_100
      000230                        224 test_end_down:
      000230 ED 5B 45 0A      [20]  225         ld de,(ptr_internal_array)
      000234 01 20 00         [10]  226         ld bc,#BWS_LINE_WIDTH
      000237 EB               [ 4]  227         ex de,hl
      000238 09               [11]  228         add hl,bc
      000239 EB               [ 4]  229         ex de,hl
      00023A ED 53 45 0A      [20]  230         ld (ptr_internal_array),de
      00023E 1A               [ 7]  231         ld a,(de)
      00023F FE 64            [ 7]  232         cp #IS_MINE
      000241 20 03            [12]  233         jr nz,update_screen_down
      000243 3E 03            [ 7]  234         ld a,#KEY_QUIT
      000245 C9               [10]  235         ret
      000246                        236 update_screen_down:
      000246 CD DA 01         [17]  237         call count_mines
      000249 FE 00            [ 7]  238         cp #NO_MINE
      00024B C4 E2 03         [17]  239         call nz,print_mines_count
      00024E 3E 02            [ 7]  240         ld a,#RECORD_DOWN
      000250 CD D6 03         [17]  241         call append_key
      000253 22 43 0A         [16]  242         ld (ptr_cursor),hl
      000256 3E 17            [ 7]  243         ld a,#CHR_MAN
      000258 77               [ 7]  244         ld (hl),a
      000259 AF               [ 4]  245         xor a
      00025A C9               [10]  246         ret
      00025B                        247 do_right:
      00025B CD C7 03         [17]  248         call clear_status_line
      00025E 2A 43 0A         [16]  249         ld hl,(ptr_cursor)
      000261 3E FF            [ 7]  250         ld a,#CHR_VISITED
      000263 77               [ 7]  251         ld (hl),a
      000264 23               [ 6]  252         inc hl
      000265 7E               [ 7]  253         ld a,(hl)
      000266 FE 20            [ 7]  254         cp #CHR_FREE
      000268 28 19            [12]  255         jr z,test_end_right
      00026A FE FF            [ 7]  256         cp #CHR_VISITED
      00026C 28 15            [12]  257         jr z,test_end_right
      00026E FE CA            [ 7]  258         cp #CHR_BONUS
      000270 28 0E            [12]  259         jr z,add_bonus_right
      000272 2B               [ 6]  260         dec hl
      000273 3E 17            [ 7]  261         ld a,#CHR_MAN
      000275 77               [ 7]  262         ld (hl),a
      000276 CD DA 01         [17]  263         call count_mines
      000279 FE 00            [ 7]  264         cp #NO_MINE
      00027B C4 E2 03         [17]  265         call nz,print_mines_count
      00027E AF               [ 4]  266         xor a
      00027F C9               [10]  267         ret
      000280                        268 add_bonus_right:
      000280 CD F8 03         [17]  269         call show_points_plus_100
      000283                        270 test_end_right:
      000283 ED 5B 45 0A      [20]  271         ld de,(ptr_internal_array)
      000287 13               [ 6]  272         inc de
      000288 ED 53 45 0A      [20]  273         ld (ptr_internal_array),de
      00028C 1A               [ 7]  274         ld a,(de)
      00028D FE 64            [ 7]  275         cp #IS_MINE
      00028F 20 03            [12]  276         jr nz,update_screen_right
      000291 3E 03            [ 7]  277         ld a,#KEY_QUIT
      000293 C9               [10]  278         ret
      000294                        279 update_screen_right:
      000294 CD DA 01         [17]  280         call count_mines
      000297 FE 00            [ 7]  281         cp #NO_MINE
      000299 C4 E2 03         [17]  282         call nz,print_mines_count
      00029C 3E 03            [ 7]  283         ld a,#RECORD_RIGHT
      00029E CD D6 03         [17]  284         call append_key
      0002A1 22 43 0A         [16]  285         ld (ptr_cursor),hl
      0002A4 3E 17            [ 7]  286         ld a,#CHR_MAN
      0002A6 77               [ 7]  287         ld (hl),a
      0002A7 AF               [ 4]  288         xor a
      0002A8 C9               [10]  289         ret
      0002A9                        290 do_left:
      0002A9 CD C7 03         [17]  291         call clear_status_line
      0002AC 2A 43 0A         [16]  292         ld hl,(ptr_cursor)
      0002AF 3E FF            [ 7]  293         ld a,#CHR_VISITED
      0002B1 77               [ 7]  294         ld (hl),a
      0002B2 2B               [ 6]  295         dec hl
      0002B3 7E               [ 7]  296         ld a,(hl)
      0002B4 FE 20            [ 7]  297         cp #CHR_FREE
      0002B6 28 19            [12]  298         jr z,test_end_left
      0002B8 FE FF            [ 7]  299         cp #CHR_VISITED
      0002BA 28 15            [12]  300         jr z,test_end_left
      0002BC FE CA            [ 7]  301         cp #CHR_BONUS
      0002BE 28 0E            [12]  302         jr z,add_bonus_left
      0002C0 23               [ 6]  303         inc hl
      0002C1 3E 17            [ 7]  304         ld a,#CHR_MAN
      0002C3 77               [ 7]  305         ld (hl),a
      0002C4 CD DA 01         [17]  306         call count_mines
      0002C7 FE 00            [ 7]  307         cp #NO_MINE
      0002C9 C4 E2 03         [17]  308         call nz,print_mines_count
      0002CC AF               [ 4]  309         xor a
      0002CD C9               [10]  310         ret
      0002CE                        311 add_bonus_left:
      0002CE CD F8 03         [17]  312         call show_points_plus_100
      0002D1                        313 test_end_left:
      0002D1 ED 5B 45 0A      [20]  314         ld de,(ptr_internal_array)
      0002D5 1B               [ 6]  315         dec de
      0002D6 ED 53 45 0A      [20]  316         ld (ptr_internal_array),de
      0002DA 1A               [ 7]  317         ld a,(de)
      0002DB FE 64            [ 7]  318         cp #IS_MINE
      0002DD 20 03            [12]  319         jr nz,update_screen_left
      0002DF 3E 03            [ 7]  320         ld a,#KEY_QUIT
      0002E1 C9               [10]  321         ret
      0002E2                        322 update_screen_left:
      0002E2 CD DA 01         [17]  323         call count_mines
      0002E5 FE 00            [ 7]  324         cp #NO_MINE
      0002E7 C4 E2 03         [17]  325         call nz,print_mines_count
      0002EA 3E 04            [ 7]  326         ld a,#RECORD_LEFT
      0002EC CD D6 03         [17]  327         call append_key
      0002EF 22 43 0A         [16]  328         ld (ptr_cursor),hl
      0002F2 3E 17            [ 7]  329         ld a,#CHR_MAN
      0002F4 77               [ 7]  330         ld (hl),a
      0002F5 AF               [ 4]  331         xor a
      0002F6 C9               [10]  332         ret
      0002F7                        333 do_skip_level:
      0002F7 3E 37            [ 7]  334         ld a,#RECORD_END
      0002F9 CD D6 03         [17]  335         call append_key
      0002FC CD 1D 03         [17]  336         call clear_screen
      0002FF CD 56 03         [17]  337         call show_empty_field
      000302 CD 68 03         [17]  338         call show_mine_field
      000305 CD 5C 04         [17]  339         call show_recording_history
      000308 21 AF EC         [10]  340         ld hl,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
      00030B CD 33 03         [17]  341         call show_win_animation
      00030E CD 37 04         [17]  342         call clear_data
      000311 CD 1D 03         [17]  343         call clear_screen
      000314 CD 46 04         [17]  344         call points_plus_50
      000317 CD 51 04         [17]  345         call points_plus_25
      00031A C3 1C 01         [10]  346         jp start_level
      00031D                        347 clear_screen:
      00031D E5               [11]  348         push hl
      00031E D5               [11]  349         push de
      00031F C5               [11]  350         push bc
      000320 3E 20            [ 7]  351         ld a,#' '
      000322 21 00 EC         [10]  352         ld hl,#BWS
      000325 77               [ 7]  353         ld (hl),a
      000326 11 01 EC         [10]  354         ld de,#BWS+1
      000329 01 FF 03         [10]  355         ld bc,#BWS_SIZE-1
      00032C ED B0            [21]  356         ldir
      00032E AF               [ 4]  357         xor a
      00032F C1               [10]  358         pop bc
      000330 D1               [10]  359         pop de
      000331 E1               [10]  360         pop hl
      000332 C9               [10]  361         ret
      000333                        362 show_win_animation:
      000333 D5               [11]  363         push de
      000334 C5               [11]  364         push bc
      000335 7E               [ 7]  365         ld a,(hl)
      000336 4F               [ 4]  366         ld c,a
      000337 06 0A            [ 7]  367         ld b,#BLINK_COUNTER
      000339                        368 animate_end:
      000339 3E FF            [ 7]  369         ld a,#CHR_VISITED
      00033B 77               [ 7]  370         ld (hl),a
      00033C 11 20 4E         [10]  371         ld de,#WAIT_250MS
      00033F                        372 animate$delay_visited:
      00033F 1B               [ 6]  373         dec de
      000340 AF               [ 4]  374         xor a
      000341 BA               [ 4]  375         cp d
      000342 20 FB            [12]  376         jr nz,animate$delay_visited
      000344 3E 20            [ 7]  377         ld a,#CHR_FREE
      000346 77               [ 7]  378         ld (hl),a
      000347 11 20 4E         [10]  379         ld de,#WAIT_250MS
      00034A                        380 animate$delay_free:
      00034A 1B               [ 6]  381         dec de
      00034B AF               [ 4]  382         xor a
      00034C BA               [ 4]  383         cp d
      00034D 20 FB            [12]  384         jr nz,animate$delay_free
      00034F 10 E8            [13]  385         djnz animate_end
      000351 79               [ 4]  386         ld a,c
      000352 77               [ 7]  387         ld (hl),a
      000353 C1               [10]  388         pop bc
      000354 D1               [10]  389         pop de
      000355 C9               [10]  390         ret
      000356                        391 show_empty_field:
      000356 E5               [11]  392         push hl
      000357 D5               [11]  393         push de
      000358 C5               [11]  394         push bc
      000359 21 43 06         [10]  395         ld hl,#txt_empty_screen
      00035C 11 00 EC         [10]  396         ld de,#BWS
      00035F 01 00 04         [10]  397         ld bc,#BWS_SIZE
      000362 ED B0            [21]  398         ldir
      000364 C1               [10]  399         pop bc
      000365 D1               [10]  400         pop de
      000366 E1               [10]  401         pop hl
      000367 C9               [10]  402         ret
      000368                        403 show_mine_field:
      000368 E5               [11]  404         push hl
      000369 D5               [11]  405         push de
      00036A C5               [11]  406         push bc
      00036B 21 D0 0E         [10]  407         ld hl,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
      00036E 11 E0 EC         [10]  408         ld de,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
      000371 0E 16            [ 7]  409         ld c,#START_ROW-END_ROW-3; NET HEIGHT MINEFIELD
      000373                        410 $show_new_line:
      000373 06 1E            [ 7]  411         ld b,#MINEFIELD_WIDTH
      000375                        412 $get_character:
      000375 23               [ 6]  413         inc hl
      000376 13               [ 6]  414         inc de
      000377 7E               [ 7]  415         ld a,(hl)
      000378 FE 64            [ 7]  416         cp #IS_MINE
      00037A 20 03            [12]  417         jr nz,$draw_character
      00037C 3E C9            [ 7]  418         ld a,#CHR_MINE
      00037E 12               [ 7]  419         ld (de),a
      00037F                        420 $draw_character:
      00037F 05               [ 4]  421         dec b
      000380 20 F3            [12]  422         jr nz,$get_character
      000382 C5               [11]  423         push bc
      000383 01 10 27         [10]  424         ld bc,#WAIT_130MS
      000386 CD C1 03         [17]  425         call wait
      000389 C1               [10]  426         pop bc
      00038A 0D               [ 4]  427         dec c
      00038B 20 04            [12]  428         jr nz,line_correction_ptr
      00038D C1               [10]  429         pop bc
      00038E D1               [10]  430         pop de
      00038F E1               [10]  431         pop hl
      000390 C9               [10]  432         ret
      000391                        433 line_correction_ptr:
      000391 06 02            [ 7]  434         ld b,#BWS_LINE_WIDTH-MINEFIELD_WIDTH
      000393                        435 $correct_ptr:
      000393 23               [ 6]  436         inc hl
      000394 13               [ 6]  437         inc de
      000395 10 FC            [13]  438         djnz $correct_ptr
      000397 18 DA            [12]  439         jr $show_new_line
      000399                        440 hex2int:
      000399 AF               [ 4]  441         xor a
      00039A 01 E8 03         [10]  442         ld bc,#1000
      00039D CD B3 03         [17]  443         call convert_digit_to_ascii
      0003A0 01 64 00         [10]  444         ld bc,#100
      0003A3 CD B3 03         [17]  445         call convert_digit_to_ascii
      0003A6 01 0A 00         [10]  446         ld bc,#10
      0003A9 CD B3 03         [17]  447         call convert_digit_to_ascii
      0003AC 01 01 00         [10]  448         ld bc,#1
      0003AF CD B3 03         [17]  449         call convert_digit_to_ascii
      0003B2 C9               [10]  450         ret
      0003B3                        451 convert_digit_to_ascii:
      0003B3 AF               [ 4]  452         xor a
      0003B4                        453 convert$sub_digit:
      0003B4 ED 42            [15]  454         sbc hl,bc
      0003B6 38 03            [12]  455         jr c,convert$hex_to_ascii
      0003B8 3C               [ 4]  456         inc a
      0003B9 18 F9            [12]  457         jr convert$sub_digit
      0003BB                        458 convert$hex_to_ascii:
      0003BB 09               [11]  459         add hl,bc
      0003BC C6 30            [ 7]  460         add #'0'
      0003BE 12               [ 7]  461         ld (de),a
      0003BF 13               [ 6]  462         inc de
      0003C0 C9               [10]  463         ret
      0003C1                        464 wait:
      0003C1 0B               [ 6]  465         dec bc
      0003C2 79               [ 4]  466         ld a,c
      0003C3 B0               [ 4]  467         or b
      0003C4 20 FB            [12]  468         jr nz,wait
      0003C6 C9               [10]  469         ret
      0003C7                        470 clear_status_line:
      0003C7 3E 20            [ 7]  471         ld a,#' '
      0003C9 21 67 EC         [10]  472         ld hl,#BWS_ADR_HINT
      0003CC 77               [ 7]  473         ld (hl),a
      0003CD 11 68 EC         [10]  474         ld de,#BWS_ADR_HINT+1
      0003D0 01 10 00         [10]  475         ld bc,#len_vorsicht_minen-1
      0003D3 ED B0            [21]  476         ldir
      0003D5 C9               [10]  477         ret
      0003D6                        478 append_key:
      0003D6 E5               [11]  479         push hl
      0003D7 2A 4B 0A         [16]  480         ld hl,(ptr_log_buffer)
      0003DA 23               [ 6]  481         inc hl
      0003DB 77               [ 7]  482         ld (hl),a
      0003DC 22 4B 0A         [16]  483         ld (ptr_log_buffer),hl
      0003DF E1               [10]  484         pop hl
      0003E0 AF               [ 4]  485         xor a
      0003E1 C9               [10]  486         ret
      0003E2                        487 print_mines_count:
      0003E2 E5               [11]  488         push hl
      0003E3 D5               [11]  489         push de
      0003E4 21 50 0A         [10]  490         ld hl,#str_vorsicht_minen
      0003E7 11 67 EC         [10]  491         ld de,#BWS_ADR_HINT
      0003EA 01 11 00         [10]  492         ld bc,#len_vorsicht_minen
      0003ED ED B0            [21]  493         ldir
      0003EF 21 70 EC         [10]  494         ld hl,#BWS_ADR_HINT+9; 'VORSICHT '
      0003F2 C6 30            [ 7]  495         add #'0'
      0003F4 77               [ 7]  496         ld (hl),a
      0003F5 D1               [10]  497         pop de
      0003F6 E1               [10]  498         pop hl
      0003F7 C9               [10]  499         ret
      0003F8                        500 show_points_plus_100:
      0003F8 E5               [11]  501         push hl
      0003F9 C5               [11]  502         push bc
      0003FA D5               [11]  503         push de
      0003FB 01 64 00         [10]  504         ld bc,#100
      0003FE 2A 47 0A         [16]  505         ld hl,(points_count)
      000401 09               [11]  506         add hl,bc
      000402 22 47 0A         [16]  507         ld (points_count),hl
      000405 11 39 EC         [10]  508         ld de,#BWS_ADR_POINTS
      000408 CD 99 03         [17]  509         call hex2int
      00040B D1               [10]  510         pop de
      00040C C1               [10]  511         pop bc
      00040D E1               [10]  512         pop hl
      00040E C9               [10]  513         ret
      00040F                        514 show_title:
      00040F 21 8F 0A         [10]  515         ld hl,#txt_title
      000412 11 00 EC         [10]  516         ld de,#BWS
      000415 01 00 04         [10]  517         ld bc,#BWS_SIZE
      000418 ED B0            [21]  518         ldir
      00031A                        519         FILL_BACKGROUND_COLOR
      00041A C9               [10]  520         ret
      00041B                        521 check_for_bonus:
      00041B 2A 49 0A         [16]  522         ld hl,(mines_count)
      00041E 01 64 00         [10]  523         ld bc,#100
      000421 ED 42            [15]  524         sbc hl,bc
      000423 D8               [11]  525         ret c
      000424 3E CA            [ 7]  526         ld a,#CHR_BONUS
      000426 21 06 EE         [10]  527         ld hl,#BWS_ADR_BONUS_L
      000429 77               [ 7]  528         ld (hl),a
      00042A 21 19 EE         [10]  529         ld hl,#BWS_ADR_BONUS_R
      00042D 77               [ 7]  530         ld (hl),a
      00042E 21 F6 0F         [10]  531         ld hl,#INT_ADR_BONUS_L
      000431 77               [ 7]  532         ld (hl),a
      000432 21 09 10         [10]  533         ld hl,#INT_ADR_BONUS_R
      000435 77               [ 7]  534         ld (hl),a
      000436 C9               [10]  535         ret
      000437                        536 clear_data:
      000437 21 90 0E         [10]  537         ld hl,#INTERNAL_ARRAY
      00043A 3E 00            [ 7]  538         ld a,#IS_FREE
      00043C 77               [ 7]  539         ld (hl),a
      00043D 11 91 0E         [10]  540         ld de,#INTERNAL_ARRAY+1
      000440 01 3F 03         [10]  541         ld bc,#BWS_LINE_WIDTH*(START_ROW-END_ROW+1)-1
      000443 ED B0            [21]  542         ldir
      000445 C9               [10]  543         ret
      000446                        544 points_plus_50:
      000446 2A 47 0A         [16]  545         ld hl,(points_count)
      000449 01 32 00         [10]  546         ld bc,#50
      00044C 09               [11]  547         add hl,bc
      00044D 22 47 0A         [16]  548         ld (points_count),hl
      000450 C9               [10]  549         ret
      000451                        550 points_plus_25:
      000451 2A 49 0A         [16]  551         ld hl,(mines_count)
      000454 01 19 00         [10]  552         ld bc,#25
      000457 09               [11]  553         add hl,bc
      000458 22 49 0A         [16]  554         ld (mines_count),hl
      00045B C9               [10]  555         ret
      00045C                        556 show_recording_history:
      00045C 21 CF EF         [10]  557         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      00045F 11 D0 11         [10]  558         ld de,#LOG_BUFFER
      000462 01 20 00         [10]  559         ld bc,#BWS_LINE_WIDTH
      000465                        560 animate_recording:
      000465 C5               [11]  561         push bc
      000466 01 98 3A         [10]  562         ld bc,#REC_DELAY_190MS
      000469                        563 recording$delay:
      000469 0B               [ 6]  564         dec bc
      00046A AF               [ 4]  565         xor a
      00046B B8               [ 4]  566         cp b
      00046C 20 FB            [12]  567         jr nz,recording$delay
      00046E C1               [10]  568         pop bc
      00046F 1A               [ 7]  569         ld a,(de)
      000470 13               [ 6]  570         inc de
      000471 FE 01            [ 7]  571         cp #RECORD_UP
      000473 CC 8A 04         [17]  572         call z,animate_up
      000476 FE 02            [ 7]  573         cp #RECORD_DOWN
      000478 CC 93 04         [17]  574         call z,animate_down
      00047B FE 03            [ 7]  575         cp #RECORD_RIGHT
      00047D CC 9B 04         [17]  576         call z,animate_right
      000480 FE 04            [ 7]  577         cp #RECORD_LEFT
      000482 CC A3 04         [17]  578         call z,animate_left
      000485 FE 37            [ 7]  579         cp #RECORD_END
      000487 C8               [11]  580         ret z
      000488 18 DB            [12]  581         jr animate_recording
      00048A                        582 animate_up:
      00048A 3E FF            [ 7]  583         ld a,#CHR_VISITED
      00048C 77               [ 7]  584         ld (hl),a
      00048D 3E 17            [ 7]  585         ld a,#CHR_MAN
      00048F ED 42            [15]  586         sbc hl,bc
      000491 77               [ 7]  587         ld (hl),a
      000492 C9               [10]  588         ret
      000493                        589 animate_down:
      000493 3E FF            [ 7]  590         ld a,#CHR_VISITED
      000495 77               [ 7]  591         ld (hl),a
      000496 3E 17            [ 7]  592         ld a,#CHR_MAN
      000498 09               [11]  593         add hl,bc
      000499 77               [ 7]  594         ld (hl),a
      00049A C9               [10]  595         ret
      00049B                        596 animate_right:
      00049B 3E FF            [ 7]  597         ld a,#CHR_VISITED
      00049D 77               [ 7]  598         ld (hl),a
      00049E 3E 17            [ 7]  599         ld a,#CHR_MAN
      0004A0 23               [ 6]  600         inc hl
      0004A1 77               [ 7]  601         ld (hl),a
      0004A2 C9               [10]  602         ret
      0004A3                        603 animate_left:
      0004A3 3E FF            [ 7]  604         ld a,#CHR_VISITED
      0004A5 77               [ 7]  605         ld (hl),a
      0004A6 3E 17            [ 7]  606         ld a,#CHR_MAN
      0004A8 2B               [ 6]  607         dec hl
      0004A9 77               [ 7]  608         ld (hl),a
      0004AA C9               [10]  609         ret
                                    610 
      0004AB                        611 distribute_mines:
      0004AB ED 4B 49 0A      [20]  612         ld bc,(mines_count)
      0004AF                        613 $put_mine:
      0004AF C5               [11]  614         push bc
      0004B0                        615 distribute$new_number:
      0004B0 CD B2 05         [17]  616         call rand16
      0004B3 7C               [ 4]  617         ld a,h
      0004B4 E6 03            [ 7]  618         and #RANDOM_MASK ; bc <0x400
                                    619         ; while HL >= CUT_OFF call rand16
      0004B6 67               [ 4]  620         ld h,a
      0004B7 FE 02            [ 7]  621         cp #>CUT_OFF   ; H>=HIGH(CUT_OFF)
      0004B9 38 08            [12]  622         jr c,distribute$is_smaller
      0004BB 20 F3            [12]  623         jr nz,distribute$new_number
      0004BD 7D               [ 4]  624         ld a,l
      0004BE FE A0            [ 7]  625         cp #<CUT_OFF
      0004C0 F2 B0 04         [10]  626         jp p,distribute$new_number
      0004C3                        627 distribute$is_smaller:
      0004C3 01 D0 0E         [10]  628         ld bc,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
      0004C6 5D               [ 4]  629         ld e,l
      0004C7 54               [ 4]  630         ld d,h
      0004C8 09               [11]  631         add hl,bc
      0004C9 7E               [ 7]  632         ld a,(hl)
      0004CA FE 00            [ 7]  633         cp #IS_FREE
                                    634 
      0004CC 20 E2            [12]  635         jr nz,distribute$new_number
      0004CE 21 E0 EC         [10]  636         ld hl,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
      0004D1 19               [11]  637         add hl,de
      0004D2 7E               [ 7]  638         ld a,(hl)
      0004D3 FE 20            [ 7]  639         cp #CHR_FREE
      0004D5 20 D9            [12]  640         jr nz,distribute$new_number
                                    641         ;AZ check distribution
                                    642         ;ld a,#0x55
                                    643         ;ld (hl),a
      0004D7 EB               [ 4]  644         ex de,hl
      0004D8 09               [11]  645         add hl,bc
      0004D9 3E 64            [ 7]  646         ld a,#IS_MINE
      0004DB 77               [ 7]  647         ld (hl),a
      0004DC C1               [10]  648         pop bc
      0004DD 0B               [ 6]  649         dec bc
      0004DE 79               [ 4]  650         ld a,c
      0004DF B0               [ 4]  651         or b
      0004E0 20 CD            [12]  652         jr nz,$put_mine
      0004E2 C9               [10]  653         ret
      0004E3                        654 do_quit:
      0004E3 3E 37            [ 7]  655         ld a,#RECORD_END
      0004E5 CD D6 03         [17]  656         call append_key
      0004E8 CD 68 05         [17]  657         call quit_sound
      0004EB CD 1D 03         [17]  658         call clear_screen
      0004EE CD 56 03         [17]  659         call show_empty_field
      0004F1 CD 68 03         [17]  660         call show_mine_field
      0004F4 CD 5C 04         [17]  661         call show_recording_history
      0004F7 CD 37 04         [17]  662         call clear_data
      0004FA 01 60 EA         [10]  663         ld bc,#WAIT_750MS
      0004FD CD C1 03         [17]  664         call wait
      000500 CD 1D 03         [17]  665         call clear_screen
      000503 C3 06 05         [10]  666         jp go_next
      000506                        667 go_next:
      000506 11 2A ED         [10]  668         ld de,#BWS_A_SIE_HABEN
      000509 21 61 0A         [10]  669         ld hl,#str_sie_haben
      00050C 01 0C 00         [10]  670         ld bc,#size_of_sie_haben
      00050F ED B0            [21]  671         ldir
      000511 11 A7 ED         [10]  672         ld de,#BWS_A_PUNKTE_ER
      000514 21 6D 0A         [10]  673         ld hl,#str_punkte_erreicht
      000517 01 12 00         [10]  674         ld bc,#size_of_punkte_erreich
      00051A ED B0            [21]  675         ldir
      00051C 2A 47 0A         [16]  676         ld hl,(points_count)
      00051F 11 6D ED         [10]  677         ld de,#BWS_A_TOTAL_POI
      000522 CD 99 03         [17]  678         call hex2int
      000525 11 88 EE         [10]  679         ld de,#BWS_A_NOCH_EIN
      000528 21 7F 0A         [10]  680         ld hl,#str_noch_ein_spiel
      00052B 01 10 00         [10]  681         ld bc,#size_of_noch_ein_spiel
      00052E ED B0            [21]  682         ldir
      000530 21 CE EE         [10]  683         ld hl,#BWS_A_JA
      000533 3E 4A            [ 7]  684         ld a,#'J'
      000535 77               [ 7]  685         ld (hl),a
      000536 23               [ 6]  686         inc hl
      000537 3E 2F            [ 7]  687         ld a,#'/'
      000539 77               [ 7]  688         ld (hl),a
      00053A 23               [ 6]  689         inc hl
      00053B 3E 4E            [ 7]  690         ld a,#'N'
      00053D 77               [ 7]  691         ld (hl),a
      00053E CD CC 05         [17]  692         call up_inch
      000541 FE 4A            [ 7]  693         cp #'J'
      000543 CA 0D 01         [10]  694         jp z,new_game
      000546 C3 49 05         [10]  695         jp kill_all_and_halt
                                    696 
      000549                        697 kill_all_and_halt:
      000449                        698         END_MESSAGE
      000549 E7               [11]    1         rst 0x20
      00054A 02                       2         .db UP_PRST7
      00054B 41 75 66 20 57 69 65     3         .ascis 'Auf Wiedersehen! Und weg... '
             64 65 72 73 65 68 65
             6E 21 20 55 6E 64 20
             77 65 67 2E 2E 2E A0
      000567 FF               [11]    4         rst 0x38
                                    699 
      000568                        700 quit_sound:
      000468                        701         QUIT_SOUND
      000568 2E 60            [ 7]    1         ld l,#QUIT_SOUND_P1
      00056A 16 E0            [ 7]    2         ld d,#QUIT_SOUND_P2
      00056C 1E 01            [ 7]    3         ld e,#QUIT_SOUND_P3
      00056E                          4 quit$play_effect1:
      00056E 4B               [ 4]    5         ld c,e
      00056F                          6 quit$play_period1:
      00056F EE 80            [ 7]    7         xor #TAPE_OUT
      000571 D3 02            [11]    8         out (PIOB_DATA),a
      000573 42               [ 4]    9         ld b,d
      000574 00               [ 4]   10         nop
      000575 FE EE            [ 7]   11         cp #QUIT_SOUND_P4
      000577 80               [ 4]   12         add b
      000578 D3 02            [11]   13         out (PIOB_DATA),a
      00057A 42               [ 4]   14         ld b,d
      00057B                         15 quit$play_half_wave1:
      00057B 10 FE            [13]   16         djnz quit$play_half_wave1
      00057D 0D               [ 4]   17         dec c
      00057E 20 EF            [12]   18         jr nz,quit$play_period1
      000580 15               [ 4]   19         dec d
      000581 1C               [ 4]   20         inc e
      000582 2D               [ 4]   21         dec l
      000583 20 E9            [12]   22         jr nz,quit$play_effect1
      000585 2E 60            [ 7]   23         ld l,#QUIT_SOUND_P1
      000587                         24 quit$play_effect2:
      000587 4B               [ 4]   25         ld c,e
      000588                         26 quit$play_period2:
      000588 EE 80            [ 7]   27         xor #TAPE_OUT
      00058A D3 02            [11]   28         out (PIOB_DATA),a
      00058C 42               [ 4]   29         ld b,d
      00058D 00               [ 4]   30         nop
      00058E FE EE            [ 7]   31         cp #QUIT_SOUND_P4
      000590 80               [ 4]   32         add b
      000591 D3 02            [11]   33         out (PIOB_DATA),a
      000593 42               [ 4]   34         ld b,d
      000594                         35 quit$play_half_wave2:
      000594 10 FE            [13]   36         djnz quit$play_half_wave2
      000596 0D               [ 4]   37         dec c
      000597 20 EF            [12]   38         jr nz,quit$play_period2
      000599 14               [ 4]   39         inc d
      00059A 1D               [ 4]   40         dec e
      00059B 2D               [ 4]   41         dec l
      00059C 20 E9            [12]   42         jr nz,quit$play_effect2
      00059E C9               [10]  702         ret
      00059F                        703 click_sound:
      00049F                        704         CLICK_SOUND
      00059F F5               [11]    1         push af
      0005A0 06 50            [ 7]    2         ld b,#WAVE_PERIODS
      0005A2 AF               [ 4]    3         xor a
      0005A3                          4 $click_next_period:
      0005A3 0E 64            [ 7]    5         ld c,#WAVE_LEN_285Hz; 1-half wave has 3500 clock cycles
      0005A5                          6 $click_keep_level:
      0005A5 D3 02            [11]    7         out (PIOB_DATA),a
      0005A7 00               [ 4]    8         nop
      0005A8 00               [ 4]    9         nop
      0005A9 0D               [ 4]   10         dec c
      0005AA 20 F9            [12]   11         jr nz,$click_keep_level
      0005AC EE 80            [ 7]   12         xor #TAPE_OUT
      0005AE 10 F3            [13]   13         djnz $click_next_period
      0005B0 F1               [10]   14         pop af
      0005B1 C9               [10]  705         ret
                                    706 ;
                                    707 ; Galois LFSRs
                                    708 ;
      0005B2                        709 rand16:
      0005B2 2A CA 05         [16]  710         ld hl,(seed)
      0005B5 ED 5F            [ 9]  711         ld a,r
      0005B7 84               [ 4]  712         add h
      0005B8 67               [ 4]  713         ld h,a
      0005B9 AF               [ 4]  714         xor a ; CF=0
      0005BA CB 1C            [ 8]  715         rr h
      0005BC CB 1D            [ 8]  716         rr l
      0005BE 30 06            [12]  717         jr  nc,rand16$write_seed
      0005C0 AD               [ 4]  718         xor l
      0005C1 6F               [ 4]  719         ld l,a
      0005C2 3E B4            [ 7]  720         ld a,#0xB4
      0005C4 AC               [ 4]  721         xor h
      0005C5 67               [ 4]  722         ld h,a
      0005C6                        723 rand16$write_seed:
      0005C6 22 CA 05         [16]  724         ld (seed),hl
      0005C9 C9               [10]  725         ret
      0005CA                        726 seed:
      0005CA E1 AC                  727         .dw 0xace1
                                    728 
      0005CC                        729 up_inch:
      0005CC CD B2 05         [17]  730         call rand16
      0004CF                        731         INKEY
      0005CF AF               [ 4]    1         xor     a
      0005D0 32 04 00         [13]    2         ld      (KEY_CODE),a
      0005D3 E7               [11]    3         rst     0x20
      0005D4 04                       4         .db     UP_INKEY
      0005D5 B7               [ 4]    5         or      a
      0005D6 28 2A            [12]    6         jr      z,up_inch$joystick
      0005D8 FE 0B            [ 7]  732         cp #VK_UP; CURSOR UP
      0005DA 20 03            [12]  733         jr nz,up_inch$test_down
      0005DC                        734 up_inch$is_up:
      0005DC 3E 47            [ 7]  735         ld a,#'G'
      0005DE C9               [10]  736         ret
      0005DF                        737 up_inch$test_down:
      0005DF FE 0A            [ 7]  738         cp #VK_DOWN; CURSOR DOWN
      0005E1 20 03            [12]  739         jr nz,up_inch$test_left
      0005E3                        740 up_inch$is_down:
      0005E3 3E 4F            [ 7]  741         ld a,#'O'
      0005E5 C9               [10]  742         ret
      0005E6                        743 up_inch$test_left:
      0005E6 FE 08            [ 7]  744         cp #VK_LEFT; CURSOR LEFT
      0005E8 20 03            [12]  745         jr nz,up_inch$test_right
      0005EA                        746 up_inch$is_left:
      0005EA 3E 50            [ 7]  747         ld a,#'P'
      0005EC C9               [10]  748         ret
      0005ED                        749 up_inch$test_right:
      0005ED FE 09            [ 7]  750         cp #VK_RIGHT; CURSOR RIGHT
      0005EF 20 03            [12]  751         jr nz,up_inch$test_enter
      0005F1                        752 up_inch$is_right:
      0005F1 3E 51            [ 7]  753         ld a,#'Q'
      0005F3 C9               [10]  754         ret
      0005F4                        755 up_inch$test_enter:
      0005F4 FE 0D            [ 7]  756         cp #0x0d; enter
      0005F6 20 03            [12]  757         jr nz,up_inch$fire
      0005F8                        758 up_inch$is_start:
      0005F8 3E 53            [ 7]  759         ld a,#'S'
      0005FA C9               [10]  760         ret
      0005FB                        761 up_inch$fire:
      0005FB FE 1B            [ 7]  762         cp #0x1b; joystick fire
      0005FD 20 02            [12]  763         jr nz,up_inch$end
      0005FF 18 F7            [12]  764         jr up_inch$is_start
      000601                        765 up_inch$end:
      000601 C9               [10]  766         ret
      000602                        767 	JOYSTICK
      000502                          1 up_inch$joystick:
      000602 DB 00            [11]    2         in a,(0x00)
      000604 E6 1F            [ 7]    3         and #0x1f
      000606 4F               [ 4]    4         ld c,a
      000607 06 80            [ 7]    5         ld b,#0x80
      000609                          6 up_inch$debounce1:
      000609 10 FE            [13]    7         djnz up_inch$debounce1
      00060B DB 00            [11]    8         in a,(0x00)
      00060D E6 1F            [ 7]    9         and #0x1f;
      00060F B9               [ 4]   10         cp c
      000610 20 F0            [12]   11         jr nz,up_inch$joystick
      000612                         12 joystick:
      000612 3A 4F 0A         [13]   13         ld a,(last_joystick)
      000615 B9               [ 4]   14         cp c
      000616 28 B4            [12]   15         jr z,up_inch
      000618 79               [ 4]   16         ld a,c
      000619 32 4F 0A         [13]   17         ld (last_joystick),a
      00061C FE 1E            [ 7]   18         cp #0x1e; left
      00061E 28 CA            [12]   19         jr z,up_inch$is_left
      000620 FE 1D            [ 7]   20         cp #0x1d; right
      000622 28 CD            [12]   21         jr z,up_inch$is_right
      000624 FE 1B            [ 7]   22         cp #0x1b; right
      000626 28 BB            [12]   23         jr z,up_inch$is_down
      000628 FE 17            [ 7]   24         cp #0x17; up
      00062A 28 B0            [12]   25         jr z,up_inch$is_up
      00062C E6 10            [ 7]   26         and #0x10
      00062E C0               [11]   27         ret nz
      00062F 3E 53            [ 7]   28         ld a,#'S'
      000631 C9               [10]   29         ret
      000632                         30 joystick_init:
      000632 3E CF            [ 7]   31         ld a,#0xcf; bitwise input
      000634 D3 01            [11]   32         out (0x01),a
      000636 3E 1F            [ 7]   33         ld a,#0x1f;
      000638 D3 01            [11]   34         out (0x01),a
      00063A AF               [ 4]   35         xor a
      00063B 32 4F 0A         [13]   36         ld (last_joystick),a
      00063E 3E 60            [ 7]   37         ld a,#0x60 ; both enabled
      000640 D3 00            [11]   38         out (0x00),a
      000642 C9               [10]   39         ret
      000643                        768 txt_empty_screen:
      000543                        769         TXT_MINES
      000643 20 20 20 20 20 20 20     1         .ascii '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000563                          2         FILL_SPACES
      000663 20 20 20                 3         .ascii '   '
      000666 4D 49 4E 45 4E 3A        4         .ascii 'MINEN:'
                           000029   770 ofs_minen   .equ .-txt_empty_screen
                                    771 
      00056C                        772         TXT_PUNKTE
      00066C 20 20 20 20              1         .ascii '    '
      000670 20 20 20 20 20 50 55     2         .ascii '     PUNKTE:'
             4E 4B 54 45 3A
                           000039   773 ofs_points   .equ .-txt_empty_screen
                                    774 
      00057C                        775         TXT_EMPTY_SCREEN
      00067C 20 20 20 20 20 20 20     1         .ascii '       '
      000683 A8                       2         .db 0xa8
                                      3         .rept (BWS_LINE_WIDTH-2)
                                      4         .db 0xa0
                                      5         .endm
      000684 A0                       1         .db 0xa0
      000685 A0                       1         .db 0xa0
      000686 A0                       1         .db 0xa0
      000687 A0                       1         .db 0xa0
      000688 A0                       1         .db 0xa0
      000689 A0                       1         .db 0xa0
      00068A A0                       1         .db 0xa0
      00068B A0                       1         .db 0xa0
      00068C A0                       1         .db 0xa0
      00068D A0                       1         .db 0xa0
      00068E A0                       1         .db 0xa0
      00068F A0                       1         .db 0xa0
      000690 A0                       1         .db 0xa0
      000691 A0                       1         .db 0xa0
      000692 A0                       1         .db 0xa0
      000693 A0                       1         .db 0xa0
      000694 A0                       1         .db 0xa0
      000695 A0                       1         .db 0xa0
      000696 A0                       1         .db 0xa0
      000697 A0                       1         .db 0xa0
      000698 A0                       1         .db 0xa0
      000699 A0                       1         .db 0xa0
      00069A A0                       1         .db 0xa0
      00069B A0                       1         .db 0xa0
      00069C A0                       1         .db 0xa0
      00069D A0                       1         .db 0xa0
      00069E A0                       1         .db 0xa0
      00069F A0                       1         .db 0xa0
      0006A0 A0                       1         .db 0xa0
      0006A1 A0                       1         .db 0xa0
      0006A2 A9                       6         .db 0xa9
                                      7         
      0006A3 A1                       8         .db 0xa1
                           000067     9 ofs_vorsicht   .equ .-txt_empty_screen+6; 5 is intentionally move right
                                     10         .rept (BWS_LINE_WIDTH-2)
                                     11         .db ' '
                                     12         .endm
      0006A4 20                       1         .db ' '
      0006A5 20                       1         .db ' '
      0006A6 20                       1         .db ' '
      0006A7 20                       1         .db ' '
      0006A8 20                       1         .db ' '
      0006A9 20                       1         .db ' '
      0006AA 20                       1         .db ' '
      0006AB 20                       1         .db ' '
      0006AC 20                       1         .db ' '
      0006AD 20                       1         .db ' '
      0006AE 20                       1         .db ' '
      0006AF 20                       1         .db ' '
      0006B0 20                       1         .db ' '
      0006B1 20                       1         .db ' '
      0006B2 20                       1         .db ' '
      0006B3 20                       1         .db ' '
      0006B4 20                       1         .db ' '
      0006B5 20                       1         .db ' '
      0006B6 20                       1         .db ' '
      0006B7 20                       1         .db ' '
      0006B8 20                       1         .db ' '
      0006B9 20                       1         .db ' '
      0006BA 20                       1         .db ' '
      0006BB 20                       1         .db ' '
      0006BC 20                       1         .db ' '
      0006BD 20                       1         .db ' '
      0006BE 20                       1         .db ' '
      0006BF 20                       1         .db ' '
      0006C0 20                       1         .db ' '
      0006C1 20                       1         .db ' '
      0006C2 A1                      13         .db 0xa1
                                     14         
      0006C3 A3                      15         .db 0xa3
                                     16         .rept (BWS_LINE_WIDTH/2-3)
                                     17         .db 0xa0
                                     18         .endm
      0006C4 A0                       1         .db 0xa0
      0006C5 A0                       1         .db 0xa0
      0006C6 A0                       1         .db 0xa0
      0006C7 A0                       1         .db 0xa0
      0006C8 A0                       1         .db 0xa0
      0006C9 A0                       1         .db 0xa0
      0006CA A0                       1         .db 0xa0
      0006CB A0                       1         .db 0xa0
      0006CC A0                       1         .db 0xa0
      0006CD A0                       1         .db 0xa0
      0006CE A0                       1         .db 0xa0
      0006CF A0                       1         .db 0xa0
      0006D0 A0                       1         .db 0xa0
      0006D1 A4 A0 A4                19         .db 0xa4,0xa0,0xa4
                                     20         .rept (BWS_LINE_WIDTH/2-2)
                                     21         .db 0xa0
                                     22         .endm
      0006D4 A0                       1         .db 0xa0
      0006D5 A0                       1         .db 0xa0
      0006D6 A0                       1         .db 0xa0
      0006D7 A0                       1         .db 0xa0
      0006D8 A0                       1         .db 0xa0
      0006D9 A0                       1         .db 0xa0
      0006DA A0                       1         .db 0xa0
      0006DB A0                       1         .db 0xa0
      0006DC A0                       1         .db 0xa0
      0006DD A0                       1         .db 0xa0
      0006DE A0                       1         .db 0xa0
      0006DF A0                       1         .db 0xa0
      0006E0 A0                       1         .db 0xa0
      0006E1 A0                       1         .db 0xa0
      0006E2 A5                      23         .db 0xa5
                                     24         
      0006E3 A3                      25          .db 0xa3
                                     26         .rept (BWS_LINE_WIDTH/2-3)
                                     27         .db 0xa0
                                     28         .endm
      0006E4 A0                       1         .db 0xa0
      0006E5 A0                       1         .db 0xa0
      0006E6 A0                       1         .db 0xa0
      0006E7 A0                       1         .db 0xa0
      0006E8 A0                       1         .db 0xa0
      0006E9 A0                       1         .db 0xa0
      0006EA A0                       1         .db 0xa0
      0006EB A0                       1         .db 0xa0
      0006EC A0                       1         .db 0xa0
      0006ED A0                       1         .db 0xa0
      0006EE A0                       1         .db 0xa0
      0006EF A0                       1         .db 0xa0
      0006F0 A0                       1         .db 0xa0
      0006F1 AA 20 A7                29         .db 0xaa,0x20,0xa7
                                     30         .rept (BWS_LINE_WIDTH/2-2)
                                     31         .db 0xa0
                                     32         .endm
      0006F4 A0                       1         .db 0xa0
      0006F5 A0                       1         .db 0xa0
      0006F6 A0                       1         .db 0xa0
      0006F7 A0                       1         .db 0xa0
      0006F8 A0                       1         .db 0xa0
      0006F9 A0                       1         .db 0xa0
      0006FA A0                       1         .db 0xa0
      0006FB A0                       1         .db 0xa0
      0006FC A0                       1         .db 0xa0
      0006FD A0                       1         .db 0xa0
      0006FE A0                       1         .db 0xa0
      0006FF A0                       1         .db 0xa0
      000700 A0                       1         .db 0xa0
      000701 A0                       1         .db 0xa0
      000702 A5                      33         .db 0xa5
                                     34 
                                     35         ;;22 times
                                     36         .rept (BWS_HEIGHT-9)
                                     37                 .db 0xa1
                                     38                 .rept (BWS_LINE_WIDTH-2)
                                     39                 .db ' '
                                     40                 .endm
                                     41                 .db 0xa1
                                     42         .endm
      000703 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000704 20                       1                 .db ' '
      000705 20                       1                 .db ' '
      000706 20                       1                 .db ' '
      000707 20                       1                 .db ' '
      000708 20                       1                 .db ' '
      000709 20                       1                 .db ' '
      00070A 20                       1                 .db ' '
      00070B 20                       1                 .db ' '
      00070C 20                       1                 .db ' '
      00070D 20                       1                 .db ' '
      00070E 20                       1                 .db ' '
      00070F 20                       1                 .db ' '
      000710 20                       1                 .db ' '
      000711 20                       1                 .db ' '
      000712 20                       1                 .db ' '
      000713 20                       1                 .db ' '
      000714 20                       1                 .db ' '
      000715 20                       1                 .db ' '
      000716 20                       1                 .db ' '
      000717 20                       1                 .db ' '
      000718 20                       1                 .db ' '
      000719 20                       1                 .db ' '
      00071A 20                       1                 .db ' '
      00071B 20                       1                 .db ' '
      00071C 20                       1                 .db ' '
      00071D 20                       1                 .db ' '
      00071E 20                       1                 .db ' '
      00071F 20                       1                 .db ' '
      000720 20                       1                 .db ' '
      000721 20                       1                 .db ' '
      000722 A1                       5                 .db 0xa1
      000723 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000724 20                       1                 .db ' '
      000725 20                       1                 .db ' '
      000726 20                       1                 .db ' '
      000727 20                       1                 .db ' '
      000728 20                       1                 .db ' '
      000729 20                       1                 .db ' '
      00072A 20                       1                 .db ' '
      00072B 20                       1                 .db ' '
      00072C 20                       1                 .db ' '
      00072D 20                       1                 .db ' '
      00072E 20                       1                 .db ' '
      00072F 20                       1                 .db ' '
      000730 20                       1                 .db ' '
      000731 20                       1                 .db ' '
      000732 20                       1                 .db ' '
      000733 20                       1                 .db ' '
      000734 20                       1                 .db ' '
      000735 20                       1                 .db ' '
      000736 20                       1                 .db ' '
      000737 20                       1                 .db ' '
      000738 20                       1                 .db ' '
      000739 20                       1                 .db ' '
      00073A 20                       1                 .db ' '
      00073B 20                       1                 .db ' '
      00073C 20                       1                 .db ' '
      00073D 20                       1                 .db ' '
      00073E 20                       1                 .db ' '
      00073F 20                       1                 .db ' '
      000740 20                       1                 .db ' '
      000741 20                       1                 .db ' '
      000742 A1                       5                 .db 0xa1
      000743 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000744 20                       1                 .db ' '
      000745 20                       1                 .db ' '
      000746 20                       1                 .db ' '
      000747 20                       1                 .db ' '
      000748 20                       1                 .db ' '
      000749 20                       1                 .db ' '
      00074A 20                       1                 .db ' '
      00074B 20                       1                 .db ' '
      00074C 20                       1                 .db ' '
      00074D 20                       1                 .db ' '
      00074E 20                       1                 .db ' '
      00074F 20                       1                 .db ' '
      000750 20                       1                 .db ' '
      000751 20                       1                 .db ' '
      000752 20                       1                 .db ' '
      000753 20                       1                 .db ' '
      000754 20                       1                 .db ' '
      000755 20                       1                 .db ' '
      000756 20                       1                 .db ' '
      000757 20                       1                 .db ' '
      000758 20                       1                 .db ' '
      000759 20                       1                 .db ' '
      00075A 20                       1                 .db ' '
      00075B 20                       1                 .db ' '
      00075C 20                       1                 .db ' '
      00075D 20                       1                 .db ' '
      00075E 20                       1                 .db ' '
      00075F 20                       1                 .db ' '
      000760 20                       1                 .db ' '
      000761 20                       1                 .db ' '
      000762 A1                       5                 .db 0xa1
      000763 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000764 20                       1                 .db ' '
      000765 20                       1                 .db ' '
      000766 20                       1                 .db ' '
      000767 20                       1                 .db ' '
      000768 20                       1                 .db ' '
      000769 20                       1                 .db ' '
      00076A 20                       1                 .db ' '
      00076B 20                       1                 .db ' '
      00076C 20                       1                 .db ' '
      00076D 20                       1                 .db ' '
      00076E 20                       1                 .db ' '
      00076F 20                       1                 .db ' '
      000770 20                       1                 .db ' '
      000771 20                       1                 .db ' '
      000772 20                       1                 .db ' '
      000773 20                       1                 .db ' '
      000774 20                       1                 .db ' '
      000775 20                       1                 .db ' '
      000776 20                       1                 .db ' '
      000777 20                       1                 .db ' '
      000778 20                       1                 .db ' '
      000779 20                       1                 .db ' '
      00077A 20                       1                 .db ' '
      00077B 20                       1                 .db ' '
      00077C 20                       1                 .db ' '
      00077D 20                       1                 .db ' '
      00077E 20                       1                 .db ' '
      00077F 20                       1                 .db ' '
      000780 20                       1                 .db ' '
      000781 20                       1                 .db ' '
      000782 A1                       5                 .db 0xa1
      000783 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000784 20                       1                 .db ' '
      000785 20                       1                 .db ' '
      000786 20                       1                 .db ' '
      000787 20                       1                 .db ' '
      000788 20                       1                 .db ' '
      000789 20                       1                 .db ' '
      00078A 20                       1                 .db ' '
      00078B 20                       1                 .db ' '
      00078C 20                       1                 .db ' '
      00078D 20                       1                 .db ' '
      00078E 20                       1                 .db ' '
      00078F 20                       1                 .db ' '
      000790 20                       1                 .db ' '
      000791 20                       1                 .db ' '
      000792 20                       1                 .db ' '
      000793 20                       1                 .db ' '
      000794 20                       1                 .db ' '
      000795 20                       1                 .db ' '
      000796 20                       1                 .db ' '
      000797 20                       1                 .db ' '
      000798 20                       1                 .db ' '
      000799 20                       1                 .db ' '
      00079A 20                       1                 .db ' '
      00079B 20                       1                 .db ' '
      00079C 20                       1                 .db ' '
      00079D 20                       1                 .db ' '
      00079E 20                       1                 .db ' '
      00079F 20                       1                 .db ' '
      0007A0 20                       1                 .db ' '
      0007A1 20                       1                 .db ' '
      0007A2 A1                       5                 .db 0xa1
      0007A3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0007A4 20                       1                 .db ' '
      0007A5 20                       1                 .db ' '
      0007A6 20                       1                 .db ' '
      0007A7 20                       1                 .db ' '
      0007A8 20                       1                 .db ' '
      0007A9 20                       1                 .db ' '
      0007AA 20                       1                 .db ' '
      0007AB 20                       1                 .db ' '
      0007AC 20                       1                 .db ' '
      0007AD 20                       1                 .db ' '
      0007AE 20                       1                 .db ' '
      0007AF 20                       1                 .db ' '
      0007B0 20                       1                 .db ' '
      0007B1 20                       1                 .db ' '
      0007B2 20                       1                 .db ' '
      0007B3 20                       1                 .db ' '
      0007B4 20                       1                 .db ' '
      0007B5 20                       1                 .db ' '
      0007B6 20                       1                 .db ' '
      0007B7 20                       1                 .db ' '
      0007B8 20                       1                 .db ' '
      0007B9 20                       1                 .db ' '
      0007BA 20                       1                 .db ' '
      0007BB 20                       1                 .db ' '
      0007BC 20                       1                 .db ' '
      0007BD 20                       1                 .db ' '
      0007BE 20                       1                 .db ' '
      0007BF 20                       1                 .db ' '
      0007C0 20                       1                 .db ' '
      0007C1 20                       1                 .db ' '
      0007C2 A1                       5                 .db 0xa1
      0007C3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0007C4 20                       1                 .db ' '
      0007C5 20                       1                 .db ' '
      0007C6 20                       1                 .db ' '
      0007C7 20                       1                 .db ' '
      0007C8 20                       1                 .db ' '
      0007C9 20                       1                 .db ' '
      0007CA 20                       1                 .db ' '
      0007CB 20                       1                 .db ' '
      0007CC 20                       1                 .db ' '
      0007CD 20                       1                 .db ' '
      0007CE 20                       1                 .db ' '
      0007CF 20                       1                 .db ' '
      0007D0 20                       1                 .db ' '
      0007D1 20                       1                 .db ' '
      0007D2 20                       1                 .db ' '
      0007D3 20                       1                 .db ' '
      0007D4 20                       1                 .db ' '
      0007D5 20                       1                 .db ' '
      0007D6 20                       1                 .db ' '
      0007D7 20                       1                 .db ' '
      0007D8 20                       1                 .db ' '
      0007D9 20                       1                 .db ' '
      0007DA 20                       1                 .db ' '
      0007DB 20                       1                 .db ' '
      0007DC 20                       1                 .db ' '
      0007DD 20                       1                 .db ' '
      0007DE 20                       1                 .db ' '
      0007DF 20                       1                 .db ' '
      0007E0 20                       1                 .db ' '
      0007E1 20                       1                 .db ' '
      0007E2 A1                       5                 .db 0xa1
      0007E3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0007E4 20                       1                 .db ' '
      0007E5 20                       1                 .db ' '
      0007E6 20                       1                 .db ' '
      0007E7 20                       1                 .db ' '
      0007E8 20                       1                 .db ' '
      0007E9 20                       1                 .db ' '
      0007EA 20                       1                 .db ' '
      0007EB 20                       1                 .db ' '
      0007EC 20                       1                 .db ' '
      0007ED 20                       1                 .db ' '
      0007EE 20                       1                 .db ' '
      0007EF 20                       1                 .db ' '
      0007F0 20                       1                 .db ' '
      0007F1 20                       1                 .db ' '
      0007F2 20                       1                 .db ' '
      0007F3 20                       1                 .db ' '
      0007F4 20                       1                 .db ' '
      0007F5 20                       1                 .db ' '
      0007F6 20                       1                 .db ' '
      0007F7 20                       1                 .db ' '
      0007F8 20                       1                 .db ' '
      0007F9 20                       1                 .db ' '
      0007FA 20                       1                 .db ' '
      0007FB 20                       1                 .db ' '
      0007FC 20                       1                 .db ' '
      0007FD 20                       1                 .db ' '
      0007FE 20                       1                 .db ' '
      0007FF 20                       1                 .db ' '
      000800 20                       1                 .db ' '
      000801 20                       1                 .db ' '
      000802 A1                       5                 .db 0xa1
      000803 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000804 20                       1                 .db ' '
      000805 20                       1                 .db ' '
      000806 20                       1                 .db ' '
      000807 20                       1                 .db ' '
      000808 20                       1                 .db ' '
      000809 20                       1                 .db ' '
      00080A 20                       1                 .db ' '
      00080B 20                       1                 .db ' '
      00080C 20                       1                 .db ' '
      00080D 20                       1                 .db ' '
      00080E 20                       1                 .db ' '
      00080F 20                       1                 .db ' '
      000810 20                       1                 .db ' '
      000811 20                       1                 .db ' '
      000812 20                       1                 .db ' '
      000813 20                       1                 .db ' '
      000814 20                       1                 .db ' '
      000815 20                       1                 .db ' '
      000816 20                       1                 .db ' '
      000817 20                       1                 .db ' '
      000818 20                       1                 .db ' '
      000819 20                       1                 .db ' '
      00081A 20                       1                 .db ' '
      00081B 20                       1                 .db ' '
      00081C 20                       1                 .db ' '
      00081D 20                       1                 .db ' '
      00081E 20                       1                 .db ' '
      00081F 20                       1                 .db ' '
      000820 20                       1                 .db ' '
      000821 20                       1                 .db ' '
      000822 A1                       5                 .db 0xa1
      000823 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000824 20                       1                 .db ' '
      000825 20                       1                 .db ' '
      000826 20                       1                 .db ' '
      000827 20                       1                 .db ' '
      000828 20                       1                 .db ' '
      000829 20                       1                 .db ' '
      00082A 20                       1                 .db ' '
      00082B 20                       1                 .db ' '
      00082C 20                       1                 .db ' '
      00082D 20                       1                 .db ' '
      00082E 20                       1                 .db ' '
      00082F 20                       1                 .db ' '
      000830 20                       1                 .db ' '
      000831 20                       1                 .db ' '
      000832 20                       1                 .db ' '
      000833 20                       1                 .db ' '
      000834 20                       1                 .db ' '
      000835 20                       1                 .db ' '
      000836 20                       1                 .db ' '
      000837 20                       1                 .db ' '
      000838 20                       1                 .db ' '
      000839 20                       1                 .db ' '
      00083A 20                       1                 .db ' '
      00083B 20                       1                 .db ' '
      00083C 20                       1                 .db ' '
      00083D 20                       1                 .db ' '
      00083E 20                       1                 .db ' '
      00083F 20                       1                 .db ' '
      000840 20                       1                 .db ' '
      000841 20                       1                 .db ' '
      000842 A1                       5                 .db 0xa1
      000843 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000844 20                       1                 .db ' '
      000845 20                       1                 .db ' '
      000846 20                       1                 .db ' '
      000847 20                       1                 .db ' '
      000848 20                       1                 .db ' '
      000849 20                       1                 .db ' '
      00084A 20                       1                 .db ' '
      00084B 20                       1                 .db ' '
      00084C 20                       1                 .db ' '
      00084D 20                       1                 .db ' '
      00084E 20                       1                 .db ' '
      00084F 20                       1                 .db ' '
      000850 20                       1                 .db ' '
      000851 20                       1                 .db ' '
      000852 20                       1                 .db ' '
      000853 20                       1                 .db ' '
      000854 20                       1                 .db ' '
      000855 20                       1                 .db ' '
      000856 20                       1                 .db ' '
      000857 20                       1                 .db ' '
      000858 20                       1                 .db ' '
      000859 20                       1                 .db ' '
      00085A 20                       1                 .db ' '
      00085B 20                       1                 .db ' '
      00085C 20                       1                 .db ' '
      00085D 20                       1                 .db ' '
      00085E 20                       1                 .db ' '
      00085F 20                       1                 .db ' '
      000860 20                       1                 .db ' '
      000861 20                       1                 .db ' '
      000862 A1                       5                 .db 0xa1
      000863 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000864 20                       1                 .db ' '
      000865 20                       1                 .db ' '
      000866 20                       1                 .db ' '
      000867 20                       1                 .db ' '
      000868 20                       1                 .db ' '
      000869 20                       1                 .db ' '
      00086A 20                       1                 .db ' '
      00086B 20                       1                 .db ' '
      00086C 20                       1                 .db ' '
      00086D 20                       1                 .db ' '
      00086E 20                       1                 .db ' '
      00086F 20                       1                 .db ' '
      000870 20                       1                 .db ' '
      000871 20                       1                 .db ' '
      000872 20                       1                 .db ' '
      000873 20                       1                 .db ' '
      000874 20                       1                 .db ' '
      000875 20                       1                 .db ' '
      000876 20                       1                 .db ' '
      000877 20                       1                 .db ' '
      000878 20                       1                 .db ' '
      000879 20                       1                 .db ' '
      00087A 20                       1                 .db ' '
      00087B 20                       1                 .db ' '
      00087C 20                       1                 .db ' '
      00087D 20                       1                 .db ' '
      00087E 20                       1                 .db ' '
      00087F 20                       1                 .db ' '
      000880 20                       1                 .db ' '
      000881 20                       1                 .db ' '
      000882 A1                       5                 .db 0xa1
      000883 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000884 20                       1                 .db ' '
      000885 20                       1                 .db ' '
      000886 20                       1                 .db ' '
      000887 20                       1                 .db ' '
      000888 20                       1                 .db ' '
      000889 20                       1                 .db ' '
      00088A 20                       1                 .db ' '
      00088B 20                       1                 .db ' '
      00088C 20                       1                 .db ' '
      00088D 20                       1                 .db ' '
      00088E 20                       1                 .db ' '
      00088F 20                       1                 .db ' '
      000890 20                       1                 .db ' '
      000891 20                       1                 .db ' '
      000892 20                       1                 .db ' '
      000893 20                       1                 .db ' '
      000894 20                       1                 .db ' '
      000895 20                       1                 .db ' '
      000896 20                       1                 .db ' '
      000897 20                       1                 .db ' '
      000898 20                       1                 .db ' '
      000899 20                       1                 .db ' '
      00089A 20                       1                 .db ' '
      00089B 20                       1                 .db ' '
      00089C 20                       1                 .db ' '
      00089D 20                       1                 .db ' '
      00089E 20                       1                 .db ' '
      00089F 20                       1                 .db ' '
      0008A0 20                       1                 .db ' '
      0008A1 20                       1                 .db ' '
      0008A2 A1                       5                 .db 0xa1
      0008A3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0008A4 20                       1                 .db ' '
      0008A5 20                       1                 .db ' '
      0008A6 20                       1                 .db ' '
      0008A7 20                       1                 .db ' '
      0008A8 20                       1                 .db ' '
      0008A9 20                       1                 .db ' '
      0008AA 20                       1                 .db ' '
      0008AB 20                       1                 .db ' '
      0008AC 20                       1                 .db ' '
      0008AD 20                       1                 .db ' '
      0008AE 20                       1                 .db ' '
      0008AF 20                       1                 .db ' '
      0008B0 20                       1                 .db ' '
      0008B1 20                       1                 .db ' '
      0008B2 20                       1                 .db ' '
      0008B3 20                       1                 .db ' '
      0008B4 20                       1                 .db ' '
      0008B5 20                       1                 .db ' '
      0008B6 20                       1                 .db ' '
      0008B7 20                       1                 .db ' '
      0008B8 20                       1                 .db ' '
      0008B9 20                       1                 .db ' '
      0008BA 20                       1                 .db ' '
      0008BB 20                       1                 .db ' '
      0008BC 20                       1                 .db ' '
      0008BD 20                       1                 .db ' '
      0008BE 20                       1                 .db ' '
      0008BF 20                       1                 .db ' '
      0008C0 20                       1                 .db ' '
      0008C1 20                       1                 .db ' '
      0008C2 A1                       5                 .db 0xa1
      0008C3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0008C4 20                       1                 .db ' '
      0008C5 20                       1                 .db ' '
      0008C6 20                       1                 .db ' '
      0008C7 20                       1                 .db ' '
      0008C8 20                       1                 .db ' '
      0008C9 20                       1                 .db ' '
      0008CA 20                       1                 .db ' '
      0008CB 20                       1                 .db ' '
      0008CC 20                       1                 .db ' '
      0008CD 20                       1                 .db ' '
      0008CE 20                       1                 .db ' '
      0008CF 20                       1                 .db ' '
      0008D0 20                       1                 .db ' '
      0008D1 20                       1                 .db ' '
      0008D2 20                       1                 .db ' '
      0008D3 20                       1                 .db ' '
      0008D4 20                       1                 .db ' '
      0008D5 20                       1                 .db ' '
      0008D6 20                       1                 .db ' '
      0008D7 20                       1                 .db ' '
      0008D8 20                       1                 .db ' '
      0008D9 20                       1                 .db ' '
      0008DA 20                       1                 .db ' '
      0008DB 20                       1                 .db ' '
      0008DC 20                       1                 .db ' '
      0008DD 20                       1                 .db ' '
      0008DE 20                       1                 .db ' '
      0008DF 20                       1                 .db ' '
      0008E0 20                       1                 .db ' '
      0008E1 20                       1                 .db ' '
      0008E2 A1                       5                 .db 0xa1
      0008E3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0008E4 20                       1                 .db ' '
      0008E5 20                       1                 .db ' '
      0008E6 20                       1                 .db ' '
      0008E7 20                       1                 .db ' '
      0008E8 20                       1                 .db ' '
      0008E9 20                       1                 .db ' '
      0008EA 20                       1                 .db ' '
      0008EB 20                       1                 .db ' '
      0008EC 20                       1                 .db ' '
      0008ED 20                       1                 .db ' '
      0008EE 20                       1                 .db ' '
      0008EF 20                       1                 .db ' '
      0008F0 20                       1                 .db ' '
      0008F1 20                       1                 .db ' '
      0008F2 20                       1                 .db ' '
      0008F3 20                       1                 .db ' '
      0008F4 20                       1                 .db ' '
      0008F5 20                       1                 .db ' '
      0008F6 20                       1                 .db ' '
      0008F7 20                       1                 .db ' '
      0008F8 20                       1                 .db ' '
      0008F9 20                       1                 .db ' '
      0008FA 20                       1                 .db ' '
      0008FB 20                       1                 .db ' '
      0008FC 20                       1                 .db ' '
      0008FD 20                       1                 .db ' '
      0008FE 20                       1                 .db ' '
      0008FF 20                       1                 .db ' '
      000900 20                       1                 .db ' '
      000901 20                       1                 .db ' '
      000902 A1                       5                 .db 0xa1
      000903 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000904 20                       1                 .db ' '
      000905 20                       1                 .db ' '
      000906 20                       1                 .db ' '
      000907 20                       1                 .db ' '
      000908 20                       1                 .db ' '
      000909 20                       1                 .db ' '
      00090A 20                       1                 .db ' '
      00090B 20                       1                 .db ' '
      00090C 20                       1                 .db ' '
      00090D 20                       1                 .db ' '
      00090E 20                       1                 .db ' '
      00090F 20                       1                 .db ' '
      000910 20                       1                 .db ' '
      000911 20                       1                 .db ' '
      000912 20                       1                 .db ' '
      000913 20                       1                 .db ' '
      000914 20                       1                 .db ' '
      000915 20                       1                 .db ' '
      000916 20                       1                 .db ' '
      000917 20                       1                 .db ' '
      000918 20                       1                 .db ' '
      000919 20                       1                 .db ' '
      00091A 20                       1                 .db ' '
      00091B 20                       1                 .db ' '
      00091C 20                       1                 .db ' '
      00091D 20                       1                 .db ' '
      00091E 20                       1                 .db ' '
      00091F 20                       1                 .db ' '
      000920 20                       1                 .db ' '
      000921 20                       1                 .db ' '
      000922 A1                       5                 .db 0xa1
      000923 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000924 20                       1                 .db ' '
      000925 20                       1                 .db ' '
      000926 20                       1                 .db ' '
      000927 20                       1                 .db ' '
      000928 20                       1                 .db ' '
      000929 20                       1                 .db ' '
      00092A 20                       1                 .db ' '
      00092B 20                       1                 .db ' '
      00092C 20                       1                 .db ' '
      00092D 20                       1                 .db ' '
      00092E 20                       1                 .db ' '
      00092F 20                       1                 .db ' '
      000930 20                       1                 .db ' '
      000931 20                       1                 .db ' '
      000932 20                       1                 .db ' '
      000933 20                       1                 .db ' '
      000934 20                       1                 .db ' '
      000935 20                       1                 .db ' '
      000936 20                       1                 .db ' '
      000937 20                       1                 .db ' '
      000938 20                       1                 .db ' '
      000939 20                       1                 .db ' '
      00093A 20                       1                 .db ' '
      00093B 20                       1                 .db ' '
      00093C 20                       1                 .db ' '
      00093D 20                       1                 .db ' '
      00093E 20                       1                 .db ' '
      00093F 20                       1                 .db ' '
      000940 20                       1                 .db ' '
      000941 20                       1                 .db ' '
      000942 A1                       5                 .db 0xa1
      000943 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000944 20                       1                 .db ' '
      000945 20                       1                 .db ' '
      000946 20                       1                 .db ' '
      000947 20                       1                 .db ' '
      000948 20                       1                 .db ' '
      000949 20                       1                 .db ' '
      00094A 20                       1                 .db ' '
      00094B 20                       1                 .db ' '
      00094C 20                       1                 .db ' '
      00094D 20                       1                 .db ' '
      00094E 20                       1                 .db ' '
      00094F 20                       1                 .db ' '
      000950 20                       1                 .db ' '
      000951 20                       1                 .db ' '
      000952 20                       1                 .db ' '
      000953 20                       1                 .db ' '
      000954 20                       1                 .db ' '
      000955 20                       1                 .db ' '
      000956 20                       1                 .db ' '
      000957 20                       1                 .db ' '
      000958 20                       1                 .db ' '
      000959 20                       1                 .db ' '
      00095A 20                       1                 .db ' '
      00095B 20                       1                 .db ' '
      00095C 20                       1                 .db ' '
      00095D 20                       1                 .db ' '
      00095E 20                       1                 .db ' '
      00095F 20                       1                 .db ' '
      000960 20                       1                 .db ' '
      000961 20                       1                 .db ' '
      000962 A1                       5                 .db 0xa1
      000963 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000964 20                       1                 .db ' '
      000965 20                       1                 .db ' '
      000966 20                       1                 .db ' '
      000967 20                       1                 .db ' '
      000968 20                       1                 .db ' '
      000969 20                       1                 .db ' '
      00096A 20                       1                 .db ' '
      00096B 20                       1                 .db ' '
      00096C 20                       1                 .db ' '
      00096D 20                       1                 .db ' '
      00096E 20                       1                 .db ' '
      00096F 20                       1                 .db ' '
      000970 20                       1                 .db ' '
      000971 20                       1                 .db ' '
      000972 20                       1                 .db ' '
      000973 20                       1                 .db ' '
      000974 20                       1                 .db ' '
      000975 20                       1                 .db ' '
      000976 20                       1                 .db ' '
      000977 20                       1                 .db ' '
      000978 20                       1                 .db ' '
      000979 20                       1                 .db ' '
      00097A 20                       1                 .db ' '
      00097B 20                       1                 .db ' '
      00097C 20                       1                 .db ' '
      00097D 20                       1                 .db ' '
      00097E 20                       1                 .db ' '
      00097F 20                       1                 .db ' '
      000980 20                       1                 .db ' '
      000981 20                       1                 .db ' '
      000982 A1                       5                 .db 0xa1
      000983 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      000984 20                       1                 .db ' '
      000985 20                       1                 .db ' '
      000986 20                       1                 .db ' '
      000987 20                       1                 .db ' '
      000988 20                       1                 .db ' '
      000989 20                       1                 .db ' '
      00098A 20                       1                 .db ' '
      00098B 20                       1                 .db ' '
      00098C 20                       1                 .db ' '
      00098D 20                       1                 .db ' '
      00098E 20                       1                 .db ' '
      00098F 20                       1                 .db ' '
      000990 20                       1                 .db ' '
      000991 20                       1                 .db ' '
      000992 20                       1                 .db ' '
      000993 20                       1                 .db ' '
      000994 20                       1                 .db ' '
      000995 20                       1                 .db ' '
      000996 20                       1                 .db ' '
      000997 20                       1                 .db ' '
      000998 20                       1                 .db ' '
      000999 20                       1                 .db ' '
      00099A 20                       1                 .db ' '
      00099B 20                       1                 .db ' '
      00099C 20                       1                 .db ' '
      00099D 20                       1                 .db ' '
      00099E 20                       1                 .db ' '
      00099F 20                       1                 .db ' '
      0009A0 20                       1                 .db ' '
      0009A1 20                       1                 .db ' '
      0009A2 A1                       5                 .db 0xa1
      0009A3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0009A4 20                       1                 .db ' '
      0009A5 20                       1                 .db ' '
      0009A6 20                       1                 .db ' '
      0009A7 20                       1                 .db ' '
      0009A8 20                       1                 .db ' '
      0009A9 20                       1                 .db ' '
      0009AA 20                       1                 .db ' '
      0009AB 20                       1                 .db ' '
      0009AC 20                       1                 .db ' '
      0009AD 20                       1                 .db ' '
      0009AE 20                       1                 .db ' '
      0009AF 20                       1                 .db ' '
      0009B0 20                       1                 .db ' '
      0009B1 20                       1                 .db ' '
      0009B2 20                       1                 .db ' '
      0009B3 20                       1                 .db ' '
      0009B4 20                       1                 .db ' '
      0009B5 20                       1                 .db ' '
      0009B6 20                       1                 .db ' '
      0009B7 20                       1                 .db ' '
      0009B8 20                       1                 .db ' '
      0009B9 20                       1                 .db ' '
      0009BA 20                       1                 .db ' '
      0009BB 20                       1                 .db ' '
      0009BC 20                       1                 .db ' '
      0009BD 20                       1                 .db ' '
      0009BE 20                       1                 .db ' '
      0009BF 20                       1                 .db ' '
      0009C0 20                       1                 .db ' '
      0009C1 20                       1                 .db ' '
      0009C2 A1                       5                 .db 0xa1
      0009C3 A1                       1                 .db 0xa1
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db ' '
                                      4                 .endm
      0009C4 20                       1                 .db ' '
      0009C5 20                       1                 .db ' '
      0009C6 20                       1                 .db ' '
      0009C7 20                       1                 .db ' '
      0009C8 20                       1                 .db ' '
      0009C9 20                       1                 .db ' '
      0009CA 20                       1                 .db ' '
      0009CB 20                       1                 .db ' '
      0009CC 20                       1                 .db ' '
      0009CD 20                       1                 .db ' '
      0009CE 20                       1                 .db ' '
      0009CF 20                       1                 .db ' '
      0009D0 20                       1                 .db ' '
      0009D1 20                       1                 .db ' '
      0009D2 20                       1                 .db ' '
      0009D3 20                       1                 .db ' '
      0009D4 20                       1                 .db ' '
      0009D5 20                       1                 .db ' '
      0009D6 20                       1                 .db ' '
      0009D7 20                       1                 .db ' '
      0009D8 20                       1                 .db ' '
      0009D9 20                       1                 .db ' '
      0009DA 20                       1                 .db ' '
      0009DB 20                       1                 .db ' '
      0009DC 20                       1                 .db ' '
      0009DD 20                       1                 .db ' '
      0009DE 20                       1                 .db ' '
      0009DF 20                       1                 .db ' '
      0009E0 20                       1                 .db ' '
      0009E1 20                       1                 .db ' '
      0009E2 A1                       5                 .db 0xa1
                                     43 
      0009E3 A3                      44         .db 0xa3
                                     45         .rept (BWS_LINE_WIDTH/2-3)
                                     46         .db 0xa0
                                     47         .endm
      0009E4 A0                       1         .db 0xa0
      0009E5 A0                       1         .db 0xa0
      0009E6 A0                       1         .db 0xa0
      0009E7 A0                       1         .db 0xa0
      0009E8 A0                       1         .db 0xa0
      0009E9 A0                       1         .db 0xa0
      0009EA A0                       1         .db 0xa0
      0009EB A0                       1         .db 0xa0
      0009EC A0                       1         .db 0xa0
      0009ED A0                       1         .db 0xa0
      0009EE A0                       1         .db 0xa0
      0009EF A0                       1         .db 0xa0
      0009F0 A0                       1         .db 0xa0
      0009F1 A9 20 A8                48         .db 0xa9,0x20,0xa8
                                     49         .rept (BWS_LINE_WIDTH/2-2)
                                     50         .db 0xa0
                                     51         .endm
      0009F4 A0                       1         .db 0xa0
      0009F5 A0                       1         .db 0xa0
      0009F6 A0                       1         .db 0xa0
      0009F7 A0                       1         .db 0xa0
      0009F8 A0                       1         .db 0xa0
      0009F9 A0                       1         .db 0xa0
      0009FA A0                       1         .db 0xa0
      0009FB A0                       1         .db 0xa0
      0009FC A0                       1         .db 0xa0
      0009FD A0                       1         .db 0xa0
      0009FE A0                       1         .db 0xa0
      0009FF A0                       1         .db 0xa0
      000A00 A0                       1         .db 0xa0
      000A01 A0                       1         .db 0xa0
      000A02 A5                      52         .db 0xa5
                                     53 
      000A03 A1                      54         .db 0xa1
      000A04 20 20 20 20 20 53 43    55         .ascii '     SCI     '
             49 20 20 20 20 20
      000A11 A1 20 A1                56         .db 0xa1,0x20,0xa1
      000A14 20 20 20 20 47 41 4D    57         .ascii '    GAMES     '
             45 53 20 20 20 20 20
      000A22 A1                      58         .db 0xa1
                                     59 
      000A23 A7                      60         .db 0xa7
                                     61         .rept (BWS_LINE_WIDTH/2-3)
                                     62         .db 0xa0
                                     63         .endm
      000A24 A0                       1         .db 0xa0
      000A25 A0                       1         .db 0xa0
      000A26 A0                       1         .db 0xa0
      000A27 A0                       1         .db 0xa0
      000A28 A0                       1         .db 0xa0
      000A29 A0                       1         .db 0xa0
      000A2A A0                       1         .db 0xa0
      000A2B A0                       1         .db 0xa0
      000A2C A0                       1         .db 0xa0
      000A2D A0                       1         .db 0xa0
      000A2E A0                       1         .db 0xa0
      000A2F A0                       1         .db 0xa0
      000A30 A0                       1         .db 0xa0
      000A31 A2 A0 A2                64         .db 0xa2,0xa0,0xa2
                                     65         .rept (BWS_LINE_WIDTH/2-2)
                                     66         .db 0xa0
                                     67         .endm
      000A34 A0                       1         .db 0xa0
      000A35 A0                       1         .db 0xa0
      000A36 A0                       1         .db 0xa0
      000A37 A0                       1         .db 0xa0
      000A38 A0                       1         .db 0xa0
      000A39 A0                       1         .db 0xa0
      000A3A A0                       1         .db 0xa0
      000A3B A0                       1         .db 0xa0
      000A3C A0                       1         .db 0xa0
      000A3D A0                       1         .db 0xa0
      000A3E A0                       1         .db 0xa0
      000A3F A0                       1         .db 0xa0
      000A40 A0                       1         .db 0xa0
      000A41 A0                       1         .db 0xa0
      000A42 AA                      68         .db 0xaa
                                    776 
      000A43                        777 ptr_cursor:
      000A43 CF EF                  778         .db 0xcf,0xef                               ;Oo
      000A45                        779 ptr_internal_array:
      000A45 2F 17                  780         .db 0x2f,0x17                               ;/.
      000A47                        781 points_count:
      000A47 32 00                  782         .db 0x32,0x00                               ;2.
      000A49                        783 mines_count:
      000A49 4B 00                  784         .db 0x4b,0x00                               ;K.
      000A4B                        785 ptr_log_buffer:
      000A4B FF 1F                  786         .db 0xff,0x1f                               ;..
      000A4D                        787 ptr_random_buffer:
      000A4D BE 14                  788         .db 0xbe,0x14                               ;>.
      000A4F                        789 last_joystick:
      000A4F 00                     790         .db 0x00
      000A50                        791 str_vorsicht_minen:
      000A50 56 4F 52 53 49 43 48   792         .ascii 'VORSICHT   MINE/N'
             54 20 20 20 4D 49 4E
             45 2F 4E
                           000011   793 len_vorsicht_minen .equ .-str_vorsicht_minen
      000A61                        794 str_sie_haben:
      000A61 53 49 45 20 20 20 20   795         .ascii 'SIE    HABEN'
             48 41 42 45 4E
      000A6D                        796 str_punkte_erreicht:
      000A6D 50 55 4E 4B 54 45 20   797         .ascii 'PUNKTE    ERREICHT'
             20 20 20 45 52 52 45
             49 43 48 54
      000A7F                        798 str_noch_ein_spiel:
      000A7F 4E 4F 43 48 20 45 49   799         .ascii 'NOCH EIN SPIEL ?'
             4E 20 53 50 49 45 4C
             20 3F
      000A8F                        800 txt_title:
      00098F                        801         TITLE_IMG_CONTENT
      000A8F AE 9E 9E 9E 9E 9E 9E     1         .ascii '\256\236\236\236\236\236\236\236\236\236\255           \212   \212\212  \212 '
             9E 9E 9E AD 20 20 20
             20 20 20 20 20 20 20
             20 8A 20 20 20 8A 8A
             20 20 8A 20
      000AAF 9F B9 B6 B3 B2 B6 B8     2         .ascii '\237\271\266\263\262\266\270 \275\260\300          \212 \212\222\223\236\236\226\225\212\212'
             20 BD B0 C0 20 20 20
             20 20 20 20 20 20 20
             8A 20 8A 92 93 9E 9E
             96 95 8A 8A
      000ACF 9F B8 B7 20 B5 20 20     3         .db 0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
             20
      000AD7 B5 20 C0 20 20 20 20     4         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000ADF 20 20 20 20 20 8A 20     5         .db 0x20,0x20,0x20,0x20,0x20,0x8a,0x20,0x99 ;     . .
             99
      000AE7 20 20 20 20 20 20 9B     6         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x9b,0x20 ;      . 
             20
      000AEF 9F B3 20 B4 B5 20 B2     7         .db 0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
             20
      000AF7 B5 20 C0 20 20 20 20     8         .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
             20
      000AFF 20 20 20 20 20 20 20     9         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x98 ;       .
             98
      000B07 20 C9 20 20 C9 20 9C    10         .db 0x20,0xc9,0x20,0x20,0xc9,0x20,0x9c,0x20 ; I  I . 
             20
      000B0F 9F B1 B6 20 20 B6 B0    11         .db 0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
             20
      000B17 B6 B0 C0 20 92 93 9E    12         .db 0xb6,0xb0,0xc0,0x20,0x92,0x93,0x9e,0x9e ;60@ ....
             9E
      000B1F 96 95 20 20 20 20 20    13         .db 0x96,0x95,0x20,0x20,0x20,0x20,0x20,0x9f ;..     .
             9F
      000B27 20 20 86 87 20 20 C0    14         .db 0x20,0x20,0x86,0x87,0x20,0x20,0xc0,0x20 ;  ..  @ 
             20
      000B2F 9F 70 72 65 73 65 6E    15         .db 0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
             74
      000B37 73 3A C0 99 20 20 20    16         .db 0x73,0x3a,0xc0,0x99,0x20,0x20,0x20,0x20 ;s:@.    
             20
      000B3F 20 20 9B 20 20 20 20    17         .db 0x20,0x20,0x9b,0x20,0x20,0x20,0x20,0x9b ;  .    .
             9B
      000B47 20 20 85 84 20 20 99    18         .db 0x20,0x20,0x85,0x84,0x20,0x20,0x99,0x20 ;  ..  . 
             20
      000B4F AB F8 F8 F8 F8 F8 F8    19         .db 0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
             F8
      000B57 F8 F8 AC 98 20 C9 20    20         .db 0xf8,0xf8,0xac,0x98,0x20,0xc9,0x20,0x20 ;xx,. I  
             20
      000B5F C9 20 9C 20 20 20 20    21         .db 0xc9,0x20,0x9c,0x20,0x20,0x20,0x20,0x9c ;I .    .
             9C
      000B67 20 86 92 95 87 20 98    22         .db 0x20,0x86,0x92,0x95,0x87,0x20,0x98,0x20 ; .... . 
             20
      000B6F 20 20 20 20 20 20 20    23         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B77 20 20 20 9F 20 20 86    24         .db 0x20,0x20,0x20,0x9f,0x20,0x20,0x86,0x87 ;   .  ..
             87
      000B7F 20 20 C0 20 20 20 20    25         .db 0x20,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;  @     
             20
      000B87 96 95 F8 F8 92 93 20    26         .db 0x96,0x95,0xf8,0xf8,0x92,0x93,0x20,0x20 ;..xx..  
             20
      000B8F 20 20 20 20 20 20 20    27         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000B97 20 20 20 9B 20 20 85    28         .db 0x20,0x20,0x20,0x9b,0x20,0x20,0x85,0x84 ;   .  ..
             84
      000B9F 20 20 99 20 20 20 20    29         .db 0x20,0x20,0x99,0x20,0x20,0x20,0x20,0x20 ;  .     
             20
      000BA7 20 20 9F C0 20 20 20    30         .db 0x20,0x20,0x9f,0xc0,0x20,0x20,0x20,0x20 ;  .@    
             20
      000BAF 20 4E 6F 77 20 79 6F    31         .db 0x20,0x4e,0x6f,0x77,0x20,0x79,0x6f,0x75 ; Now you
             75
      000BB7 20 20 20 9C 20 85 95    32         .db 0x20,0x20,0x20,0x9c,0x20,0x85,0x95,0x92 ;   . ...
             92
      000BBF 84 20 98 20 20 20 20    33         .db 0x84,0x20,0x98,0x20,0x20,0x20,0x20,0x20 ;. .     
             20
      000BC7 20 DF 9F C0 DC 20 20    34         .db 0x20,0xdf,0x9f,0xc0,0xdc,0x20,0x20,0x20 ; _.@\   
             20
      000BCF 20 20 20 20 20 20 20    35         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000BD7 20 20 20 20 96 95 F8    36         .db 0x20,0x20,0x20,0x20,0x96,0x95,0xf8,0xf8 ;    ..xx
             F8
      000BDF 92 93 20 20 20 20 20    37         .db 0x92,0x93,0x20,0x20,0x20,0x20,0x20,0x20 ;..      
             20
      000BE7 20 20 20 20 20 20 20    38         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000BEF 20 61 72 65 20 68 61    39         .db 0x20,0x61,0x72,0x65,0x20,0x68,0x61,0x70 ; are hap
             70
      000BF7 70 79 20 DB F8 90 20    40         .db 0x70,0x79,0x20,0xdb,0xf8,0x90,0x20,0x20 ;py [x.  
             20
      000BFF 9E 96 D8 20 20 20 62    41         .db 0x9e,0x96,0xd8,0x20,0x20,0x20,0x62,0x75 ;..X   bu
             75
      000C07 74 20 62 65 20 20 20    42         .db 0x74,0x20,0x62,0x65,0x20,0x20,0x20,0x20 ;t be    
             20
      000C0F 20 20 20 20 20 20 20    43         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C17 20 20 20 20 20 20 20    44         .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
             20
      000C1F 20 B7 FF FF B7 20 20    45         .db 0x20,0xb7,0xff,0xff,0xb7,0x20,0x20,0x63 ; 7..7  c
             63
      000C27 61 72 65 66 75 6C 6C    46         .db 0x61,0x72,0x65,0x66,0x75,0x6c,0x6c,0x21 ;arefull!
             21
      000C2F 20 20 20 20 20 20 20    47         .ascii '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000C4F 20 20 20 20 20 20 20    48         .ascii '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000C6F 20 20 20 20 B2 20 B2    49         .db 0x20,0x20,0x20,0x20,0xb2,0x20,0xb2,0x20 ;    2 2 
             20
      000C77 B3 20 20 20 20 20 20    50         .db 0xb3,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;3       
             20
      000C7F B2 B3 B3 20 20 20 B2    51         .db 0xb2,0xb3,0xb3,0x20,0x20,0x20,0xb2,0x20 ;233   2 
             20
      000C87 20 20 B3 20 20 20 20    52         .db 0x20,0x20,0xb3,0x20,0x20,0x20,0x20,0x20 ;  3     
             20
      000C8F 20 B8 20 20 B5 B8 BD    53         .db 0x20,0xb8,0x20,0x20,0xb5,0xb8,0xbd,0x20 ; 8  58= 
             20
      000C97 B3 B2 B2 20 20 B7 B3    54         .db 0xb3,0xb2,0xb2,0x20,0x20,0xb7,0xb3,0x20 ;322  73 
             20
      000C9F B4 20 B3 20 B7 B3 B5    55         .db 0xb4,0x20,0xb3,0x20,0xb7,0xb3,0xb5,0x20 ;4 3 735 
             20
      000CA7 B2 B7 B4 20 B2 B0 20    56         .db 0xb2,0xb7,0xb4,0x20,0xb2,0xb0,0x20,0x20 ;274 20  
             20
      000CAF 20 B2 B0 20 B5 20 B5    57         .db 0x20,0xb2,0xb0,0x20,0xb5,0x20,0xb5,0x20 ; 20 5 5 
             20
      000CB7 B4 B5 B0 B4 B5 B7 B9    58         .db 0xb4,0xb5,0xb0,0xb4,0xb5,0xb7,0xb9,0xb1 ;45045791
             B1
      000CBF BC 20 B4 B5 B7 B9 B5    59         .db 0xbc,0x20,0xb4,0xb5,0xb7,0xb9,0xb5,0x20 ;< 45795 
             20
      000CC7 B4 20 B4 20 B8 20 20    60         .db 0xb4,0x20,0xb4,0x20,0xb8,0x20,0x20,0x20 ;4 4 8   
             20
      000CCF 20 B0 20 20 B5 20 B5    61         .db 0x20,0xb0,0x20,0x20,0xb5,0x20,0xb5,0xb2 ; 0  5 52
             B2
      000CD7 BB B5 20 BB B1 B7 B7    62         .db 0xbb,0xb5,0x20,0xbb,0xb1,0xb7,0xb7,0x20 ;;5 ;177 
             20
      000CDF B4 B2 BB B1 B7 B7 B5    63         .db 0xb4,0xb2,0xbb,0xb1,0xb7,0xb7,0xb5,0xb3 ;42;17753
             B3
      000CE7 B8 B7 B4 20 20 B0 20    64         .db 0xb8,0xb7,0xb4,0x20,0x20,0xb0,0x20,0x20 ;874  0  
             20
      000CEF 20 20 20 20 20 20 20    65         .ascii '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000D0F 20 20 66 75 65 72 20    66         .ascii '  fuer Brosig, A2 und Joystick  '
             42 72 6F 73 69 67 2C
             20 41 32 20 75 6E 64
             20 4A 6F 79 73 74 69
             63 6B 20 20
      000D2F 20 20 20 20 20 20 20    67         .ascii '                         PA01/88'
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 50 41 30
             31 2F 38 38
      000D4F 20 20 20 20 20 20 20    68         .ascii '        S   - START             '
             20 53 20 20 20 2D 20
             53 54 41 52 54 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000D6F 20 20 20 20 20 20 20    69         .ascii '        G \235 - AUFWAERTS         '
             20 47 20 9D 20 2D 20
             41 55 46 57 41 45 52
             54 53 20 20 20 20 20
             20 20 20 20
      000D8F 20 20 20 20 20 20 20    70         .ascii '        O \232 - ABWAERTS          '
             20 4F 20 9A 20 2D 20
             41 42 57 41 45 52 54
             53 20 20 20 20 20 20
             20 20 20 20
      000DAF 20 20 20 20 20 20 20    71         .ascii '        P \224 - LINKS             '
             20 50 20 94 20 2D 20
             4C 49 4E 4B 53 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000DCF 20 20 20 20 20 20 20    72         .ascii '        Q \227 - RECHTS            '
             20 51 20 97 20 2D 20
             52 45 43 48 54 53 20
             20 20 20 20 20 20 20
             20 20 20 20
      000DEF 20 20 20 20 20 20 20    73         .ascii '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000E0F 20 20 20 20 20 20 20    74         .ascii '                                '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20
      000E2F 20 43 2D 31 39 38 37    75         .ascii ' C-1987 SOFTWARE CENTER ILMENAU '
             20 53 4F 46 54 57 41
             52 45 20 43 45 4E 54
             45 52 20 49 4C 4D 45
             4E 41 55 20
      000E4F 20 20 20 20 20 20 62    76         .ascii '      by DIRK STREHLE           '
             79 20 44 49 52 4B 20
             53 54 52 45 48 4C 45
             20 20 20 20 20 20 20
             20 20 20 20
      000E6F 20 32 30 31 37 20 4D    77         .ascii ' 2017 MOD by Andreas Ziermann    '
             4F 44 20 62 79 20 41
             6E 64 72 65 61 73 20
             5A 69 65 72 6D 61 6E
             6E 20 20 20 20
                                    802 ;
                                    803 ;
                                    804 ;
                                    805 	.area _DATA 
      000E90                        806 INTERNAL_ARRAY:
      000E90                        807         .ds BWS_LINE_WIDTH*MINEFIELD_ARRAY_HEIGHT
      0011D0                        808 LOG_BUFFER:
      0011D0                        809         .ds 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

  0 $click_keep_level                                              0004A5 GR
  0 $click_next_period                                             0004A3 GR
  0 $correct_ptr                                                   000293 GR
  0 $draw_character                                                00027F GR
  0 $get_character                                                 000275 GR
  0 $put_mine                                                      0003AF GR
  0 $show_new_line                                                 000273 GR
  0 $sub_line_width_down                                           000125 GR
  0 $sub_line_width_up                                             0000F1 GR
    .__.$$$.                                                    =  002710 GL
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 GL
    .__.H$L.                                                    =  000000 GL
    BLINK_COUNTER                                               =  00000A G
    BWS                                                         =  00EC00 G
    BWS_ADR_BONUS_L                                             =  00EE06 G
    BWS_ADR_BONUS_R                                             =  00EE19 G
    BWS_ADR_HINT                                                =  00EC67 G
    BWS_ADR_MINES                                               =  00EC29 G
    BWS_ADR_POINTS                                              =  00EC39 G
    BWS_A_JA                                                    =  00EECE G
    BWS_A_NOCH_EIN                                              =  00EE88 G
    BWS_A_PUNKTE_ER                                             =  00EDA7 G
    BWS_A_SIE_HABEN                                             =  00ED2A G
    BWS_A_TOTAL_POI                                             =  00ED6D G
    BWS_HEIGHT                                                  =  000020 G
    BWS_LINE_WIDTH                                              =  000020 G
    BWS_SIZE                                                    =  000400 G
    CHR_BONUS                                                   =  0000CA G
    CHR_FREE                                                    =  000020 G
    CHR_MAN                                                     =  000017 G
    CHR_MINE                                                    =  0000C9 G
    CHR_VISITED                                                 =  0000FF G
    CUT_OFF                                                     =  0002A0 G
    DEBUG                                                       =  000000 G
    END_COLUMN                                                  =  00000F G
    END_ROW                                                     =  000005 G
    END_SCREEN_CORRECTION                                       =  000009 G
  1 INTERNAL_ARRAY                                                 000000 GR
  1 INT_ADR_BONUS_L                                             =  000166 GR
  1 INT_ADR_BONUS_R                                             =  000179 GR
    IS_FREE                                                     =  000000 G
    IS_MINE                                                     =  000064 G
    KEY_CODE                                                    =  000004 G
    KEY_DOWN                                                    =  00004F G
    KEY_LEFT                                                    =  000050 G
    KEY_NEXT                                                    =  000001 G
    KEY_QUIT                                                    =  000003 G
    KEY_RIGHT                                                   =  000051 G
    KEY_START                                                   =  000053 G
    KEY_UP                                                      =  000047 G
  1 LOG_BUFFER                                                     000340 GR
  1 LOG_BUFFER_INIT                                             =  00033F GR
    MINEFIELD_ARRAY_HEIGHT                                      =  00001A G
    MINEFIELD_WIDTH                                             =  00001E G
    NO_MINE                                                     =  000000 G
    PIOB_DATA                                                   =  000002 G
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
    START_COLUMN                                                =  00000F G
    START_ROW                                                   =  00001E G
    TAPE_OUT                                                    =  000080 G
    UP_INKEY                                                    =  000004 G
    UP_PRST7                                                    =  000002 G
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
  0 add_bonus_down                                                 00012D GR
  0 add_bonus_left                                                 0001CE GR
  0 add_bonus_right                                                000180 GR
  0 add_bonus_up                                                   0000A0 GR
  0 animate$delay_free                                             00024A GR
  0 animate$delay_visited                                          00023F GR
  0 animate_down                                                   000393 GR
  0 animate_end                                                    000239 GR
  0 animate_left                                                   0003A3 GR
  0 animate_recording                                              000365 GR
  0 animate_right                                                  00039B GR
  0 animate_up                                                     00038A GR
  0 append_key                                                     0002D6 GR
  0 check_for_bonus                                                00031B GR
  0 clear_data                                                     000337 GR
  0 clear_screen                                                   00021D GR
  0 clear_status_line                                              0002C7 GR
  0 click_sound                                                    00049F GR
  0 continue_up                                                    0000AD GR
  0 convert$hex_to_ascii                                           0002BB GR
  0 convert$sub_digit                                              0002B4 GR
  0 convert_digit_to_ascii                                         0002B3 GR
  0 count_mines                                                    0000DA GR
  0 distribute$is_smaller                                          0003C3 GR
  0 distribute$new_number                                          0003B0 GR
  0 distribute_mines                                               0003AB GR
  0 do_down                                                        000109 GR
  0 do_left                                                        0001A9 GR
  0 do_quit                                                        0003E3 GR
  0 do_right                                                       00015B GR
  0 do_skip_level                                                  0001F7 GR
  0 do_up                                                          00007F GR
  0 go_next                                                        000406 GR
  0 hex2int                                                        000299 GR
  0 joystick                                                       000512 GR
  0 joystick_init                                                  000532 GR
  0 kill_all_and_halt                                              000449 GR
  0 last_joystick                                                  00094F GR
    len_vorsicht_minen                                          =  000011 G
  0 line_correction_ptr                                            000291 GR
  0 main_loop                                                      000052 GR
  0 mines_count                                                    000949 GR
  0 new_game                                                       00000D GR
    ofs_minen                                                   =  000029 G
    ofs_points                                                  =  000039 G
    ofs_vorsicht                                                =  000067 G
  0 points_count                                                   000947 GR
  0 points_plus_25                                                 000351 GR
  0 points_plus_50                                                 000346 GR
  0 print_mines_count                                              0002E2 GR
  0 ptr_cursor                                                     000943 GR
  0 ptr_internal_array                                             000945 GR
  0 ptr_log_buffer                                                 00094B GR
  0 ptr_random_buffer                                              00094D GR
  0 quit$play_effect1                                              00046E GR
  0 quit$play_effect2                                              000487 GR
  0 quit$play_half_wave1                                           00047B GR
  0 quit$play_half_wave2                                           000494 GR
  0 quit$play_period1                                              00046F GR
  0 quit$play_period2                                              000488 GR
  0 quit_sound                                                     000468 GR
  0 rand16                                                         0004B2 GR
  0 rand16$write_seed                                              0004C6 GR
  0 recording$delay                                                000369 GR
  0 seed                                                           0004CA GR
  0 show_empty_field                                               000256 GR
  0 show_mine_field                                                000268 GR
  0 show_points_plus_100                                           0002F8 GR
  0 show_recording_history                                         00035C GR
  0 show_title                                                     00030F GR
  0 show_win_animation                                             000233 GR
    size_of_noch_ein_spiel                                      =  000010 G
    size_of_punkte_erreich                                      =  000012 G
    size_of_sie_haben                                           =  00000C G
    size_of_vorsicht_minen                                      =  000014 G
  0 start_level                                                    00001C GR
  0 str_noch_ein_spiel                                             00097F GR
  0 str_punkte_erreicht                                            00096D GR
  0 str_sie_haben                                                  000961 GR
  0 str_vorsicht_minen                                             000950 GR
    ta_alpha                                                    =  000000 G
  0 test_end_down                                                  000130 GR
  0 test_end_left                                                  0001D1 GR
  0 test_end_right                                                 000183 GR
  0 test_end_up                                                    0000A3 GR
  0 test_inc_mine_count                                            000103 GR
  0 txt_empty_screen                                               000543 GR
  0 txt_title                                                      00098F GR
  0 up_inch                                                        0004CC GR
  0 up_inch$debounce1                                              000509 GR
  0 up_inch$end                                                    000501 GR
  0 up_inch$fire                                                   0004FB GR
  0 up_inch$is_down                                                0004E3 GR
  0 up_inch$is_left                                                0004EA GR
  0 up_inch$is_right                                               0004F1 GR
  0 up_inch$is_start                                               0004F8 GR
  0 up_inch$is_up                                                  0004DC GR
  0 up_inch$joystick                                               000502 GR
  0 up_inch$test_down                                              0004DF GR
  0 up_inch$test_enter                                             0004F4 GR
  0 up_inch$test_left                                              0004E6 GR
  0 up_inch$test_right                                             0004ED GR
  0 update_screen_down                                             000146 GR
  0 update_screen_left                                             0001E2 GR
  0 update_screen_right                                            000194 GR
  0 update_screen_up                                               0000C5 GR
  0 wait                                                           0002C1 GR
  0 wait_to_start                                                  000006 GR
    z1013                                                       =  000000 G
    z9001                                                       =  000001 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    D90   flags    0
   1 _DATA                                      size    341   flags    0


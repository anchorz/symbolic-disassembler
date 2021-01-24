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
                           000000     2 z1013                           =       0
                           000001     3 ta_alpha                        =       1
                                      4 ;
                                      5 ; ta os specific constants
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
                           000028    19 BWS_LINE_WIDTH                  =       40
                           000018    20 BWS_HEIGHT                      =       24
                           0003C0    21 BWS_SIZE                        =       40*24
                                     22 
                           00000C    23 VK_CLS                          =       0x0c
                           00000D    24 VK_ENTER                        =       0x0d
                           00001D    25 VK_LEFT                         =       0x1d
                           00001C    26 VK_RIGHT                        =       0x1c
                           00001E    27 VK_UP                           =       0x1e
                           00001F    28 VK_DOWN                         =       0x1f
                                     29 
                           000000    30 FG_BLACK                        =       0
                           000001    31 FG_BLUE                         =       1
                           000002    32 FG_RED                          =       2
                           000003    33 FG_MAGENTA                      =       3
                           000004    34 FG_GREEN                        =       4
                           000005    35 FG_CYAN                         =       5
                           000006    36 FG_YELLOW                       =       6
                           000007    37 FG_WHITE                        =       7
                           000000    38 BG_BLACK                        =       0*8
                           000008    39 BG_BLUE                         =       1*8
                           000010    40 BG_RED                          =       2*8
                           000018    41 BG_MAGENTA                      =       3*8
                           000020    42 BG_GREEN                        =       4*8
                           000028    43 BG_CYAN                         =       5*8
                           000030    44 BG_YELLOW                       =       6*8
                           000038    45 BG_WHITE                        =       7*8
                                     46 ;
                                     47 ; application specific constants
                                     48 ;
                           0000FD    49 CHR_MAN                         =       0xfd
                           0000EE    50 CHR_VISITED                     =       0xee
                           000020    51 CHR_FREE                        =       ' '
                           0000FA    52 CHR_BONUS                       =       0xfa
                           0000F1    53 CHR_MINE                        =       0xf1
                           000002    54 END_ROW                         =       2
                           000005    55 END_SCREEN_CORRECTION           =       5 ; starting line of the text
                           000016    56 START_ROW                       =       BWS_HEIGHT-2
                           000013    57 START_COLUMN                    =       (BWS_LINE_WIDTH/2)-1
                           000013    58 END_COLUMN                      =       (BWS_LINE_WIDTH/2)-1
                           0002A8    59 CUT_OFF                         =       (START_ROW-END_ROW-3)*BWS_LINE_WIDTH
                                     60 
                                     61 .macro  PROGRAM_HEADER
                                     62         ld      hl,#s__CODE
                                     63         ld      de,#s__CODE
                                     64         ld      bc,#l__CODE
                                     65         ldir
                                     66         ld      hl,#cfg10_settings
                                     67         res     6,(hl)                                  ;ROM_PACK_EN=0
                                     68         ld      a,(hl)
                                     69         out     (CFG10),a
                                     70         call    crt_cls
                                     71         call    crt_cursor_disable
                                     72 .endm
                                     73 
                                     74 .macro  JOYSTICK_INIT
                                     75 .endm
                                     76 
                                     77 .macro  FILL_BACKGROUND_COLOR
                                     78         ld hl,#BWS+OFFSET_COLOR
                                     79         ld de,#BWS+OFFSET_COLOR-1
                                     80         ld bc,#BWS_SIZE-1
                                     81         ld a,#FG_WHITE|BG_BLACK
                                     82         ld (hl),a
                                     83         ldir
                                     84 .endm
                                     85 
                                     86 .macro  END_MESSAGE
                                     87         jp      exit
                                     88 .endm
                                     89 
                                     90 .macro  QUIT_SOUND
                                     91 .endm
                                     92 
                                     93 .macro  CLICK_SOUND
                                     94 .endm
                                     95 
                                     96 .macro  INKEY
                                     97         call    inkey
                                     98         or      a
                                     99         jr      z,up_inch
                                    100 .endm
                                    101 
                                    102 .macro  JOYSTICK
                                    103 .endm
                                    104 
                                    105 .macro  TXT_MINES
                                    106         .ascii 'MINEN:'
                                    107 .endm
                                    108 
                                    109 .macro  TXT_PUNKTE
                                    110         .ascii '     PUNKTE:'
                                    111 .endm
                                    112 
                                    113 .macro  TXT_EMPTY_SCREEN
                                    114         .ascii '     '
                                    115 ofs_vorsicht   .equ .-txt_empty_screen
                                    116         .ascii '                 '
                                    117         .db 0xe0
                                    118         .rept (BWS_LINE_WIDTH/2-3)
                                    119         .db 0xe4
                                    120         .endm
                                    121         .db 0xea,0xe4,0xea
                                    122         .rept (BWS_LINE_WIDTH/2-2)
                                    123         .db 0xe4
                                    124         .endm
                                    125         .db 0xe1
                                    126 
                                    127         .db 0xe8
                                    128         .rept (BWS_LINE_WIDTH/2-3)
                                    129         .db 0xe4
                                    130         .endm
                                    131         .db 0xe3,0x20,0xe2
                                    132         .rept (BWS_LINE_WIDTH/2-2)
                                    133         .db 0xe4
                                    134         .endm
                                    135         .db 0xe9
                                    136 
                                    137         .rept (BWS_HEIGHT-5)
                                    138                 .db 0xe5
                                    139                 .rept (BWS_LINE_WIDTH-2)
                                    140                 .db 0x20
                                    141                 .endm
                                    142                 .db 0xe5
                                    143         .endm
                                    144 
                                    145         .db 0xe8
                                    146         .rept (BWS_LINE_WIDTH/2-3)
                                    147         .db 0xe4
                                    148         .endm
                                    149         .db 0xe1,0x20,0xe0
                                    150         .rept (BWS_LINE_WIDTH/2-2)
                                    151         .db 0xe4
                                    152         .endm
                                    153         .db 0xe9
                                    154 
                                    155         .db 0xe2
                                    156         .rept (BWS_LINE_WIDTH/2-3)
                                    157         .db 0xe4
                                    158         .endm
                                    159         .db 0xeb,0xe4,0xeb
                                    160         .rept (BWS_LINE_WIDTH/2-2)
                                    161         .db 0xe4
                                    162         .endm
                                    163         .db 0xe3
                                    164 .endm
                                    165 
                                    166 .macro TITLE_IMG_CONTENT
                                    167         .ascii '\340\344\344\344\344\344\344\344\344\344\341\040\040\040\040\040\040\040\040   \331   \331\331  \331         '
                                    168         .ascii '\345\227\003\011\227\003\011\040\224\027\345\040\040\040\040\040\040\040\040  \331 \331\237\014\003\003\014\020\331\331        '
                                    169         .ascii '\345\012\217\020\225\040\040\040\225\025\345\040\040\040\040\040\040\040\040  \331 \227\001\040\040\040\040\002\024\040        '
                                    170         .ascii '\345\237\040\225\225\040\237\040\225\025\345\040\040\040\040\040\040\040\040  \040 \025\040\361\040\040\361\040\225\040S Start '
                                    171         .ascii '\345\002\014\006\002\014\006\040\016\015\345\040\237\014\003\003\014\020\040  \040 \012\020\040\340\341\040\237\005\040        '
                                    172         .ascii                            '\345presents:\345\227\001\040\040\040\040\002\024  \040 \040\002\014\217\217\014\001\040\040\334 Hoch  '
                                    173         .ascii '\342\344\344\344\344\344\344\344\344\344\343\025\040\361\040\040\361\040\225  \040 \040\040\225\040\040\025\040\040\040        '
                                    174         .ascii '\040\040\040\040\040\040\040\040\040\040\040\012\020\040\342\343\040\237\005  \040 \040\040\205\040\040\212\040\040\040\333 Runter'
                                    175         .ascii '\040\040\040\040\040\040\040\040\040\040\040\040\002\014\217\217\014\001                      '
                                    176         .ascii ' Now you     \032  \212\217              \335 Links '
                                    177         .ascii '            \003    \367\366                     '
                                    178         .ascii ' are happy      \367\337\337\366  but be    \336 Rechts'
                                    179         .ascii '                       carefull!        '
                                    180         .ascii '                                        '
                                    181         .ascii '                                        '
                                    182         .ascii '     \040\040 \237\040\237\040\040\040\040\040\040\040\040\040\237\020\040\040\040\040\237\040\040\040\020\040\040\040      ' 
                                    183         .ascii '     \233\040 \225\011\224\040\021\237\237\040\040\217\020\040\025\040\021\040\217\020\225\040\237\217\025\040\040\030      '
                                    184         .ascii '     \040\031 \225\040\225\040\025\225\001\025\225\217\032\012\027\040\025\225\217\032\225\040\025\040\025\040\231\040      '
                                    185         .ascii '     \006\040 \225\040\225\237\212\225\040\212\012\217\217\040\025\237\212\012\217\217\225\020\232\217\025\040\040\011      '
                                    186         .ascii '                                        '
                                    187         .ascii '                                        '
                                    188         .ascii '     C-1987 SOFTWARE CENTER ILMENAU     '
                                    189         .ascii '          by DIRK STREHLE               '
                                    190         .ascii '      2020 MOD by Andreas Ziermann      '
                                    191 .endm
                                     11         
                                     12         .globl  _main
                                     13 
                           000347    14 LOG_BUFFER_INIT        .equ (LOG_BUFFER-1)
                                     15 
                           00F006    16 BWS_ADR_MINES          .equ BWS+ofs_minen
                           00F012    17 BWS_ADR_POINTS         .equ BWS+ofs_points
                           00F017    18 BWS_ADR_HINT           .equ BWS+ofs_vorsicht
                                     19 
                           00F0D2    20 BWS_A_SIE_HABEN        .equ BWS+(END_SCREEN_CORRECTION*BWS_LINE_WIDTH+10)
                           00F125    21 BWS_A_TOTAL_POI        .equ BWS+((END_SCREEN_CORRECTION+2)*BWS_LINE_WIDTH+13)
                           00F16F    22 BWS_A_PUNKTE_ER        .equ BWS+((END_SCREEN_CORRECTION+4)*BWS_LINE_WIDTH+7)
                           00F288    23 BWS_A_NOCH_EIN         .equ BWS+((END_SCREEN_CORRECTION+11)*BWS_LINE_WIDTH+8)
                           00F2DE    24 BWS_A_JA               .equ BWS+((END_SCREEN_CORRECTION+13)*BWS_LINE_WIDTH+14)
                                     25 
                           00F1C0    26 BWS_ADR_BONUS_L        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
                           00F1D7    27 BWS_ADR_BONUS_R        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)
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
      00A00F                         67 _main:
      000000                         68         PROGRAM_HEADER
      00A00F 21 00 A0         [10]    1         ld      hl,#s__CODE
      00A012 11 00 A0         [10]    2         ld      de,#s__CODE
      00A015 01 1F 0E         [10]    3         ld      bc,#l__CODE
      00A018 ED B0            [21]    4         ldir
      00A01A 21 68 E4         [10]    5         ld      hl,#cfg10_settings
      00A01D CB B6            [15]    6         res     6,(hl)                                  ;ROM_PACK_EN=0
      00A01F 7E               [ 7]    7         ld      a,(hl)
      00A020 D3 10            [11]    8         out     (CFG10),a
      00A022 CD E8 E9         [17]    9         call    crt_cls
      00A025 CD D5 AD         [17]   10         call    crt_cursor_disable
      000019                         69         JOYSTICK_INIT
      00A028 CD 34 A3         [17]   70         call show_title
      00A02B                         71 wait_to_start:
      00A02B CD 9B A4         [17]   72         call up_inch
      00A02E FE 53            [ 7]   73         cp #KEY_START
      00A030 20 F9            [12]   74         jr nz,wait_to_start
      00A032                         75 new_game:
      00A032 CD 6A A3         [17]   76         call clear_data
      00A035 21 00 00         [10]   77         ld hl,#SET_TO_ZERO
      00A038 22 92 A8         [16]   78         ld (points_count),hl
      00A03B 21 32 00         [10]   79         ld hl,#50
      00A03E 22 94 A8         [16]   80         ld (mines_count),hl
      00A041                         81 start_level:
      00A041 21 83 F3         [10]   82         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      00A044 22 8E A8         [16]   83         ld (ptr_cursor),hl
      00A047 21 33 83         [10]   84         ld hl,#INTERNAL_ARRAY+(START_ROW-END_ROW)*BWS_LINE_WIDTH+START_COLUMN
      00A04A 22 90 A8         [16]   85         ld (ptr_internal_array),hl
      00A04D 21 47 83         [10]   86         ld hl,#LOG_BUFFER_INIT
      00A050 22 96 A8         [16]   87         ld (ptr_log_buffer),hl
      00A053 CD 42 A2         [17]   88         call clear_screen
      00A056 CD 7B A2         [17]   89         call show_empty_field
      00A059 21 83 F3         [10]   90         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      00A05C 3E FD            [ 7]   91         ld a,#CHR_MAN
      00A05E 77               [ 7]   92         ld (hl),a
      00A05F 2A 92 A8         [16]   93         ld hl,(points_count)
      00A062 11 12 F0         [10]   94         ld de,#BWS_ADR_POINTS
      00A065 CD BE A2         [17]   95         call hex2int
      00A068 2A 94 A8         [16]   96         ld hl,(mines_count)
      00A06B 11 06 F0         [10]   97         ld de,#BWS_ADR_MINES
      00A06E CD BE A2         [17]   98         call hex2int
      00A071 CD 4E A3         [17]   99         call check_for_bonus
      00A074 CD DE A3         [17]  100         call distribute_mines
      00A077                        101 main_loop:
      00A077 CD 9B A4         [17]  102         call up_inch
      00A07A FE 47            [ 7]  103         cp #KEY_UP
      00A07C CC A4 A0         [17]  104         call z,do_up
      00A07F FE 4F            [ 7]  105         cp #KEY_DOWN
      00A081 CC 2E A1         [17]  106         call z,do_down
      00A084 FE 51            [ 7]  107         cp #KEY_RIGHT
      00A086 CC 80 A1         [17]  108         call z,do_right
      00A089 FE 50            [ 7]  109         cp #KEY_LEFT
      00A08B CC CE A1         [17]  110         call z,do_left
      00A08E CD 80 A4         [17]  111         call click_sound
      00A091 FE 03            [ 7]  112         cp #KEY_QUIT
      00A093 CA 16 A4         [10]  113         jp z,do_quit
      00A096 FE 01            [ 7]  114         cp #KEY_NEXT
      00A098 CA 1C A2         [10]  115         jp z,do_skip_level
      00A09B 01 20 4E         [10]  116         ld bc,#WAIT_250MS
      00A09E CD E6 A2         [17]  117         call wait
      00A0A1 C3 77 A0         [10]  118         jp main_loop
      00A0A4                        119 do_up:
      00A0A4 CD EC A2         [17]  120         call clear_status_line
      00A0A7 2A 8E A8         [16]  121         ld hl,(ptr_cursor)
      00A0AA 3E EE            [ 7]  122         ld a,#CHR_VISITED
      00A0AC 77               [ 7]  123         ld (hl),a
      00A0AD 01 28 00         [10]  124         ld bc,#BWS_LINE_WIDTH
      00A0B0 ED 42            [15]  125         sbc hl,bc
      00A0B2 7E               [ 7]  126         ld a,(hl)
      00A0B3 FE 20            [ 7]  127         cp #CHR_FREE
      00A0B5 28 11            [12]  128         jr z,test_end_up
      00A0B7 FE EE            [ 7]  129         cp #CHR_VISITED
      00A0B9 28 0D            [12]  130         jr z,test_end_up
      00A0BB FE FA            [ 7]  131         cp #CHR_BONUS
      00A0BD 28 06            [12]  132         jr z,add_bonus_up
      00A0BF 09               [11]  133         add hl,bc
      00A0C0 3E FD            [ 7]  134         ld a,#CHR_MAN
      00A0C2 77               [ 7]  135         ld (hl),a
      00A0C3 AF               [ 4]  136         xor a
      00A0C4 C9               [10]  137         ret
      00A0C5                        138 add_bonus_up:
      00A0C5 CD 1D A3         [17]  139         call show_points_plus_100
      00A0C8                        140 test_end_up:
      00A0C8 01 63 F0         [10]  141         ld bc,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
      00A0CB ED 42            [15]  142         sbc hl,bc
      00A0CD 20 03            [12]  143         jr nz,continue_up
      00A0CF 3E 01            [ 7]  144         ld a,#KEY_NEXT
      00A0D1 C9               [10]  145         ret
      00A0D2                        146 continue_up:
      00A0D2 09               [11]  147         add hl,bc
      00A0D3 01 28 00         [10]  148         ld bc,#BWS_LINE_WIDTH
      00A0D6 ED 5B 90 A8      [20]  149         ld de,(ptr_internal_array)
      00A0DA EB               [ 4]  150         ex de,hl
      00A0DB ED 42            [15]  151         sbc hl,bc
      00A0DD EB               [ 4]  152         ex de,hl
      00A0DE ED 53 90 A8      [20]  153         ld (ptr_internal_array),de
      00A0E2 1A               [ 7]  154         ld a,(de)
      00A0E3 FE 64            [ 7]  155         cp #IS_MINE
      00A0E5 20 03            [12]  156         jr nz,update_screen_up
      00A0E7 3E 03            [ 7]  157         ld a,#KEY_QUIT
      00A0E9 C9               [10]  158         ret
      00A0EA                        159 update_screen_up:
      00A0EA CD FF A0         [17]  160         call count_mines
      00A0ED FE 00            [ 7]  161         cp #NO_MINE
      00A0EF C4 07 A3         [17]  162         call nz,print_mines_count
      00A0F2 3E 01            [ 7]  163         ld a,#RECORD_UP
      00A0F4 CD FB A2         [17]  164         call append_key
      00A0F7 22 8E A8         [16]  165         ld (ptr_cursor),hl
      00A0FA 3E FD            [ 7]  166         ld a,#CHR_MAN
      00A0FC 77               [ 7]  167         ld (hl),a
      00A0FD AF               [ 4]  168         xor a
      00A0FE C9               [10]  169         ret
      00A0FF                        170 count_mines:
      00A0FF EB               [ 4]  171         ex de,hl
      00A100 D5               [11]  172         push de
      00A101 16 00            [ 7]  173         ld d,#SET_TO_ZERO
      00A103 01 28 00         [10]  174         ld bc,#BWS_LINE_WIDTH
      00A106 09               [11]  175         add hl,bc
      00A107 CD 28 A1         [17]  176         call test_inc_mine_count
      00A10A 2A 90 A8         [16]  177         ld hl,(ptr_internal_array)
      00A10D 2B               [ 6]  178         dec hl
      00A10E CD 28 A1         [17]  179         call test_inc_mine_count
      00A111 2A 90 A8         [16]  180         ld hl,(ptr_internal_array)
      00A114 06 28            [ 7]  181         ld b,#BWS_LINE_WIDTH
      00A116                        182 $sub_line_width_up:
      00A116 2B               [ 6]  183         dec hl
      00A117 10 FD            [13]  184         djnz $sub_line_width_up
      00A119 CD 28 A1         [17]  185         call test_inc_mine_count
      00A11C 2A 90 A8         [16]  186         ld hl,(ptr_internal_array)
      00A11F 23               [ 6]  187         inc hl
      00A120 CD 28 A1         [17]  188         call test_inc_mine_count
      00A123 2B               [ 6]  189         dec hl
      00A124 7A               [ 4]  190         ld a,d
      00A125 D1               [10]  191         pop de
      00A126 EB               [ 4]  192         ex de,hl
      00A127 C9               [10]  193         ret
      00A128                        194 test_inc_mine_count:
      00A128 7E               [ 7]  195         ld a,(hl)
      00A129 FE 64            [ 7]  196         cp #IS_MINE
      00A12B C0               [11]  197         ret nz
      00A12C 14               [ 4]  198         inc d
      00A12D C9               [10]  199         ret
      00A12E                        200 do_down:
      00A12E CD EC A2         [17]  201         call clear_status_line
      00A131 2A 8E A8         [16]  202         ld hl,(ptr_cursor)
      00A134 3E EE            [ 7]  203         ld a,#CHR_VISITED
      00A136 77               [ 7]  204         ld (hl),a
      00A137 01 28 00         [10]  205         ld bc,#BWS_LINE_WIDTH
      00A13A 09               [11]  206         add hl,bc
      00A13B 7E               [ 7]  207         ld a,(hl)
      00A13C FE 20            [ 7]  208         cp #CHR_FREE
      00A13E 28 15            [12]  209         jr z,test_end_down
      00A140 FE EE            [ 7]  210         cp #CHR_VISITED
      00A142 28 11            [12]  211         jr z,test_end_down
      00A144 FE FA            [ 7]  212         cp #CHR_BONUS
      00A146 28 0A            [12]  213         jr z,add_bonus_down
      00A148 06 28            [ 7]  214         ld b,#BWS_LINE_WIDTH
      00A14A                        215 $sub_line_width_down:
      00A14A 2B               [ 6]  216         dec hl
      00A14B 10 FD            [13]  217         djnz $sub_line_width_down
      00A14D 3E FD            [ 7]  218         ld a,#CHR_MAN
      00A14F 77               [ 7]  219         ld (hl),a
      00A150 AF               [ 4]  220         xor a
      00A151 C9               [10]  221         ret
      00A152                        222 add_bonus_down:
      00A152 CD 1D A3         [17]  223         call show_points_plus_100
      00A155                        224 test_end_down:
      00A155 ED 5B 90 A8      [20]  225         ld de,(ptr_internal_array)
      00A159 01 28 00         [10]  226         ld bc,#BWS_LINE_WIDTH
      00A15C EB               [ 4]  227         ex de,hl
      00A15D 09               [11]  228         add hl,bc
      00A15E EB               [ 4]  229         ex de,hl
      00A15F ED 53 90 A8      [20]  230         ld (ptr_internal_array),de
      00A163 1A               [ 7]  231         ld a,(de)
      00A164 FE 64            [ 7]  232         cp #IS_MINE
      00A166 20 03            [12]  233         jr nz,update_screen_down
      00A168 3E 03            [ 7]  234         ld a,#KEY_QUIT
      00A16A C9               [10]  235         ret
      00A16B                        236 update_screen_down:
      00A16B CD FF A0         [17]  237         call count_mines
      00A16E FE 00            [ 7]  238         cp #NO_MINE
      00A170 C4 07 A3         [17]  239         call nz,print_mines_count
      00A173 3E 02            [ 7]  240         ld a,#RECORD_DOWN
      00A175 CD FB A2         [17]  241         call append_key
      00A178 22 8E A8         [16]  242         ld (ptr_cursor),hl
      00A17B 3E FD            [ 7]  243         ld a,#CHR_MAN
      00A17D 77               [ 7]  244         ld (hl),a
      00A17E AF               [ 4]  245         xor a
      00A17F C9               [10]  246         ret
      00A180                        247 do_right:
      00A180 CD EC A2         [17]  248         call clear_status_line
      00A183 2A 8E A8         [16]  249         ld hl,(ptr_cursor)
      00A186 3E EE            [ 7]  250         ld a,#CHR_VISITED
      00A188 77               [ 7]  251         ld (hl),a
      00A189 23               [ 6]  252         inc hl
      00A18A 7E               [ 7]  253         ld a,(hl)
      00A18B FE 20            [ 7]  254         cp #CHR_FREE
      00A18D 28 19            [12]  255         jr z,test_end_right
      00A18F FE EE            [ 7]  256         cp #CHR_VISITED
      00A191 28 15            [12]  257         jr z,test_end_right
      00A193 FE FA            [ 7]  258         cp #CHR_BONUS
      00A195 28 0E            [12]  259         jr z,add_bonus_right
      00A197 2B               [ 6]  260         dec hl
      00A198 3E FD            [ 7]  261         ld a,#CHR_MAN
      00A19A 77               [ 7]  262         ld (hl),a
      00A19B CD FF A0         [17]  263         call count_mines
      00A19E FE 00            [ 7]  264         cp #NO_MINE
      00A1A0 C4 07 A3         [17]  265         call nz,print_mines_count
      00A1A3 AF               [ 4]  266         xor a
      00A1A4 C9               [10]  267         ret
      00A1A5                        268 add_bonus_right:
      00A1A5 CD 1D A3         [17]  269         call show_points_plus_100
      00A1A8                        270 test_end_right:
      00A1A8 ED 5B 90 A8      [20]  271         ld de,(ptr_internal_array)
      00A1AC 13               [ 6]  272         inc de
      00A1AD ED 53 90 A8      [20]  273         ld (ptr_internal_array),de
      00A1B1 1A               [ 7]  274         ld a,(de)
      00A1B2 FE 64            [ 7]  275         cp #IS_MINE
      00A1B4 20 03            [12]  276         jr nz,update_screen_right
      00A1B6 3E 03            [ 7]  277         ld a,#KEY_QUIT
      00A1B8 C9               [10]  278         ret
      00A1B9                        279 update_screen_right:
      00A1B9 CD FF A0         [17]  280         call count_mines
      00A1BC FE 00            [ 7]  281         cp #NO_MINE
      00A1BE C4 07 A3         [17]  282         call nz,print_mines_count
      00A1C1 3E 03            [ 7]  283         ld a,#RECORD_RIGHT
      00A1C3 CD FB A2         [17]  284         call append_key
      00A1C6 22 8E A8         [16]  285         ld (ptr_cursor),hl
      00A1C9 3E FD            [ 7]  286         ld a,#CHR_MAN
      00A1CB 77               [ 7]  287         ld (hl),a
      00A1CC AF               [ 4]  288         xor a
      00A1CD C9               [10]  289         ret
      00A1CE                        290 do_left:
      00A1CE CD EC A2         [17]  291         call clear_status_line
      00A1D1 2A 8E A8         [16]  292         ld hl,(ptr_cursor)
      00A1D4 3E EE            [ 7]  293         ld a,#CHR_VISITED
      00A1D6 77               [ 7]  294         ld (hl),a
      00A1D7 2B               [ 6]  295         dec hl
      00A1D8 7E               [ 7]  296         ld a,(hl)
      00A1D9 FE 20            [ 7]  297         cp #CHR_FREE
      00A1DB 28 19            [12]  298         jr z,test_end_left
      00A1DD FE EE            [ 7]  299         cp #CHR_VISITED
      00A1DF 28 15            [12]  300         jr z,test_end_left
      00A1E1 FE FA            [ 7]  301         cp #CHR_BONUS
      00A1E3 28 0E            [12]  302         jr z,add_bonus_left
      00A1E5 23               [ 6]  303         inc hl
      00A1E6 3E FD            [ 7]  304         ld a,#CHR_MAN
      00A1E8 77               [ 7]  305         ld (hl),a
      00A1E9 CD FF A0         [17]  306         call count_mines
      00A1EC FE 00            [ 7]  307         cp #NO_MINE
      00A1EE C4 07 A3         [17]  308         call nz,print_mines_count
      00A1F1 AF               [ 4]  309         xor a
      00A1F2 C9               [10]  310         ret
      00A1F3                        311 add_bonus_left:
      00A1F3 CD 1D A3         [17]  312         call show_points_plus_100
      00A1F6                        313 test_end_left:
      00A1F6 ED 5B 90 A8      [20]  314         ld de,(ptr_internal_array)
      00A1FA 1B               [ 6]  315         dec de
      00A1FB ED 53 90 A8      [20]  316         ld (ptr_internal_array),de
      00A1FF 1A               [ 7]  317         ld a,(de)
      00A200 FE 64            [ 7]  318         cp #IS_MINE
      00A202 20 03            [12]  319         jr nz,update_screen_left
      00A204 3E 03            [ 7]  320         ld a,#KEY_QUIT
      00A206 C9               [10]  321         ret
      00A207                        322 update_screen_left:
      00A207 CD FF A0         [17]  323         call count_mines
      00A20A FE 00            [ 7]  324         cp #NO_MINE
      00A20C C4 07 A3         [17]  325         call nz,print_mines_count
      00A20F 3E 04            [ 7]  326         ld a,#RECORD_LEFT
      00A211 CD FB A2         [17]  327         call append_key
      00A214 22 8E A8         [16]  328         ld (ptr_cursor),hl
      00A217 3E FD            [ 7]  329         ld a,#CHR_MAN
      00A219 77               [ 7]  330         ld (hl),a
      00A21A AF               [ 4]  331         xor a
      00A21B C9               [10]  332         ret
      00A21C                        333 do_skip_level:
      00A21C 3E 37            [ 7]  334         ld a,#RECORD_END
      00A21E CD FB A2         [17]  335         call append_key
      00A221 CD 42 A2         [17]  336         call clear_screen
      00A224 CD 7B A2         [17]  337         call show_empty_field
      00A227 CD 8D A2         [17]  338         call show_mine_field
      00A22A CD 8F A3         [17]  339         call show_recording_history
      00A22D 21 63 F0         [10]  340         ld hl,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
      00A230 CD 58 A2         [17]  341         call show_win_animation
      00A233 CD 6A A3         [17]  342         call clear_data
      00A236 CD 42 A2         [17]  343         call clear_screen
      00A239 CD 79 A3         [17]  344         call points_plus_50
      00A23C CD 84 A3         [17]  345         call points_plus_25
      00A23F C3 41 A0         [10]  346         jp start_level
      00A242                        347 clear_screen:
      00A242 E5               [11]  348         push hl
      00A243 D5               [11]  349         push de
      00A244 C5               [11]  350         push bc
      00A245 3E 20            [ 7]  351         ld a,#' '
      00A247 21 00 F0         [10]  352         ld hl,#BWS
      00A24A 77               [ 7]  353         ld (hl),a
      00A24B 11 01 F0         [10]  354         ld de,#BWS+1
      00A24E 01 BF 03         [10]  355         ld bc,#BWS_SIZE-1
      00A251 ED B0            [21]  356         ldir
      00A253 AF               [ 4]  357         xor a
      00A254 C1               [10]  358         pop bc
      00A255 D1               [10]  359         pop de
      00A256 E1               [10]  360         pop hl
      00A257 C9               [10]  361         ret
      00A258                        362 show_win_animation:
      00A258 D5               [11]  363         push de
      00A259 C5               [11]  364         push bc
      00A25A 7E               [ 7]  365         ld a,(hl)
      00A25B 4F               [ 4]  366         ld c,a
      00A25C 06 0A            [ 7]  367         ld b,#BLINK_COUNTER
      00A25E                        368 animate_end:
      00A25E 3E EE            [ 7]  369         ld a,#CHR_VISITED
      00A260 77               [ 7]  370         ld (hl),a
      00A261 11 20 4E         [10]  371         ld de,#WAIT_250MS
      00A264                        372 animate$delay_visited:
      00A264 1B               [ 6]  373         dec de
      00A265 AF               [ 4]  374         xor a
      00A266 BA               [ 4]  375         cp d
      00A267 20 FB            [12]  376         jr nz,animate$delay_visited
      00A269 3E 20            [ 7]  377         ld a,#CHR_FREE
      00A26B 77               [ 7]  378         ld (hl),a
      00A26C 11 20 4E         [10]  379         ld de,#WAIT_250MS
      00A26F                        380 animate$delay_free:
      00A26F 1B               [ 6]  381         dec de
      00A270 AF               [ 4]  382         xor a
      00A271 BA               [ 4]  383         cp d
      00A272 20 FB            [12]  384         jr nz,animate$delay_free
      00A274 10 E8            [13]  385         djnz animate_end
      00A276 79               [ 4]  386         ld a,c
      00A277 77               [ 7]  387         ld (hl),a
      00A278 C1               [10]  388         pop bc
      00A279 D1               [10]  389         pop de
      00A27A C9               [10]  390         ret
      00A27B                        391 show_empty_field:
      00A27B E5               [11]  392         push hl
      00A27C D5               [11]  393         push de
      00A27D C5               [11]  394         push bc
      00A27E 21 CE A4         [10]  395         ld hl,#txt_empty_screen
      00A281 11 00 F0         [10]  396         ld de,#BWS
      00A284 01 C0 03         [10]  397         ld bc,#BWS_SIZE
      00A287 ED B0            [21]  398         ldir
      00A289 C1               [10]  399         pop bc
      00A28A D1               [10]  400         pop de
      00A28B E1               [10]  401         pop hl
      00A28C C9               [10]  402         ret
      00A28D                        403 show_mine_field:
      00A28D E5               [11]  404         push hl
      00A28E D5               [11]  405         push de
      00A28F C5               [11]  406         push bc
      00A290 21 50 80         [10]  407         ld hl,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
      00A293 11 A0 F0         [10]  408         ld de,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
      00A296 0E 11            [ 7]  409         ld c,#START_ROW-END_ROW-3; NET HEIGHT MINEFIELD
      00A298                        410 $show_new_line:
      00A298 06 26            [ 7]  411         ld b,#MINEFIELD_WIDTH
      00A29A                        412 $get_character:
      00A29A 23               [ 6]  413         inc hl
      00A29B 13               [ 6]  414         inc de
      00A29C 7E               [ 7]  415         ld a,(hl)
      00A29D FE 64            [ 7]  416         cp #IS_MINE
      00A29F 20 03            [12]  417         jr nz,$draw_character
      00A2A1 3E F1            [ 7]  418         ld a,#CHR_MINE
      00A2A3 12               [ 7]  419         ld (de),a
      00A2A4                        420 $draw_character:
      00A2A4 05               [ 4]  421         dec b
      00A2A5 20 F3            [12]  422         jr nz,$get_character
      00A2A7 C5               [11]  423         push bc
      00A2A8 01 10 27         [10]  424         ld bc,#WAIT_130MS
      00A2AB CD E6 A2         [17]  425         call wait
      00A2AE C1               [10]  426         pop bc
      00A2AF 0D               [ 4]  427         dec c
      00A2B0 20 04            [12]  428         jr nz,line_correction_ptr
      00A2B2 C1               [10]  429         pop bc
      00A2B3 D1               [10]  430         pop de
      00A2B4 E1               [10]  431         pop hl
      00A2B5 C9               [10]  432         ret
      00A2B6                        433 line_correction_ptr:
      00A2B6 06 02            [ 7]  434         ld b,#BWS_LINE_WIDTH-MINEFIELD_WIDTH
      00A2B8                        435 $correct_ptr:
      00A2B8 23               [ 6]  436         inc hl
      00A2B9 13               [ 6]  437         inc de
      00A2BA 10 FC            [13]  438         djnz $correct_ptr
      00A2BC 18 DA            [12]  439         jr $show_new_line
      00A2BE                        440 hex2int:
      00A2BE AF               [ 4]  441         xor a
      00A2BF 01 E8 03         [10]  442         ld bc,#1000
      00A2C2 CD D8 A2         [17]  443         call convert_digit_to_ascii
      00A2C5 01 64 00         [10]  444         ld bc,#100
      00A2C8 CD D8 A2         [17]  445         call convert_digit_to_ascii
      00A2CB 01 0A 00         [10]  446         ld bc,#10
      00A2CE CD D8 A2         [17]  447         call convert_digit_to_ascii
      00A2D1 01 01 00         [10]  448         ld bc,#1
      00A2D4 CD D8 A2         [17]  449         call convert_digit_to_ascii
      00A2D7 C9               [10]  450         ret
      00A2D8                        451 convert_digit_to_ascii:
      00A2D8 AF               [ 4]  452         xor a
      00A2D9                        453 convert$sub_digit:
      00A2D9 ED 42            [15]  454         sbc hl,bc
      00A2DB 38 03            [12]  455         jr c,convert$hex_to_ascii
      00A2DD 3C               [ 4]  456         inc a
      00A2DE 18 F9            [12]  457         jr convert$sub_digit
      00A2E0                        458 convert$hex_to_ascii:
      00A2E0 09               [11]  459         add hl,bc
      00A2E1 C6 30            [ 7]  460         add #'0'
      00A2E3 12               [ 7]  461         ld (de),a
      00A2E4 13               [ 6]  462         inc de
      00A2E5 C9               [10]  463         ret
      00A2E6                        464 wait:
      00A2E6 0B               [ 6]  465         dec bc
      00A2E7 79               [ 4]  466         ld a,c
      00A2E8 B0               [ 4]  467         or b
      00A2E9 20 FB            [12]  468         jr nz,wait
      00A2EB C9               [10]  469         ret
      00A2EC                        470 clear_status_line:
      00A2EC 3E 20            [ 7]  471         ld a,#' '
      00A2EE 21 17 F0         [10]  472         ld hl,#BWS_ADR_HINT
      00A2F1 77               [ 7]  473         ld (hl),a
      00A2F2 11 18 F0         [10]  474         ld de,#BWS_ADR_HINT+1
      00A2F5 01 10 00         [10]  475         ld bc,#len_vorsicht_minen-1
      00A2F8 ED B0            [21]  476         ldir
      00A2FA C9               [10]  477         ret
      00A2FB                        478 append_key:
      00A2FB E5               [11]  479         push hl
      00A2FC 2A 96 A8         [16]  480         ld hl,(ptr_log_buffer)
      00A2FF 23               [ 6]  481         inc hl
      00A300 77               [ 7]  482         ld (hl),a
      00A301 22 96 A8         [16]  483         ld (ptr_log_buffer),hl
      00A304 E1               [10]  484         pop hl
      00A305 AF               [ 4]  485         xor a
      00A306 C9               [10]  486         ret
      00A307                        487 print_mines_count:
      00A307 E5               [11]  488         push hl
      00A308 D5               [11]  489         push de
      00A309 21 9B A8         [10]  490         ld hl,#str_vorsicht_minen
      00A30C 11 17 F0         [10]  491         ld de,#BWS_ADR_HINT
      00A30F 01 11 00         [10]  492         ld bc,#len_vorsicht_minen
      00A312 ED B0            [21]  493         ldir
      00A314 21 20 F0         [10]  494         ld hl,#BWS_ADR_HINT+9; 'VORSICHT '
      00A317 C6 30            [ 7]  495         add #'0'
      00A319 77               [ 7]  496         ld (hl),a
      00A31A D1               [10]  497         pop de
      00A31B E1               [10]  498         pop hl
      00A31C C9               [10]  499         ret
      00A31D                        500 show_points_plus_100:
      00A31D E5               [11]  501         push hl
      00A31E C5               [11]  502         push bc
      00A31F D5               [11]  503         push de
      00A320 01 64 00         [10]  504         ld bc,#100
      00A323 2A 92 A8         [16]  505         ld hl,(points_count)
      00A326 09               [11]  506         add hl,bc
      00A327 22 92 A8         [16]  507         ld (points_count),hl
      00A32A 11 12 F0         [10]  508         ld de,#BWS_ADR_POINTS
      00A32D CD BE A2         [17]  509         call hex2int
      00A330 D1               [10]  510         pop de
      00A331 C1               [10]  511         pop bc
      00A332 E1               [10]  512         pop hl
      00A333 C9               [10]  513         ret
      00A334                        514 show_title:
      00A334 21 DA A8         [10]  515         ld hl,#txt_title
      00A337 11 00 F0         [10]  516         ld de,#BWS
      00A33A 01 C0 03         [10]  517         ld bc,#BWS_SIZE
      00A33D ED B0            [21]  518         ldir
      000330                        519         FILL_BACKGROUND_COLOR
      00A33F 21 00 F8         [10]    1         ld hl,#BWS+OFFSET_COLOR
      00A342 11 FF F7         [10]    2         ld de,#BWS+OFFSET_COLOR-1
      00A345 01 BF 03         [10]    3         ld bc,#BWS_SIZE-1
      00A348 3E 07            [ 7]    4         ld a,#FG_WHITE|BG_BLACK
      00A34A 77               [ 7]    5         ld (hl),a
      00A34B ED B0            [21]    6         ldir
      00A34D C9               [10]  520         ret
      00A34E                        521 check_for_bonus:
      00A34E 2A 94 A8         [16]  522         ld hl,(mines_count)
      00A351 01 64 00         [10]  523         ld bc,#100
      00A354 ED 42            [15]  524         sbc hl,bc
      00A356 D8               [11]  525         ret c
      00A357 3E FA            [ 7]  526         ld a,#CHR_BONUS
      00A359 21 C0 F1         [10]  527         ld hl,#BWS_ADR_BONUS_L
      00A35C 77               [ 7]  528         ld (hl),a
      00A35D 21 D7 F1         [10]  529         ld hl,#BWS_ADR_BONUS_R
      00A360 77               [ 7]  530         ld (hl),a
      00A361 21 70 81         [10]  531         ld hl,#INT_ADR_BONUS_L
      00A364 77               [ 7]  532         ld (hl),a
      00A365 21 87 81         [10]  533         ld hl,#INT_ADR_BONUS_R
      00A368 77               [ 7]  534         ld (hl),a
      00A369 C9               [10]  535         ret
      00A36A                        536 clear_data:
      00A36A 21 00 80         [10]  537         ld hl,#INTERNAL_ARRAY
      00A36D 3E 00            [ 7]  538         ld a,#IS_FREE
      00A36F 77               [ 7]  539         ld (hl),a
      00A370 11 01 80         [10]  540         ld de,#INTERNAL_ARRAY+1
      00A373 01 47 03         [10]  541         ld bc,#BWS_LINE_WIDTH*(START_ROW-END_ROW+1)-1
      00A376 ED B0            [21]  542         ldir
      00A378 C9               [10]  543         ret
      00A379                        544 points_plus_50:
      00A379 2A 92 A8         [16]  545         ld hl,(points_count)
      00A37C 01 32 00         [10]  546         ld bc,#50
      00A37F 09               [11]  547         add hl,bc
      00A380 22 92 A8         [16]  548         ld (points_count),hl
      00A383 C9               [10]  549         ret
      00A384                        550 points_plus_25:
      00A384 2A 94 A8         [16]  551         ld hl,(mines_count)
      00A387 01 19 00         [10]  552         ld bc,#25
      00A38A 09               [11]  553         add hl,bc
      00A38B 22 94 A8         [16]  554         ld (mines_count),hl
      00A38E C9               [10]  555         ret
      00A38F                        556 show_recording_history:
      00A38F 21 83 F3         [10]  557         ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
      00A392 11 48 83         [10]  558         ld de,#LOG_BUFFER
      00A395 01 28 00         [10]  559         ld bc,#BWS_LINE_WIDTH
      00A398                        560 animate_recording:
      00A398 C5               [11]  561         push bc
      00A399 01 98 3A         [10]  562         ld bc,#REC_DELAY_190MS
      00A39C                        563 recording$delay:
      00A39C 0B               [ 6]  564         dec bc
      00A39D AF               [ 4]  565         xor a
      00A39E B8               [ 4]  566         cp b
      00A39F 20 FB            [12]  567         jr nz,recording$delay
      00A3A1 C1               [10]  568         pop bc
      00A3A2 1A               [ 7]  569         ld a,(de)
      00A3A3 13               [ 6]  570         inc de
      00A3A4 FE 01            [ 7]  571         cp #RECORD_UP
      00A3A6 CC BD A3         [17]  572         call z,animate_up
      00A3A9 FE 02            [ 7]  573         cp #RECORD_DOWN
      00A3AB CC C6 A3         [17]  574         call z,animate_down
      00A3AE FE 03            [ 7]  575         cp #RECORD_RIGHT
      00A3B0 CC CE A3         [17]  576         call z,animate_right
      00A3B3 FE 04            [ 7]  577         cp #RECORD_LEFT
      00A3B5 CC D6 A3         [17]  578         call z,animate_left
      00A3B8 FE 37            [ 7]  579         cp #RECORD_END
      00A3BA C8               [11]  580         ret z
      00A3BB 18 DB            [12]  581         jr animate_recording
      00A3BD                        582 animate_up:
      00A3BD 3E EE            [ 7]  583         ld a,#CHR_VISITED
      00A3BF 77               [ 7]  584         ld (hl),a
      00A3C0 3E FD            [ 7]  585         ld a,#CHR_MAN
      00A3C2 ED 42            [15]  586         sbc hl,bc
      00A3C4 77               [ 7]  587         ld (hl),a
      00A3C5 C9               [10]  588         ret
      00A3C6                        589 animate_down:
      00A3C6 3E EE            [ 7]  590         ld a,#CHR_VISITED
      00A3C8 77               [ 7]  591         ld (hl),a
      00A3C9 3E FD            [ 7]  592         ld a,#CHR_MAN
      00A3CB 09               [11]  593         add hl,bc
      00A3CC 77               [ 7]  594         ld (hl),a
      00A3CD C9               [10]  595         ret
      00A3CE                        596 animate_right:
      00A3CE 3E EE            [ 7]  597         ld a,#CHR_VISITED
      00A3D0 77               [ 7]  598         ld (hl),a
      00A3D1 3E FD            [ 7]  599         ld a,#CHR_MAN
      00A3D3 23               [ 6]  600         inc hl
      00A3D4 77               [ 7]  601         ld (hl),a
      00A3D5 C9               [10]  602         ret
      00A3D6                        603 animate_left:
      00A3D6 3E EE            [ 7]  604         ld a,#CHR_VISITED
      00A3D8 77               [ 7]  605         ld (hl),a
      00A3D9 3E FD            [ 7]  606         ld a,#CHR_MAN
      00A3DB 2B               [ 6]  607         dec hl
      00A3DC 77               [ 7]  608         ld (hl),a
      00A3DD C9               [10]  609         ret
                                    610 
      00A3DE                        611 distribute_mines:
      00A3DE ED 4B 94 A8      [20]  612         ld bc,(mines_count)
      00A3E2                        613 $put_mine:
      00A3E2 C5               [11]  614         push bc
      00A3E3                        615 distribute$new_number:
      00A3E3 CD 81 A4         [17]  616         call rand16
      00A3E6 7C               [ 4]  617         ld a,h
      00A3E7 E6 03            [ 7]  618         and #RANDOM_MASK ; bc <0x400
                                    619         ; while HL >= CUT_OFF call rand16
      00A3E9 67               [ 4]  620         ld h,a
      00A3EA FE 02            [ 7]  621         cp #>CUT_OFF   ; H>=HIGH(CUT_OFF)
      00A3EC 38 08            [12]  622         jr c,distribute$is_smaller
      00A3EE 20 F3            [12]  623         jr nz,distribute$new_number
      00A3F0 7D               [ 4]  624         ld a,l
      00A3F1 FE A8            [ 7]  625         cp #<CUT_OFF
      00A3F3 F2 E3 A3         [10]  626         jp p,distribute$new_number
      00A3F6                        627 distribute$is_smaller:
      00A3F6 01 50 80         [10]  628         ld bc,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
      00A3F9 5D               [ 4]  629         ld e,l
      00A3FA 54               [ 4]  630         ld d,h
      00A3FB 09               [11]  631         add hl,bc
      00A3FC 7E               [ 7]  632         ld a,(hl)
      00A3FD FE 00            [ 7]  633         cp #IS_FREE
                                    634 
      00A3FF 20 E2            [12]  635         jr nz,distribute$new_number
      00A401 21 A0 F0         [10]  636         ld hl,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
      00A404 19               [11]  637         add hl,de
      00A405 7E               [ 7]  638         ld a,(hl)
      00A406 FE 20            [ 7]  639         cp #CHR_FREE
      00A408 20 D9            [12]  640         jr nz,distribute$new_number
                                    641         ;AZ check distribution
                                    642         ;ld a,#0x55
                                    643         ;ld (hl),a
      00A40A EB               [ 4]  644         ex de,hl
      00A40B 09               [11]  645         add hl,bc
      00A40C 3E 64            [ 7]  646         ld a,#IS_MINE
      00A40E 77               [ 7]  647         ld (hl),a
      00A40F C1               [10]  648         pop bc
      00A410 0B               [ 6]  649         dec bc
      00A411 79               [ 4]  650         ld a,c
      00A412 B0               [ 4]  651         or b
      00A413 20 CD            [12]  652         jr nz,$put_mine
      00A415 C9               [10]  653         ret
      00A416                        654 do_quit:
      00A416 3E 37            [ 7]  655         ld a,#RECORD_END
      00A418 CD FB A2         [17]  656         call append_key
      00A41B CD 7F A4         [17]  657         call quit_sound
      00A41E CD 42 A2         [17]  658         call clear_screen
      00A421 CD 7B A2         [17]  659         call show_empty_field
      00A424 CD 8D A2         [17]  660         call show_mine_field
      00A427 CD 8F A3         [17]  661         call show_recording_history
      00A42A CD 6A A3         [17]  662         call clear_data
      00A42D 01 60 EA         [10]  663         ld bc,#WAIT_750MS
      00A430 CD E6 A2         [17]  664         call wait
      00A433 CD 42 A2         [17]  665         call clear_screen
      00A436 C3 39 A4         [10]  666         jp go_next
      00A439                        667 go_next:
      00A439 11 D2 F0         [10]  668         ld de,#BWS_A_SIE_HABEN
      00A43C 21 AC A8         [10]  669         ld hl,#str_sie_haben
      00A43F 01 0C 00         [10]  670         ld bc,#size_of_sie_haben
      00A442 ED B0            [21]  671         ldir
      00A444 11 6F F1         [10]  672         ld de,#BWS_A_PUNKTE_ER
      00A447 21 B8 A8         [10]  673         ld hl,#str_punkte_erreicht
      00A44A 01 12 00         [10]  674         ld bc,#size_of_punkte_erreich
      00A44D ED B0            [21]  675         ldir
      00A44F 2A 92 A8         [16]  676         ld hl,(points_count)
      00A452 11 25 F1         [10]  677         ld de,#BWS_A_TOTAL_POI
      00A455 CD BE A2         [17]  678         call hex2int
      00A458 11 88 F2         [10]  679         ld de,#BWS_A_NOCH_EIN
      00A45B 21 CA A8         [10]  680         ld hl,#str_noch_ein_spiel
      00A45E 01 10 00         [10]  681         ld bc,#size_of_noch_ein_spiel
      00A461 ED B0            [21]  682         ldir
      00A463 21 DE F2         [10]  683         ld hl,#BWS_A_JA
      00A466 3E 4A            [ 7]  684         ld a,#'J'
      00A468 77               [ 7]  685         ld (hl),a
      00A469 23               [ 6]  686         inc hl
      00A46A 3E 2F            [ 7]  687         ld a,#'/'
      00A46C 77               [ 7]  688         ld (hl),a
      00A46D 23               [ 6]  689         inc hl
      00A46E 3E 4E            [ 7]  690         ld a,#'N'
      00A470 77               [ 7]  691         ld (hl),a
      00A471 CD 9B A4         [17]  692         call up_inch
      00A474 FE 4A            [ 7]  693         cp #'J'
      00A476 CA 32 A0         [10]  694         jp z,new_game
      00A479 C3 7C A4         [10]  695         jp kill_all_and_halt
                                    696 
      00A47C                        697 kill_all_and_halt:
      00046D                        698         END_MESSAGE
      00A47C C3 CC AD         [10]    1         jp      exit
                                    699 
      00A47F                        700 quit_sound:
      000470                        701         QUIT_SOUND
      00A47F C9               [10]  702         ret
      00A480                        703 click_sound:
      000471                        704         CLICK_SOUND
      00A480 C9               [10]  705         ret
                                    706 ;
                                    707 ; Galois LFSRs
                                    708 ;
      00A481                        709 rand16:
      00A481 2A 99 A4         [16]  710         ld hl,(seed)
      00A484 ED 5F            [ 9]  711         ld a,r
      00A486 84               [ 4]  712         add h
      00A487 67               [ 4]  713         ld h,a
      00A488 AF               [ 4]  714         xor a ; CF=0
      00A489 CB 1C            [ 8]  715         rr h
      00A48B CB 1D            [ 8]  716         rr l
      00A48D 30 06            [12]  717         jr  nc,rand16$write_seed
      00A48F AD               [ 4]  718         xor l
      00A490 6F               [ 4]  719         ld l,a
      00A491 3E B4            [ 7]  720         ld a,#0xB4
      00A493 AC               [ 4]  721         xor h
      00A494 67               [ 4]  722         ld h,a
      00A495                        723 rand16$write_seed:
      00A495 22 99 A4         [16]  724         ld (seed),hl
      00A498 C9               [10]  725         ret
      00A499                        726 seed:
      00A499 E1 AC                  727         .dw 0xace1
                                    728 
      00A49B                        729 up_inch:
      00A49B CD 81 A4         [17]  730         call rand16
      00048F                        731         INKEY
      00A49E CD E7 AD         [17]    1         call    inkey
      00A4A1 B7               [ 4]    2         or      a
      00A4A2 28 F7            [12]    3         jr      z,up_inch
      00A4A4 FE 1E            [ 7]  732         cp #VK_UP; CURSOR UP
      00A4A6 20 03            [12]  733         jr nz,up_inch$test_down
      00A4A8                        734 up_inch$is_up:
      00A4A8 3E 47            [ 7]  735         ld a,#'G'
      00A4AA C9               [10]  736         ret
      00A4AB                        737 up_inch$test_down:
      00A4AB FE 1F            [ 7]  738         cp #VK_DOWN; CURSOR DOWN
      00A4AD 20 03            [12]  739         jr nz,up_inch$test_left
      00A4AF                        740 up_inch$is_down:
      00A4AF 3E 4F            [ 7]  741         ld a,#'O'
      00A4B1 C9               [10]  742         ret
      00A4B2                        743 up_inch$test_left:
      00A4B2 FE 1D            [ 7]  744         cp #VK_LEFT; CURSOR LEFT
      00A4B4 20 03            [12]  745         jr nz,up_inch$test_right
      00A4B6                        746 up_inch$is_left:
      00A4B6 3E 50            [ 7]  747         ld a,#'P'
      00A4B8 C9               [10]  748         ret
      00A4B9                        749 up_inch$test_right:
      00A4B9 FE 1C            [ 7]  750         cp #VK_RIGHT; CURSOR RIGHT
      00A4BB 20 03            [12]  751         jr nz,up_inch$test_enter
      00A4BD                        752 up_inch$is_right:
      00A4BD 3E 51            [ 7]  753         ld a,#'Q'
      00A4BF C9               [10]  754         ret
      00A4C0                        755 up_inch$test_enter:
      00A4C0 FE 0D            [ 7]  756         cp #0x0d; enter
      00A4C2 20 03            [12]  757         jr nz,up_inch$fire
      00A4C4                        758 up_inch$is_start:
      00A4C4 3E 53            [ 7]  759         ld a,#'S'
      00A4C6 C9               [10]  760         ret
      00A4C7                        761 up_inch$fire:
      00A4C7 FE 1B            [ 7]  762         cp #0x1b; joystick fire
      00A4C9 20 02            [12]  763         jr nz,up_inch$end
      00A4CB 18 F7            [12]  764         jr up_inch$is_start
      00A4CD                        765 up_inch$end:
      00A4CD C9               [10]  766         ret
      00A4CE                        767 	JOYSTICK
      0004BF                        768 txt_empty_screen:
      0004BF                        769         TXT_MINES
      00A4CE 4D 49 4E 45 4E 3A        1         .ascii 'MINEN:'
                           000006   770 ofs_minen   .equ .-txt_empty_screen
                                    771 
      0004C5                        772         TXT_PUNKTE
      00A4D4 20 20 20 20 20 50 55     1         .ascii '     PUNKTE:'
             4E 4B 54 45 3A
                           000012   773 ofs_points   .equ .-txt_empty_screen
                                    774 
      0004D1                        775         TXT_EMPTY_SCREEN
      00A4E0 20 20 20 20 20           1         .ascii '     '
                           000017     2 ofs_vorsicht   .equ .-txt_empty_screen
      00A4E5 20 20 20 20 20 20 20     3         .ascii '                 '
             20 20 20 20 20 20 20
             20 20 20
      00A4F6 E0                       4         .db 0xe0
                                      5         .rept (BWS_LINE_WIDTH/2-3)
                                      6         .db 0xe4
                                      7         .endm
      00A4F7 E4                       1         .db 0xe4
      00A4F8 E4                       1         .db 0xe4
      00A4F9 E4                       1         .db 0xe4
      00A4FA E4                       1         .db 0xe4
      00A4FB E4                       1         .db 0xe4
      00A4FC E4                       1         .db 0xe4
      00A4FD E4                       1         .db 0xe4
      00A4FE E4                       1         .db 0xe4
      00A4FF E4                       1         .db 0xe4
      00A500 E4                       1         .db 0xe4
      00A501 E4                       1         .db 0xe4
      00A502 E4                       1         .db 0xe4
      00A503 E4                       1         .db 0xe4
      00A504 E4                       1         .db 0xe4
      00A505 E4                       1         .db 0xe4
      00A506 E4                       1         .db 0xe4
      00A507 E4                       1         .db 0xe4
      00A508 EA E4 EA                 8         .db 0xea,0xe4,0xea
                                      9         .rept (BWS_LINE_WIDTH/2-2)
                                     10         .db 0xe4
                                     11         .endm
      00A50B E4                       1         .db 0xe4
      00A50C E4                       1         .db 0xe4
      00A50D E4                       1         .db 0xe4
      00A50E E4                       1         .db 0xe4
      00A50F E4                       1         .db 0xe4
      00A510 E4                       1         .db 0xe4
      00A511 E4                       1         .db 0xe4
      00A512 E4                       1         .db 0xe4
      00A513 E4                       1         .db 0xe4
      00A514 E4                       1         .db 0xe4
      00A515 E4                       1         .db 0xe4
      00A516 E4                       1         .db 0xe4
      00A517 E4                       1         .db 0xe4
      00A518 E4                       1         .db 0xe4
      00A519 E4                       1         .db 0xe4
      00A51A E4                       1         .db 0xe4
      00A51B E4                       1         .db 0xe4
      00A51C E4                       1         .db 0xe4
      00A51D E1                      12         .db 0xe1
                                     13 
      00A51E E8                      14         .db 0xe8
                                     15         .rept (BWS_LINE_WIDTH/2-3)
                                     16         .db 0xe4
                                     17         .endm
      00A51F E4                       1         .db 0xe4
      00A520 E4                       1         .db 0xe4
      00A521 E4                       1         .db 0xe4
      00A522 E4                       1         .db 0xe4
      00A523 E4                       1         .db 0xe4
      00A524 E4                       1         .db 0xe4
      00A525 E4                       1         .db 0xe4
      00A526 E4                       1         .db 0xe4
      00A527 E4                       1         .db 0xe4
      00A528 E4                       1         .db 0xe4
      00A529 E4                       1         .db 0xe4
      00A52A E4                       1         .db 0xe4
      00A52B E4                       1         .db 0xe4
      00A52C E4                       1         .db 0xe4
      00A52D E4                       1         .db 0xe4
      00A52E E4                       1         .db 0xe4
      00A52F E4                       1         .db 0xe4
      00A530 E3 20 E2                18         .db 0xe3,0x20,0xe2
                                     19         .rept (BWS_LINE_WIDTH/2-2)
                                     20         .db 0xe4
                                     21         .endm
      00A533 E4                       1         .db 0xe4
      00A534 E4                       1         .db 0xe4
      00A535 E4                       1         .db 0xe4
      00A536 E4                       1         .db 0xe4
      00A537 E4                       1         .db 0xe4
      00A538 E4                       1         .db 0xe4
      00A539 E4                       1         .db 0xe4
      00A53A E4                       1         .db 0xe4
      00A53B E4                       1         .db 0xe4
      00A53C E4                       1         .db 0xe4
      00A53D E4                       1         .db 0xe4
      00A53E E4                       1         .db 0xe4
      00A53F E4                       1         .db 0xe4
      00A540 E4                       1         .db 0xe4
      00A541 E4                       1         .db 0xe4
      00A542 E4                       1         .db 0xe4
      00A543 E4                       1         .db 0xe4
      00A544 E4                       1         .db 0xe4
      00A545 E9                      22         .db 0xe9
                                     23 
                                     24         .rept (BWS_HEIGHT-5)
                                     25                 .db 0xe5
                                     26                 .rept (BWS_LINE_WIDTH-2)
                                     27                 .db 0x20
                                     28                 .endm
                                     29                 .db 0xe5
                                     30         .endm
      00A546 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A547 20                       1                 .db 0x20
      00A548 20                       1                 .db 0x20
      00A549 20                       1                 .db 0x20
      00A54A 20                       1                 .db 0x20
      00A54B 20                       1                 .db 0x20
      00A54C 20                       1                 .db 0x20
      00A54D 20                       1                 .db 0x20
      00A54E 20                       1                 .db 0x20
      00A54F 20                       1                 .db 0x20
      00A550 20                       1                 .db 0x20
      00A551 20                       1                 .db 0x20
      00A552 20                       1                 .db 0x20
      00A553 20                       1                 .db 0x20
      00A554 20                       1                 .db 0x20
      00A555 20                       1                 .db 0x20
      00A556 20                       1                 .db 0x20
      00A557 20                       1                 .db 0x20
      00A558 20                       1                 .db 0x20
      00A559 20                       1                 .db 0x20
      00A55A 20                       1                 .db 0x20
      00A55B 20                       1                 .db 0x20
      00A55C 20                       1                 .db 0x20
      00A55D 20                       1                 .db 0x20
      00A55E 20                       1                 .db 0x20
      00A55F 20                       1                 .db 0x20
      00A560 20                       1                 .db 0x20
      00A561 20                       1                 .db 0x20
      00A562 20                       1                 .db 0x20
      00A563 20                       1                 .db 0x20
      00A564 20                       1                 .db 0x20
      00A565 20                       1                 .db 0x20
      00A566 20                       1                 .db 0x20
      00A567 20                       1                 .db 0x20
      00A568 20                       1                 .db 0x20
      00A569 20                       1                 .db 0x20
      00A56A 20                       1                 .db 0x20
      00A56B 20                       1                 .db 0x20
      00A56C 20                       1                 .db 0x20
      00A56D E5                       5                 .db 0xe5
      00A56E E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A56F 20                       1                 .db 0x20
      00A570 20                       1                 .db 0x20
      00A571 20                       1                 .db 0x20
      00A572 20                       1                 .db 0x20
      00A573 20                       1                 .db 0x20
      00A574 20                       1                 .db 0x20
      00A575 20                       1                 .db 0x20
      00A576 20                       1                 .db 0x20
      00A577 20                       1                 .db 0x20
      00A578 20                       1                 .db 0x20
      00A579 20                       1                 .db 0x20
      00A57A 20                       1                 .db 0x20
      00A57B 20                       1                 .db 0x20
      00A57C 20                       1                 .db 0x20
      00A57D 20                       1                 .db 0x20
      00A57E 20                       1                 .db 0x20
      00A57F 20                       1                 .db 0x20
      00A580 20                       1                 .db 0x20
      00A581 20                       1                 .db 0x20
      00A582 20                       1                 .db 0x20
      00A583 20                       1                 .db 0x20
      00A584 20                       1                 .db 0x20
      00A585 20                       1                 .db 0x20
      00A586 20                       1                 .db 0x20
      00A587 20                       1                 .db 0x20
      00A588 20                       1                 .db 0x20
      00A589 20                       1                 .db 0x20
      00A58A 20                       1                 .db 0x20
      00A58B 20                       1                 .db 0x20
      00A58C 20                       1                 .db 0x20
      00A58D 20                       1                 .db 0x20
      00A58E 20                       1                 .db 0x20
      00A58F 20                       1                 .db 0x20
      00A590 20                       1                 .db 0x20
      00A591 20                       1                 .db 0x20
      00A592 20                       1                 .db 0x20
      00A593 20                       1                 .db 0x20
      00A594 20                       1                 .db 0x20
      00A595 E5                       5                 .db 0xe5
      00A596 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A597 20                       1                 .db 0x20
      00A598 20                       1                 .db 0x20
      00A599 20                       1                 .db 0x20
      00A59A 20                       1                 .db 0x20
      00A59B 20                       1                 .db 0x20
      00A59C 20                       1                 .db 0x20
      00A59D 20                       1                 .db 0x20
      00A59E 20                       1                 .db 0x20
      00A59F 20                       1                 .db 0x20
      00A5A0 20                       1                 .db 0x20
      00A5A1 20                       1                 .db 0x20
      00A5A2 20                       1                 .db 0x20
      00A5A3 20                       1                 .db 0x20
      00A5A4 20                       1                 .db 0x20
      00A5A5 20                       1                 .db 0x20
      00A5A6 20                       1                 .db 0x20
      00A5A7 20                       1                 .db 0x20
      00A5A8 20                       1                 .db 0x20
      00A5A9 20                       1                 .db 0x20
      00A5AA 20                       1                 .db 0x20
      00A5AB 20                       1                 .db 0x20
      00A5AC 20                       1                 .db 0x20
      00A5AD 20                       1                 .db 0x20
      00A5AE 20                       1                 .db 0x20
      00A5AF 20                       1                 .db 0x20
      00A5B0 20                       1                 .db 0x20
      00A5B1 20                       1                 .db 0x20
      00A5B2 20                       1                 .db 0x20
      00A5B3 20                       1                 .db 0x20
      00A5B4 20                       1                 .db 0x20
      00A5B5 20                       1                 .db 0x20
      00A5B6 20                       1                 .db 0x20
      00A5B7 20                       1                 .db 0x20
      00A5B8 20                       1                 .db 0x20
      00A5B9 20                       1                 .db 0x20
      00A5BA 20                       1                 .db 0x20
      00A5BB 20                       1                 .db 0x20
      00A5BC 20                       1                 .db 0x20
      00A5BD E5                       5                 .db 0xe5
      00A5BE E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A5BF 20                       1                 .db 0x20
      00A5C0 20                       1                 .db 0x20
      00A5C1 20                       1                 .db 0x20
      00A5C2 20                       1                 .db 0x20
      00A5C3 20                       1                 .db 0x20
      00A5C4 20                       1                 .db 0x20
      00A5C5 20                       1                 .db 0x20
      00A5C6 20                       1                 .db 0x20
      00A5C7 20                       1                 .db 0x20
      00A5C8 20                       1                 .db 0x20
      00A5C9 20                       1                 .db 0x20
      00A5CA 20                       1                 .db 0x20
      00A5CB 20                       1                 .db 0x20
      00A5CC 20                       1                 .db 0x20
      00A5CD 20                       1                 .db 0x20
      00A5CE 20                       1                 .db 0x20
      00A5CF 20                       1                 .db 0x20
      00A5D0 20                       1                 .db 0x20
      00A5D1 20                       1                 .db 0x20
      00A5D2 20                       1                 .db 0x20
      00A5D3 20                       1                 .db 0x20
      00A5D4 20                       1                 .db 0x20
      00A5D5 20                       1                 .db 0x20
      00A5D6 20                       1                 .db 0x20
      00A5D7 20                       1                 .db 0x20
      00A5D8 20                       1                 .db 0x20
      00A5D9 20                       1                 .db 0x20
      00A5DA 20                       1                 .db 0x20
      00A5DB 20                       1                 .db 0x20
      00A5DC 20                       1                 .db 0x20
      00A5DD 20                       1                 .db 0x20
      00A5DE 20                       1                 .db 0x20
      00A5DF 20                       1                 .db 0x20
      00A5E0 20                       1                 .db 0x20
      00A5E1 20                       1                 .db 0x20
      00A5E2 20                       1                 .db 0x20
      00A5E3 20                       1                 .db 0x20
      00A5E4 20                       1                 .db 0x20
      00A5E5 E5                       5                 .db 0xe5
      00A5E6 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A5E7 20                       1                 .db 0x20
      00A5E8 20                       1                 .db 0x20
      00A5E9 20                       1                 .db 0x20
      00A5EA 20                       1                 .db 0x20
      00A5EB 20                       1                 .db 0x20
      00A5EC 20                       1                 .db 0x20
      00A5ED 20                       1                 .db 0x20
      00A5EE 20                       1                 .db 0x20
      00A5EF 20                       1                 .db 0x20
      00A5F0 20                       1                 .db 0x20
      00A5F1 20                       1                 .db 0x20
      00A5F2 20                       1                 .db 0x20
      00A5F3 20                       1                 .db 0x20
      00A5F4 20                       1                 .db 0x20
      00A5F5 20                       1                 .db 0x20
      00A5F6 20                       1                 .db 0x20
      00A5F7 20                       1                 .db 0x20
      00A5F8 20                       1                 .db 0x20
      00A5F9 20                       1                 .db 0x20
      00A5FA 20                       1                 .db 0x20
      00A5FB 20                       1                 .db 0x20
      00A5FC 20                       1                 .db 0x20
      00A5FD 20                       1                 .db 0x20
      00A5FE 20                       1                 .db 0x20
      00A5FF 20                       1                 .db 0x20
      00A600 20                       1                 .db 0x20
      00A601 20                       1                 .db 0x20
      00A602 20                       1                 .db 0x20
      00A603 20                       1                 .db 0x20
      00A604 20                       1                 .db 0x20
      00A605 20                       1                 .db 0x20
      00A606 20                       1                 .db 0x20
      00A607 20                       1                 .db 0x20
      00A608 20                       1                 .db 0x20
      00A609 20                       1                 .db 0x20
      00A60A 20                       1                 .db 0x20
      00A60B 20                       1                 .db 0x20
      00A60C 20                       1                 .db 0x20
      00A60D E5                       5                 .db 0xe5
      00A60E E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A60F 20                       1                 .db 0x20
      00A610 20                       1                 .db 0x20
      00A611 20                       1                 .db 0x20
      00A612 20                       1                 .db 0x20
      00A613 20                       1                 .db 0x20
      00A614 20                       1                 .db 0x20
      00A615 20                       1                 .db 0x20
      00A616 20                       1                 .db 0x20
      00A617 20                       1                 .db 0x20
      00A618 20                       1                 .db 0x20
      00A619 20                       1                 .db 0x20
      00A61A 20                       1                 .db 0x20
      00A61B 20                       1                 .db 0x20
      00A61C 20                       1                 .db 0x20
      00A61D 20                       1                 .db 0x20
      00A61E 20                       1                 .db 0x20
      00A61F 20                       1                 .db 0x20
      00A620 20                       1                 .db 0x20
      00A621 20                       1                 .db 0x20
      00A622 20                       1                 .db 0x20
      00A623 20                       1                 .db 0x20
      00A624 20                       1                 .db 0x20
      00A625 20                       1                 .db 0x20
      00A626 20                       1                 .db 0x20
      00A627 20                       1                 .db 0x20
      00A628 20                       1                 .db 0x20
      00A629 20                       1                 .db 0x20
      00A62A 20                       1                 .db 0x20
      00A62B 20                       1                 .db 0x20
      00A62C 20                       1                 .db 0x20
      00A62D 20                       1                 .db 0x20
      00A62E 20                       1                 .db 0x20
      00A62F 20                       1                 .db 0x20
      00A630 20                       1                 .db 0x20
      00A631 20                       1                 .db 0x20
      00A632 20                       1                 .db 0x20
      00A633 20                       1                 .db 0x20
      00A634 20                       1                 .db 0x20
      00A635 E5                       5                 .db 0xe5
      00A636 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A637 20                       1                 .db 0x20
      00A638 20                       1                 .db 0x20
      00A639 20                       1                 .db 0x20
      00A63A 20                       1                 .db 0x20
      00A63B 20                       1                 .db 0x20
      00A63C 20                       1                 .db 0x20
      00A63D 20                       1                 .db 0x20
      00A63E 20                       1                 .db 0x20
      00A63F 20                       1                 .db 0x20
      00A640 20                       1                 .db 0x20
      00A641 20                       1                 .db 0x20
      00A642 20                       1                 .db 0x20
      00A643 20                       1                 .db 0x20
      00A644 20                       1                 .db 0x20
      00A645 20                       1                 .db 0x20
      00A646 20                       1                 .db 0x20
      00A647 20                       1                 .db 0x20
      00A648 20                       1                 .db 0x20
      00A649 20                       1                 .db 0x20
      00A64A 20                       1                 .db 0x20
      00A64B 20                       1                 .db 0x20
      00A64C 20                       1                 .db 0x20
      00A64D 20                       1                 .db 0x20
      00A64E 20                       1                 .db 0x20
      00A64F 20                       1                 .db 0x20
      00A650 20                       1                 .db 0x20
      00A651 20                       1                 .db 0x20
      00A652 20                       1                 .db 0x20
      00A653 20                       1                 .db 0x20
      00A654 20                       1                 .db 0x20
      00A655 20                       1                 .db 0x20
      00A656 20                       1                 .db 0x20
      00A657 20                       1                 .db 0x20
      00A658 20                       1                 .db 0x20
      00A659 20                       1                 .db 0x20
      00A65A 20                       1                 .db 0x20
      00A65B 20                       1                 .db 0x20
      00A65C 20                       1                 .db 0x20
      00A65D E5                       5                 .db 0xe5
      00A65E E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A65F 20                       1                 .db 0x20
      00A660 20                       1                 .db 0x20
      00A661 20                       1                 .db 0x20
      00A662 20                       1                 .db 0x20
      00A663 20                       1                 .db 0x20
      00A664 20                       1                 .db 0x20
      00A665 20                       1                 .db 0x20
      00A666 20                       1                 .db 0x20
      00A667 20                       1                 .db 0x20
      00A668 20                       1                 .db 0x20
      00A669 20                       1                 .db 0x20
      00A66A 20                       1                 .db 0x20
      00A66B 20                       1                 .db 0x20
      00A66C 20                       1                 .db 0x20
      00A66D 20                       1                 .db 0x20
      00A66E 20                       1                 .db 0x20
      00A66F 20                       1                 .db 0x20
      00A670 20                       1                 .db 0x20
      00A671 20                       1                 .db 0x20
      00A672 20                       1                 .db 0x20
      00A673 20                       1                 .db 0x20
      00A674 20                       1                 .db 0x20
      00A675 20                       1                 .db 0x20
      00A676 20                       1                 .db 0x20
      00A677 20                       1                 .db 0x20
      00A678 20                       1                 .db 0x20
      00A679 20                       1                 .db 0x20
      00A67A 20                       1                 .db 0x20
      00A67B 20                       1                 .db 0x20
      00A67C 20                       1                 .db 0x20
      00A67D 20                       1                 .db 0x20
      00A67E 20                       1                 .db 0x20
      00A67F 20                       1                 .db 0x20
      00A680 20                       1                 .db 0x20
      00A681 20                       1                 .db 0x20
      00A682 20                       1                 .db 0x20
      00A683 20                       1                 .db 0x20
      00A684 20                       1                 .db 0x20
      00A685 E5                       5                 .db 0xe5
      00A686 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A687 20                       1                 .db 0x20
      00A688 20                       1                 .db 0x20
      00A689 20                       1                 .db 0x20
      00A68A 20                       1                 .db 0x20
      00A68B 20                       1                 .db 0x20
      00A68C 20                       1                 .db 0x20
      00A68D 20                       1                 .db 0x20
      00A68E 20                       1                 .db 0x20
      00A68F 20                       1                 .db 0x20
      00A690 20                       1                 .db 0x20
      00A691 20                       1                 .db 0x20
      00A692 20                       1                 .db 0x20
      00A693 20                       1                 .db 0x20
      00A694 20                       1                 .db 0x20
      00A695 20                       1                 .db 0x20
      00A696 20                       1                 .db 0x20
      00A697 20                       1                 .db 0x20
      00A698 20                       1                 .db 0x20
      00A699 20                       1                 .db 0x20
      00A69A 20                       1                 .db 0x20
      00A69B 20                       1                 .db 0x20
      00A69C 20                       1                 .db 0x20
      00A69D 20                       1                 .db 0x20
      00A69E 20                       1                 .db 0x20
      00A69F 20                       1                 .db 0x20
      00A6A0 20                       1                 .db 0x20
      00A6A1 20                       1                 .db 0x20
      00A6A2 20                       1                 .db 0x20
      00A6A3 20                       1                 .db 0x20
      00A6A4 20                       1                 .db 0x20
      00A6A5 20                       1                 .db 0x20
      00A6A6 20                       1                 .db 0x20
      00A6A7 20                       1                 .db 0x20
      00A6A8 20                       1                 .db 0x20
      00A6A9 20                       1                 .db 0x20
      00A6AA 20                       1                 .db 0x20
      00A6AB 20                       1                 .db 0x20
      00A6AC 20                       1                 .db 0x20
      00A6AD E5                       5                 .db 0xe5
      00A6AE E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A6AF 20                       1                 .db 0x20
      00A6B0 20                       1                 .db 0x20
      00A6B1 20                       1                 .db 0x20
      00A6B2 20                       1                 .db 0x20
      00A6B3 20                       1                 .db 0x20
      00A6B4 20                       1                 .db 0x20
      00A6B5 20                       1                 .db 0x20
      00A6B6 20                       1                 .db 0x20
      00A6B7 20                       1                 .db 0x20
      00A6B8 20                       1                 .db 0x20
      00A6B9 20                       1                 .db 0x20
      00A6BA 20                       1                 .db 0x20
      00A6BB 20                       1                 .db 0x20
      00A6BC 20                       1                 .db 0x20
      00A6BD 20                       1                 .db 0x20
      00A6BE 20                       1                 .db 0x20
      00A6BF 20                       1                 .db 0x20
      00A6C0 20                       1                 .db 0x20
      00A6C1 20                       1                 .db 0x20
      00A6C2 20                       1                 .db 0x20
      00A6C3 20                       1                 .db 0x20
      00A6C4 20                       1                 .db 0x20
      00A6C5 20                       1                 .db 0x20
      00A6C6 20                       1                 .db 0x20
      00A6C7 20                       1                 .db 0x20
      00A6C8 20                       1                 .db 0x20
      00A6C9 20                       1                 .db 0x20
      00A6CA 20                       1                 .db 0x20
      00A6CB 20                       1                 .db 0x20
      00A6CC 20                       1                 .db 0x20
      00A6CD 20                       1                 .db 0x20
      00A6CE 20                       1                 .db 0x20
      00A6CF 20                       1                 .db 0x20
      00A6D0 20                       1                 .db 0x20
      00A6D1 20                       1                 .db 0x20
      00A6D2 20                       1                 .db 0x20
      00A6D3 20                       1                 .db 0x20
      00A6D4 20                       1                 .db 0x20
      00A6D5 E5                       5                 .db 0xe5
      00A6D6 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A6D7 20                       1                 .db 0x20
      00A6D8 20                       1                 .db 0x20
      00A6D9 20                       1                 .db 0x20
      00A6DA 20                       1                 .db 0x20
      00A6DB 20                       1                 .db 0x20
      00A6DC 20                       1                 .db 0x20
      00A6DD 20                       1                 .db 0x20
      00A6DE 20                       1                 .db 0x20
      00A6DF 20                       1                 .db 0x20
      00A6E0 20                       1                 .db 0x20
      00A6E1 20                       1                 .db 0x20
      00A6E2 20                       1                 .db 0x20
      00A6E3 20                       1                 .db 0x20
      00A6E4 20                       1                 .db 0x20
      00A6E5 20                       1                 .db 0x20
      00A6E6 20                       1                 .db 0x20
      00A6E7 20                       1                 .db 0x20
      00A6E8 20                       1                 .db 0x20
      00A6E9 20                       1                 .db 0x20
      00A6EA 20                       1                 .db 0x20
      00A6EB 20                       1                 .db 0x20
      00A6EC 20                       1                 .db 0x20
      00A6ED 20                       1                 .db 0x20
      00A6EE 20                       1                 .db 0x20
      00A6EF 20                       1                 .db 0x20
      00A6F0 20                       1                 .db 0x20
      00A6F1 20                       1                 .db 0x20
      00A6F2 20                       1                 .db 0x20
      00A6F3 20                       1                 .db 0x20
      00A6F4 20                       1                 .db 0x20
      00A6F5 20                       1                 .db 0x20
      00A6F6 20                       1                 .db 0x20
      00A6F7 20                       1                 .db 0x20
      00A6F8 20                       1                 .db 0x20
      00A6F9 20                       1                 .db 0x20
      00A6FA 20                       1                 .db 0x20
      00A6FB 20                       1                 .db 0x20
      00A6FC 20                       1                 .db 0x20
      00A6FD E5                       5                 .db 0xe5
      00A6FE E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A6FF 20                       1                 .db 0x20
      00A700 20                       1                 .db 0x20
      00A701 20                       1                 .db 0x20
      00A702 20                       1                 .db 0x20
      00A703 20                       1                 .db 0x20
      00A704 20                       1                 .db 0x20
      00A705 20                       1                 .db 0x20
      00A706 20                       1                 .db 0x20
      00A707 20                       1                 .db 0x20
      00A708 20                       1                 .db 0x20
      00A709 20                       1                 .db 0x20
      00A70A 20                       1                 .db 0x20
      00A70B 20                       1                 .db 0x20
      00A70C 20                       1                 .db 0x20
      00A70D 20                       1                 .db 0x20
      00A70E 20                       1                 .db 0x20
      00A70F 20                       1                 .db 0x20
      00A710 20                       1                 .db 0x20
      00A711 20                       1                 .db 0x20
      00A712 20                       1                 .db 0x20
      00A713 20                       1                 .db 0x20
      00A714 20                       1                 .db 0x20
      00A715 20                       1                 .db 0x20
      00A716 20                       1                 .db 0x20
      00A717 20                       1                 .db 0x20
      00A718 20                       1                 .db 0x20
      00A719 20                       1                 .db 0x20
      00A71A 20                       1                 .db 0x20
      00A71B 20                       1                 .db 0x20
      00A71C 20                       1                 .db 0x20
      00A71D 20                       1                 .db 0x20
      00A71E 20                       1                 .db 0x20
      00A71F 20                       1                 .db 0x20
      00A720 20                       1                 .db 0x20
      00A721 20                       1                 .db 0x20
      00A722 20                       1                 .db 0x20
      00A723 20                       1                 .db 0x20
      00A724 20                       1                 .db 0x20
      00A725 E5                       5                 .db 0xe5
      00A726 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A727 20                       1                 .db 0x20
      00A728 20                       1                 .db 0x20
      00A729 20                       1                 .db 0x20
      00A72A 20                       1                 .db 0x20
      00A72B 20                       1                 .db 0x20
      00A72C 20                       1                 .db 0x20
      00A72D 20                       1                 .db 0x20
      00A72E 20                       1                 .db 0x20
      00A72F 20                       1                 .db 0x20
      00A730 20                       1                 .db 0x20
      00A731 20                       1                 .db 0x20
      00A732 20                       1                 .db 0x20
      00A733 20                       1                 .db 0x20
      00A734 20                       1                 .db 0x20
      00A735 20                       1                 .db 0x20
      00A736 20                       1                 .db 0x20
      00A737 20                       1                 .db 0x20
      00A738 20                       1                 .db 0x20
      00A739 20                       1                 .db 0x20
      00A73A 20                       1                 .db 0x20
      00A73B 20                       1                 .db 0x20
      00A73C 20                       1                 .db 0x20
      00A73D 20                       1                 .db 0x20
      00A73E 20                       1                 .db 0x20
      00A73F 20                       1                 .db 0x20
      00A740 20                       1                 .db 0x20
      00A741 20                       1                 .db 0x20
      00A742 20                       1                 .db 0x20
      00A743 20                       1                 .db 0x20
      00A744 20                       1                 .db 0x20
      00A745 20                       1                 .db 0x20
      00A746 20                       1                 .db 0x20
      00A747 20                       1                 .db 0x20
      00A748 20                       1                 .db 0x20
      00A749 20                       1                 .db 0x20
      00A74A 20                       1                 .db 0x20
      00A74B 20                       1                 .db 0x20
      00A74C 20                       1                 .db 0x20
      00A74D E5                       5                 .db 0xe5
      00A74E E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A74F 20                       1                 .db 0x20
      00A750 20                       1                 .db 0x20
      00A751 20                       1                 .db 0x20
      00A752 20                       1                 .db 0x20
      00A753 20                       1                 .db 0x20
      00A754 20                       1                 .db 0x20
      00A755 20                       1                 .db 0x20
      00A756 20                       1                 .db 0x20
      00A757 20                       1                 .db 0x20
      00A758 20                       1                 .db 0x20
      00A759 20                       1                 .db 0x20
      00A75A 20                       1                 .db 0x20
      00A75B 20                       1                 .db 0x20
      00A75C 20                       1                 .db 0x20
      00A75D 20                       1                 .db 0x20
      00A75E 20                       1                 .db 0x20
      00A75F 20                       1                 .db 0x20
      00A760 20                       1                 .db 0x20
      00A761 20                       1                 .db 0x20
      00A762 20                       1                 .db 0x20
      00A763 20                       1                 .db 0x20
      00A764 20                       1                 .db 0x20
      00A765 20                       1                 .db 0x20
      00A766 20                       1                 .db 0x20
      00A767 20                       1                 .db 0x20
      00A768 20                       1                 .db 0x20
      00A769 20                       1                 .db 0x20
      00A76A 20                       1                 .db 0x20
      00A76B 20                       1                 .db 0x20
      00A76C 20                       1                 .db 0x20
      00A76D 20                       1                 .db 0x20
      00A76E 20                       1                 .db 0x20
      00A76F 20                       1                 .db 0x20
      00A770 20                       1                 .db 0x20
      00A771 20                       1                 .db 0x20
      00A772 20                       1                 .db 0x20
      00A773 20                       1                 .db 0x20
      00A774 20                       1                 .db 0x20
      00A775 E5                       5                 .db 0xe5
      00A776 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A777 20                       1                 .db 0x20
      00A778 20                       1                 .db 0x20
      00A779 20                       1                 .db 0x20
      00A77A 20                       1                 .db 0x20
      00A77B 20                       1                 .db 0x20
      00A77C 20                       1                 .db 0x20
      00A77D 20                       1                 .db 0x20
      00A77E 20                       1                 .db 0x20
      00A77F 20                       1                 .db 0x20
      00A780 20                       1                 .db 0x20
      00A781 20                       1                 .db 0x20
      00A782 20                       1                 .db 0x20
      00A783 20                       1                 .db 0x20
      00A784 20                       1                 .db 0x20
      00A785 20                       1                 .db 0x20
      00A786 20                       1                 .db 0x20
      00A787 20                       1                 .db 0x20
      00A788 20                       1                 .db 0x20
      00A789 20                       1                 .db 0x20
      00A78A 20                       1                 .db 0x20
      00A78B 20                       1                 .db 0x20
      00A78C 20                       1                 .db 0x20
      00A78D 20                       1                 .db 0x20
      00A78E 20                       1                 .db 0x20
      00A78F 20                       1                 .db 0x20
      00A790 20                       1                 .db 0x20
      00A791 20                       1                 .db 0x20
      00A792 20                       1                 .db 0x20
      00A793 20                       1                 .db 0x20
      00A794 20                       1                 .db 0x20
      00A795 20                       1                 .db 0x20
      00A796 20                       1                 .db 0x20
      00A797 20                       1                 .db 0x20
      00A798 20                       1                 .db 0x20
      00A799 20                       1                 .db 0x20
      00A79A 20                       1                 .db 0x20
      00A79B 20                       1                 .db 0x20
      00A79C 20                       1                 .db 0x20
      00A79D E5                       5                 .db 0xe5
      00A79E E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A79F 20                       1                 .db 0x20
      00A7A0 20                       1                 .db 0x20
      00A7A1 20                       1                 .db 0x20
      00A7A2 20                       1                 .db 0x20
      00A7A3 20                       1                 .db 0x20
      00A7A4 20                       1                 .db 0x20
      00A7A5 20                       1                 .db 0x20
      00A7A6 20                       1                 .db 0x20
      00A7A7 20                       1                 .db 0x20
      00A7A8 20                       1                 .db 0x20
      00A7A9 20                       1                 .db 0x20
      00A7AA 20                       1                 .db 0x20
      00A7AB 20                       1                 .db 0x20
      00A7AC 20                       1                 .db 0x20
      00A7AD 20                       1                 .db 0x20
      00A7AE 20                       1                 .db 0x20
      00A7AF 20                       1                 .db 0x20
      00A7B0 20                       1                 .db 0x20
      00A7B1 20                       1                 .db 0x20
      00A7B2 20                       1                 .db 0x20
      00A7B3 20                       1                 .db 0x20
      00A7B4 20                       1                 .db 0x20
      00A7B5 20                       1                 .db 0x20
      00A7B6 20                       1                 .db 0x20
      00A7B7 20                       1                 .db 0x20
      00A7B8 20                       1                 .db 0x20
      00A7B9 20                       1                 .db 0x20
      00A7BA 20                       1                 .db 0x20
      00A7BB 20                       1                 .db 0x20
      00A7BC 20                       1                 .db 0x20
      00A7BD 20                       1                 .db 0x20
      00A7BE 20                       1                 .db 0x20
      00A7BF 20                       1                 .db 0x20
      00A7C0 20                       1                 .db 0x20
      00A7C1 20                       1                 .db 0x20
      00A7C2 20                       1                 .db 0x20
      00A7C3 20                       1                 .db 0x20
      00A7C4 20                       1                 .db 0x20
      00A7C5 E5                       5                 .db 0xe5
      00A7C6 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A7C7 20                       1                 .db 0x20
      00A7C8 20                       1                 .db 0x20
      00A7C9 20                       1                 .db 0x20
      00A7CA 20                       1                 .db 0x20
      00A7CB 20                       1                 .db 0x20
      00A7CC 20                       1                 .db 0x20
      00A7CD 20                       1                 .db 0x20
      00A7CE 20                       1                 .db 0x20
      00A7CF 20                       1                 .db 0x20
      00A7D0 20                       1                 .db 0x20
      00A7D1 20                       1                 .db 0x20
      00A7D2 20                       1                 .db 0x20
      00A7D3 20                       1                 .db 0x20
      00A7D4 20                       1                 .db 0x20
      00A7D5 20                       1                 .db 0x20
      00A7D6 20                       1                 .db 0x20
      00A7D7 20                       1                 .db 0x20
      00A7D8 20                       1                 .db 0x20
      00A7D9 20                       1                 .db 0x20
      00A7DA 20                       1                 .db 0x20
      00A7DB 20                       1                 .db 0x20
      00A7DC 20                       1                 .db 0x20
      00A7DD 20                       1                 .db 0x20
      00A7DE 20                       1                 .db 0x20
      00A7DF 20                       1                 .db 0x20
      00A7E0 20                       1                 .db 0x20
      00A7E1 20                       1                 .db 0x20
      00A7E2 20                       1                 .db 0x20
      00A7E3 20                       1                 .db 0x20
      00A7E4 20                       1                 .db 0x20
      00A7E5 20                       1                 .db 0x20
      00A7E6 20                       1                 .db 0x20
      00A7E7 20                       1                 .db 0x20
      00A7E8 20                       1                 .db 0x20
      00A7E9 20                       1                 .db 0x20
      00A7EA 20                       1                 .db 0x20
      00A7EB 20                       1                 .db 0x20
      00A7EC 20                       1                 .db 0x20
      00A7ED E5                       5                 .db 0xe5
      00A7EE E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A7EF 20                       1                 .db 0x20
      00A7F0 20                       1                 .db 0x20
      00A7F1 20                       1                 .db 0x20
      00A7F2 20                       1                 .db 0x20
      00A7F3 20                       1                 .db 0x20
      00A7F4 20                       1                 .db 0x20
      00A7F5 20                       1                 .db 0x20
      00A7F6 20                       1                 .db 0x20
      00A7F7 20                       1                 .db 0x20
      00A7F8 20                       1                 .db 0x20
      00A7F9 20                       1                 .db 0x20
      00A7FA 20                       1                 .db 0x20
      00A7FB 20                       1                 .db 0x20
      00A7FC 20                       1                 .db 0x20
      00A7FD 20                       1                 .db 0x20
      00A7FE 20                       1                 .db 0x20
      00A7FF 20                       1                 .db 0x20
      00A800 20                       1                 .db 0x20
      00A801 20                       1                 .db 0x20
      00A802 20                       1                 .db 0x20
      00A803 20                       1                 .db 0x20
      00A804 20                       1                 .db 0x20
      00A805 20                       1                 .db 0x20
      00A806 20                       1                 .db 0x20
      00A807 20                       1                 .db 0x20
      00A808 20                       1                 .db 0x20
      00A809 20                       1                 .db 0x20
      00A80A 20                       1                 .db 0x20
      00A80B 20                       1                 .db 0x20
      00A80C 20                       1                 .db 0x20
      00A80D 20                       1                 .db 0x20
      00A80E 20                       1                 .db 0x20
      00A80F 20                       1                 .db 0x20
      00A810 20                       1                 .db 0x20
      00A811 20                       1                 .db 0x20
      00A812 20                       1                 .db 0x20
      00A813 20                       1                 .db 0x20
      00A814 20                       1                 .db 0x20
      00A815 E5                       5                 .db 0xe5
      00A816 E5                       1                 .db 0xe5
                                      2                 .rept (BWS_LINE_WIDTH-2)
                                      3                 .db 0x20
                                      4                 .endm
      00A817 20                       1                 .db 0x20
      00A818 20                       1                 .db 0x20
      00A819 20                       1                 .db 0x20
      00A81A 20                       1                 .db 0x20
      00A81B 20                       1                 .db 0x20
      00A81C 20                       1                 .db 0x20
      00A81D 20                       1                 .db 0x20
      00A81E 20                       1                 .db 0x20
      00A81F 20                       1                 .db 0x20
      00A820 20                       1                 .db 0x20
      00A821 20                       1                 .db 0x20
      00A822 20                       1                 .db 0x20
      00A823 20                       1                 .db 0x20
      00A824 20                       1                 .db 0x20
      00A825 20                       1                 .db 0x20
      00A826 20                       1                 .db 0x20
      00A827 20                       1                 .db 0x20
      00A828 20                       1                 .db 0x20
      00A829 20                       1                 .db 0x20
      00A82A 20                       1                 .db 0x20
      00A82B 20                       1                 .db 0x20
      00A82C 20                       1                 .db 0x20
      00A82D 20                       1                 .db 0x20
      00A82E 20                       1                 .db 0x20
      00A82F 20                       1                 .db 0x20
      00A830 20                       1                 .db 0x20
      00A831 20                       1                 .db 0x20
      00A832 20                       1                 .db 0x20
      00A833 20                       1                 .db 0x20
      00A834 20                       1                 .db 0x20
      00A835 20                       1                 .db 0x20
      00A836 20                       1                 .db 0x20
      00A837 20                       1                 .db 0x20
      00A838 20                       1                 .db 0x20
      00A839 20                       1                 .db 0x20
      00A83A 20                       1                 .db 0x20
      00A83B 20                       1                 .db 0x20
      00A83C 20                       1                 .db 0x20
      00A83D E5                       5                 .db 0xe5
                                     31 
      00A83E E8                      32         .db 0xe8
                                     33         .rept (BWS_LINE_WIDTH/2-3)
                                     34         .db 0xe4
                                     35         .endm
      00A83F E4                       1         .db 0xe4
      00A840 E4                       1         .db 0xe4
      00A841 E4                       1         .db 0xe4
      00A842 E4                       1         .db 0xe4
      00A843 E4                       1         .db 0xe4
      00A844 E4                       1         .db 0xe4
      00A845 E4                       1         .db 0xe4
      00A846 E4                       1         .db 0xe4
      00A847 E4                       1         .db 0xe4
      00A848 E4                       1         .db 0xe4
      00A849 E4                       1         .db 0xe4
      00A84A E4                       1         .db 0xe4
      00A84B E4                       1         .db 0xe4
      00A84C E4                       1         .db 0xe4
      00A84D E4                       1         .db 0xe4
      00A84E E4                       1         .db 0xe4
      00A84F E4                       1         .db 0xe4
      00A850 E1 20 E0                36         .db 0xe1,0x20,0xe0
                                     37         .rept (BWS_LINE_WIDTH/2-2)
                                     38         .db 0xe4
                                     39         .endm
      00A853 E4                       1         .db 0xe4
      00A854 E4                       1         .db 0xe4
      00A855 E4                       1         .db 0xe4
      00A856 E4                       1         .db 0xe4
      00A857 E4                       1         .db 0xe4
      00A858 E4                       1         .db 0xe4
      00A859 E4                       1         .db 0xe4
      00A85A E4                       1         .db 0xe4
      00A85B E4                       1         .db 0xe4
      00A85C E4                       1         .db 0xe4
      00A85D E4                       1         .db 0xe4
      00A85E E4                       1         .db 0xe4
      00A85F E4                       1         .db 0xe4
      00A860 E4                       1         .db 0xe4
      00A861 E4                       1         .db 0xe4
      00A862 E4                       1         .db 0xe4
      00A863 E4                       1         .db 0xe4
      00A864 E4                       1         .db 0xe4
      00A865 E9                      40         .db 0xe9
                                     41 
      00A866 E2                      42         .db 0xe2
                                     43         .rept (BWS_LINE_WIDTH/2-3)
                                     44         .db 0xe4
                                     45         .endm
      00A867 E4                       1         .db 0xe4
      00A868 E4                       1         .db 0xe4
      00A869 E4                       1         .db 0xe4
      00A86A E4                       1         .db 0xe4
      00A86B E4                       1         .db 0xe4
      00A86C E4                       1         .db 0xe4
      00A86D E4                       1         .db 0xe4
      00A86E E4                       1         .db 0xe4
      00A86F E4                       1         .db 0xe4
      00A870 E4                       1         .db 0xe4
      00A871 E4                       1         .db 0xe4
      00A872 E4                       1         .db 0xe4
      00A873 E4                       1         .db 0xe4
      00A874 E4                       1         .db 0xe4
      00A875 E4                       1         .db 0xe4
      00A876 E4                       1         .db 0xe4
      00A877 E4                       1         .db 0xe4
      00A878 EB E4 EB                46         .db 0xeb,0xe4,0xeb
                                     47         .rept (BWS_LINE_WIDTH/2-2)
                                     48         .db 0xe4
                                     49         .endm
      00A87B E4                       1         .db 0xe4
      00A87C E4                       1         .db 0xe4
      00A87D E4                       1         .db 0xe4
      00A87E E4                       1         .db 0xe4
      00A87F E4                       1         .db 0xe4
      00A880 E4                       1         .db 0xe4
      00A881 E4                       1         .db 0xe4
      00A882 E4                       1         .db 0xe4
      00A883 E4                       1         .db 0xe4
      00A884 E4                       1         .db 0xe4
      00A885 E4                       1         .db 0xe4
      00A886 E4                       1         .db 0xe4
      00A887 E4                       1         .db 0xe4
      00A888 E4                       1         .db 0xe4
      00A889 E4                       1         .db 0xe4
      00A88A E4                       1         .db 0xe4
      00A88B E4                       1         .db 0xe4
      00A88C E4                       1         .db 0xe4
      00A88D E3                      50         .db 0xe3
                                    776 
      00A88E                        777 ptr_cursor:
      00A88E CF EF                  778         .db 0xcf,0xef                               ;Oo
      00A890                        779 ptr_internal_array:
      00A890 2F 17                  780         .db 0x2f,0x17                               ;/.
      00A892                        781 points_count:
      00A892 32 00                  782         .db 0x32,0x00                               ;2.
      00A894                        783 mines_count:
      00A894 4B 00                  784         .db 0x4b,0x00                               ;K.
      00A896                        785 ptr_log_buffer:
      00A896 FF 1F                  786         .db 0xff,0x1f                               ;..
      00A898                        787 ptr_random_buffer:
      00A898 BE 14                  788         .db 0xbe,0x14                               ;>.
      00A89A                        789 last_joystick:
      00A89A 00                     790         .db 0x00
      00A89B                        791 str_vorsicht_minen:
      00A89B 56 4F 52 53 49 43 48   792         .ascii 'VORSICHT   MINE/N'
             54 20 20 20 4D 49 4E
             45 2F 4E
                           000011   793 len_vorsicht_minen .equ .-str_vorsicht_minen
      00A8AC                        794 str_sie_haben:
      00A8AC 53 49 45 20 20 20 20   795         .ascii 'SIE    HABEN'
             48 41 42 45 4E
      00A8B8                        796 str_punkte_erreicht:
      00A8B8 50 55 4E 4B 54 45 20   797         .ascii 'PUNKTE    ERREICHT'
             20 20 20 45 52 52 45
             49 43 48 54
      00A8CA                        798 str_noch_ein_spiel:
      00A8CA 4E 4F 43 48 20 45 49   799         .ascii 'NOCH EIN SPIEL ?'
             4E 20 53 50 49 45 4C
             20 3F
      00A8DA                        800 txt_title:
      0008CB                        801         TITLE_IMG_CONTENT
      00A8DA E0 E4 E4 E4 E4 E4 E4     1         .ascii '\340\344\344\344\344\344\344\344\344\344\341\040\040\040\040\040\040\040\040   \331   \331\331  \331         '
             E4 E4 E4 E1 20 20 20
             20 20 20 20 20 20 20
             20 D9 20 20 20 D9 D9
             20 20 D9 20 20 20 20
             20 20 20 20 20
      00A902 E5 97 03 09 97 03 09     2         .ascii '\345\227\003\011\227\003\011\040\224\027\345\040\040\040\040\040\040\040\040  \331 \331\237\014\003\003\014\020\331\331        '
             20 94 17 E5 20 20 20
             20 20 20 20 20 20 20
             D9 20 D9 9F 0C 03 03
             0C 10 D9 D9 20 20 20
             20 20 20 20 20
      00A92A E5 0A 8F 10 95 20 20     3         .ascii '\345\012\217\020\225\040\040\040\225\025\345\040\040\040\040\040\040\040\040  \331 \227\001\040\040\040\040\002\024\040        '
             20 95 15 E5 20 20 20
             20 20 20 20 20 20 20
             D9 20 97 01 20 20 20
             20 02 14 20 20 20 20
             20 20 20 20 20
      00A952 E5 9F 20 95 95 20 9F     4         .ascii '\345\237\040\225\225\040\237\040\225\025\345\040\040\040\040\040\040\040\040  \040 \025\040\361\040\040\361\040\225\040S Start '
             20 95 15 E5 20 20 20
             20 20 20 20 20 20 20
             20 20 15 20 F1 20 20
             F1 20 95 20 53 20 53
             74 61 72 74 20
      00A97A E5 02 0C 06 02 0C 06     5         .ascii '\345\002\014\006\002\014\006\040\016\015\345\040\237\014\003\003\014\020\040  \040 \012\020\040\340\341\040\237\005\040        '
             20 0E 0D E5 20 9F 0C
             03 03 0C 10 20 20 20
             20 20 0A 10 20 E0 E1
             20 9F 05 20 20 20 20
             20 20 20 20 20
      00A9A2 E5 70 72 65 73 65 6E     6         .ascii                            '\345presents:\345\227\001\040\040\040\040\002\024  \040 \040\002\014\217\217\014\001\040\040\334 Hoch  '
             74 73 3A E5 97 01 20
             20 20 20 02 14 20 20
             20 20 20 02 0C 8F 8F
             0C 01 20 20 DC 20 48
             6F 63 68 20 20
      00A9CA E2 E4 E4 E4 E4 E4 E4     7         .ascii '\342\344\344\344\344\344\344\344\344\344\343\025\040\361\040\040\361\040\225  \040 \040\040\225\040\040\025\040\040\040        '
             E4 E4 E4 E3 15 20 F1
             20 20 F1 20 95 20 20
             20 20 20 20 95 20 20
             15 20 20 20 20 20 20
             20 20 20 20 20
      00A9F2 20 20 20 20 20 20 20     8         .ascii '\040\040\040\040\040\040\040\040\040\040\040\012\020\040\342\343\040\237\005  \040 \040\040\205\040\040\212\040\040\040\333 Runter'
             20 20 20 20 0A 10 20
             E2 E3 20 9F 05 20 20
             20 20 20 20 85 20 20
             8A 20 20 20 DB 20 52
             75 6E 74 65 72
      00AA1A 20 20 20 20 20 20 20     9         .ascii '\040\040\040\040\040\040\040\040\040\040\040\040\002\014\217\217\014\001                      '
             20 20 20 20 20 02 0C
             8F 8F 0C 01 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00AA42 20 4E 6F 77 20 79 6F    10         .ascii ' Now you     \032  \212\217              \335 Links '
             75 20 20 20 20 20 1A
             20 20 8A 8F 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 DD 20 4C
             69 6E 6B 73 20
      00AA6A 20 20 20 20 20 20 20    11         .ascii '            \003    \367\366                     '
             20 20 20 20 20 03 20
             20 20 20 F7 F6 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00AA92 20 61 72 65 20 68 61    12         .ascii ' are happy      \367\337\337\366  but be    \336 Rechts'
             70 70 79 20 20 20 20
             20 20 F7 DF DF F6 20
             20 62 75 74 20 62 65
             20 20 20 20 DE 20 52
             65 63 68 74 73
      00AABA 20 20 20 20 20 20 20    13         .ascii '                       carefull!        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 63 61 72 65 66
             75 6C 6C 21 20 20 20
             20 20 20 20 20
      00AAE2 20 20 20 20 20 20 20    14         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00AB0A 20 20 20 20 20 20 20    15         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00AB32 20 20 20 20 20 20 20    16         .ascii '     \040\040 \237\040\237\040\040\040\040\040\040\040\040\040\237\020\040\040\040\040\237\040\040\040\020\040\040\040      ' 
             20 9F 20 9F 20 20 20
             20 20 20 20 20 20 9F
             10 20 20 20 20 9F 20
             20 20 10 20 20 20 20
             20 20 20 20 20
      00AB5A 20 20 20 20 20 9B 20    17         .ascii '     \233\040 \225\011\224\040\021\237\237\040\040\217\020\040\025\040\021\040\217\020\225\040\237\217\025\040\040\030      '
             20 95 09 94 20 11 9F
             9F 20 20 8F 10 20 15
             20 11 20 8F 10 95 20
             9F 8F 15 20 20 18 20
             20 20 20 20 20
      00AB82 20 20 20 20 20 20 19    18         .ascii '     \040\031 \225\040\225\040\025\225\001\025\225\217\032\012\027\040\025\225\217\032\225\040\025\040\025\040\231\040      '
             20 95 20 95 20 15 95
             01 15 95 8F 1A 0A 17
             20 15 95 8F 1A 95 20
             15 20 15 20 99 20 20
             20 20 20 20 20
      00ABAA 20 20 20 20 20 06 20    19         .ascii '     \006\040 \225\040\225\237\212\225\040\212\012\217\217\040\025\237\212\012\217\217\225\020\232\217\025\040\040\011      '
             20 95 20 95 9F 8A 95
             20 8A 0A 8F 8F 20 15
             9F 8A 0A 8F 8F 95 10
             9A 8F 15 20 20 09 20
             20 20 20 20 20
      00ABD2 20 20 20 20 20 20 20    20         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00ABFA 20 20 20 20 20 20 20    21         .ascii '                                        '
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00AC22 20 20 20 20 20 43 2D    22         .ascii '     C-1987 SOFTWARE CENTER ILMENAU     '
             31 39 38 37 20 53 4F
             46 54 57 41 52 45 20
             43 45 4E 54 45 52 20
             49 4C 4D 45 4E 41 55
             20 20 20 20 20
      00AC4A 20 20 20 20 20 20 20    23         .ascii '          by DIRK STREHLE               '
             20 20 20 62 79 20 44
             49 52 4B 20 53 54 52
             45 48 4C 45 20 20 20
             20 20 20 20 20 20 20
             20 20 20 20 20
      00AC72 20 20 20 20 20 20 32    24         .ascii '      2020 MOD by Andreas Ziermann      '
             30 32 30 20 4D 4F 44
             20 62 79 20 41 6E 64
             72 65 61 73 20 5A 69
             65 72 6D 61 6E 6E 20
             20 20 20 20 20
                                    802 ;
                                    803 ;
                                    804 ;
                                    805 	.area _DATA 
      008000                        806 INTERNAL_ARRAY:
      008000                        807         .ds BWS_LINE_WIDTH*MINEFIELD_ARRAY_HEIGHT
      008348                        808 LOG_BUFFER:
      008348                        809         .ds 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

  0 $correct_ptr                                                   0002A9 GR
  0 $draw_character                                                000295 GR
  0 $get_character                                                 00028B GR
  0 $put_mine                                                      0003D3 GR
  0 $show_new_line                                                 000289 GR
  0 $sub_line_width_down                                           00013B GR
  0 $sub_line_width_up                                             000107 GR
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
    BLINK_COUNTER                                               =  00000A G
    BWS                                                         =  00F000 G
    BWS_ADR_BONUS_L                                             =  00F1C0 G
    BWS_ADR_BONUS_R                                             =  00F1D7 G
    BWS_ADR_HINT                                                =  00F017 G
    BWS_ADR_MINES                                               =  00F006 G
    BWS_ADR_POINTS                                              =  00F012 G
    BWS_A_JA                                                    =  00F2DE G
    BWS_A_NOCH_EIN                                              =  00F288 G
    BWS_A_PUNKTE_ER                                             =  00F16F G
    BWS_A_SIE_HABEN                                             =  00F0D2 G
    BWS_A_TOTAL_POI                                             =  00F125 G
    BWS_HEIGHT                                                  =  000018 G
    BWS_LINE_WIDTH                                              =  000028 G
    BWS_SIZE                                                    =  0003C0 G
    CFG10                                                       =  000010 G
    CFG20                                                       =  000020 G
    CHR_BONUS                                                   =  0000FA G
    CHR_FREE                                                    =  000020 G
    CHR_MAN                                                     =  0000FD G
    CHR_MINE                                                    =  0000F1 G
    CHR_VISITED                                                 =  0000EE G
    CRT_DATA                                                    =  000051 G
    CRT_REG                                                     =  000050 G
    CUT_OFF                                                     =  0002A8 G
    END_COLUMN                                                  =  000013 G
    END_ROW                                                     =  000002 G
    END_SCREEN_CORRECTION                                       =  000005 G
    FG_BLACK                                                    =  000000 G
    FG_BLUE                                                     =  000001 G
    FG_CYAN                                                     =  000005 G
    FG_GREEN                                                    =  000004 G
    FG_MAGENTA                                                  =  000003 G
    FG_RED                                                      =  000002 G
    FG_WHITE                                                    =  000007 G
    FG_YELLOW                                                   =  000006 G
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
    OFFSET_COLOR                                                =  000800 G
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
    REG_10_CURSOR_START                                         =  00000A G
    SET_TO_ZERO                                                 =  000000 G
    START_COLUMN                                                =  000013 G
    START_ROW                                                   =  000016 G
    VK_CLS                                                      =  00000C G
    VK_DOWN                                                     =  00001F G
    VK_ENTER                                                    =  00000D G
    VK_LEFT                                                     =  00001D G
    VK_RIGHT                                                    =  00001C G
    VK_UP                                                       =  00001E G
    WAIT_130MS                                                  =  002710 G
    WAIT_250MS                                                  =  004E20 G
    WAIT_750MS                                                  =  00EA60 G
    WAVE_LEN_285Hz                                              =  000064 G
    WAVE_PERIODS                                                =  000050 G
  0 _main                                                          000000 GR
  0 add_bonus_down                                                 000143 GR
  0 add_bonus_left                                                 0001E4 GR
  0 add_bonus_right                                                000196 GR
  0 add_bonus_up                                                   0000B6 GR
  0 animate$delay_free                                             000260 GR
  0 animate$delay_visited                                          000255 GR
  0 animate_down                                                   0003B7 GR
  0 animate_end                                                    00024F GR
  0 animate_left                                                   0003C7 GR
  0 animate_recording                                              000389 GR
  0 animate_right                                                  0003BF GR
  0 animate_up                                                     0003AE GR
  0 append_key                                                     0002EC GR
    cfg10_settings                                              =  00E468 G
    cfg20_settings                                              =  00E469 G
  0 check_for_bonus                                                00033F GR
  0 clear_data                                                     00035B GR
  0 clear_screen                                                   000233 GR
  0 clear_status_line                                              0002DD GR
  0 click_sound                                                    000471 GR
  0 continue_up                                                    0000C3 GR
  0 convert$hex_to_ascii                                           0002D1 GR
  0 convert$sub_digit                                              0002CA GR
  0 convert_digit_to_ascii                                         0002C9 GR
  0 count_mines                                                    0000F0 GR
    crt_cls                                                     =  00E9E8 G
    crt_cursor_disable                                             ****** GX
  0 distribute$is_smaller                                          0003E7 GR
  0 distribute$new_number                                          0003D4 GR
  0 distribute_mines                                               0003CF GR
  0 do_down                                                        00011F GR
  0 do_left                                                        0001BF GR
  0 do_quit                                                        000407 GR
  0 do_right                                                       000171 GR
  0 do_skip_level                                                  00020D GR
  0 do_up                                                          000095 GR
    exit                                                           ****** GX
  0 go_next                                                        00042A GR
  0 hex2int                                                        0002AF GR
    inkey                                                          ****** GX
  0 kill_all_and_halt                                              00046D GR
    l__CODE                                                        ****** GX
  0 last_joystick                                                  00088B GR
    len_vorsicht_minen                                          =  000011 G
  0 line_correction_ptr                                            0002A7 GR
  0 main_loop                                                      000068 GR
  0 mines_count                                                    000885 GR
    mon_reboot                                                  =  00E023 G
  0 new_game                                                       000023 GR
    ofs_minen                                                   =  000006 G
    ofs_points                                                  =  000012 G
    ofs_vorsicht                                                =  000017 G
  0 points_count                                                   000883 GR
  0 points_plus_25                                                 000375 GR
  0 points_plus_50                                                 00036A GR
  0 print_mines_count                                              0002F8 GR
  0 ptr_cursor                                                     00087F GR
  0 ptr_internal_array                                             000881 GR
  0 ptr_log_buffer                                                 000887 GR
  0 ptr_random_buffer                                              000889 GR
  0 quit_sound                                                     000470 GR
  0 rand16                                                         000472 GR
  0 rand16$write_seed                                              000486 GR
  0 recording$delay                                                00038D GR
    s__CODE                                                        ****** GX
  0 seed                                                           00048A GR
  0 show_empty_field                                               00026C GR
  0 show_mine_field                                                00027E GR
  0 show_points_plus_100                                           00030E GR
  0 show_recording_history                                         000380 GR
  0 show_title                                                     000325 GR
  0 show_win_animation                                             000249 GR
    size_of_noch_ein_spiel                                      =  000010 G
    size_of_punkte_erreich                                      =  000012 G
    size_of_sie_haben                                           =  00000C G
    size_of_vorsicht_minen                                      =  000014 G
  0 start_level                                                    000032 GR
  0 str_noch_ein_spiel                                             0008BB GR
  0 str_punkte_erreicht                                            0008A9 GR
  0 str_sie_haben                                                  00089D GR
  0 str_vorsicht_minen                                             00088C GR
    ta_alpha                                                    =  000001 G
  0 test_end_down                                                  000146 GR
  0 test_end_left                                                  0001E7 GR
  0 test_end_right                                                 000199 GR
  0 test_end_up                                                    0000B9 GR
  0 test_inc_mine_count                                            000119 GR
  0 txt_empty_screen                                               0004BF GR
  0 txt_title                                                      0008CB GR
  0 up_inch                                                        00048C GR
  0 up_inch$end                                                    0004BE GR
  0 up_inch$fire                                                   0004B8 GR
  0 up_inch$is_down                                                0004A0 GR
  0 up_inch$is_left                                                0004A7 GR
  0 up_inch$is_right                                               0004AE GR
  0 up_inch$is_start                                               0004B5 GR
  0 up_inch$is_up                                                  000499 GR
  0 up_inch$test_down                                              00049C GR
  0 up_inch$test_enter                                             0004B1 GR
  0 up_inch$test_left                                              0004A3 GR
  0 up_inch$test_right                                             0004AA GR
  0 update_screen_down                                             00015C GR
  0 update_screen_left                                             0001F8 GR
  0 update_screen_right                                            0001AA GR
  0 update_screen_up                                               0000DB GR
  0 wait                                                           0002D7 GR
  0 wait_to_start                                                  00001C GR
    z1013                                                       =  000000 G
    z9001                                                       =  000000 G


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size    C8B   flags    0
   1 _DATA                                      size    349   flags    0


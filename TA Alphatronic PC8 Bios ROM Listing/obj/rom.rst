                                      1 ; source : 0_b4-6_ic1038.bin
                                      2 ; created: 2021-01-22 10:47:42
                                      3 ; by     : Andreas Ziermann
                                      4 ; 
                                      5 ; constant
                                      6 ; 
                           000000     7 HIGH_ZERO                        = 0x00
                           000001     8 ON                               = 0x01
                           000001     9 TOGGLE_SLED                      = 0x01
                           000000    10 STATUS_SLED                      = 0x00
                           000004    11 TOGGLE_GLED                      = 0x04
                           000002    12 STATUS_GLED                      = 0x02
                           000000    13 OFF                              = 0x00
                           000000    14 REG_0                            = 0x00
                           00000E    15 REG_14_CURSOR_H                  = 0x0e
                           00000F    16 REG_14_CURSOR_L                  = 0x0f
                           000010    17 CFG10                            = 0x10
                           000007    18 ROM_ACCESS_EN                    = 0x07
                           000006    19 ROM_PACK_EN                      = 0x06
                           000004    20 _BUZZER_ON                       = 0x04
                           000003    21 CMT_MOTOR_START                  = 0x03
                           000002    22 CMT_RS232_SELECT                 = 0x02
                           000001    23 _DISPLAY_INHIBIT                 = 0x01
                           000001    24 _CRT80                           = 0x01
                           000010    25 STATUS10                         = 0x10
                           000007    26 _CRT_DISPLAY                     = 0x07
                           000006    27 _CRT_NTSC                        = 0x06
                           000005    28 _PRT_SERIAL                      = 0x05
                           000001    29 _GFX_AVAILABLE                   = 0x01
                           000000    30 _FDD_PRESENT                     = 0x00
                           00001C    31 MASK_COUNTRY_SELECT              = 0x1c
                           000007    32 MASK_COUNTRY_BITS                = 0x07
                           000000    33 COUNTRY_INTERNATIONAL            = 0x00
                           000001    34 COUNTRY_DE                       = 0x01
                           000002    35 COUNTRY_US                       = 0x02
                           000003    36 COUNTRY_FR                       = 0x03
                           000004    37 COUNTRY_UK                       = 0x04
                           000005    38 COUNTRY_IT                       = 0x05
                           000006    39 COUNTRY_ES                       = 0x06
                           000007    40 COUNTRY_07                       = 0x07
                           000020    41 CFG20                            = 0x20
                           000000    42 CRT_RESET                        = 0x00
                           000001    43 CEN_RESET                        = 0x01
                           000002    44 CEN_STROBE                       = 0x02
                           000003    45 MONINH                           = 0x03
                           000004    46 GLED                             = 0x04
                           000005    47 SLED                             = 0x05
                           000006    48 UPPER_MONITOR_SEL                = 0x06
                           000020    49 STATUS_KBD                       = 0x20
                           00000C    50 KBD_COLUMNS                      = 0x0c
                           00004F    51 KBD_POSITION_CTRL                = 0x4f
                           000053    52 KBD_POSITION_SHIFT               = 0x53
                           00004E    53 KBD_POSITION_SHIFT_LOCK          = 0x4e
                           00004D    54 KBD_POSITION_COMMAND             = 0x4d
                           000056    55 KBD_POSITION_GRAPH               = 0x56
                           000007    56 KBD_BREAK                        = 0x07
                           000001    57 MODIFIER_SHIFT                   = 0x01
                           000030    58 STATUS30                         = 0x30
                           000030    59 CEN_DATA                         = 0x30
                           000000    60 _SIOC                            = 0x00
                           000001    61 _CRT_VSYNC_PERIOD                = 0x01
                           000002    62 _CEN_ACKNOWLEDGE                 = 0x02
                           000003    63 _CEN_BUSY                        = 0x03
                           000050    64 CRT_REG                          = 0x50
                           000051    65 CRT_DATA                         = 0x51
                           000060    66 DMA                              = 0x60
                           000068    67 DMA_MODE_SET                     = 0x68
                           000070    68 PIC_ICW1                         = 0x70
                           000071    69 PIC_ICW2                         = 0x71
                           000071    70 PIC_OCW1                         = 0x71
                           000008    71 FDC_CMD_SENSE_INTERRUPT_STATE    = 0x08
                           0000F0    72 FDC_UNIT                         = 0xf0
                           0000F0    73 UPD765_STATE                     = 0xf0
                           0000F8    74 UPD765_DATA                      = 0xf8
                           0000F9    75 UPD765_MAIN_STATUS               = 0xf9
                           000007    76 RQM_Request_for_master           = 0x07
                           000006    77 DIO_Data_input_output            = 0x06
                           0000C3    78 ID_JMP                           = 0xc3
                           00007E    79 ID_IS_BASIC                      = 0x7e
                           000018    80 SCREEN_HEIGHT                    = 0x18
                           00000D    81 VK_ENTER                         = 0x0d
                           00001B    82 VK_ESC                           = 0x1b
                           00001D    83 VK_LEFT                          = 0x1d
                           00001C    84 VK_RIGHT                         = 0x1c
                           00001E    85 VK_UP                            = 0x1e
                           00001F    86 VK_DOWN                          = 0x1f
                           00007F    87 VK_DEL                           = 0x7f
                           00007E    88 GERMAN_MAX_ASCII_CODE            = 0x7e
                           00005F    89 MASK_CAPITALIZE                  = 0x5f
                                     90 
                           00C200    91 boot_sector                      = 0xc200
                           000000    92 cold_start                       = 0x0000
                           000008    93 id_basic                         = 0x0008
                           000038    94 rst_38                           = 0x0038
                           00003B    95 basic_start                      = 0x003b
                           00F000    96 BWS                              = 0xf000
                           00F000    97 stack_at_boot                    = 0xf000
                           000800    98 OFFSET_COLOR                     = 0x0800
                           00A000    99 ROM_PACK_16K                     = 0xa000
                           00C000   100 ROM_PACK_8K                      = 0xc000
                           00FFFF   101 MAX_ADDRESS                      = 0xffff
                           000023   102 str_monitor_size                 = 0x0023
                           00000E   103 str_memory_size                  = 0x000e
                           00000E   104 str_completed_size               = 0x000e
                           000010   105 str_area_over_size               = 0x0010
                           00000E   106 str_print_off_size               = 0x000e
                           00000D   107 str_print_on_size                = 0x000d
                           00000D   108 str_break_at_size                = 0x000d
                           00002D   109 str_reg_size                     = 0x002d
                           00000C   110 kbd_matrix_buffer_size           = 0x000c
                           00000C   111 kbd_matrix_buffer2_size          = 0x000c
                           0000C0   112 kbd_table_lookup_size            = 0x00c0
                           000010   113 crt_table40_size                 = 0x0010
                           000010   114 crt_table80_size                 = 0x0010
                           000005   115 fdc_cmd_init_size                = 0x0005
                           000009   116 fdc_cmd_read_boot_size           = 0x0009
                           000060   117 kbd_table_int_size               = 0x0060
                           000060   118 kbd_table_int_sh_size            = 0x0060
                           0000C0   119 kbd_table_de_size                = 0x00c0
                           0000C0   120 kbd_table_us_size                = 0x00c0
                           0000C0   121 kbd_table_fr_size                = 0x00c0
                           0000C0   122 kbd_table_uk_size                = 0x00c0
                           0000C0   123 kbd_table_it_size                = 0x00c0
                           0000C0   124 kbd_table_es_size                = 0x00c0
                           000024   125 crt_table_ntsc_size              = 0x0024
                                    126 ;
                                    127 ;
                                    128 ;
      00E000                        129 m_e000:
      00E000 21 69 E4         [10]  130         ld      hl,#cfg20_settings
      00E003 CB DE            [15]  131         set     3,(hl)                                  ;MONINH
      00E005 7E               [ 7]  132         ld      a,(hl)
      00E006 D3 20            [11]  133         out     (CFG20),a
      00E008 CD 9D E5         [17]  134         call    kbd_buffer_clear_beep
      00E00B 21 68 E4         [10]  135         ld      hl,#cfg10_settings
      00E00E CB F6            [15]  136         set     6,(hl)                                  ;ROM_PACK_EN
      00E010 7E               [ 7]  137         ld      a,(hl)
      00E011 D3 10            [11]  138         out     (CFG10),a
      00E013 3A 00 A0         [13]  139         ld      a,(ROM_PACK_16K)
      00E016 FE C3            [ 7]  140         cp      #ID_JMP
      00E018 CA 00 A0         [10]  141         jp      z,ROM_PACK_16K
      00E01B 3A 00 C0         [13]  142         ld      a,(ROM_PACK_8K)
      00E01E FE C3            [ 7]  143         cp      #ID_JMP
      00E020 CA 00 C0         [10]  144         jp      z,ROM_PACK_8K
      00E023 21 68 E4         [10]  145         ld      hl,#cfg10_settings
      00E026 CB B6            [15]  146         res     6,(hl)                                  ;ROM_PACK_EN
      00E028 7E               [ 7]  147         ld      a,(hl)
      00E029 D3 10            [11]  148         out     (CFG10),a
      00E02B DB 10            [11]  149         in      a,(STATUS10)
      00E02D CB 47            [ 8]  150         bit     0,a                                     ;_FDD_PRESENT
      00E02F C2 98 EF         [10]  151         jp      nz,fdd_available
      00E032 3A 08 00         [13]  152         ld      a,(id_basic)
      00E035 FE 7E            [ 7]  153         cp      #ID_IS_BASIC
      00E037 28 0C            [12]  154         jr      z,go_basic
      00E039 21 68 E4         [10]  155         ld      hl,#cfg10_settings
      00E03C CB FE            [15]  156         set     7,(hl)                                  ;ROM_ACCESS_EN
      00E03E 7E               [ 7]  157         ld      a,(hl)
      00E03F 77               [ 7]  158         ld      (hl),a
      00E040 D3 10            [11]  159         out     (CFG10),a
      00E042 C3 60 E0         [10]  160         jp      go_monitor
      00E045                        161 go_basic:
      00E045 CD 74 EF         [17]  162         call    patch_os_functions
      00E048 C3 3B 00         [10]  163         jp      basic_start
                                    164 ; unchecked data source
      00E04B 00 00 00 00 00 00 00   165         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E053 00 00 00 00 00 00 00   166         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E05B 00 00 00 00 00         167         .db     0x00,0x00,0x00,0x00,0x00                ;.....
      00E060                        168 go_monitor:
      00E060 ED 73 C6 E4      [20]  169         ld      (save_stack),sp
      00E064 31 00 F0         [10]  170         ld      sp,#stack_at_boot
      00E067 CD 8C EF         [17]  171         call    restore_os_functions
      00E06A 21 E9 E2         [10]  172         ld      hl,#str_monitor
      00E06D                        173 m_e06d:
      00E06D CD 6A EF         [17]  174         call    puts
      00E070 CD 53 EF         [17]  175         call    get_hex_number
      00E073 FE 0D            [ 7]  176         cp      #VK_ENTER
      00E075 28 08            [12]  177         jr      z,m_e07f
      00E077 CD C3 E3         [17]  178         call    print_new_line
      00E07A 21 0C E3         [10]  179         ld      hl,#str_memory
      00E07D 18 EE            [12]  180         jr      m_e06d
      00E07F                        181 m_e07f:
      00E07F 2A 9C E4         [16]  182         ld      hl,(param_word)
      00E082 7C               [ 4]  183         ld      a,h
      00E083 B5               [ 4]  184         or      l
      00E084 20 03            [12]  185         jr      nz,m_e089
      00E086 21 FF FF         [10]  186         ld      hl,#MAX_ADDRESS
      00E089                        187 m_e089:
      00E089 22 A4 E4         [16]  188         ld      (0xe4a4),hl
      00E08C                        189 monitor_cmd_loop:
      00E08C 21 8C E0         [10]  190         ld      hl,#monitor_cmd_loop
      00E08F E5               [11]  191         push    hl
      00E090 CD C3 E3         [17]  192         call    print_new_line
      00E093 0E 2A            [ 7]  193         ld      c,#'*'
      00E095 CD D5 E3         [17]  194         call    put_char
      00E098 CD F2 E3         [17]  195         call    get_char_echoed
      00E09B FE 1B            [ 7]  196         cp      #VK_ESC
      00E09D C8               [11]  197         ret     z
      00E09E E6 5F            [ 7]  198         and     #MASK_CAPITALIZE
      00E0A0 FE 45            [ 7]  199         cp      #'E'
      00E0A2 CA 70 E2         [10]  200         jp      z,return_to_basic
      00E0A5 FE 50            [ 7]  201         cp      #'P'
      00E0A7 CA 57 E2         [10]  202         jp      z,enable_protocol_printer
      00E0AA FE 4D            [ 7]  203         cp      #'M'
      00E0AC CA F2 E0         [10]  204         jp      z,monitor_cmd_mem_move
      00E0AF FE 44            [ 7]  205         cp      #'D'
      00E0B1 CA 78 E1         [10]  206         jp      z,m_e178
      00E0B4 FE 47            [ 7]  207         cp      #'G'
      00E0B6 CA C9 E1         [10]  208         jp      z,m_e1c9
      00E0B9 FE 52            [ 7]  209         cp      #'R'
      00E0BB CA 1D E2         [10]  210         jp      z,m_e21d
      00E0BE FE 43            [ 7]  211         cp      #'C'
      00E0C0 C0               [11]  212         ret     nz
      00E0C1 CD CD E3         [17]  213         call    print_space
      00E0C4 CD 53 EF         [17]  214         call    get_hex_number
      00E0C7 FE 0D            [ 7]  215         cp      #VK_ENTER
      00E0C9 C0               [11]  216         ret     nz
      00E0CA 2A 9C E4         [16]  217         ld      hl,(param_word)
      00E0CD                        218 m_e0cd:
      00E0CD CD DC E2         [17]  219         call    m_e2dc
      00E0D0                        220 m_e0d0:
      00E0D0 E5               [11]  221         push    hl
      00E0D1 CD AB E3         [17]  222         call    m_e3ab
      00E0D4 CD E0 E3         [17]  223         call    m_e3e0
      00E0D7 E1               [10]  224         pop     hl
      00E0D8 38 09            [12]  225         jr      c,m_e0e3
      00E0DA 77               [ 7]  226         ld      (hl),a
      00E0DB                        227 m_e0db:
      00E0DB 23               [ 6]  228         inc     hl
      00E0DC 7D               [ 4]  229         ld      a,l
      00E0DD E6 07            [ 7]  230         and     #0x07
      00E0DF 20 EF            [12]  231         jr      nz,m_e0d0
      00E0E1 18 EA            [12]  232         jr      m_e0cd
      00E0E3                        233 m_e0e3:
      00E0E3 FE 20            [ 7]  234         cp      #0x20
      00E0E5 20 05            [12]  235         jr      nz,m_e0ec
      00E0E7 CD CD E3         [17]  236         call    print_space
      00E0EA 18 EF            [12]  237         jr      m_e0db
      00E0EC                        238 m_e0ec:
      00E0EC FE 2D            [ 7]  239         cp      #0x2d
      00E0EE C0               [11]  240         ret     nz
      00E0EF 2B               [ 6]  241         dec     hl
      00E0F0 18 DB            [12]  242         jr      m_e0cd
      00E0F2                        243 monitor_cmd_mem_move:
      00E0F2 CD CD E3         [17]  244         call    print_space
      00E0F5 CD 53 EF         [17]  245         call    get_hex_number
      00E0F8 FE 2C            [ 7]  246         cp      #','
      00E0FA C0               [11]  247         ret     nz
      00E0FB 2A 9C E4         [16]  248         ld      hl,(param_word)
      00E0FE 22 9E E4         [16]  249         ld      (param_1),hl
      00E101 CD 53 EF         [17]  250         call    get_hex_number
      00E104 FE 2C            [ 7]  251         cp      #','
      00E106 C0               [11]  252         ret     nz
      00E107 2A 9E E4         [16]  253         ld      hl,(param_1)
      00E10A EB               [ 4]  254         ex      de,hl
      00E10B 2A 9C E4         [16]  255         ld      hl,(param_word)
      00E10E 22 A0 E4         [16]  256         ld      (param_2),hl
      00E111 B7               [ 4]  257         or      a
      00E112 ED 52            [15]  258         sbc     hl,de
      00E114 D8               [11]  259         ret     c
      00E115 23               [ 6]  260         inc     hl
      00E116 22 A2 E4         [16]  261         ld      (param_3),hl
      00E119 CD 53 EF         [17]  262         call    get_hex_number
      00E11C FE 0D            [ 7]  263         cp      #VK_ENTER
      00E11E C0               [11]  264         ret     nz
      00E11F 2A A2 E4         [16]  265         ld      hl,(param_3)
      00E122 2B               [ 6]  266         dec     hl
      00E123 EB               [ 4]  267         ex      de,hl
      00E124 2A 9C E4         [16]  268         ld      hl,(param_word)
      00E127 B7               [ 4]  269         or      a
      00E128 ED 5A            [15]  270         adc     hl,de
      00E12A 38 40            [12]  271         jr      c,m_e16c
      00E12C EB               [ 4]  272         ex      de,hl
      00E12D 2A A4 E4         [16]  273         ld      hl,(0xe4a4)
      00E130 ED 52            [15]  274         sbc     hl,de
      00E132 38 38            [12]  275         jr      c,m_e16c
      00E134 D5               [11]  276         push    de
      00E135 2A 9E E4         [16]  277         ld      hl,(param_1)
      00E138 EB               [ 4]  278         ex      de,hl
      00E139 2A 9C E4         [16]  279         ld      hl,(param_word)
      00E13C B7               [ 4]  280         or      a
      00E13D ED 52            [15]  281         sbc     hl,de
      00E13F 38 1D            [12]  282         jr      c,m_e15e
      00E141 D1               [10]  283         pop     de
      00E142 7C               [ 4]  284         ld      a,h
      00E143 B5               [ 4]  285         or      l
      00E144 28 11            [12]  286         jr      z,m_e157
      00E146 2A A2 E4         [16]  287         ld      hl,(param_3)
      00E149 E5               [11]  288         push    hl
      00E14A C1               [10]  289         pop     bc
      00E14B 2A A0 E4         [16]  290         ld      hl,(param_2)
      00E14E                        291 m_e14e:
      00E14E 7E               [ 7]  292         ld      a,(hl)
      00E14F 12               [ 7]  293         ld      (de),a
      00E150 2B               [ 6]  294         dec     hl
      00E151 1B               [ 6]  295         dec     de
      00E152 0B               [ 6]  296         dec     bc
      00E153 78               [ 4]  297         ld      a,b
      00E154 B1               [ 4]  298         or      c
      00E155 20 F7            [12]  299         jr      nz,m_e14e
      00E157                        300 m_e157:
      00E157 21 1A E3         [10]  301         ld      hl,#str_completed
      00E15A CD 6A EF         [17]  302         call    puts
      00E15D C9               [10]  303         ret
      00E15E                        304 m_e15e:
      00E15E 2A A2 E4         [16]  305         ld      hl,(param_3)
      00E161 E5               [11]  306         push    hl
      00E162 C1               [10]  307         pop     bc
      00E163 2A 9C E4         [16]  308         ld      hl,(0xe49c)
      00E166 EB               [ 4]  309         ex      de,hl
      00E167 ED B0            [21]  310         ldir
      00E169 D1               [10]  311         pop     de
      00E16A 18 EB            [12]  312         jr      m_e157
      00E16C                        313 m_e16c:
      00E16C 21 28 E3         [10]  314         ld      hl,#str_area_over
      00E16F CD 6A EF         [17]  315         call    puts
      00E172 21 0C E3         [10]  316         ld      hl,#str_memory
      00E175 C3 6D E0         [10]  317         jp      m_e06d
      00E178                        318 m_e178:
      00E178 CD CD E3         [17]  319         call    print_space
      00E17B CD 53 EF         [17]  320         call    get_hex_number
      00E17E FE 2C            [ 7]  321         cp      #0x2c
      00E180 C0               [11]  322         ret     nz
      00E181 2A 9C E4         [16]  323         ld      hl,(0xe49c)
      00E184 22 9E E4         [16]  324         ld      (param_1),hl
      00E187 CD 53 EF         [17]  325         call    get_hex_number
      00E18A FE 0D            [ 7]  326         cp      #0x0d
      00E18C C0               [11]  327         ret     nz
      00E18D 2A 9E E4         [16]  328         ld      hl,(param_1)
      00E190 EB               [ 4]  329         ex      de,hl
      00E191 2A 9C E4         [16]  330         ld      hl,(0xe49c)
      00E194 B7               [ 4]  331         or      a
      00E195 ED 52            [15]  332         sbc     hl,de
      00E197 D8               [11]  333         ret     c
      00E198 23               [ 6]  334         inc     hl
      00E199 E5               [11]  335         push    hl
      00E19A EB               [ 4]  336         ex      de,hl
      00E19B C1               [10]  337         pop     bc
      00E19C                        338 m_e19c:
      00E19C C5               [11]  339         push    bc
      00E19D E5               [11]  340         push    hl
      00E19E CD DC E2         [17]  341         call    m_e2dc
      00E1A1 CD D0 E2         [17]  342         call    m_e2d0
      00E1A4 E1               [10]  343         pop     hl
      00E1A5 C1               [10]  344         pop     bc
      00E1A6 11 A6 E4         [10]  345         ld      de,#0xe4a6
      00E1A9                        346 m_e1a9:
      00E1A9 CD 8D E3         [17]  347         call    m_e38d
      00E1AC 7E               [ 7]  348         ld      a,(hl)
      00E1AD 12               [ 7]  349         ld      (de),a
      00E1AE 0B               [ 6]  350         dec     bc
      00E1AF 78               [ 4]  351         ld      a,b
      00E1B0 B1               [ 4]  352         or      c
      00E1B1 23               [ 6]  353         inc     hl
      00E1B2 13               [ 6]  354         inc     de
      00E1B3 CA 82 E2         [10]  355         jp      z,m_e282
      00E1B6 3A 62 E4         [13]  356         ld      a,(0xe462)
      00E1B9 EE 0F            [ 7]  357         xor     #0x0f
      00E1BB E6 0F            [ 7]  358         and     #0x0f
      00E1BD C5               [11]  359         push    bc
      00E1BE 47               [ 4]  360         ld      b,a
      00E1BF 7D               [ 4]  361         ld      a,l
      00E1C0 A0               [ 4]  362         and     b
      00E1C1 C1               [10]  363         pop     bc
      00E1C2 20 E5            [12]  364         jr      nz,m_e1a9
      00E1C4 CD 82 E2         [17]  365         call    m_e282
      00E1C7 18 D3            [12]  366         jr      m_e19c
      00E1C9                        367 m_e1c9:
      00E1C9 CD CD E3         [17]  368         call    print_space
      00E1CC CD 53 EF         [17]  369         call    get_hex_number
      00E1CF FE 0D            [ 7]  370         cp      #VK_ENTER
      00E1D1 C0               [11]  371         ret     nz
      00E1D2 21 38 00         [10]  372         ld      hl,#rst_38
      00E1D5 EB               [ 4]  373         ex      de,hl
      00E1D6 21 E7 E1         [10]  374         ld      hl,#rst38_vec
      00E1D9 01 03 00         [10]  375         ld      bc,#3
      00E1DC ED B0            [21]  376         ldir
      00E1DE 21 E6 E1         [10]  377         ld      hl,#op_return
      00E1E1 E5               [11]  378         push    hl
      00E1E2 2A 9C E4         [16]  379         ld      hl,(param_word)
      00E1E5 E9               [ 4]  380         jp      (hl)
      00E1E6                        381 op_return:
      00E1E6 C9               [10]  382         ret
      00E1E7                        383 rst38_vec:
      00E1E7 C3 EA E1         [10]  384         jp      m_e1ea
      00E1EA                        385 m_e1ea:
      00E1EA 22 BD E4         [16]  386         ld      (0xe4bd),hl
      00E1ED E1               [10]  387         pop     hl
      00E1EE 22 B7 E4         [16]  388         ld      (0xe4b7),hl
      00E1F1 F5               [11]  389         push    af
      00E1F2 E1               [10]  390         pop     hl
      00E1F3 22 BF E4         [16]  391         ld      (0xe4bf),hl
      00E1F6 ED 43 B9 E4      [20]  392         ld      (0xe4b9),bc
      00E1FA ED 53 BB E4      [20]  393         ld      (0xe4bb),de
      00E1FE ED 57            [ 9]  394         ld      a,i
      00E200 32 C1 E4         [13]  395         ld      (0xe4c1),a
      00E203 DD 22 C2 E4      [20]  396         ld      (0xe4c2),ix
      00E207 FD 22 C4 E4      [20]  397         ld      (0xe4c4),iy
      00E20B 21 53 E3         [10]  398         ld      hl,#str_break_at
      00E20E CD 6A EF         [17]  399         call    puts
      00E211 2A B7 E4         [16]  400         ld      hl,(0xe4b7)
      00E214 CD 93 E3         [17]  401         call    m_e393
      00E217 31 00 F0         [10]  402         ld      sp,#stack_at_boot
      00E21A C3 8C E0         [10]  403         jp      monitor_cmd_loop
      00E21D                        404 m_e21d:
      00E21D 21 60 E3         [10]  405         ld      hl,#str_reg
      00E220 CD 6A EF         [17]  406         call    puts
      00E223 2A B7 E4         [16]  407         ld      hl,(0xe4b7)
      00E226 CD 93 E3         [17]  408         call    m_e393
      00E229 21 B9 E4         [10]  409         ld      hl,#0xe4b9
      00E22C 0E 04            [ 7]  410         ld      c,#0x04
      00E22E                        411 m_e22e:
      00E22E C5               [11]  412         push    bc
      00E22F 23               [ 6]  413         inc     hl
      00E230 E5               [11]  414         push    hl
      00E231 CD 8D E3         [17]  415         call    m_e38d
      00E234 E1               [10]  416         pop     hl
      00E235 2B               [ 6]  417         dec     hl
      00E236 E5               [11]  418         push    hl
      00E237 CD 8D E3         [17]  419         call    m_e38d
      00E23A E1               [10]  420         pop     hl
      00E23B 23               [ 6]  421         inc     hl
      00E23C 23               [ 6]  422         inc     hl
      00E23D C1               [10]  423         pop     bc
      00E23E 0D               [ 4]  424         dec     c
      00E23F 20 ED            [12]  425         jr      nz,m_e22e
      00E241 CD 8D E3         [17]  426         call    m_e38d
      00E244 CD CD E3         [17]  427         call    print_space
      00E247 2A C2 E4         [16]  428         ld      hl,(0xe4c2)
      00E24A CD 93 E3         [17]  429         call    m_e393
      00E24D CD CD E3         [17]  430         call    print_space
      00E250 2A C4 E4         [16]  431         ld      hl,(0xe4c4)
      00E253 CD 93 E3         [17]  432         call    m_e393
      00E256 C9               [10]  433         ret
      00E257                        434 enable_protocol_printer:
      00E257 3A B6 E4         [13]  435         ld      a,(printer_protocol_flag)
      00E25A B7               [ 4]  436         or      a
      00E25B 28 0C            [12]  437         jr      z,m_e269
      00E25D 3E 00            [ 7]  438         ld      a,#OFF
      00E25F 21 38 E3         [10]  439         ld      hl,#str_print_off
      00E262                        440 m_e262:
      00E262 32 B6 E4         [13]  441         ld      (printer_protocol_flag),a
      00E265 CD 6A EF         [17]  442         call    puts
      00E268 C9               [10]  443         ret
      00E269                        444 m_e269:
      00E269 3E 01            [ 7]  445         ld      a,#ON
      00E26B 21 46 E3         [10]  446         ld      hl,#str_print_on
      00E26E 18 F2            [12]  447         jr      m_e262
      00E270                        448 return_to_basic:
      00E270 3A 08 00         [13]  449         ld      a,(id_basic)
      00E273 FE 7E            [ 7]  450         cp      #ID_IS_BASIC
      00E275 20 06            [12]  451         jr      nz,just_go_back
      00E277 CD 74 EF         [17]  452         call    patch_os_functions
      00E27A 3E 0C            [ 7]  453         ld      a,#0x0c
      00E27C DF               [11]  454         rst     0x18
      00E27D                        455 just_go_back:
      00E27D ED 7B C6 E4      [20]  456         ld      sp,(save_stack)
      00E281 C9               [10]  457         ret
      00E282                        458 m_e282:
      00E282 E5               [11]  459         push    hl
      00E283 C5               [11]  460         push    bc
      00E284 3A 62 E4         [13]  461         ld      a,(0xe462)
      00E287 E6 18            [ 7]  462         and     #0x18
      00E289 4F               [ 4]  463         ld      c,a
      00E28A 06 00            [ 7]  464         ld      b,#0x00
      00E28C 21 A6 E4         [10]  465         ld      hl,#0xe4a6
      00E28F B7               [ 4]  466         or      a
      00E290 ED 4A            [15]  467         adc     hl,bc
      00E292 B7               [ 4]  468         or      a
      00E293 ED 52            [15]  469         sbc     hl,de
      00E295 7D               [ 4]  470         ld      a,l
      00E296 B7               [ 4]  471         or      a
      00E297 28 0E            [12]  472         jr      z,m_e2a7
      00E299                        473 m_e299:
      00E299 E5               [11]  474         push    hl
      00E29A CD CD E3         [17]  475         call    print_space
      00E29D CD CD E3         [17]  476         call    print_space
      00E2A0 CD CD E3         [17]  477         call    print_space
      00E2A3 E1               [10]  478         pop     hl
      00E2A4 2D               [ 4]  479         dec     l
      00E2A5 20 F2            [12]  480         jr      nz,m_e299
      00E2A7                        481 m_e2a7:
      00E2A7 CD CD E3         [17]  482         call    print_space
      00E2AA CD CD E3         [17]  483         call    print_space
      00E2AD 3A 62 E4         [13]  484         ld      a,(0xe462)
      00E2B0 E6 18            [ 7]  485         and     #0x18
      00E2B2 47               [ 4]  486         ld      b,a
      00E2B3 21 A6 E4         [10]  487         ld      hl,#0xe4a6
      00E2B6                        488 m_e2b6:
      00E2B6 E5               [11]  489         push    hl
      00E2B7 C5               [11]  490         push    bc
      00E2B8 7E               [ 7]  491         ld      a,(hl)
      00E2B9 FE 20            [ 7]  492         cp      #' '
      00E2BB 38 04            [12]  493         jr      c,non_char_printable
      00E2BD FE 7F            [ 7]  494         cp      #VK_DEL
      00E2BF 38 02            [12]  495         jr      c,m_e2c3
      00E2C1                        496 non_char_printable:
      00E2C1 3E 2E            [ 7]  497         ld      a,#'.'
      00E2C3                        498 m_e2c3:
      00E2C3 4F               [ 4]  499         ld      c,a
      00E2C4 CD D5 E3         [17]  500         call    put_char
      00E2C7 C1               [10]  501         pop     bc
      00E2C8 E1               [10]  502         pop     hl
      00E2C9 23               [ 6]  503         inc     hl
      00E2CA 05               [ 4]  504         dec     b
      00E2CB 20 E9            [12]  505         jr      nz,m_e2b6
      00E2CD C1               [10]  506         pop     bc
      00E2CE E1               [10]  507         pop     hl
      00E2CF C9               [10]  508         ret
      00E2D0                        509 m_e2d0:
      00E2D0 21 A6 E4         [10]  510         ld      hl,#0xe4a6
      00E2D3 06 10            [ 7]  511         ld      b,#0x10
      00E2D5                        512 m_e2d5:
      00E2D5 36 00            [10]  513         ld      (hl),#0x00
      00E2D7 23               [ 6]  514         inc     hl
      00E2D8 05               [ 4]  515         dec     b
      00E2D9 20 FA            [12]  516         jr      nz,m_e2d5
      00E2DB C9               [10]  517         ret
      00E2DC                        518 m_e2dc:
      00E2DC CD C3 E3         [17]  519         call    print_new_line
      00E2DF CD 93 E3         [17]  520         call    m_e393
      00E2E2 C9               [10]  521         ret
      00E2E3                        522 unreferenced_02:
      00E2E3 CD F2 E3         [17]  523         call    get_char_echoed
      00E2E6 FE 2C            [ 7]  524         cp      #','
      00E2E8 C9               [10]  525         ret
      00E2E9                        526 str_monitor:
      00E2E9 0C 2A 20 4D 4F 4E 49   527         .db     0x0c,0x2a,0x20,0x4d,0x4f,0x4e,0x49,0x54 ;.* MONIT
             54
      00E2F1 4F 52 20 2A 20 28 56   528         .db     0x4f,0x52,0x20,0x2a,0x20,0x28,0x56,0x2e ;OR * (V.
             2E
      00E2F9 20 31 2E 32 29 20 4A   529         .db     0x20,0x31,0x2e,0x32,0x29,0x20,0x4a,0x75 ; 1.2) Ju
             75
      00E301 6E 65 20 31 39 38 33   530         .db     0x6e,0x65,0x20,0x31,0x39,0x38,0x33,0x0d ;ne 1983.
             0D
      00E309 0A 0D 0A               531         .db     0x0a,0x0d,0x0a                          ;...
      00E30C                        532 str_memory:
      00E30C 4D 65 6D 6F 72 79 20   533         .db     0x4d,0x65,0x6d,0x6f,0x72,0x79,0x20,0x41 ;Memory A
             41
      00E314 72 65 61 20 3F 00      534         .db     0x72,0x65,0x61,0x20,0x3f,0x00           ;rea ?.
      00E31A                        535 str_completed:
      00E31A 0D 0A 43 6F 6D 70 6C   536         .db     0x0d,0x0a,0x43,0x6f,0x6d,0x70,0x6c,0x65 ;..Comple
             65
      00E322 74 65 64 0D 0A 00      537         .db     0x74,0x65,0x64,0x0d,0x0a,0x00           ;ted...
      00E328                        538 str_area_over:
      00E328 0D 0A 41 72 65 61 20   539         .db     0x0d,0x0a,0x41,0x72,0x65,0x61,0x20,0x4f ;..Area O
             4F
      00E330 76 65 72 20 21 0D 0A   540         .db     0x76,0x65,0x72,0x20,0x21,0x0d,0x0a,0x00 ;ver !...
             00
      00E338                        541 str_print_off:
      00E338 0D 0A 50 72 69 6E 74   542         .db     0x0d,0x0a,0x50,0x72,0x69,0x6e,0x74,0x20 ;..Print 
             20
      00E340 4F 46 46 0D 0A 00      543         .db     0x4f,0x46,0x46,0x0d,0x0a,0x00           ;OFF...
      00E346                        544 str_print_on:
      00E346 0D 0A 50 72 69 6E 74   545         .db     0x0d,0x0a,0x50,0x72,0x69,0x6e,0x74,0x20 ;..Print 
             20
      00E34E 4F 4E 0D 0A 00         546         .db     0x4f,0x4e,0x0d,0x0a,0x00                ;ON...
      00E353                        547 str_break_at:
      00E353 0D 0A 42 72 65 61 6B   548         .db     0x0d,0x0a,0x42,0x72,0x65,0x61,0x6b,0x20 ;..Break 
             20
      00E35B 61 74 20 23 00         549         .db     0x61,0x74,0x20,0x23,0x00                ;at #.
      00E360                        550 str_reg:
      00E360 0D 0A 20 50 43 20 20   551         .db     0x0d,0x0a,0x20,0x50,0x43,0x20,0x20,0x20 ;.. PC   
             20
      00E368 42 20 20 43 20 20 44   552         .db     0x42,0x20,0x20,0x43,0x20,0x20,0x44,0x20 ;B  C  D 
             20
      00E370 20 45 20 20 48 20 20   553         .db     0x20,0x45,0x20,0x20,0x48,0x20,0x20,0x4c ; E  H  L
             4C
      00E378 20 20 41 20 20 46 20   554         .db     0x20,0x20,0x41,0x20,0x20,0x46,0x20,0x20 ;  A  F  
             20
      00E380 49 20 20 49 58 20 20   555         .db     0x49,0x20,0x20,0x49,0x58,0x20,0x20,0x20 ;I  IX   
             20
      00E388 49 59 0D 0A 00         556         .db     0x49,0x59,0x0d,0x0a,0x00                ;IY...
      00E38D                        557 m_e38d:
      00E38D CD CD E3         [17]  558         call    print_space
      00E390 7E               [ 7]  559         ld      a,(hl)
      00E391 18 05            [12]  560         jr      m_e398
      00E393                        561 m_e393:
      00E393 7C               [ 4]  562         ld      a,h
      00E394 CD 9C E3         [17]  563         call    m_e39c
      00E397 7D               [ 4]  564         ld      a,l
      00E398                        565 m_e398:
      00E398 CD 9C E3         [17]  566         call    m_e39c
      00E39B C9               [10]  567         ret
      00E39C                        568 m_e39c:
      00E39C C5               [11]  569         push    bc
      00E39D F5               [11]  570         push    af
      00E39E 0F               [ 4]  571         rrca
      00E39F 0F               [ 4]  572         rrca
      00E3A0 0F               [ 4]  573         rrca
      00E3A1 0F               [ 4]  574         rrca
      00E3A2 CD B2 E3         [17]  575         call    m_e3b2
      00E3A5 F1               [10]  576         pop     af
      00E3A6 CD B2 E3         [17]  577         call    m_e3b2
      00E3A9 C1               [10]  578         pop     bc
      00E3AA C9               [10]  579         ret
      00E3AB                        580 m_e3ab:
      00E3AB CD 8D E3         [17]  581         call    m_e38d
      00E3AE 0E 2D            [ 7]  582         ld      c,#'-'
      00E3B0 18 09            [12]  583         jr      m_e3bb
      00E3B2                        584 m_e3b2:
      00E3B2 E6 0F            [ 7]  585         and     #0x0f
      00E3B4 FE 0A            [ 7]  586         cp      #0x0a
      00E3B6 30 07            [12]  587         jr      nc,m_e3bf
      00E3B8 C6 30            [ 7]  588         add     a,#0x30
      00E3BA                        589 m_e3ba:
      00E3BA 4F               [ 4]  590         ld      c,a
      00E3BB                        591 m_e3bb:
      00E3BB CD D5 E3         [17]  592         call    put_char
      00E3BE C9               [10]  593         ret
      00E3BF                        594 m_e3bf:
      00E3BF C6 37            [ 7]  595         add     a,#0x37
      00E3C1 18 F7            [12]  596         jr      m_e3ba
      00E3C3                        597 print_new_line:
      00E3C3 C5               [11]  598         push    bc
      00E3C4 0E 0D            [ 7]  599         ld      c,#VK_ENTER
      00E3C6 CD D5 E3         [17]  600         call    put_char
      00E3C9 0E 0A            [ 7]  601         ld      c,#0x0a
      00E3CB 18 03            [12]  602         jr      m_e3d0
      00E3CD                        603 print_space:
      00E3CD C5               [11]  604         push    bc
      00E3CE 0E 20            [ 7]  605         ld      c,#0x20
      00E3D0                        606 m_e3d0:
      00E3D0 CD D5 E3         [17]  607         call    put_char
      00E3D3 C1               [10]  608         pop     bc
      00E3D4 C9               [10]  609         ret
      00E3D5                        610 put_char:
      00E3D5 CD AC E7         [17]  611         call    m_e7ac
      00E3D8 3A B6 E4         [13]  612         ld      a,(printer_protocol_flag)
      00E3DB B7               [ 4]  613         or      a
      00E3DC C4 39 E4         [17]  614         call    nz,dev_printer_write_byte
      00E3DF C9               [10]  615         ret
      00E3E0                        616 m_e3e0:
      00E3E0 CD 34 EF         [17]  617         call    get_hex_digit
      00E3E3 D8               [11]  618         ret     c
      00E3E4 07               [ 4]  619         rlca
      00E3E5 07               [ 4]  620         rlca
      00E3E6 07               [ 4]  621         rlca
      00E3E7 07               [ 4]  622         rlca
      00E3E8 47               [ 4]  623         ld      b,a
      00E3E9 CD 34 EF         [17]  624         call    get_hex_digit
      00E3EC D8               [11]  625         ret     c
      00E3ED 80               [ 4]  626         add     a,b
      00E3EE 32 9C E4         [13]  627         ld      (param_word),a
      00E3F1 C9               [10]  628         ret
      00E3F2                        629 get_char_echoed:
      00E3F2 CD 62 E7         [17]  630         call    m_e762
      00E3F5 F5               [11]  631         push    af
      00E3F6 4F               [ 4]  632         ld      c,a
      00E3F7 CD D5 E3         [17]  633         call    put_char
      00E3FA F1               [10]  634         pop     af
      00E3FB C9               [10]  635         ret
                                    636 ; unchecked data source
      00E3FC 00                     637         .db     0x00                                    ;.
      00E3FD                        638 dev_fdd_wait_ready:
      00E3FD C3 91 EF         [10]  639         jp      wait_fdd_ready
      00E400                        640 dev_monitor:
      00E400 C3 60 E0         [10]  641         jp      go_monitor
      00E403                        642 dev_serial_ready:
      00E403 C3 10 EB         [10]  643         jp      com_rx_ready
      00E406                        644 dev_serial_read_byte:
      00E406 C3 F6 EA         [10]  645         jp      com_read_byte
      00E409 C3 EC EA         [10]  646         jp      com_write_byte
      00E40C                        647 dev_kbd_status:
      00E40C C3 B1 E5         [10]  648         jp      m_e5b1
      00E40F                        649 dev_kbd_inkey:
      00E40F C3 62 E7         [10]  650         jp      m_e762
      00E412 C3 AC E7         [10]  651         jp      m_e7ac
      00E415 C3 B1 E5         [10]  652         jp      m_e5b1
      00E418 C3 62 E7         [10]  653         jp      m_e762
      00E41B C3 AC E7         [10]  654         jp      m_e7ac
      00E41E C3 B1 E5         [10]  655         jp      m_e5b1
      00E421 C3 62 E7         [10]  656         jp      m_e762
      00E424 C3 AC E7         [10]  657         jp      m_e7ac
      00E427 C3 62 E7         [10]  658         jp      m_e762
      00E42A C3 F6 EA         [10]  659         jp      com_read_byte
      00E42D C3 F6 EA         [10]  660         jp      com_read_byte
      00E430 C3 AC E7         [10]  661         jp      m_e7ac
      00E433                        662 dev_serial_tx_ready:
      00E433 C3 E3 EA         [10]  663         jp      com_tx_ready
      00E436                        664 dev_serial_write_byte:
      00E436 C3 EC EA         [10]  665         jp      com_write_byte
      00E439                        666 dev_printer_write_byte:
      00E439 C3 C2 EA         [10]  667         jp      lpt_write_byte
                                    668 ; unchecked data source
      00E43C C3 C2 EA 3E FF C9 00   669         .db     0xc3,0xc2,0xea,0x3e,0xff,0xc9,0x00,0xaf ;CBj>.I./
             AF
      00E444 C9                     670         .db     0xc9                                    ;I
      00E445                        671 m_e445:
      00E445 C3 B5 EA         [10]  672         jp      lpt_busy
      00E448 00               [ 4]  673         nop
      00E449 AF               [ 4]  674         xor     a
      00E44A C9               [10]  675         ret
      00E44B C3 9D E5         [10]  676         jp      kbd_buffer_clear_beep
      00E44E C3 A3 E5         [10]  677         jp      kbd_buffer_clear
      00E451 C3 7B E6         [10]  678         jp      delay
      00E454 C3 9E EA         [10]  679         jp      m_ea9e
      00E457 C3 96 EA         [10]  680         jp      buzzer_on
      00E45A C3 EA E1         [10]  681         jp      m_e1ea
      00E45D C3 15 F1         [10]  682         jp      m_f115
                                    683 ; unchecked data source
      00E460 18 18                  684         .db     0x18,0x18                               ;..
      00E462                        685 column_count:
      00E462 50                     686         .db     0x50                                    ;P
                                    687 ; unchecked data source
      00E463 00 18 18 30            688         .db     0x00,0x18,0x18,0x30                     ;...0
      00E467                        689 attrib_color:
      00E467 07                     690         .db     0x07                                    ;.
      00E468                        691 cfg10_settings:
      00E468 00                     692         .db     0x00                                    ;.
      00E469                        693 cfg20_settings:
      00E469 00                     694         .db     0x00                                    ;.
                                    695 ; unchecked data source
      00E46A 05 00 D5               696         .db     0x05,0x00,0xd5                          ;..U
      00E46D                        697 cursor_row:
      00E46D 00                     698         .db     0x00                                    ;.
      00E46E                        699 cursor_column:
      00E46E 00                     700         .db     0x00                                    ;.
      00E46F                        701 led_status:
      00E46F 00                     702         .db     0x00                                    ;.
      00E470                        703 cursor_start:
      00E470 00                     704         .db     0x00                                    ;.
      00E471                        705 kbd_debounce_cnt:
      00E471 00                     706         .db     0x00                                    ;.
      00E472                        707 kbd_matrix_buffer:
      00E472 00 00 00 00 00 00 00   708         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E47A 00 00 00 00            709         .db     0x00,0x00,0x00,0x00                     ;....
      00E47E                        710 kbd_matrix_buffer2:
      00E47E 00 00 00 00 00 00 00   711         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E486 00 00 00 00            712         .db     0x00,0x00,0x00,0x00                     ;....
                                    713 ; unchecked data source
      00E48A 00                     714         .db     0x00                                    ;.
      00E48B                        715 kbd_modifiers:
      00E48B 00                     716         .db     0x00                                    ;.
                                    717 ; unchecked data source
      00E48C 00 00                  718         .db     0x00,0x00                               ;..
      00E48E                        719 kbd_position:
      00E48E 00                     720         .db     0x00                                    ;.
      00E48F                        721 kbd_ascii:
      00E48F 00                     722         .db     0x00                                    ;.
      00E490                        723 cursor_abs:
      00E490 00 00                  724         .db     0x00,0x00                               ;..
      00E492                        725 cursor_abs_color:
      00E492 00 00                  726         .db     0x00,0x00                               ;..
                                    727 ; unchecked data source
      00E494 00 00 00 00            728         .db     0x00,0x00,0x00,0x00                     ;....
      00E498                        729 key_code:
      00E498 00                     730         .db     0x00                                    ;.
                                    731 ; unchecked data source
      00E499 00 00 00               732         .db     0x00,0x00,0x00                          ;...
      00E49C                        733 param_word:
      00E49C 00 00                  734         .db     0x00,0x00                               ;..
      00E49E                        735 param_1:
      00E49E 00 00                  736         .db     0x00,0x00                               ;..
      00E4A0                        737 param_2:
      00E4A0 00 00                  738         .db     0x00,0x00                               ;..
      00E4A2                        739 param_3:
      00E4A2 00 00                  740         .db     0x00,0x00                               ;..
                                    741 ; unchecked data source
      00E4A4 00 00 00 00 00 00 00   742         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E4AC 00 00 00 00 00 00 00   743         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E4B4 00 00                  744         .db     0x00,0x00                               ;..
      00E4B6                        745 printer_protocol_flag:
      00E4B6 00                     746         .db     0x00                                    ;.
                                    747 ; unchecked data source
      00E4B7 00 00 00 00 00 00 00   748         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E4BF 00 00 00 00 00 00 00   749         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00      ;.......
      00E4C6                        750 save_stack:
      00E4C6 00 00                  751         .db     0x00,0x00                               ;..
                                    752 ; unchecked data source
      00E4C8 00 00 00 00 00 00 00   753         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E4D0                        754 os_patch:
      00E4D0 00                     755         .db     0x00                                    ;.
                                    756 ; unchecked data source
      00E4D1 00                     757         .db     0x00                                    ;.
      00E4D2                        758 beep_delay:
      00E4D2 00 80                  759         .db     0x00,0x80                               ;..
      00E4D4                        760 unreferenced_03:
      00E4D4 C3 09 EA         [10]  761         jp      wait_vsync
      00E4D7                        762 unreferenced_04:
      00E4D7 C3 16 EA         [10]  763         jp      is_vsync
      00E4DA                        764 unreferenced_05:
      00E4DA C3 27 EA         [10]  765         jp      wait_flicker_free_save_A
      00E4DD                        766 kbd_table_lookup:
      00E4DD 30 31 32 33 34 35 36   767         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00E4E5 38 39 2E FF 2B 2D 3D   768         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00E4ED FF 61 62 63 64 65 66   769         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00E4F5 68 69 6A 6B 6C 6D 6E   770         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00E4FD 70 71 72 73 74 75 76   771         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00E505 78 79 7A FF FF FF FF   772         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00E50D 30 31 32 33 34 35 36   773         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00E515 38 39 2D 5E 40 5B 5D   774         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00E51D FF FF 20 5C 2C 2E 2F   775         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00E525 1F 1C 1D 1E 9B FF 7F   776         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00E52D FF 7F FF 09 0D DF 0B   777         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00E535 FF FF 86 85 84 83 82   778         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00E53D E4 E2 EB E3 E8 E6 E9   779         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00E545 EA E1 E5 FF 2A 2F E7   780         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00E54D FF 41 42 43 44 45 46   781         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00E555 48 49 4A 4B 4C 4D 4E   782         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00E55D 50 51 52 53 54 55 56   783         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00E565 58 59 5A FF FF FF FF   784         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00E56D 5F 21 22 23 24 25 26   785         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00E575 28 29 3D 7E 60 7B 7D   786         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00E57D FF FF 20 7C 3C 3E 3F   787         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00E585 EC EF EE ED 9B FF 7F   788         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00E58D FF 12 FF 09 0D DF 0C   789         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00E595 FF FF 8C 8B 8A 89 88   790         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00E59D                        791 kbd_buffer_clear_beep:
      00E59D CD 7E EA         [17]  792         call    chr_beep
      00E5A0 CD 78 EE         [17]  793         call    m_ee78
      00E5A3                        794 kbd_buffer_clear:
      00E5A3 21 71 E4         [10]  795         ld      hl,#kbd_debounce_cnt
      00E5A6 11 72 E4         [10]  796         ld      de,#kbd_matrix_buffer
      00E5A9 01 60 00         [10]  797         ld      bc,#kbd_table_int_size
      00E5AC 36 00            [10]  798         ld      (hl),#0
      00E5AE ED B0            [21]  799         ldir
      00E5B0 C9               [10]  800         ret
      00E5B1                        801 m_e5b1:
      00E5B1 E5               [11]  802         push    hl
      00E5B2 D5               [11]  803         push    de
      00E5B3 C5               [11]  804         push    bc
      00E5B4 3A 8A E4         [13]  805         ld      a,(0xe48a)
      00E5B7 FE 80            [ 7]  806         cp      #0x80
      00E5B9 28 26            [12]  807         jr      z,m_e5e1
      00E5BB FE 88            [ 7]  808         cp      #0x88
      00E5BD 28 22            [12]  809         jr      z,m_e5e1
      00E5BF 21 7E E4         [10]  810         ld      hl,#0xe47e
      00E5C2 CD 6E E6         [17]  811         call    kbd_copy_state
      00E5C5 21 7E E4         [10]  812         ld      hl,#0xe47e
      00E5C8 06 0C            [ 7]  813         ld      b,#0x0c
      00E5CA                        814 m_e5ca:
      00E5CA 7E               [ 7]  815         ld      a,(hl)
      00E5CB B7               [ 4]  816         or      a
      00E5CC 20 07            [12]  817         jr      nz,m_e5d5
      00E5CE 05               [ 4]  818         dec     b
      00E5CF CA 47 E6         [10]  819         jp      z,m_e647
      00E5D2 23               [ 6]  820         inc     hl
      00E5D3 18 F5            [12]  821         jr      m_e5ca
      00E5D5                        822 m_e5d5:
      00E5D5 CD E7 E5         [17]  823         call    m_e5e7
      00E5D8 3A 8A E4         [13]  824         ld      a,(0xe48a)
      00E5DB FE 80            [ 7]  825         cp      #0x80
      00E5DD 3E 00            [ 7]  826         ld      a,#0x00
      00E5DF 20 02            [12]  827         jr      nz,m_e5e3
      00E5E1                        828 m_e5e1:
      00E5E1 3E FF            [ 7]  829         ld      a,#0xff
      00E5E3                        830 m_e5e3:
      00E5E3 C1               [10]  831         pop     bc
      00E5E4 D1               [10]  832         pop     de
      00E5E5 E1               [10]  833         pop     hl
      00E5E6 C9               [10]  834         ret
      00E5E7                        835 m_e5e7:
      00E5E7 E5               [11]  836         push    hl
      00E5E8 D5               [11]  837         push    de
      00E5E9 C5               [11]  838         push    bc
      00E5EA 21 DC 05         [10]  839         ld      hl,#0x05dc
      00E5ED CD 7B E6         [17]  840         call    delay
      00E5F0 21 72 E4         [10]  841         ld      hl,#kbd_matrix_buffer
      00E5F3 CD 6E E6         [17]  842         call    kbd_copy_state
      00E5F6 21 72 E4         [10]  843         ld      hl,#kbd_matrix_buffer
      00E5F9 11 7E E4         [10]  844         ld      de,#kbd_matrix_buffer2
      00E5FC 06 0C            [ 7]  845         ld      b,#kbd_matrix_buffer_size
      00E5FE                        846 cmp_kbd_entry:
      00E5FE 1A               [ 7]  847         ld      a,(de)
      00E5FF BE               [ 7]  848         cp      (hl)
      00E600 20 54            [12]  849         jr      nz,m_e656
      00E602 05               [ 4]  850         dec     b
      00E603 28 04            [12]  851         jr      z,scan_is_stable
      00E605 23               [ 6]  852         inc     hl
      00E606 13               [ 6]  853         inc     de
      00E607 18 F5            [12]  854         jr      cmp_kbd_entry
      00E609                        855 scan_is_stable:
      00E609 CD 82 E6         [17]  856         call    m_e682
      00E60C 3A 8A E4         [13]  857         ld      a,(0xe48a)
      00E60F FE 80            [ 7]  858         cp      #0x80
      00E611 20 38            [12]  859         jr      nz,clear_kbd_modifiers
      00E613 CD 2C E7         [17]  860         call    m_e72c
      00E616 3A 6F E4         [13]  861         ld      a,(led_status)
      00E619 CB 7F            [ 8]  862         bit     7,a
      00E61B 20 32            [12]  863         jr      nz,m_e64f
      00E61D 3A 8F E4         [13]  864         ld      a,(kbd_ascii)
      00E620 FE FF            [ 7]  865         cp      #0xff
      00E622 28 2B            [12]  866         jr      z,m_e64f
      00E624 B7               [ 4]  867         or      a
      00E625 28 28            [12]  868         jr      z,m_e64f
      00E627 CD 1A E7         [17]  869         call    modify_if_graphic_B
      00E62A 3A 98 E4         [13]  870         ld      a,(key_code)
      00E62D B8               [ 4]  871         cp      b
      00E62E 20 2F            [12]  872         jr      nz,set_kbd_debounce_cnt
      00E630 3A 71 E4         [13]  873         ld      a,(kbd_debounce_cnt)
      00E633 B7               [ 4]  874         or      a
      00E634 20 0B            [12]  875         jr      nz,decrement_kbd_debounce_cnt
      00E636 21 B8 0B         [10]  876         ld      hl,#0x0bb8
      00E639 CD 7B E6         [17]  877         call    delay
      00E63C 18 26            [12]  878         jr      m_e664
                                    879 ; unchecked data source
      00E63E AF 18 12               880         .db     0xaf,0x18,0x12                          ;/..
      00E641                        881 decrement_kbd_debounce_cnt:
      00E641 3D               [ 4]  882         dec     a
      00E642 32 71 E4         [13]  883         ld      (kbd_debounce_cnt),a
      00E645 18 0F            [12]  884         jr      m_e656
      00E647                        885 m_e647:
      00E647 AF               [ 4]  886         xor     a
      00E648 32 C9 E4         [13]  887         ld      (0xe4c9),a
      00E64B                        888 clear_kbd_modifiers:
      00E64B AF               [ 4]  889         xor     a
      00E64C 32 8B E4         [13]  890         ld      (kbd_modifiers),a
      00E64F                        891 m_e64f:
      00E64F AF               [ 4]  892         xor     a
      00E650 32 98 E4         [13]  893         ld      (key_code),a
      00E653 32 71 E4         [13]  894         ld      (kbd_debounce_cnt),a
      00E656                        895 m_e656:
      00E656 AF               [ 4]  896         xor     a
      00E657 32 8A E4         [13]  897         ld      (0xe48a),a
      00E65A 32 8F E4         [13]  898         ld      (kbd_ascii),a
      00E65D 18 0B            [12]  899         jr      m_e66a
      00E65F                        900 set_kbd_debounce_cnt:
      00E65F 3E 20            [ 7]  901         ld      a,#32
      00E661 32 71 E4         [13]  902         ld      (kbd_debounce_cnt),a
      00E664                        903 m_e664:
      00E664 3A 8F E4         [13]  904         ld      a,(kbd_ascii)
      00E667 32 98 E4         [13]  905         ld      (key_code),a
      00E66A                        906 m_e66a:
      00E66A C1               [10]  907         pop     bc
      00E66B D1               [10]  908         pop     de
      00E66C E1               [10]  909         pop     hl
      00E66D C9               [10]  910         ret
      00E66E                        911 kbd_copy_state:
      00E66E 0E 20            [ 7]  912         ld      c,#STATUS_KBD
      00E670 06 0C            [ 7]  913         ld      b,#KBD_COLUMNS
      00E672                        914 kbd_scan_columns:
      00E672 ED 78            [12]  915         in      a,(c)
      00E674 77               [ 7]  916         ld      (hl),a
      00E675 23               [ 6]  917         inc     hl
      00E676 0C               [ 4]  918         inc     c
      00E677 05               [ 4]  919         dec     b
      00E678 20 F8            [12]  920         jr      nz,kbd_scan_columns
      00E67A C9               [10]  921         ret
      00E67B                        922 delay:
      00E67B 00               [ 4]  923         nop
      00E67C 2B               [ 6]  924         dec     hl
      00E67D 7C               [ 4]  925         ld      a,h
      00E67E B5               [ 4]  926         or      l
      00E67F 20 FA            [12]  927         jr      nz,delay
      00E681 C9               [10]  928         ret
      00E682                        929 m_e682:
      00E682 DD 21 7E E4      [14]  930         ld      ix,#kbd_matrix_buffer2
      00E686 AF               [ 4]  931         xor     a
      00E687 4F               [ 4]  932         ld      c,a
      00E688 5F               [ 4]  933         ld      e,a
      00E689 32 8A E4         [13]  934         ld      (0xe48a),a
      00E68C                        935 kbd_buffer_check_colum:
      00E68C DD 7E 00         [19]  936         ld      a,0(ix)
      00E68F B7               [ 4]  937         or      a
      00E690 20 0B            [12]  938         jr      nz,m_e69d
      00E692 79               [ 4]  939         ld      a,c
      00E693 C6 08            [ 7]  940         add     a,#0x08
      00E695 4F               [ 4]  941         ld      c,a
      00E696                        942 m_e696:
      00E696 FE 60            [ 7]  943         cp      #kbd_table_int_size
      00E698 C8               [11]  944         ret     z
      00E699 DD 23            [10]  945         inc     ix
      00E69B 18 EF            [12]  946         jr      kbd_buffer_check_colum
      00E69D                        947 m_e69d:
      00E69D 16 08            [ 7]  948         ld      d,#0x08
      00E69F 67               [ 4]  949         ld      h,a
      00E6A0                        950 m_e6a0:
      00E6A0 0C               [ 4]  951         inc     c
      00E6A1 7C               [ 4]  952         ld      a,h
      00E6A2 B7               [ 4]  953         or      a
      00E6A3 CB 3F            [ 8]  954         srl     a
      00E6A5 67               [ 4]  955         ld      h,a
      00E6A6 38 06            [12]  956         jr      c,m_e6ae
      00E6A8                        957 m_e6a8:
      00E6A8 15               [ 4]  958         dec     d
      00E6A9 20 F5            [12]  959         jr      nz,m_e6a0
      00E6AB 79               [ 4]  960         ld      a,c
      00E6AC 18 E8            [12]  961         jr      m_e696
      00E6AE                        962 m_e6ae:
      00E6AE 79               [ 4]  963         ld      a,c
      00E6AF FE 4F            [ 7]  964         cp      #KBD_POSITION_CTRL
      00E6B1 28 21            [12]  965         jr      z,m_e6d4
      00E6B3 FE 53            [ 7]  966         cp      #KBD_POSITION_SHIFT
      00E6B5 28 2B            [12]  967         jr      z,set_kbd_shift_lock
      00E6B7 FE 4E            [ 7]  968         cp      #KBD_POSITION_SHIFT_LOCK
      00E6B9 28 31            [12]  969         jr      z,m_e6ec
      00E6BB FE 4D            [ 7]  970         cp      #KBD_POSITION_COMMAND
      00E6BD 28 37            [12]  971         jr      z,m_e6f6
      00E6BF FE 56            [ 7]  972         cp      #KBD_POSITION_GRAPH
      00E6C1 28 3C            [12]  973         jr      z,m_e6ff
      00E6C3                        974 m_e6c3:
      00E6C3 7B               [ 4]  975         ld      a,e
      00E6C4 B7               [ 4]  976         or      a
      00E6C5 20 E1            [12]  977         jr      nz,m_e6a8
      00E6C7 1E 01            [ 7]  978         ld      e,#0x01
      00E6C9 79               [ 4]  979         ld      a,c
      00E6CA 32 8E E4         [13]  980         ld      (kbd_position),a
      00E6CD 3E 80            [ 7]  981         ld      a,#0x80
      00E6CF 32 8A E4         [13]  982         ld      (0xe48a),a
      00E6D2 18 D4            [12]  983         jr      m_e6a8
      00E6D4                        984 m_e6d4:
      00E6D4 3A 6A E4         [13]  985         ld      a,(0xe46a)
      00E6D7 CB 57            [ 8]  986         bit     2,a
      00E6D9 28 E8            [12]  987         jr      z,m_e6c3
      00E6DB 3A 8B E4         [13]  988         ld      a,(kbd_modifiers)
      00E6DE CB D7            [ 8]  989         set     2,a                                     ;STATUS_GLED
      00E6E0 18 05            [12]  990         jr      set_kbd_modifiers
      00E6E2                        991 set_kbd_shift_lock:
      00E6E2 3A 8B E4         [13]  992         ld      a,(kbd_modifiers)
      00E6E5 CB C7            [ 8]  993         set     0,a                                     ;STATUS_SLED
      00E6E7                        994 set_kbd_modifiers:
      00E6E7 32 8B E4         [13]  995         ld      (kbd_modifiers),a
      00E6EA 18 BC            [12]  996         jr      m_e6a8
      00E6EC                        997 m_e6ec:
      00E6EC CD 0F E7         [17]  998         call    m_e70f
      00E6EF 20 B7            [12]  999         jr      nz,m_e6a8
      00E6F1 CD BF E8         [17] 1000         call    m_e8bf
      00E6F4 18 B2            [12] 1001         jr      m_e6a8
      00E6F6                       1002 m_e6f6:
      00E6F6 3A 6A E4         [13] 1003         ld      a,(0xe46a)
      00E6F9 CB 5F            [ 8] 1004         bit     3,a
      00E6FB 20 C6            [12] 1005         jr      nz,m_e6c3
      00E6FD 18 A9            [12] 1006         jr      m_e6a8
      00E6FF                       1007 m_e6ff:
      00E6FF CD 0F E7         [17] 1008         call    m_e70f
      00E702 20 A4            [12] 1009         jr      nz,m_e6a8
      00E704 CD A6 E8         [17] 1010         call    m_e8a6
      00E707 3A D0 E4         [13] 1011         ld      a,(os_patch)
      00E70A B7               [ 4] 1012         or      a
      00E70B 28 B6            [12] 1013         jr      z,m_e6c3
      00E70D 18 99            [12] 1014         jr      m_e6a8
      00E70F                       1015 m_e70f:
      00E70F 3A C9 E4         [13] 1016         ld      a,(0xe4c9)
      00E712 B7               [ 4] 1017         or      a
      00E713 C0               [11] 1018         ret     nz
      00E714 3E 01            [ 7] 1019         ld      a,#0x01
      00E716 32 C9 E4         [13] 1020         ld      (0xe4c9),a
      00E719 C9               [10] 1021         ret
      00E71A                       1022 modify_if_graphic_B:
      00E71A 3A 8B E4         [13] 1023         ld      a,(kbd_modifiers)
      00E71D CB 57            [ 8] 1024         bit     2,a                                     ;STATUS_GLED
      00E71F E5               [11] 1025         push    hl
      00E720 21 8F E4         [10] 1026         ld      hl,#kbd_ascii
      00E723 28 04            [12] 1027         jr      z,m_e729
      00E725 CB B6            [15] 1028         res     6,(hl)
      00E727 CB AE            [15] 1029         res     5,(hl)
      00E729                       1030 m_e729:
      00E729 46               [ 7] 1031         ld      b,(hl)
      00E72A E1               [10] 1032         pop     hl
      00E72B C9               [10] 1033         ret
      00E72C                       1034 m_e72c:
      00E72C 3A 8B E4         [13] 1035         ld      a,(kbd_modifiers)
      00E72F E6 01            [ 7] 1036         and     #MODIFIER_SHIFT
      00E731 21 DD E4         [10] 1037         ld      hl,#kbd_table_lookup
      00E734 28 03            [12] 1038         jr      z,m_e739
      00E736 21 3D E5         [10] 1039         ld      hl,#kbd_table_lookup+0x60
      00E739                       1040 m_e739:
      00E739 16 00            [ 7] 1041         ld      d,#HIGH_ZERO
      00E73B 3A 8E E4         [13] 1042         ld      a,(kbd_position)
      00E73E 5F               [ 4] 1043         ld      e,a
      00E73F 19               [11] 1044         add     hl,de
      00E740 2B               [ 6] 1045         dec     hl
      00E741 7E               [ 7] 1046         ld      a,(hl)
      00E742 32 8F E4         [13] 1047         ld      (kbd_ascii),a
      00E745 3A 6F E4         [13] 1048         ld      a,(led_status)
      00E748 CB 47            [ 8] 1049         bit     0,a                                     ;STATUS_SLED
      00E74A C8               [11] 1050         ret     z
      00E74B 7E               [ 7] 1051         ld      a,(hl)
      00E74C FE 61            [ 7] 1052         cp      #0x61
      00E74E D8               [11] 1053         ret     c
      00E74F                       1054 opcode_compare:
      00E74F FE 7B            [ 7] 1055         cp      #0x7b
      00E751 D0               [11] 1056         ret     nc
      00E752 E6 5F            [ 7] 1057         and     #0x5f
      00E754 32 8F E4         [13] 1058         ld      (kbd_ascii),a
      00E757 C9               [10] 1059         ret
      00E758                       1060 unreferenced:
      00E758 E5               [11] 1061         push    hl
      00E759 21 6F E4         [10] 1062         ld      hl,#led_status
      00E75C CB BE            [15] 1063         res     7,(hl)
      00E75E E1               [10] 1064         pop     hl
      00E75F C3 9E EA         [10] 1065         jp      m_ea9e
      00E762                       1066 m_e762:
      00E762 E5               [11] 1067         push    hl
      00E763 D5               [11] 1068         push    de
      00E764 C5               [11] 1069         push    bc
      00E765                       1070 m_e765:
      00E765 3A 8A E4         [13] 1071         ld      a,(0xe48a)
      00E768 FE 80            [ 7] 1072         cp      #0x80
      00E76A 28 0E            [12] 1073         jr      z,m_e77a
      00E76C FE 88            [ 7] 1074         cp      #0x88
      00E76E 3E 00            [ 7] 1075         ld      a,#0x00
      00E770 32 8A E4         [13] 1076         ld      (0xe48a),a
      00E773 28 2D            [12] 1077         jr      z,m_e7a2
      00E775 CD B1 E5         [17] 1078         call    m_e5b1
      00E778 18 EB            [12] 1079         jr      m_e765
      00E77A                       1080 m_e77a:
      00E77A AF               [ 4] 1081         xor     a
      00E77B 32 8A E4         [13] 1082         ld      (0xe48a),a
      00E77E 3A 8F E4         [13] 1083         ld      a,(kbd_ascii)
      00E781 E6 7F            [ 7] 1084         and     #0x7f
      00E783 FE 20            [ 7] 1085         cp      #0x20
      00E785 38 0D            [12] 1086         jr      c,m_e794
      00E787 3A D0 E4         [13] 1087         ld      a,(os_patch)
      00E78A B7               [ 4] 1088         or      a
      00E78B 28 07            [12] 1089         jr      z,m_e794
      00E78D 3A 6F E4         [13] 1090         ld      a,(led_status)
      00E790 CB 57            [ 8] 1091         bit     2,a                                     ;STATUS_GLED
      00E792 20 05            [12] 1092         jr      nz,m_e799
      00E794                       1093 m_e794:
      00E794 3A 8F E4         [13] 1094         ld      a,(kbd_ascii)
      00E797 18 0F            [12] 1095         jr      m_e7a8
      00E799                       1096 m_e799:
      00E799 3E 88            [ 7] 1097         ld      a,#0x88
      00E79B 32 8A E4         [13] 1098         ld      (0xe48a),a
      00E79E 3E DF            [ 7] 1099         ld      a,#0xdf
      00E7A0 18 06            [12] 1100         jr      m_e7a8
      00E7A2                       1101 m_e7a2:
      00E7A2 3A 8F E4         [13] 1102         ld      a,(kbd_ascii)
      00E7A5 CD 28 E8         [17] 1103         call    m_e828
      00E7A8                       1104 m_e7a8:
      00E7A8 C1               [10] 1105         pop     bc
      00E7A9 D1               [10] 1106         pop     de
      00E7AA E1               [10] 1107         pop     hl
      00E7AB C9               [10] 1108         ret
      00E7AC                       1109 m_e7ac:
      00E7AC E5               [11] 1110         push    hl
      00E7AD D5               [11] 1111         push    de
      00E7AE C5               [11] 1112         push    bc
      00E7AF 79               [ 4] 1113         ld      a,c
      00E7B0 32 66 E4         [13] 1114         ld      (0xe466),a
      00E7B3 3A 8C E4         [13] 1115         ld      a,(0xe48c)
      00E7B6 B7               [ 4] 1116         or      a
      00E7B7 20 6A            [12] 1117         jr      nz,m_e823
      00E7B9 3A D0 E4         [13] 1118         ld      a,(os_patch)
      00E7BC B7               [ 4] 1119         or      a
      00E7BD 28 30            [12] 1120         jr      z,m_e7ef
      00E7BF 3A C8 E4         [13] 1121         ld      a,(0xe4c8)
      00E7C2 B7               [ 4] 1122         or      a
      00E7C3 3A 66 E4         [13] 1123         ld      a,(0xe466)
      00E7C6 20 10            [12] 1124         jr      nz,m_e7d8
      00E7C8 FE DF            [ 7] 1125         cp      #0xdf
      00E7CA 28 4B            [12] 1126         jr      z,m_e817
      00E7CC                       1127 m_e7cc:
      00E7CC E6 7F            [ 7] 1128         and     #0x7f
      00E7CE 28 0F            [12] 1129         jr      z,m_e7df
      00E7D0 FE 7F            [ 7] 1130         cp      #0x7f
      00E7D2 28 4A            [12] 1131         jr      z,m_e81e
      00E7D4 FE 20            [ 7] 1132         cp      #0x20
      00E7D6 38 46            [12] 1133         jr      c,m_e81e
      00E7D8                       1134 m_e7d8:
      00E7D8 AF               [ 4] 1135         xor     a
      00E7D9 32 C8 E4         [13] 1136         ld      (0xe4c8),a
      00E7DC                       1137 m_e7dc:
      00E7DC CD EC E8         [17] 1138         call    m_e8ec
      00E7DF                       1139 m_e7df:
      00E7DF C1               [10] 1140         pop     bc
      00E7E0 D1               [10] 1141         pop     de
      00E7E1 3A CB E4         [13] 1142         ld      a,(0xe4cb)
      00E7E4 B7               [ 4] 1143         or      a
      00E7E5 20 26            [12] 1144         jr      nz,m_e80d
      00E7E7                       1145 m_e7e7:
      00E7E7 3A 66 E4         [13] 1146         ld      a,(0xe466)
      00E7EA 32 6C E4         [13] 1147         ld      (0xe46c),a
      00E7ED E1               [10] 1148         pop     hl
      00E7EE C9               [10] 1149         ret
      00E7EF                       1150 m_e7ef:
      00E7EF 3A 66 E4         [13] 1151         ld      a,(0xe466)
      00E7F2 47               [ 4] 1152         ld      b,a
      00E7F3 FE DF            [ 7] 1153         cp      #0xdf
      00E7F5 28 11            [12] 1154         jr      z,m_e808
      00E7F7 3A C8 E4         [13] 1155         ld      a,(0xe4c8)
      00E7FA B7               [ 4] 1156         or      a
      00E7FB 78               [ 4] 1157         ld      a,b
      00E7FC 28 CE            [12] 1158         jr      z,m_e7cc
      00E7FE CD 28 E8         [17] 1159         call    m_e828
      00E801 32 66 E4         [13] 1160         ld      (0xe466),a
      00E804 38 18            [12] 1161         jr      c,m_e81e
      00E806 18 D4            [12] 1162         jr      m_e7dc
      00E808                       1163 m_e808:
      00E808 CD D6 E8         [17] 1164         call    m_e8d6
      00E80B 18 D2            [12] 1165         jr      m_e7df
      00E80D                       1166 m_e80d:
      00E80D 2A CC E4         [16] 1167         ld      hl,(0xe4cc)
      00E810 EB               [ 4] 1168         ex      de,hl
      00E811 AF               [ 4] 1169         xor     a
      00E812 32 CB E4         [13] 1170         ld      (0xe4cb),a
      00E815 18 D0            [12] 1171         jr      m_e7e7
      00E817                       1172 m_e817:
      00E817 3E 01            [ 7] 1173         ld      a,#0x01
      00E819 32 C8 E4         [13] 1174         ld      (0xe4c8),a
      00E81C 18 C1            [12] 1175         jr      m_e7df
      00E81E                       1176 m_e81e:
      00E81E CD 3F E8         [17] 1177         call    m_e83f
      00E821 18 BC            [12] 1178         jr      m_e7df
      00E823                       1179 m_e823:
      00E823 CD E3 EB         [17] 1180         call    m_ebe3
      00E826 18 B7            [12] 1181         jr      m_e7df
      00E828                       1182 m_e828:
      00E828 FE 20            [ 7] 1183         cp      #0x20
      00E82A D8               [11] 1184         ret     c
      00E82B FE 60            [ 7] 1185         cp      #0x60
      00E82D 38 06            [12] 1186         jr      c,m_e835
      00E82F FE 80            [ 7] 1187         cp      #0x80
      00E831 D0               [11] 1188         ret     nc
      00E832 F6 80            [ 7] 1189         or      #0x80
      00E834 C9               [10] 1190         ret
      00E835                       1191 m_e835:
      00E835 FE 40            [ 7] 1192         cp      #0x40
      00E837 38 03            [12] 1193         jr      c,m_e83c
      00E839 EE C0            [ 7] 1194         xor     #0xc0
      00E83B C9               [10] 1195         ret
      00E83C                       1196 m_e83c:
      00E83C EE 20            [ 7] 1197         xor     #0x20
      00E83E C9               [10] 1198         ret
      00E83F                       1199 m_e83f:
      00E83F 3A 66 E4         [13] 1200         ld      a,(0xe466)
      00E842 FE 1B            [ 7] 1201         cp      #VK_ESC
      00E844 20 06            [12] 1202         jr      nz,m_e84c
      00E846 3E 01            [ 7] 1203         ld      a,#0x01
      00E848 32 8C E4         [13] 1204         ld      (0xe48c),a
      00E84B C9               [10] 1205         ret
      00E84C                       1206 m_e84c:
      00E84C 4F               [ 4] 1207         ld      c,a
      00E84D 21 55 E8         [10] 1208         ld      hl,#special_characters
      00E850 CD 1F EC         [17] 1209         call    map_C_to_PTR
      00E853 C8               [11] 1210         ret     z
      00E854 E9               [ 4] 1211         jp      (hl)
      00E855                       1212 special_characters:
      00E855 03                    1213         .db     0x03                                    ;.
      00E856 91 E8                 1214         .dw     chr_03
      00E858                       1215 asc_07:
      00E858 07                    1216         .db     0x07                                    ;.
      00E859 7E EA                 1217         .dw     chr_beep
      00E85B                       1218 asc_08:
      00E85B 08                    1219         .db     0x08                                    ;.
      00E85C 74 EA                 1220         .dw     chr_backspace
      00E85E                       1221 asc_0a:
      00E85E 0A                    1222         .db     0x0a                                    ;.
      00E85F 80 E8                 1223         .dw     chr_line_feed
      00E861                       1224 asc_0c:
      00E861 0C                    1225         .db     0x0c                                    ;.
      00E862 E8 E9                 1226         .dw     chr_clear_screen
      00E864                       1227 asc_0d:
      00E864 0D                    1228         .db     0x0d                                    ;.
      00E865 09 E9                 1229         .dw     chr_carrige_return
      00E867                       1230 asc_12:
      00E867 12                    1231         .db     0x12                                    ;.
      00E868 94 E8                 1232         .dw     chr_12
      00E86A                       1233 asc_1c:
      00E86A 1C                    1234         .db     0x1c                                    ;.
      00E86B 50 EA                 1235         .dw     chr_cursor_right
      00E86D                       1236 asc_1d:
      00E86D 1D                    1237         .db     0x1d                                    ;.
      00E86E 35 EA                 1238         .dw     chr_cursor_left
      00E870                       1239 asc_1e:
      00E870 1E                    1240         .db     0x1e                                    ;.
      00E871 44 EA                 1241         .dw     chr_cursor_up
      00E873                       1242 asc_1f:
      00E873 1F                    1243         .db     0x1f                                    ;.
      00E874 5F EA                 1244         .dw     chr_cursor_down
      00E876                       1245 asc_7f:
      00E876 7F                    1246         .db     0x7f                                    ;.
      00E877 97 E8                 1247         .dw     chr_7f
      00E879                       1248 asc_99:
      00E879 99                    1249         .db     0x99                                    ;.
      00E87A A0 E8                 1250         .dw     chr_inverse_on
      00E87C                       1251 asc_9a:
      00E87C 9A                    1252         .db     0x9a                                    ;.
      00E87D 9A E8                 1253         .dw     chr_inverse_off
                                   1254 ; unchecked data source
      00E87F 00                    1255         .db     0x00                                    ;.
      00E880                       1256 chr_line_feed:
      00E880 3A 6C E4         [13] 1257         ld      a,(0xe46c)
      00E883 FE 0D            [ 7] 1258         cp      #VK_ENTER
      00E885 C8               [11] 1259         ret     z
      00E886 3A 6E E4         [13] 1260         ld      a,(cursor_column)
      00E889 F6 80            [ 7] 1261         or      #0x80
      00E88B 32 CA E4         [13] 1262         ld      (0xe4ca),a
      00E88E C3 09 E9         [10] 1263         jp      chr_carrige_return
      00E891                       1264 chr_03:
      00E891 C9               [10] 1265         ret
                                   1266 ; unchecked data source
      00E892 00 00                 1267         .db     0x00,0x00                               ;..
      00E894                       1268 chr_12:
      00E894 C9               [10] 1269         ret
                                   1270 ; unchecked data source
      00E895 00 00                 1271         .db     0x00,0x00                               ;..
      00E897                       1272 chr_7f:
      00E897 C9               [10] 1273         ret
                                   1274 ; unchecked data source
      00E898 00 00                 1275         .db     0x00,0x00                               ;..
      00E89A                       1276 chr_inverse_off:
      00E89A 21 67 E4         [10] 1277         ld      hl,#attrib_color
      00E89D CB BE            [15] 1278         res     7,(hl)
      00E89F C9               [10] 1279         ret
      00E8A0                       1280 chr_inverse_on:
      00E8A0 21 67 E4         [10] 1281         ld      hl,#attrib_color
      00E8A3 CB FE            [15] 1282         set     7,(hl)
      00E8A5 C9               [10] 1283         ret
      00E8A6                       1284 m_e8a6:
      00E8A6 3A 6F E4         [13] 1285         ld      a,(led_status)
      00E8A9 EE 04            [ 7] 1286         xor     #TOGGLE_GLED
      00E8AB                       1287 m_e8ab:
      00E8AB 32 6F E4         [13] 1288         ld      (led_status),a
      00E8AE CB 57            [ 8] 1289         bit     2,a                                     ;STATUS_GLED
      00E8B0 21 69 E4         [10] 1290         ld      hl,#cfg20_settings
      00E8B3 28 06            [12] 1291         jr      z,m_e8bb
      00E8B5 CB E6            [15] 1292         set     4,(hl)                                  ;GLED
      00E8B7                       1293 m_e8b7:
      00E8B7 7E               [ 7] 1294         ld      a,(hl)
      00E8B8 D3 20            [11] 1295         out     (CFG20),a
      00E8BA C9               [10] 1296         ret
      00E8BB                       1297 m_e8bb:
      00E8BB CB A6            [15] 1298         res     4,(hl)                                  ;GLED
      00E8BD 18 F8            [12] 1299         jr      m_e8b7
      00E8BF                       1300 m_e8bf:
      00E8BF 3A 6F E4         [13] 1301         ld      a,(led_status)
      00E8C2 EE 01            [ 7] 1302         xor     #TOGGLE_SLED
      00E8C4 32 6F E4         [13] 1303         ld      (led_status),a
      00E8C7 CB 47            [ 8] 1304         bit     0,a                                     ;STATUS_SLED
      00E8C9 21 69 E4         [10] 1305         ld      hl,#cfg20_settings
      00E8CC 28 04            [12] 1306         jr      z,m_e8d2
      00E8CE CB EE            [15] 1307         set     5,(hl)                                  ;SLED
      00E8D0 18 E5            [12] 1308         jr      m_e8b7
      00E8D2                       1309 m_e8d2:
      00E8D2 CB AE            [15] 1310         res     5,(hl)                                  ;SLED
      00E8D4 18 E1            [12] 1311         jr      m_e8b7
      00E8D6                       1312 m_e8d6:
      00E8D6 3A C8 E4         [13] 1313         ld      a,(0xe4c8)
      00E8D9 EE 01            [ 7] 1314         xor     #0x01
      00E8DB 32 C8 E4         [13] 1315         ld      (0xe4c8),a
      00E8DE 3A 6F E4         [13] 1316         ld      a,(led_status)
      00E8E1 28 05            [12] 1317         jr      z,m_e8e8
      00E8E3 CB D7            [ 8] 1318         set     2,a                                     ;STATUS_GLED
      00E8E5                       1319 m_e8e5:
      00E8E5 C3 AB E8         [10] 1320         jp      m_e8ab
      00E8E8                       1321 m_e8e8:
      00E8E8 CB 97            [ 8] 1322         res     2,a                                     ;STATUS_GLED
      00E8EA 18 F9            [12] 1323         jr      m_e8e5
      00E8EC                       1324 m_e8ec:
      00E8EC CD B7 E9         [17] 1325         call    set_cursor_abs
      00E8EF 3A 66 E4         [13] 1326         ld      a,(0xe466)
      00E8F2 CD 27 EA         [17] 1327         call    wait_flicker_free_save_A
      00E8F5 70               [ 7] 1328         ld      (hl),b
      00E8F6 3A 67 E4         [13] 1329         ld      a,(attrib_color)
      00E8F9 12               [ 7] 1330         ld      (de),a
      00E8FA                       1331 m_e8fa:
      00E8FA 3A 6E E4         [13] 1332         ld      a,(cursor_column)
      00E8FD 3C               [ 4] 1333         inc     a
      00E8FE 32 6E E4         [13] 1334         ld      (cursor_column),a
      00E901 47               [ 4] 1335         ld      b,a
      00E902 3A 62 E4         [13] 1336         ld      a,(column_count)
      00E905 3D               [ 4] 1337         dec     a
      00E906 B8               [ 4] 1338         cp      b
      00E907 30 28            [12] 1339         jr      nc,crt_set_cursor
      00E909                       1340 chr_carrige_return:
      00E909 3A 6D E4         [13] 1341         ld      a,(cursor_row)
      00E90C 3C               [ 4] 1342         inc     a
      00E90D 32 6D E4         [13] 1343         ld      (cursor_row),a
      00E910 47               [ 4] 1344         ld      b,a
      00E911 3A 65 E4         [13] 1345         ld      a,(0xe465)
      00E914 B8               [ 4] 1346         cp      b
      00E915 28 33            [12] 1347         jr      z,m_e94a
      00E917 3A 60 E4         [13] 1348         ld      a,(0xe460)
      00E91A B8               [ 4] 1349         cp      b
      00E91B 28 46            [12] 1350         jr      z,m_e963
      00E91D DC FF E9         [17] 1351         call    c,set_cursor_home
      00E920 18 03            [12] 1352         jr      m_e925
      00E922                       1353 m_e922:
      00E922 CD CF ED         [17] 1354         call    erase_line
      00E925                       1355 m_e925:
      00E925 3A CA E4         [13] 1356         ld      a,(0xe4ca)
      00E928 CB 7F            [ 8] 1357         bit     7,a
      00E92A 28 1B            [12] 1358         jr      z,m_e947
      00E92C E6 0F            [ 7] 1359         and     #0x0f
      00E92E                       1360 m_e92e:
      00E92E 32 6E E4         [13] 1361         ld      (cursor_column),a
      00E931                       1362 crt_set_cursor:
      00E931 CD CC E9         [17] 1363         call    get_cursor_abs
      00E934 3E 0E            [ 7] 1364         ld      a,#REG_14_CURSOR_H
      00E936 D3 50            [11] 1365         out     (CRT_REG),a
      00E938 7C               [ 4] 1366         ld      a,h
      00E939 D3 51            [11] 1367         out     (CRT_DATA),a
      00E93B 3E 0F            [ 7] 1368         ld      a,#REG_14_CURSOR_L
      00E93D D3 50            [11] 1369         out     (CRT_REG),a
      00E93F 7D               [ 4] 1370         ld      a,l
      00E940 D3 51            [11] 1371         out     (CRT_DATA),a
      00E942 AF               [ 4] 1372         xor     a
      00E943 32 CA E4         [13] 1373         ld      (0xe4ca),a
      00E946 C9               [10] 1374         ret
      00E947                       1375 m_e947:
      00E947 AF               [ 4] 1376         xor     a
      00E948 18 E4            [12] 1377         jr      m_e92e
      00E94A                       1378 m_e94a:
      00E94A 3A 63 E4         [13] 1379         ld      a,(0xe463)
      00E94D CD 8C E9         [17] 1380         call    crt_set_cursor_at_row_start
      00E950 28 D3            [12] 1381         jr      z,m_e925
      00E952 3A 64 E4         [13] 1382         ld      a,(0xe464)
      00E955 FE 01            [ 7] 1383         cp      #0x01
      00E957 C4 99 E9         [17] 1384         call    nz,m_e999
      00E95A 3A 65 E4         [13] 1385         ld      a,(0xe465)
      00E95D                       1386 m_e95d:
      00E95D 3D               [ 4] 1387         dec     a
      00E95E 32 6D E4         [13] 1388         ld      (cursor_row),a
      00E961 18 BF            [12] 1389         jr      m_e922
      00E963                       1390 m_e963:
      00E963 3A 65 E4         [13] 1391         ld      a,(0xe465)
      00E966 CD 8C E9         [17] 1392         call    crt_set_cursor_at_row_start
      00E969 28 BA            [12] 1393         jr      z,m_e925
      00E96B 3A 65 E4         [13] 1394         ld      a,(0xe465)
      00E96E 47               [ 4] 1395         ld      b,a
      00E96F 3A 60 E4         [13] 1396         ld      a,(0xe460)
      00E972 90               [ 4] 1397         sub     b
      00E973 FE 01            [ 7] 1398         cp      #0x01
      00E975 C4 99 E9         [17] 1399         call    nz,m_e999
      00E978 3A 60 E4         [13] 1400         ld      a,(0xe460)
      00E97B 18 E0            [12] 1401         jr      m_e95d
      00E97D                       1402 m_e97d:
      00E97D EB               [ 4] 1403         ex      de,hl
      00E97E 3A 62 E4         [13] 1404         ld      a,(column_count)
      00E981 6F               [ 4] 1405         ld      l,a
      00E982 26 00            [ 7] 1406         ld      h,#0x00
      00E984 19               [11] 1407         add     hl,de
      00E985 ED 4B 94 E4      [20] 1408         ld      bc,(0xe494)
      00E989 ED B0            [21] 1409         ldir
      00E98B C9               [10] 1410         ret
      00E98C                       1411 crt_set_cursor_at_row_start:
      00E98C 32 6D E4         [13] 1412         ld      (cursor_row),a
      00E98F AF               [ 4] 1413         xor     a
      00E990 32 6E E4         [13] 1414         ld      (cursor_column),a
      00E993 3A 6A E4         [13] 1415         ld      a,(0xe46a)
      00E996 E6 01            [ 7] 1416         and     #0x01
      00E998 C9               [10] 1417         ret
      00E999                       1418 m_e999:
      00E999 3D               [ 4] 1419         dec     a
      00E99A 21 00 00         [10] 1420         ld      hl,#0
      00E99D 16 00            [ 7] 1421         ld      d,#HIGH_ZERO
      00E99F CD DE E9         [17] 1422         call    calc_column_offset
      00E9A2 22 94 E4         [16] 1423         ld      (0xe494),hl
      00E9A5 CD B7 E9         [17] 1424         call    set_cursor_abs
      00E9A8 D5               [11] 1425         push    de
      00E9A9 CD 09 EA         [17] 1426         call    wait_vsync
      00E9AC CD 7D E9         [17] 1427         call    m_e97d
      00E9AF E1               [10] 1428         pop     hl
      00E9B0 CD 7D E9         [17] 1429         call    m_e97d
      00E9B3 CD 16 EA         [17] 1430         call    is_vsync
      00E9B6 C9               [10] 1431         ret
      00E9B7                       1432 set_cursor_abs:
      00E9B7 CD CC E9         [17] 1433         call    get_cursor_abs
      00E9BA 11 00 F0         [10] 1434         ld      de,#BWS
      00E9BD 19               [11] 1435         add     hl,de
      00E9BE 22 90 E4         [16] 1436         ld      (cursor_abs),hl
      00E9C1 E5               [11] 1437         push    hl
      00E9C2 11 00 08         [10] 1438         ld      de,#OFFSET_COLOR
      00E9C5 19               [11] 1439         add     hl,de
      00E9C6 22 92 E4         [16] 1440         ld      (cursor_abs_color),hl
      00E9C9 EB               [ 4] 1441         ex      de,hl
      00E9CA E1               [10] 1442         pop     hl
      00E9CB C9               [10] 1443         ret
      00E9CC                       1444 get_cursor_abs:
      00E9CC 21 00 00         [10] 1445         ld      hl,#0
      00E9CF 16 00            [ 7] 1446         ld      d,#HIGH_ZERO
      00E9D1 3A 6D E4         [13] 1447         ld      a,(cursor_row)
      00E9D4 B7               [ 4] 1448         or      a
      00E9D5 C4 DE E9         [17] 1449         call    nz,calc_column_offset
      00E9D8 3A 6E E4         [13] 1450         ld      a,(cursor_column)
      00E9DB 5F               [ 4] 1451         ld      e,a
      00E9DC 19               [11] 1452         add     hl,de
      00E9DD C9               [10] 1453         ret
      00E9DE                       1454 calc_column_offset:
      00E9DE 47               [ 4] 1455         ld      b,a
      00E9DF 3A 62 E4         [13] 1456         ld      a,(column_count)
      00E9E2 5F               [ 4] 1457         ld      e,a
      00E9E3                       1458 add_column_size:
      00E9E3 19               [11] 1459         add     hl,de
      00E9E4 05               [ 4] 1460         dec     b
      00E9E5 20 FC            [12] 1461         jr      nz,add_column_size
      00E9E7 C9               [10] 1462         ret
      00E9E8                       1463 chr_clear_screen:
      00E9E8 3E 07            [ 7] 1464         ld      a,#0x07
      00E9EA 32 67 E4         [13] 1465         ld      (attrib_color),a
      00E9ED                       1466 m_e9ed:
      00E9ED 32 00 F8         [13] 1467         ld      (BWS+OFFSET_COLOR),a
      00E9F0 21 00 F0         [10] 1468         ld      hl,#BWS
      00E9F3 0E 19            [ 7] 1469         ld      c,#0x19
      00E9F5 CD 09 EA         [17] 1470         call    wait_vsync
      00E9F8 AF               [ 4] 1471         xor     a
      00E9F9 CD A3 ED         [17] 1472         call    m_eda3
      00E9FC CD 16 EA         [17] 1473         call    is_vsync
      00E9FF                       1474 set_cursor_home:
      00E9FF AF               [ 4] 1475         xor     a
      00EA00 32 6D E4         [13] 1476         ld      (cursor_row),a
      00EA03 32 6E E4         [13] 1477         ld      (cursor_column),a
      00EA06 C3 31 E9         [10] 1478         jp      crt_set_cursor
      00EA09                       1479 wait_vsync:
      00EA09 DB 30            [11] 1480         in      a,(STATUS30)
      00EA0B CB 4F            [ 8] 1481         bit     1,a                                     ;_CRT_VSYNC_PERIOD
      00EA0D 28 FA            [12] 1482         jr      z,wait_vsync
      00EA0F                       1483 display_inhibit:
      00EA0F 3A 68 E4         [13] 1484         ld      a,(cfg10_settings)
      00EA12 CB CF            [ 8] 1485         set     1,a                                     ;_DISPLAY_INHIBIT
      00EA14 18 0B            [12] 1486         jr      display_status_set
      00EA16                       1487 is_vsync:
      00EA16 DB 30            [11] 1488         in      a,(STATUS30)
      00EA18 CB 4F            [ 8] 1489         bit     1,a                                     ;_CRT_VSYNC_PERIOD
      00EA1A 28 FA            [12] 1490         jr      z,is_vsync
      00EA1C                       1491 m_ea1c:
      00EA1C 3A 68 E4         [13] 1492         ld      a,(cfg10_settings)
      00EA1F CB 8F            [ 8] 1493         res     1,a                                     ;_DISPLAY_INHIBIT
      00EA21                       1494 display_status_set:
      00EA21 32 68 E4         [13] 1495         ld      (cfg10_settings),a
      00EA24 D3 10            [11] 1496         out     (CFG10),a
      00EA26 C9               [10] 1497         ret
      00EA27                       1498 wait_flicker_free_save_A:
      00EA27 47               [ 4] 1499         ld      b,a
      00EA28                       1500 wait_flicker_free:
      00EA28 DB 10            [11] 1501         in      a,(STATUS10)
      00EA2A CB 7F            [ 8] 1502         bit     7,a                                     ;_CRT_DISPLAY
      00EA2C 20 FA            [12] 1503         jr      nz,wait_flicker_free
      00EA2E                       1504 m_ea2e:
      00EA2E DB 10            [11] 1505         in      a,(STATUS10)
      00EA30 CB 7F            [ 8] 1506         bit     7,a                                     ;_CRT_DISPLAY
      00EA32 28 FA            [12] 1507         jr      z,m_ea2e
      00EA34 C9               [10] 1508         ret
      00EA35                       1509 chr_cursor_left:
      00EA35 3A 6E E4         [13] 1510         ld      a,(cursor_column)
      00EA38 3D               [ 4] 1511         dec     a
      00EA39 FE FF            [ 7] 1512         cp      #-1
      00EA3B 20 32            [12] 1513         jr      nz,m_ea6f
      00EA3D 3A 62 E4         [13] 1514         ld      a,(column_count)
      00EA40 3D               [ 4] 1515         dec     a
      00EA41 32 6E E4         [13] 1516         ld      (cursor_column),a
      00EA44                       1517 chr_cursor_up:
      00EA44 3A 6D E4         [13] 1518         ld      a,(cursor_row)
      00EA47 3D               [ 4] 1519         dec     a
      00EA48 FE FF            [ 7] 1520         cp      #-1
      00EA4A 20 1D            [12] 1521         jr      nz,cursor_row_adjusted
      00EA4C 3E 17            [ 7] 1522         ld      a,#SCREEN_HEIGHT-1
      00EA4E 18 19            [12] 1523         jr      cursor_row_adjusted
      00EA50                       1524 chr_cursor_right:
      00EA50 3A 62 E4         [13] 1525         ld      a,(column_count)
      00EA53 47               [ 4] 1526         ld      b,a
      00EA54 3A 6E E4         [13] 1527         ld      a,(cursor_column)
      00EA57 3C               [ 4] 1528         inc     a
      00EA58 B8               [ 4] 1529         cp      b
      00EA59 38 14            [12] 1530         jr      c,m_ea6f
      00EA5B AF               [ 4] 1531         xor     a
      00EA5C 32 6E E4         [13] 1532         ld      (cursor_column),a
      00EA5F                       1533 chr_cursor_down:
      00EA5F 06 18            [ 7] 1534         ld      b,#SCREEN_HEIGHT
      00EA61 3A 6D E4         [13] 1535         ld      a,(cursor_row)
      00EA64 3C               [ 4] 1536         inc     a
      00EA65 B8               [ 4] 1537         cp      b
      00EA66 38 01            [12] 1538         jr      c,cursor_row_adjusted
      00EA68 AF               [ 4] 1539         xor     a
      00EA69                       1540 cursor_row_adjusted:
      00EA69 32 6D E4         [13] 1541         ld      (cursor_row),a
      00EA6C                       1542 m_ea6c:
      00EA6C C3 31 E9         [10] 1543         jp      crt_set_cursor
      00EA6F                       1544 m_ea6f:
      00EA6F 32 6E E4         [13] 1545         ld      (cursor_column),a
      00EA72 18 F8            [12] 1546         jr      m_ea6c
      00EA74                       1547 chr_backspace:
      00EA74 CD B7 E9         [17] 1548         call    set_cursor_abs
      00EA77 CD 28 EA         [17] 1549         call    wait_flicker_free
      00EA7A 36 20            [10] 1550         ld      (hl),#' '
      00EA7C 18 B7            [12] 1551         jr      chr_cursor_left
      00EA7E                       1552 chr_beep:
      00EA7E E5               [11] 1553         push    hl
      00EA7F 21 68 E4         [10] 1554         ld      hl,#cfg10_settings
      00EA82 CB E6            [15] 1555         set     4,(hl)                                  ;_BUZZER_ON
      00EA84 7E               [ 7] 1556         ld      a,(hl)
      00EA85 D3 10            [11] 1557         out     (CFG10),a
      00EA87 E5               [11] 1558         push    hl
      00EA88 2A D2 E4         [16] 1559         ld      hl,(beep_delay)
      00EA8B CD 7B E6         [17] 1560         call    delay
      00EA8E E1               [10] 1561         pop     hl
      00EA8F                       1562 m_ea8f:
      00EA8F CB A6            [15] 1563         res     4,(hl)                                  ;_BUZZER_ON
      00EA91                       1564 m_ea91:
      00EA91 7E               [ 7] 1565         ld      a,(hl)
      00EA92 D3 10            [11] 1566         out     (CFG10),a
      00EA94 E1               [10] 1567         pop     hl
      00EA95 C9               [10] 1568         ret
      00EA96                       1569 buzzer_on:
      00EA96 E5               [11] 1570         push    hl
      00EA97 21 68 E4         [10] 1571         ld      hl,#cfg10_settings
      00EA9A CB E6            [15] 1572         set     4,(hl)                                  ;_BUZZER_ON
      00EA9C 18 F3            [12] 1573         jr      m_ea91
      00EA9E                       1574 m_ea9e:
      00EA9E E5               [11] 1575         push    hl
      00EA9F 21 68 E4         [10] 1576         ld      hl,#cfg10_settings
      00EAA2 18 EB            [12] 1577         jr      m_ea8f
      00EAA4                       1578 m_eaa4:
      00EAA4 DB 2A            [11] 1579         in      a,(STATUS_KBD+10)
      00EAA6 B7               [ 4] 1580         or      a
      00EAA7 CB 7F            [ 8] 1581         bit     7,a                                     ;KBD_BREAK
      00EAA9 C8               [11] 1582         ret     z
      00EAAA 3A D0 E4         [13] 1583         ld      a,(os_patch)
      00EAAD B7               [ 4] 1584         or      a
      00EAAE CA 00 00         [10] 1585         jp      z,cold_start
      00EAB1 1E 18            [ 7] 1586         ld      e,#0x18
      00EAB3 37               [ 4] 1587         scf
      00EAB4 C9               [10] 1588         ret
      00EAB5                       1589 lpt_busy:
      00EAB5 CD A4 EA         [17] 1590         call    m_eaa4
      00EAB8 DB 30            [11] 1591         in      a,(STATUS30)
      00EABA CB 5F            [ 8] 1592         bit     3,a                                     ;_CEN_BUSY
      00EABC 3E 00            [ 7] 1593         ld      a,#0x00
      00EABE C8               [11] 1594         ret     z
      00EABF 3E FF            [ 7] 1595         ld      a,#0xff
      00EAC1 C9               [10] 1596         ret
      00EAC2                       1597 lpt_write_byte:
      00EAC2 CD 45 E4         [17] 1598         call    m_e445
      00EAC5 D8               [11] 1599         ret     c
      00EAC6 20 FA            [12] 1600         jr      nz,lpt_write_byte
      00EAC8 79               [ 4] 1601         ld      a,c
      00EAC9 D3 30            [11] 1602         out     (CEN_DATA),a
      00EACB 3A 69 E4         [13] 1603         ld      a,(cfg20_settings)
      00EACE CB D7            [ 8] 1604         set     2,a                                     ;CEN_STROBE
      00EAD0 D3 20            [11] 1605         out     (CFG20),a
      00EAD2 CB 97            [ 8] 1606         res     2,a                                     ;CEN_STROBE
      00EAD4 D3 20            [11] 1607         out     (CFG20),a
      00EAD6                       1608 m_ead6:
      00EAD6 DB 30            [11] 1609         in      a,(STATUS30)
      00EAD8 CB 57            [ 8] 1610         bit     2,a                                     ;_CEN_ACKNOWLEDGE
      00EADA 20 01            [12] 1611         jr      nz,m_eadd
      00EADC C9               [10] 1612         ret
      00EADD                       1613 m_eadd:
      00EADD CD A4 EA         [17] 1614         call    m_eaa4
      00EAE0 D8               [11] 1615         ret     c
      00EAE1 18 F3            [12] 1616         jr      m_ead6
      00EAE3                       1617 com_tx_ready:
      00EAE3 DB 41            [11] 1618         in      a,(0x41)
      00EAE5 CD 08 EB         [17] 1619         call    m_eb08
      00EAE8 28 F9            [12] 1620         jr      z,com_tx_ready
      00EAEA 18 06            [12] 1621         jr      m_eaf2
      00EAEC                       1622 com_write_byte:
      00EAEC CD FF EA         [17] 1623         call    m_eaff
      00EAEF D8               [11] 1624         ret     c
      00EAF0 28 FA            [12] 1625         jr      z,com_write_byte
      00EAF2                       1626 m_eaf2:
      00EAF2 79               [ 4] 1627         ld      a,c
      00EAF3 D3 40            [11] 1628         out     (0x40),a
      00EAF5 C9               [10] 1629         ret
      00EAF6                       1630 com_read_byte:
      00EAF6 CD 10 EB         [17] 1631         call    com_rx_ready
      00EAF9 D8               [11] 1632         ret     c
      00EAFA 28 FA            [12] 1633         jr      z,com_read_byte
      00EAFC DB 40            [11] 1634         in      a,(0x40)
      00EAFE C9               [10] 1635         ret
      00EAFF                       1636 m_eaff:
      00EAFF CD A4 EA         [17] 1637         call    m_eaa4
      00EB02 DB 41            [11] 1638         in      a,(0x41)
      00EB04 CB 7F            [ 8] 1639         bit     7,a
      00EB06 28 05            [12] 1640         jr      z,m_eb0d
      00EB08                       1641 m_eb08:
      00EB08 CB 47            [ 8] 1642         bit     0,a
      00EB0A 3E FF            [ 7] 1643         ld      a,#0xff
      00EB0C C0               [11] 1644         ret     nz
      00EB0D                       1645 m_eb0d:
      00EB0D 3E 00            [ 7] 1646         ld      a,#0x00
      00EB0F C9               [10] 1647         ret
      00EB10                       1648 com_rx_ready:
      00EB10 CD A4 EA         [17] 1649         call    m_eaa4
      00EB13 DB 41            [11] 1650         in      a,(0x41)
      00EB15 CB 4F            [ 8] 1651         bit     1,a
      00EB17 3E 00            [ 7] 1652         ld      a,#0x00
      00EB19 C8               [11] 1653         ret     z
      00EB1A 3E FF            [ 7] 1654         ld      a,#0xff
      00EB1C C9               [10] 1655         ret
      00EB1D                       1656 unreferenced_06:
      00EB1D 3E FE            [ 7] 1657         ld      a,#0xfe
      00EB1F D3 41            [11] 1658         out     (0x41),a
      00EB21 3E 37            [ 7] 1659         ld      a,#0x37
      00EB23 D3 41            [11] 1660         out     (0x41),a
      00EB25 3A 68 E4         [13] 1661         ld      a,(cfg10_settings)
      00EB28 CB 97            [ 8] 1662         res     2,a                                     ;CMT_RS232_SELECT
      00EB2A 18 0D            [12] 1663         jr      set_cfg10
      00EB2C                       1664 init_serial:
      00EB2C 3E FA            [ 7] 1665         ld      a,#0xfa
      00EB2E D3 41            [11] 1666         out     (0x41),a
      00EB30 3E 37            [ 7] 1667         ld      a,#0x37
      00EB32 D3 41            [11] 1668         out     (0x41),a
      00EB34 3A 68 E4         [13] 1669         ld      a,(cfg10_settings)
      00EB37 CB D7            [ 8] 1670         set     2,a                                     ;CMT_RS232_SELECT
      00EB39                       1671 set_cfg10:
      00EB39 D3 10            [11] 1672         out     (CFG10),a
      00EB3B 32 68 E4         [13] 1673         ld      (cfg10_settings),a
      00EB3E C9               [10] 1674         ret
      00EB3F                       1675 unreferenced_07:
      00EB3F 3A 68 E4         [13] 1676         ld      a,(0xe468)
      00EB42 CB DF            [ 8] 1677         set     3,a
      00EB44                       1678 m_eb44:
      00EB44 D3 10            [11] 1679         out     (0x10),a
      00EB46 32 68 E4         [13] 1680         ld      (0xe468),a
      00EB49 C9               [10] 1681         ret
      00EB4A                       1682 unreferenced_08:
      00EB4A 3A 68 E4         [13] 1683         ld      a,(0xe468)
      00EB4D CB 9F            [ 8] 1684         res     3,a
      00EB4F 18 F3            [12] 1685         jr      m_eb44
      00EB51                       1686 map_esc_list:
      00EB51 09                    1687         .db     0x09                                    ;.
      00EB52 D1 EC                 1688         .dw     alternate_keyboard_table
      00EB54                       1689 map_ch_0c:
      00EB54 0C                    1690         .db     0x0c                                    ;.
      00EB55 13 EC                 1691         .dw     function_0c
      00EB57                       1692 map_ch_10:
      00EB57 10                    1693         .db     0x10                                    ;.
      00EB58 13 EC                 1694         .dw     function_0c
      00EB5A                       1695 map_ch_11:
      00EB5A 11                    1696         .db     0x11                                    ;.
      00EB5B FF E9                 1697         .dw     set_cursor_home
      00EB5D                       1698 map_ch_12:
      00EB5D 12                    1699         .db     0x12                                    ;.
      00EB5E 91 EC                 1700         .dw     set_cursor_off
      00EB60                       1701 map_ch_13:
      00EB60 13                    1702         .db     0x13                                    ;.
      00EB61 8D EC                 1703         .dw     set_cursor_on
      00EB63                       1704 map_ch_16:
      00EB63 16                    1705         .db     0x16                                    ;.
      00EB64 13 EC                 1706         .dw     function_0c
      00EB66                       1707 map_ch_17:
      00EB66 17                    1708         .db     0x17                                    ;.
      00EB67 A6 EC                 1709         .dw     get_cursor_pos
      00EB69                       1710 map_ch_18:
      00EB69 18                    1711         .db     0x18                                    ;.
      00EB6A 6A ED                 1712         .dw     write_character
      00EB6C                       1713 map_ch_19:
      00EB6C 19                    1714         .db     0x19                                    ;.
      00EB6D 99 ED                 1715         .dw     erase_rest_of_line
      00EB6F                       1716 map_ch_1a:
      00EB6F 1A                    1717         .db     0x1a                                    ;.
      00EB70 50 EA                 1718         .dw     chr_cursor_right
      00EB72                       1719 map_ch_1c:
      00EB72 1C                    1720         .db     0x1c                                    ;.
      00EB73 88 ED                 1721         .dw     read_character
      00EB75                       1722 map_ch_1d:
      00EB75 1D                    1723         .db     0x1d                                    ;.
      00EB76 13 EC                 1724         .dw     function_0c
      00EB78                       1725 map_ch_31:
      00EB78 31                    1726         .db     0x31                                    ;1
      00EB79 18 EC                 1727         .dw     graphic_mode_on
      00EB7B                       1728 map_ch_41:
      00EB7B 41                    1729         .db     0x41                                    ;A
      00EB7C 44 EA                 1730         .dw     chr_cursor_up
      00EB7E                       1731 map_ch_42:
      00EB7E 42                    1732         .db     0x42                                    ;B
      00EB7F 5F EA                 1733         .dw     chr_cursor_down
      00EB81                       1734 map_ch_43:
      00EB81 43                    1735         .db     0x43                                    ;C
      00EB82 50 EA                 1736         .dw     chr_cursor_right
      00EB84                       1737 map_ch_44:
      00EB84 44                    1738         .db     0x44                                    ;D
      00EB85 35 EA                 1739         .dw     chr_cursor_left
      00EB87                       1740 map_ch_45:
      00EB87 45                    1741         .db     0x45                                    ;E
      00EB88 E8 E9                 1742         .dw     chr_clear_screen
      00EB8A                       1743 map_ch_46:
      00EB8A 46                    1744         .db     0x46                                    ;F
      00EB8B CF ED                 1745         .dw     erase_line
      00EB8D                       1746 map_ch_47:
      00EB8D 47                    1747         .db     0x47                                    ;G
      00EB8E 13 EC                 1748         .dw     function_0c
      00EB90                       1749 map_ch_48:
      00EB90 48                    1750         .db     0x48                                    ;H
      00EB91 FF E9                 1751         .dw     set_cursor_home
      00EB93                       1752 map_ch_49:
      00EB93 49                    1753         .db     0x49                                    ;I
      00EB94 13 EC                 1754         .dw     function_0c
      00EB96                       1755 map_ch_4a:
      00EB96 4A                    1756         .db     0x4a                                    ;J
      00EB97 DD ED                 1757         .dw     function_4a
      00EB99                       1758 map_ch_4b:
      00EB99 4B                    1759         .db     0x4b                                    ;K
      00EB9A 99 ED                 1760         .dw     erase_rest_of_line
      00EB9C                       1761 map_ch_53:
      00EB9C 53                    1762         .db     0x53                                    ;S
      00EB9D 13 EC                 1763         .dw     function_0c
      00EB9F                       1764 map_ch_54:
      00EB9F 54                    1765         .db     0x54                                    ;T
      00EBA0 13 EC                 1766         .dw     function_0c
      00EBA2                       1767 map_ch_55:
      00EBA2 55                    1768         .db     0x55                                    ;U
      00EBA3 13 EC                 1769         .dw     function_0c
      00EBA5                       1770 map_ch_56:
      00EBA5 56                    1771         .db     0x56                                    ;V
      00EBA6 13 EC                 1772         .dw     function_0c
      00EBA8                       1773 map_ch_59:
      00EBA8 59                    1774         .db     0x59                                    ;Y
      00EBA9 13 EC                 1775         .dw     function_0c
      00EBAB                       1776 map_ch_end:
      00EBAB 00                    1777         .db     0x00                                    ;.
      00EBAC                       1778 map_more_codes:
      00EBAC 0C                    1779         .db     0x0c                                    ;.
      00EBAD E1 EC                 1780         .dw     function_more_0c0
      00EBAF                       1781 map_ch_more1:
      00EBAF 10                    1782         .db     0x10                                    ;.
      00EBB0 2A EE                 1783         .dw     function_more_0c1
      00EBB2                       1784 map_ch_more2:
      00EBB2 16                    1785         .db     0x16                                    ;.
      00EBB3 35 ED                 1786         .dw     function_more_0c2
      00EBB5                       1787 map_ch_more3:
      00EBB5 1D                    1788         .db     0x1d                                    ;.
      00EBB6 5F EE                 1789         .dw     function_more_0c3
      00EBB8                       1790 map_ch_more4:
      00EBB8 47                    1791         .db     0x47                                    ;G
      00EBB9 E7 ED                 1792         .dw     function_more_0c4
      00EBBB                       1793 map_ch_more5:
      00EBBB 49                    1794         .db     0x49                                    ;I
      00EBBC FC ED                 1795         .dw     function_more_0c5
      00EBBE                       1796 map_ch_more6:
      00EBBE 53                    1797         .db     0x53                                    ;S
      00EBBF 75 EE                 1798         .dw     function_more_0c6
      00EBC1                       1799 map_ch_more7:
      00EBC1 54                    1800         .db     0x54                                    ;T
      00EBC2 34 EC                 1801         .dw     function_more_0c7
      00EBC4                       1802 map_ch_more8:
      00EBC4 55                    1803         .db     0x55                                    ;U
      00EBC5 34 EC                 1804         .dw     function_more_0c7
      00EBC7                       1805 map_ch_more9:
      00EBC7 56                    1806         .db     0x56                                    ;V
      00EBC8 6A EC                 1807         .dw     function_more_0c9
      00EBCA                       1808 map_ch_more10:
      00EBCA 59                    1809         .db     0x59                                    ;Y
      00EBCB 1B ED                 1810         .dw     function_more_0c10
      00EBCD                       1811 map_ch_more11:
      00EBCD 96                    1812         .db     0x96                                    ;.
      00EBCE 65 ED                 1813         .dw     function_more_0c11
      00EBD0                       1814 map_ch_more12:
      00EBD0 9D                    1815         .db     0x9d                                    ;.
      00EBD1 68 EE                 1816         .dw     function_more_0c12
      00EBD3                       1817 map_ch_more13:
      00EBD3 B1                    1818         .db     0xb1                                    ;1
      00EBD4 ED EC                 1819         .dw     function_more_0c13
      00EBD6                       1820 map_ch_more14:
      00EBD6 B2                    1821         .db     0xb2                                    ;2
      00EBD7 0E ED                 1822         .dw     function_more_0c14
      00EBD9                       1823 map_ch_more15:
      00EBD9 D4                    1824         .db     0xd4                                    ;T
      00EBDA 3D EC                 1825         .dw     function_more_0c15
      00EBDC                       1826 map_ch_more16:
      00EBDC D5                    1827         .db     0xd5                                    ;U
      00EBDD 3D EC                 1828         .dw     function_more_0c15
      00EBDF                       1829 map_ch_more17:
      00EBDF D9                    1830         .db     0xd9                                    ;Y
      00EBE0 42 ED                 1831         .dw     function_more_0c17
      00EBE2                       1832 map_more_codes_end:
      00EBE2 00                    1833         .db     0x00                                    ;.
      00EBE3                       1834 m_ebe3:
      00EBE3 FE 01            [ 7] 1835         cp      #0x01
      00EBE5 C2 03 EC         [10] 1836         jp      nz,m_ec03
      00EBE8 AF               [ 4] 1837         xor     a
      00EBE9 32 8C E4         [13] 1838         ld      (0xe48c),a
      00EBEC 32 CB E4         [13] 1839         ld      (0xe4cb),a
      00EBEF 79               [ 4] 1840         ld      a,c
      00EBF0 FE 61            [ 7] 1841         cp      #0x61
      00EBF2 38 07            [12] 1842         jr      c,m_ebfb
      00EBF4 FE 7B            [ 7] 1843         cp      #0x7b
      00EBF6 30 03            [12] 1844         jr      nc,m_ebfb
      00EBF8 E6 5F            [ 7] 1845         and     #0x5f
      00EBFA 4F               [ 4] 1846         ld      c,a
      00EBFB                       1847 m_ebfb:
      00EBFB 21 51 EB         [10] 1848         ld      hl,#map_esc_list
      00EBFE CD 1F EC         [17] 1849         call    map_C_to_PTR
      00EC01 C8               [11] 1850         ret     z
      00EC02 E9               [ 4] 1851         jp      (hl)
      00EC03                       1852 m_ec03:
      00EC03 4F               [ 4] 1853         ld      c,a
      00EC04 AF               [ 4] 1854         xor     a
      00EC05 32 8C E4         [13] 1855         ld      (0xe48c),a
      00EC08 21 AC EB         [10] 1856         ld      hl,#0xebac
      00EC0B CD 1F EC         [17] 1857         call    map_C_to_PTR
      00EC0E C8               [11] 1858         ret     z
      00EC0F E9               [ 4] 1859         jp      (hl)
      00EC10                       1860 m_ec10:
      00EC10 AF               [ 4] 1861         xor     a
      00EC11 18 01            [12] 1862         jr      m_ec14
      00EC13                       1863 function_0c:
      00EC13 79               [ 4] 1864         ld      a,c
      00EC14                       1865 m_ec14:
      00EC14 32 8C E4         [13] 1866         ld      (0xe48c),a
      00EC17 C9               [10] 1867         ret
      00EC18                       1868 graphic_mode_on:
      00EC18 79               [ 4] 1869         ld      a,c
      00EC19 F6 80            [ 7] 1870         or      #0x80
      00EC1B 32 8C E4         [13] 1871         ld      (0xe48c),a
      00EC1E C9               [10] 1872         ret
      00EC1F                       1873 map_C_to_PTR:
      00EC1F 7E               [ 7] 1874         ld      a,(hl)
      00EC20 B7               [ 4] 1875         or      a
      00EC21 C8               [11] 1876         ret     z
      00EC22 B9               [ 4] 1877         cp      c
      00EC23 28 05            [12] 1878         jr      z,key_found
      00EC25 23               [ 6] 1879         inc     hl
      00EC26 23               [ 6] 1880         inc     hl
      00EC27 23               [ 6] 1881         inc     hl
      00EC28 18 F5            [12] 1882         jr      map_C_to_PTR
      00EC2A                       1883 key_found:
      00EC2A D5               [11] 1884         push    de
      00EC2B 23               [ 6] 1885         inc     hl
      00EC2C 5E               [ 7] 1886         ld      e,(hl)
      00EC2D 23               [ 6] 1887         inc     hl
      00EC2E 56               [ 7] 1888         ld      d,(hl)
      00EC2F EB               [ 4] 1889         ex      de,hl
      00EC30 D1               [10] 1890         pop     de
      00EC31 79               [ 4] 1891         ld      a,c
      00EC32 B7               [ 4] 1892         or      a
      00EC33 C9               [10] 1893         ret
      00EC34                       1894 function_more_0c7:
      00EC34 CD 83 EC         [17] 1895         call    m_ec83
      00EC37 D8               [11] 1896         ret     c
      00EC38 32 99 E4         [13] 1897         ld      (0xe499),a
      00EC3B 18 DB            [12] 1898         jr      graphic_mode_on
      00EC3D                       1899 function_more_0c15:
      00EC3D CD 83 EC         [17] 1900         call    m_ec83
      00EC40 D8               [11] 1901         ret     c
      00EC41 47               [ 4] 1902         ld      b,a
      00EC42 3A 6A E4         [13] 1903         ld      a,(0xe46a)
      00EC45 CB 77            [ 8] 1904         bit     6,a
      00EC47 3A 99 E4         [13] 1905         ld      a,(0xe499)
      00EC4A 20 02            [12] 1906         jr      nz,m_ec4e
      00EC4C B8               [ 4] 1907         cp      b
      00EC4D C8               [11] 1908         ret     z
      00EC4E                       1909 m_ec4e:
      00EC4E F5               [11] 1910         push    af
      00EC4F 78               [ 4] 1911         ld      a,b
      00EC50 07               [ 4] 1912         rlca
      00EC51 07               [ 4] 1913         rlca
      00EC52 07               [ 4] 1914         rlca
      00EC53 47               [ 4] 1915         ld      b,a
      00EC54 F1               [10] 1916         pop     af
      00EC55 B0               [ 4] 1917         or      b
      00EC56 47               [ 4] 1918         ld      b,a
      00EC57 3A 67 E4         [13] 1919         ld      a,(0xe467)
      00EC5A E6 C0            [ 7] 1920         and     #0xc0
      00EC5C B0               [ 4] 1921         or      b
      00EC5D 32 67 E4         [13] 1922         ld      (0xe467),a
      00EC60 79               [ 4] 1923         ld      a,c
      00EC61 FE D4            [ 7] 1924         cp      #0xd4
      00EC63 C0               [11] 1925         ret     nz
      00EC64 3A 67 E4         [13] 1926         ld      a,(0xe467)
      00EC67 C3 ED E9         [10] 1927         jp      m_e9ed
      00EC6A                       1928 function_more_0c9:
      00EC6A 21 67 E4         [10] 1929         ld      hl,#0xe467
      00EC6D 3A 66 E4         [13] 1930         ld      a,(0xe466)
      00EC70 FE 30            [ 7] 1931         cp      #0x30
      00EC72 D8               [11] 1932         ret     c
      00EC73 FE 34            [ 7] 1933         cp      #0x34
      00EC75 D0               [11] 1934         ret     nc
      00EC76 CB 0F            [ 8] 1935         rrc     a
      00EC78 CB 0F            [ 8] 1936         rrc     a
      00EC7A E6 C0            [ 7] 1937         and     #0xc0
      00EC7C 47               [ 4] 1938         ld      b,a
      00EC7D 7E               [ 7] 1939         ld      a,(hl)
      00EC7E E6 3F            [ 7] 1940         and     #0x3f
      00EC80 B0               [ 4] 1941         or      b
      00EC81 77               [ 7] 1942         ld      (hl),a
      00EC82 C9               [10] 1943         ret
      00EC83                       1944 m_ec83:
      00EC83 3A 66 E4         [13] 1945         ld      a,(0xe466)
      00EC86 D6 30            [ 7] 1946         sub     #0x30
      00EC88 D8               [11] 1947         ret     c
      00EC89 FE 08            [ 7] 1948         cp      #0x08
      00EC8B 3F               [ 4] 1949         ccf
      00EC8C C9               [10] 1950         ret
      00EC8D                       1951 set_cursor_on:
      00EC8D 06 40            [ 7] 1952         ld      b,#0x40
      00EC8F 18 02            [12] 1953         jr      m_ec93
      00EC91                       1954 set_cursor_off:
      00EC91 06 20            [ 7] 1955         ld      b,#0x20
      00EC93                       1956 m_ec93:
      00EC93 3A 70 E4         [13] 1957         ld      a,(0xe470)
      00EC96 E6 1F            [ 7] 1958         and     #0x1f
      00EC98 B0               [ 4] 1959         or      b
      00EC99 32 70 E4         [13] 1960         ld      (0xe470),a
      00EC9C 06 0A            [ 7] 1961         ld      b,#0x0a
      00EC9E 0E 50            [ 7] 1962         ld      c,#0x50
      00ECA0 ED 41            [12] 1963         out     (c),b
      00ECA2 0C               [ 4] 1964         inc     c
      00ECA3 ED 79            [12] 1965         out     (c),a
      00ECA5 C9               [10] 1966         ret
      00ECA6                       1967 get_cursor_pos:
      00ECA6 3E 01            [ 7] 1968         ld      a,#0x01
      00ECA8 32 CB E4         [13] 1969         ld      (0xe4cb),a
      00ECAB 0E 50            [ 7] 1970         ld      c,#0x50
      00ECAD 3E 0E            [ 7] 1971         ld      a,#0x0e
      00ECAF ED 79            [12] 1972         out     (c),a
      00ECB1 0C               [ 4] 1973         inc     c
      00ECB2 ED 60            [12] 1974         in      h,(c)
      00ECB4 3C               [ 4] 1975         inc     a
      00ECB5 0D               [ 4] 1976         dec     c
      00ECB6 ED 79            [12] 1977         out     (c),a
      00ECB8 0C               [ 4] 1978         inc     c
      00ECB9 ED 68            [12] 1979         in      l,(c)
      00ECBB 3A 62 E4         [13] 1980         ld      a,(0xe462)
      00ECBE 5F               [ 4] 1981         ld      e,a
      00ECBF 16 00            [ 7] 1982         ld      d,#0x00
      00ECC1 0E 00            [ 7] 1983         ld      c,#0x00
      00ECC3                       1984 m_ecc3:
      00ECC3 B7               [ 4] 1985         or      a
      00ECC4 ED 52            [15] 1986         sbc     hl,de
      00ECC6 38 03            [12] 1987         jr      c,m_eccb
      00ECC8 0C               [ 4] 1988         inc     c
      00ECC9 18 F8            [12] 1989         jr      m_ecc3
      00ECCB                       1990 m_eccb:
      00ECCB 19               [11] 1991         add     hl,de
      00ECCC 61               [ 4] 1992         ld      h,c
      00ECCD 22 CC E4         [16] 1993         ld      (0xe4cc),hl
      00ECD0 C9               [10] 1994         ret
      00ECD1                       1995 alternate_keyboard_table:
      00ECD1 21 DD E4         [10] 1996         ld      hl,#0xe4dd
      00ECD4 0E C0            [ 7] 1997         ld      c,#0xc0
      00ECD6                       1998 m_ecd6:
      00ECD6 1A               [ 7] 1999         ld      a,(de)
      00ECD7 47               [ 4] 2000         ld      b,a
      00ECD8 7E               [ 7] 2001         ld      a,(hl)
      00ECD9 12               [ 7] 2002         ld      (de),a
      00ECDA 70               [ 7] 2003         ld      (hl),b
      00ECDB 13               [ 6] 2004         inc     de
      00ECDC 23               [ 6] 2005         inc     hl
      00ECDD 0D               [ 4] 2006         dec     c
      00ECDE 20 F6            [12] 2007         jr      nz,m_ecd6
      00ECE0 C9               [10] 2008         ret
      00ECE1                       2009 function_more_0c0:
      00ECE1 3A 66 E4         [13] 2010         ld      a,(0xe466)
      00ECE4 32 6A E4         [13] 2011         ld      (0xe46a),a
      00ECE7 CB 7F            [ 8] 2012         bit     7,a
      00ECE9 C0               [11] 2013         ret     nz
      00ECEA C3 E8 E9         [10] 2014         jp      chr_clear_screen
      00ECED                       2015 function_more_0c13:
      00ECED 79               [ 4] 2016         ld      a,c
      00ECEE 32 8C E4         [13] 2017         ld      (0xe48c),a
      00ECF1                       2018 m_ecf1:
      00ECF1 3A 66 E4         [13] 2019         ld      a,(0xe466)
      00ECF4 FE 1B            [ 7] 2020         cp      #0x1b
      00ECF6 28 0F            [12] 2021         jr      z,m_ed07
      00ECF8 FE 60            [ 7] 2022         cp      #0x60
      00ECFA D0               [11] 2023         ret     nc
      00ECFB CD 28 E8         [17] 2024         call    m_e828
      00ECFE DA 1E E8         [10] 2025         jp      c,m_e81e
      00ED01 32 66 E4         [13] 2026         ld      (0xe466),a
      00ED04 C3 EC E8         [10] 2027         jp      m_e8ec
      00ED07                       2028 m_ed07:
      00ED07 3E 32            [ 7] 2029         ld      a,#0x32
      00ED09 32 8C E4         [13] 2030         ld      (0xe48c),a
      00ED0C C9               [10] 2031         ret
                                   2032 ; unchecked data source
      00ED0D C9                    2033         .db     0xc9                                    ;I
      00ED0E                       2034 function_more_0c14:
      00ED0E 3A 66 E4         [13] 2035         ld      a,(0xe466)
      00ED11 FE 32            [ 7] 2036         cp      #0x32
      00ED13 C8               [11] 2037         ret     z
      00ED14 3E B1            [ 7] 2038         ld      a,#0xb1
      00ED16 32 8C E4         [13] 2039         ld      (0xe48c),a
      00ED19 18 D6            [12] 2040         jr      m_ecf1
      00ED1B                       2041 function_more_0c10:
      00ED1B 3A 66 E4         [13] 2042         ld      a,(0xe466)
      00ED1E FE 20            [ 7] 2043         cp      #0x20
      00ED20 38 0C            [12] 2044         jr      c,m_ed2e
      00ED22 FE 38            [ 7] 2045         cp      #0x38
      00ED24 30 0B            [12] 2046         jr      nc,m_ed31
      00ED26 D6 20            [ 7] 2047         sub     #0x20
      00ED28                       2048 m_ed28:
      00ED28 32 96 E4         [13] 2049         ld      (0xe496),a
      00ED2B C3 18 EC         [10] 2050         jp      graphic_mode_on
      00ED2E                       2051 m_ed2e:
      00ED2E AF               [ 4] 2052         xor     a
      00ED2F 18 F7            [12] 2053         jr      m_ed28
      00ED31                       2054 m_ed31:
      00ED31 3E 17            [ 7] 2055         ld      a,#0x17
      00ED33 18 F3            [12] 2056         jr      m_ed28
      00ED35                       2057 function_more_0c2:
      00ED35 3A 66 E4         [13] 2058         ld      a,(0xe466)
      00ED38 B7               [ 4] 2059         or      a
      00ED39 28 ED            [12] 2060         jr      z,m_ed28
      00ED3B FE 19            [ 7] 2061         cp      #0x19
      00ED3D 30 F2            [12] 2062         jr      nc,m_ed31
      00ED3F 3D               [ 4] 2063         dec     a
      00ED40 18 E6            [12] 2064         jr      m_ed28
      00ED42                       2065 function_more_0c17:
      00ED42 3A 66 E4         [13] 2066         ld      a,(0xe466)
      00ED45 D6 20            [ 7] 2067         sub     #0x20
      00ED47 38 15            [12] 2068         jr      c,m_ed5e
      00ED49                       2069 m_ed49:
      00ED49 F5               [11] 2070         push    af
      00ED4A 3A 62 E4         [13] 2071         ld      a,(0xe462)
      00ED4D 47               [ 4] 2072         ld      b,a
      00ED4E F1               [10] 2073         pop     af
      00ED4F B8               [ 4] 2074         cp      b
      00ED50 30 0F            [12] 2075         jr      nc,m_ed61
      00ED52                       2076 m_ed52:
      00ED52 32 6E E4         [13] 2077         ld      (0xe46e),a
      00ED55 3A 96 E4         [13] 2078         ld      a,(0xe496)
      00ED58 32 6D E4         [13] 2079         ld      (0xe46d),a
      00ED5B C3 31 E9         [10] 2080         jp      crt_set_cursor
      00ED5E                       2081 m_ed5e:
      00ED5E AF               [ 4] 2082         xor     a
      00ED5F 18 F1            [12] 2083         jr      m_ed52
      00ED61                       2084 m_ed61:
      00ED61 78               [ 4] 2085         ld      a,b
      00ED62 3D               [ 4] 2086         dec     a
      00ED63 18 ED            [12] 2087         jr      m_ed52
      00ED65                       2088 function_more_0c11:
      00ED65 3A 66 E4         [13] 2089         ld      a,(0xe466)
      00ED68 18 DF            [12] 2090         jr      m_ed49
      00ED6A                       2091 write_character:
      00ED6A D5               [11] 2092         push    de
      00ED6B CD B7 E9         [17] 2093         call    set_cursor_abs
      00ED6E D1               [10] 2094         pop     de
      00ED6F CD 28 EA         [17] 2095         call    wait_flicker_free
      00ED72 73               [ 7] 2096         ld      (hl),e
      00ED73                       2097 m_ed73:
      00ED73 3A 6D E4         [13] 2098         ld      a,(0xe46d)
      00ED76 FE 17            [ 7] 2099         cp      #0x17
      00ED78 C2 FA E8         [10] 2100         jp      nz,m_e8fa
      00ED7B 3A 62 E4         [13] 2101         ld      a,(0xe462)
      00ED7E 3D               [ 4] 2102         dec     a
      00ED7F 47               [ 4] 2103         ld      b,a
      00ED80 3A 6E E4         [13] 2104         ld      a,(0xe46e)
      00ED83 B8               [ 4] 2105         cp      b
      00ED84 C2 FA E8         [10] 2106         jp      nz,m_e8fa
      00ED87 C9               [10] 2107         ret
      00ED88                       2108 read_character:
      00ED88 3E 01            [ 7] 2109         ld      a,#0x01
      00ED8A 32 CB E4         [13] 2110         ld      (0xe4cb),a
      00ED8D CD B7 E9         [17] 2111         call    set_cursor_abs
      00ED90 CD 28 EA         [17] 2112         call    wait_flicker_free
      00ED93 7E               [ 7] 2113         ld      a,(hl)
      00ED94 32 CC E4         [13] 2114         ld      (0xe4cc),a
      00ED97 18 DA            [12] 2115         jr      m_ed73
      00ED99                       2116 erase_rest_of_line:
      00ED99 0E 01            [ 7] 2117         ld      c,#0x01
      00ED9B                       2118 m_ed9b:
      00ED9B 3A 6E E4         [13] 2119         ld      a,(0xe46e)
      00ED9E                       2120 m_ed9e:
      00ED9E F5               [11] 2121         push    af
      00ED9F CD B7 E9         [17] 2122         call    set_cursor_abs
      00EDA2 F1               [10] 2123         pop     af
      00EDA3                       2124 m_eda3:
      00EDA3 F5               [11] 2125         push    af
      00EDA4 3A 62 E4         [13] 2126         ld      a,(0xe462)
      00EDA7 3D               [ 4] 2127         dec     a
      00EDA8 47               [ 4] 2128         ld      b,a
      00EDA9 1E 20            [ 7] 2129         ld      e,#' '
      00EDAB F1               [10] 2130         pop     af
      00EDAC F5               [11] 2131         push    af
      00EDAD C5               [11] 2132         push    bc
      00EDAE E5               [11] 2133         push    hl
      00EDAF CD BA ED         [17] 2134         call    fill_cnt
      00EDB2 E1               [10] 2135         pop     hl
      00EDB3 11 00 08         [10] 2136         ld      de,#0x0800
      00EDB6 19               [11] 2137         add     hl,de
      00EDB7 5E               [ 7] 2138         ld      e,(hl)
      00EDB8 C1               [10] 2139         pop     bc
      00EDB9 F1               [10] 2140         pop     af
      00EDBA                       2141 fill_cnt:
      00EDBA F5               [11] 2142         push    af
      00EDBB C5               [11] 2143         push    bc
      00EDBC CD 27 EA         [17] 2144         call    wait_flicker_free_save_A
      00EDBF C1               [10] 2145         pop     bc
      00EDC0 F1               [10] 2146         pop     af
      00EDC1 73               [ 7] 2147         ld      (hl),e
      00EDC2 B8               [ 4] 2148         cp      b
      00EDC3 28 04            [12] 2149         jr      z,m_edc9
      00EDC5 23               [ 6] 2150         inc     hl
      00EDC6 3C               [ 4] 2151         inc     a
      00EDC7 18 F1            [12] 2152         jr      fill_cnt
      00EDC9                       2153 m_edc9:
      00EDC9 0D               [ 4] 2154         dec     c
      00EDCA C8               [11] 2155         ret     z
      00EDCB AF               [ 4] 2156         xor     a
      00EDCC 23               [ 6] 2157         inc     hl
      00EDCD 18 EB            [12] 2158         jr      fill_cnt
      00EDCF                       2159 erase_line:
      00EDCF 3A 6E E4         [13] 2160         ld      a,(0xe46e)
      00EDD2 5F               [ 4] 2161         ld      e,a
      00EDD3 16 00            [ 7] 2162         ld      d,#0x00
      00EDD5 B7               [ 4] 2163         or      a
      00EDD6 ED 52            [15] 2164         sbc     hl,de
      00EDD8 AF               [ 4] 2165         xor     a
      00EDD9 0E 01            [ 7] 2166         ld      c,#0x01
      00EDDB 18 C1            [12] 2167         jr      m_ed9e
      00EDDD                       2168 function_4a:
      00EDDD 3A 6D E4         [13] 2169         ld      a,(0xe46d)
      00EDE0 47               [ 4] 2170         ld      b,a
      00EDE1 3E 18            [ 7] 2171         ld      a,#0x18
      00EDE3 90               [ 4] 2172         sub     b
      00EDE4 4F               [ 4] 2173         ld      c,a
      00EDE5 18 B4            [12] 2174         jr      m_ed9b
      00EDE7                       2175 function_more_0c4:
      00EDE7 CD 11 EE         [17] 2176         call    m_ee11
      00EDEA D8               [11] 2177         ret     c
      00EDEB                       2178 m_edeb:
      00EDEB 23               [ 6] 2179         inc     hl
      00EDEC CD 28 EA         [17] 2180         call    wait_flicker_free
      00EDEF 7E               [ 7] 2181         ld      a,(hl)
      00EDF0 2B               [ 6] 2182         dec     hl
      00EDF1 77               [ 7] 2183         ld      (hl),a
      00EDF2 23               [ 6] 2184         inc     hl
      00EDF3 0D               [ 4] 2185         dec     c
      00EDF4 20 F5            [12] 2186         jr      nz,m_edeb
      00EDF6                       2187 m_edf6:
      00EDF6 CD 28 EA         [17] 2188         call    wait_flicker_free
      00EDF9 36 20            [10] 2189         ld      (hl),#' '
      00EDFB C9               [10] 2190         ret
      00EDFC                       2191 function_more_0c5:
      00EDFC CD 11 EE         [17] 2192         call    m_ee11
      00EDFF D8               [11] 2193         ret     c
      00EE00 5F               [ 4] 2194         ld      e,a
      00EE01 16 00            [ 7] 2195         ld      d,#0x00
      00EE03 19               [11] 2196         add     hl,de
      00EE04                       2197 m_ee04:
      00EE04 2B               [ 6] 2198         dec     hl
      00EE05 CD 28 EA         [17] 2199         call    wait_flicker_free
      00EE08 7E               [ 7] 2200         ld      a,(hl)
      00EE09 23               [ 6] 2201         inc     hl
      00EE0A 77               [ 7] 2202         ld      (hl),a
      00EE0B 2B               [ 6] 2203         dec     hl
      00EE0C 0D               [ 4] 2204         dec     c
      00EE0D 20 F5            [12] 2205         jr      nz,m_ee04
      00EE0F 18 E5            [12] 2206         jr      m_edf6
      00EE11                       2207 m_ee11:
      00EE11 CD B7 E9         [17] 2208         call    set_cursor_abs
      00EE14 3A 6E E4         [13] 2209         ld      a,(0xe46e)
      00EE17 4F               [ 4] 2210         ld      c,a
      00EE18 3A 62 E4         [13] 2211         ld      a,(0xe462)
      00EE1B 47               [ 4] 2212         ld      b,a
      00EE1C 3A 66 E4         [13] 2213         ld      a,(0xe466)
      00EE1F B8               [ 4] 2214         cp      b
      00EE20 30 06            [12] 2215         jr      nc,m_ee28
      00EE22 91               [ 4] 2216         sub     c
      00EE23 28 03            [12] 2217         jr      z,m_ee28
      00EE25 D8               [11] 2218         ret     c
      00EE26 4F               [ 4] 2219         ld      c,a
      00EE27 C9               [10] 2220         ret
      00EE28                       2221 m_ee28:
      00EE28 37               [ 4] 2222         scf
      00EE29 C9               [10] 2223         ret
      00EE2A                       2224 function_more_0c1:
      00EE2A CD B7 E9         [17] 2225         call    set_cursor_abs
      00EE2D 1E 20            [ 7] 2226         ld      e,#0x20
      00EE2F 3A 66 E4         [13] 2227         ld      a,(0xe466)
      00EE32                       2228 m_ee32:
      00EE32 B7               [ 4] 2229         or      a
      00EE33 C8               [11] 2230         ret     z
      00EE34 4F               [ 4] 2231         ld      c,a
      00EE35 3A 62 E4         [13] 2232         ld      a,(0xe462)
      00EE38 47               [ 4] 2233         ld      b,a
      00EE39 3A 6E E4         [13] 2234         ld      a,(0xe46e)
      00EE3C                       2235 m_ee3c:
      00EE3C CD 28 EA         [17] 2236         call    wait_flicker_free
      00EE3F 73               [ 7] 2237         ld      (hl),e
      00EE40 23               [ 6] 2238         inc     hl
      00EE41 3C               [ 4] 2239         inc     a
      00EE42 B8               [ 4] 2240         cp      b
      00EE43 28 07            [12] 2241         jr      z,m_ee4c
      00EE45                       2242 m_ee45:
      00EE45 0D               [ 4] 2243         dec     c
      00EE46 20 F4            [12] 2244         jr      nz,m_ee3c
      00EE48                       2245 m_ee48:
      00EE48 32 6E E4         [13] 2246         ld      (0xe46e),a
      00EE4B C9               [10] 2247         ret
      00EE4C                       2248 m_ee4c:
      00EE4C 16 18            [ 7] 2249         ld      d,#0x18
      00EE4E 3A 6D E4         [13] 2250         ld      a,(0xe46d)
      00EE51 3C               [ 4] 2251         inc     a
      00EE52 BA               [ 4] 2252         cp      d
      00EE53 28 06            [12] 2253         jr      z,m_ee5b
      00EE55 32 6D E4         [13] 2254         ld      (0xe46d),a
      00EE58 AF               [ 4] 2255         xor     a
      00EE59 18 EA            [12] 2256         jr      m_ee45
      00EE5B                       2257 m_ee5b:
      00EE5B 78               [ 4] 2258         ld      a,b
      00EE5C 3D               [ 4] 2259         dec     a
      00EE5D 18 E9            [12] 2260         jr      m_ee48
      00EE5F                       2261 function_more_0c3:
      00EE5F 3A 66 E4         [13] 2262         ld      a,(0xe466)
      00EE62 32 CE E4         [13] 2263         ld      (0xe4ce),a
      00EE65 C3 18 EC         [10] 2264         jp      graphic_mode_on
      00EE68                       2265 function_more_0c12:
      00EE68 CD B7 E9         [17] 2266         call    set_cursor_abs
      00EE6B 3A 66 E4         [13] 2267         ld      a,(0xe466)
      00EE6E 5F               [ 4] 2268         ld      e,a
      00EE6F 3A CE E4         [13] 2269         ld      a,(0xe4ce)
      00EE72 4F               [ 4] 2270         ld      c,a
      00EE73 18 BD            [12] 2271         jr      m_ee32
      00EE75                       2272 function_more_0c6:
      00EE75 CD 0F EA         [17] 2273         call    display_inhibit
      00EE78                       2274 m_ee78:
      00EE78 21 68 E4         [10] 2275         ld      hl,#cfg10_settings
      00EE7B 3A 66 E4         [13] 2276         ld      a,(0xe466)
      00EE7E FE 30            [ 7] 2277         cp      #0x30
      00EE80 28 06            [12] 2278         jr      z,m_ee88
      00EE82 FE 31            [ 7] 2279         cp      #0x31
      00EE84 28 0A            [12] 2280         jr      z,m_ee90
      00EE86 18 41            [12] 2281         jr      m_eec9
      00EE88                       2282 m_ee88:
      00EE88 CB 86            [15] 2283         res     0,(hl)
      00EE8A DD 21 CF EE      [14] 2284         ld      ix,#crt_table40
      00EE8E 18 06            [12] 2285         jr      m_ee96
      00EE90                       2286 m_ee90:
      00EE90 CB C6            [15] 2287         set     0,(hl)
      00EE92 DD 21 E1 EE      [14] 2288         ld      ix,#crt_table80
      00EE96                       2289 m_ee96:
      00EE96 DD 7E 01         [19] 2290         ld      a,1(ix)
      00EE99 32 62 E4         [13] 2291         ld      (column_count),a
      00EE9C DD 7E 06         [19] 2292         ld      a,6(ix)
      00EE9F 32 61 E4         [13] 2293         ld      (0xe461),a
      00EEA2 32 60 E4         [13] 2294         ld      (0xe460),a
      00EEA5 32 64 E4         [13] 2295         ld      (0xe464),a
      00EEA8 32 65 E4         [13] 2296         ld      (0xe465),a
      00EEAB DD 7E 0A         [19] 2297         ld      a,10(ix)
      00EEAE 32 70 E4         [13] 2298         ld      (cursor_start),a
      00EEB1 06 10            [ 7] 2299         ld      b,#crt_table40_size
      00EEB3 0E 00            [ 7] 2300         ld      c,#REG_0
      00EEB5                       2301 crt_write_reg:
      00EEB5 79               [ 4] 2302         ld      a,c
      00EEB6 D3 50            [11] 2303         out     (CRT_REG),a
      00EEB8 DD 7E 00         [19] 2304         ld      a,0(ix)
      00EEBB D3 51            [11] 2305         out     (CRT_DATA),a
      00EEBD 0C               [ 4] 2306         inc     c
      00EEBE DD 23            [10] 2307         inc     ix
      00EEC0 10 F3            [13] 2308         djnz    crt_write_reg
      00EEC2 AF               [ 4] 2309         xor     a
      00EEC3 32 63 E4         [13] 2310         ld      (0xe463),a
      00EEC6 CD E8 E9         [17] 2311         call    chr_clear_screen
      00EEC9                       2312 m_eec9:
      00EEC9 CD 1C EA         [17] 2313         call    m_ea1c
      00EECC C3 10 EC         [10] 2314         jp      m_ec10
      00EECF                       2315 crt_table40:
      00EECF 46 28 34 56 1E 02 18  2316         .db     0x46,0x28,0x34,0x56,0x1e,0x02,0x18,0x1b ;F(4V....
             1B
      00EED7 00 09 49 09 00 00 00  2317         .db     0x00,0x09,0x49,0x09,0x00,0x00,0x00,0x00 ;..I.....
             00
                                   2318 ; unchecked data source
      00EEDF 00 00                 2319         .db     0x00,0x00                               ;..
      00EEE1                       2320 crt_table80:
      00EEE1 7E 50 5F 5C 1E 04 18  2321         .db     0x7e,0x50,0x5f,0x5c,0x1e,0x04,0x18,0x1b ;~P_\....
             1B
      00EEE9 00 09 49 09 00 00 00  2322         .db     0x00,0x09,0x49,0x09,0x00,0x00,0x00,0x00 ;..I.....
             00
                                   2323 ; unchecked data source
      00EEF1 00 00 E6 00 00 00 00  2324         .db     0x00,0x00,0xe6,0x00,0x00,0x00,0x00,0x00 ;..f.....
             00
      00EEF9 00 00 00 00 00 00 00  2325         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xc9 ;.......I
             C9
      00EF01 EB 00 00 C9 D1 00 00  2326         .db     0xeb,0x00,0x00,0xc9,0xd1,0x00,0x00,0xc9 ;k..IQ..I
             C9
      00EF09 E1 00 00 C9 23 00 00  2327         .db     0xe1,0x00,0x00,0xc9,0x23,0x00,0x00,0xc9 ;a..I#..I
             C9
      00EF11 C4 00 00 C9 D1 00 00  2328         .db     0xc4,0x00,0x00,0xc9,0xd1,0x00,0x00,0xc9 ;D..IQ..I
             C9
      00EF19 D6 00 00 C9 3B 00 00  2329         .db     0xd6,0x00,0x00,0xc9,0x3b,0x00,0x00      ;V..I;..
      00EF20                       2330 patch_table_1:
      00EF20 46                    2331         .db     0x46                                    ;F
      00EF21 16 E9                 2332         .db     0x16,0xe9                               ;.i
      00EF23 40                    2333         .db     0x40                                    ;@
      00EF24 1C E9                 2334         .db     0x1c,0xe9                               ;.i
      00EF26 C2                    2335         .db     0xc2                                    ;B
      00EF27 62 E9                 2336         .db     0x62,0xe9                               ;bi
      00EF29 00                    2337         .db     0x00                                    ;.
      00EF2A                       2338 patch_table_2:
      00EF2A 33                    2339         .db     0x33                                    ;3
      00EF2B 16 E9                 2340         .db     0x16,0xe9                               ;.i
      00EF2D 46                    2341         .db     0x46                                    ;F
      00EF2E 1C E9                 2342         .db     0x1c,0xe9                               ;.i
      00EF30 BF                    2343         .db     0xbf                                    ;?
      00EF31 62 E9                 2344         .db     0x62,0xe9                               ;bi
      00EF33 00                    2345         .db     0x00                                    ;.
      00EF34                       2346 get_hex_digit:
      00EF34 CD F2 E3         [17] 2347         call    get_char_echoed
      00EF37 FE 30            [ 7] 2348         cp      #'0'
      00EF39 38 16            [12] 2349         jr      c,m_ef51
      00EF3B FE 3A            [ 7] 2350         cp      #'9'+1
      00EF3D 38 0E            [12] 2351         jr      c,m_ef4d
      00EF3F E6 5F            [ 7] 2352         and     #MASK_CAPITALIZE
      00EF41 FE 41            [ 7] 2353         cp      #'A'
      00EF43 38 0C            [12] 2354         jr      c,m_ef51
      00EF45 FE 47            [ 7] 2355         cp      #'F'+1
      00EF47 30 08            [12] 2356         jr      nc,m_ef51
      00EF49 D6 37            [ 7] 2357         sub     #0x37
      00EF4B                       2358 m_ef4b:
      00EF4B A7               [ 4] 2359         and     a
      00EF4C C9               [10] 2360         ret
      00EF4D                       2361 m_ef4d:
      00EF4D D6 30            [ 7] 2362         sub     #0x30
      00EF4F 18 FA            [12] 2363         jr      m_ef4b
      00EF51                       2364 m_ef51:
      00EF51 37               [ 4] 2365         scf
      00EF52 C9               [10] 2366         ret
      00EF53                       2367 get_hex_number:
      00EF53 E5               [11] 2368         push    hl
      00EF54 21 9D E4         [10] 2369         ld      hl,#param_word+1
      00EF57 AF               [ 4] 2370         xor     a
      00EF58 77               [ 7] 2371         ld      (hl),a
      00EF59 2B               [ 6] 2372         dec     hl
      00EF5A 77               [ 7] 2373         ld      (hl),a
      00EF5B                       2374 m_ef5b:
      00EF5B CD 34 EF         [17] 2375         call    get_hex_digit
      00EF5E 38 08            [12] 2376         jr      c,m_ef68
      00EF60 ED 6F            [18] 2377         rld
      00EF62 23               [ 6] 2378         inc     hl
      00EF63 ED 6F            [18] 2379         rld
      00EF65 2B               [ 6] 2380         dec     hl
      00EF66 18 F3            [12] 2381         jr      m_ef5b
      00EF68                       2382 m_ef68:
      00EF68 E1               [10] 2383         pop     hl
      00EF69 C9               [10] 2384         ret
      00EF6A                       2385 puts:
      00EF6A 7E               [ 7] 2386         ld      a,(hl)
      00EF6B B7               [ 4] 2387         or      a
      00EF6C C8               [11] 2388         ret     z
      00EF6D 4F               [ 4] 2389         ld      c,a
      00EF6E CD D5 E3         [17] 2390         call    put_char
      00EF71 23               [ 6] 2391         inc     hl
      00EF72 18 F6            [12] 2392         jr      puts
      00EF74                       2393 patch_os_functions:
      00EF74 3E 01            [ 7] 2394         ld      a,#0x01
      00EF76 32 D0 E4         [13] 2395         ld      (os_patch),a
      00EF79 3A D0 E4         [13] 2396         ld      a,(os_patch)
      00EF7C B7               [ 4] 2397         or      a
      00EF7D C8               [11] 2398         ret     z
      00EF7E 21 20 EF         [10] 2399         ld      hl,#patch_table_1
      00EF81                       2400 patch_rom_code:
      00EF81 7E               [ 7] 2401         ld      a,(hl)
      00EF82 B7               [ 4] 2402         or      a
      00EF83 C8               [11] 2403         ret     z
      00EF84 23               [ 6] 2404         inc     hl
      00EF85 5E               [ 7] 2405         ld      e,(hl)
      00EF86 23               [ 6] 2406         inc     hl
      00EF87 56               [ 7] 2407         ld      d,(hl)
      00EF88 12               [ 7] 2408         ld      (de),a
      00EF89 23               [ 6] 2409         inc     hl
      00EF8A 18 F5            [12] 2410         jr      patch_rom_code
      00EF8C                       2411 restore_os_functions:
      00EF8C 21 2A EF         [10] 2412         ld      hl,#0xef2a
      00EF8F 18 F0            [12] 2413         jr      patch_rom_code
      00EF91                       2414 wait_fdd_ready:
      00EF91 DB F0            [11] 2415         in      a,(UPD765_STATE)
      00EF93 CB 77            [ 8] 2416         bit     6,a
      00EF95 20 FA            [12] 2417         jr      nz,wait_fdd_ready
      00EF97 C9               [10] 2418         ret
      00EF98                       2419 fdd_available:
      00EF98 CD 0F EA         [17] 2420         call    display_inhibit
      00EF9B 21 69 E4         [10] 2421         ld      hl,#cfg20_settings
      00EF9E CB 9E            [15] 2422         res     3,(hl)
      00EFA0 7E               [ 7] 2423         ld      a,(hl)
      00EFA1 D3 20            [11] 2424         out     (CFG20),a
      00EFA3 C3 B2 F0         [10] 2425         jp      m_f0b2
      00EFA6                       2426 m_efa6:
      00EFA6 21 69 E4         [10] 2427         ld      hl,#cfg20_settings
      00EFA9 CB DE            [15] 2428         set     3,(hl)
      00EFAB 7E               [ 7] 2429         ld      a,(hl)
      00EFAC D3 20            [11] 2430         out     (CFG20),a
      00EFAE 21 68 E4         [10] 2431         ld      hl,#cfg10_settings
      00EFB1 CB FE            [15] 2432         set     7,(hl)
      00EFB3 7E               [ 7] 2433         ld      a,(hl)
      00EFB4 D3 10            [11] 2434         out     (CFG10),a
      00EFB6 3A 00 C2         [13] 2435         ld      a,(boot_sector)
      00EFB9 FE 16            [ 7] 2436         cp      #0x16
      00EFBB CC 74 EF         [17] 2437         call    z,patch_os_functions
      00EFBE C3 00 C2         [10] 2438         jp      boot_sector
      00EFC1                       2439 ENTRY:
      00EFC1 31 00 F0         [10] 2440         ld      sp,#stack_at_boot
      00EFC4 CD 0F EA         [17] 2441         call    display_inhibit
      00EFC7 21 69 E4         [10] 2442         ld      hl,#cfg20_settings
      00EFCA CB F6            [15] 2443         set     6,(hl)
      00EFCC 7E               [ 7] 2444         ld      a,(hl)
      00EFCD D3 20            [11] 2445         out     (CFG20),a
      00EFCF CD 10 F0         [17] 2446         call    m_f010
      00EFD2 C3 00 E0         [10] 2447         jp      m_e000
                                   2448 ; unchecked data source
      00EFD5 74 00 00 00 00 00 00  2449         .db     0x74,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;t.......
             00
      00EFDD 00 00 00 00 00 00 00  2450         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFE5 00 00 00 00 00 00 00  2451         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFED 00 00 00              2452         .db     0x00,0x00,0x00                          ;...
      00EFF0                       2453 boot::
      00EFF0 11 00 E0         [10] 2454         ld      de,#0xe000
      00EFF3 21 00 F0         [10] 2455         ld      hl,#0xf000
      00EFF6 01 FE 0F         [10] 2456         ld      bc,#0x0ffe
      00EFF9 ED B0            [21] 2457         ldir
      00EFFB C3 C1 EF         [10] 2458         jp      ENTRY
                                   2459 ; unchecked data source
      00EFFE 00 00 00 00 00 00 00  2460         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F006 00 00 00 00 00 00 00  2461         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F00E 00 00                 2462         .db     0x00,0x00                               ;..
      00F010                       2463 m_f010:
      00F010 CD 7E F0         [17] 2464         call    init_pic
      00F013 CD 2C EB         [17] 2465         call    init_serial
      00F016 CD 20 F0         [17] 2466         call    patch_printer_ptr
      00F019 CD 2C F0         [17] 2467         call    init_kbd_table
      00F01C CD 6D F0         [17] 2468         call    init_crt_param
      00F01F C9               [10] 2469         ret
      00F020                       2470 patch_printer_ptr:
      00F020 DB 10            [11] 2471         in      a,(STATUS10)
      00F022 CB 6F            [ 8] 2472         bit     5,a
      00F024 C8               [11] 2473         ret     z
      00F025 2A 37 E4         [16] 2474         ld      hl,(dev_serial_write_byte+1)
      00F028 22 3A E4         [16] 2475         ld      (dev_printer_write_byte+1),hl
      00F02B C9               [10] 2476         ret
      00F02C                       2477 init_kbd_table:
      00F02C DB 10            [11] 2478         in      a,(STATUS10)
      00F02E E6 1C            [ 7] 2479         and     #MASK_COUNTRY_SELECT
      00F030 C8               [11] 2480         ret     z
      00F031 1F               [ 4] 2481         rra
      00F032 1F               [ 4] 2482         rra
      00F033 E6 07            [ 7] 2483         and     #MASK_COUNTRY_BITS
      00F035 FE 01            [ 7] 2484         cp      #COUNTRY_DE
      00F037 CC 3A F1         [17] 2485         call    z,set_german_ascii_range
      00F03A FE 02            [ 7] 2486         cp      #COUNTRY_US
      00F03C CC 42 F1         [17] 2487         call    z,m_f142
      00F03F FE 03            [ 7] 2488         cp      #COUNTRY_FR
      00F041 CC 45 F1         [17] 2489         call    z,m_f145
      00F044 FE 04            [ 7] 2490         cp      #COUNTRY_UK
      00F046 CC 48 F1         [17] 2491         call    z,m_f148
      00F049 FE 05            [ 7] 2492         cp      #COUNTRY_IT
      00F04B CC 4B F1         [17] 2493         call    z,m_f14b
      00F04E FE 06            [ 7] 2494         cp      #COUNTRY_ES
      00F050 CC 4E F1         [17] 2495         call    z,m_f14e
      00F053 FE 07            [ 7] 2496         cp      #COUNTRY_07
      00F055 CC 51 F1         [17] 2497         call    z,m_f151
      00F058 11 C0 00         [10] 2498         ld      de,#kbd_table_de_size
      00F05B 21 00 F8         [10] 2499         ld      hl,#kbd_table_int
      00F05E                       2500 get_kbd_table_address:
      00F05E 3D               [ 4] 2501         dec     a
      00F05F 28 03            [12] 2502         jr      z,copy_kbd_table
      00F061 19               [11] 2503         add     hl,de
      00F062 18 FA            [12] 2504         jr      get_kbd_table_address
      00F064                       2505 copy_kbd_table:
      00F064 11 DD E4         [10] 2506         ld      de,#kbd_table_lookup
      00F067 01 C0 00         [10] 2507         ld      bc,#kbd_table_de_size
      00F06A ED B0            [21] 2508         ldir
      00F06C C9               [10] 2509         ret
      00F06D                       2510 init_crt_param:
      00F06D DB 10            [11] 2511         in      a,(STATUS10)
      00F06F CB 77            [ 8] 2512         bit     6,a
      00F071 C8               [11] 2513         ret     z
      00F072 21 40 FD         [10] 2514         ld      hl,#crt_table_ntsc
      00F075 11 CF EE         [10] 2515         ld      de,#crt_table40
      00F078 01 24 00         [10] 2516         ld      bc,#crt_table_ntsc_size
      00F07B ED B0            [21] 2517         ldir
      00F07D C9               [10] 2518         ret
      00F07E                       2519 init_pic:
      00F07E 3E 16            [ 7] 2520         ld      a,#0x16
      00F080 D3 70            [11] 2521         out     (PIC_ICW1),a
      00F082 3E EF            [ 7] 2522         ld      a,#0xef
      00F084 D3 71            [11] 2523         out     (PIC_ICW2),a
      00F086 3E FF            [ 7] 2524         ld      a,#0xff
      00F088 D3 71            [11] 2525         out     (0x71),a
      00F08A C9               [10] 2526         ret
      00F08B                       2527 fdc_cmd_init:
      00F08B 03 CF 1C 07 00        2528         .db     0x03,0xcf,0x1c,0x07,0x00                ;.O...
      00F090                       2529 fdc_cmd_read_boot:
      00F090 46 00 00 00 01 01 10  2530         .db     0x46,0x00,0x00,0x00,0x01,0x01,0x10,0x36 ;F......6
             36
      00F098 FF                    2531         .db     0xff                                    ;.
      00F099                       2532 fdc_write_byte_ix:
      00F099 DD 7E 00         [19] 2533         ld      a,0(ix)
      00F09C DD 23            [10] 2534         inc     ix
      00F09E                       2535 fdc_write_byte:
      00F09E F5               [11] 2536         push    af
      00F09F                       2537 m_f09f:
      00F09F DB F9            [11] 2538         in      a,(UPD765_MAIN_STATUS)
      00F0A1 CB 7F            [ 8] 2539         bit     7,a                                     ;RQM_Request_for_master
      00F0A3 28 FA            [12] 2540         jr      z,m_f09f
      00F0A5 F1               [10] 2541         pop     af
      00F0A6 D3 F8            [11] 2542         out     (UPD765_DATA),a
      00F0A8 C9               [10] 2543         ret
      00F0A9                       2544 fdc_read_byte:
      00F0A9 DB F9            [11] 2545         in      a,(UPD765_MAIN_STATUS)
      00F0AB C6 40            [ 7] 2546         add     a,#0x40
      00F0AD 30 FA            [12] 2547         jr      nc,fdc_read_byte
      00F0AF DB F8            [11] 2548         in      a,(UPD765_DATA)
      00F0B1 C9               [10] 2549         ret
      00F0B2                       2550 m_f0b2:
      00F0B2 AF               [ 4] 2551         xor     a
      00F0B3 D3 F0            [11] 2552         out     (FDC_UNIT),a
      00F0B5 11 00 C2         [10] 2553         ld      de,#boot_sector
      00F0B8 7B               [ 4] 2554         ld      a,e
      00F0B9 D3 64            [11] 2555         out     (0x64),a
      00F0BB 7A               [ 4] 2556         ld      a,d
      00F0BC D3 64            [11] 2557         out     (0x64),a
      00F0BE 3E FF            [ 7] 2558         ld      a,#0xff
      00F0C0 D3 F0            [11] 2559         out     (FDC_UNIT),a
      00F0C2 D3 F0            [11] 2560         out     (FDC_UNIT),a
      00F0C4 D3 65            [11] 2561         out     (0x65),a
      00F0C6 3E 40            [ 7] 2562         ld      a,#0x40
      00F0C8 D3 65            [11] 2563         out     (0x65),a
      00F0CA 21 40 9C         [10] 2564         ld      hl,#0x9c40
      00F0CD CD 7B E6         [17] 2565         call    delay
      00F0D0 21 40 9C         [10] 2566         ld      hl,#0x9c40
      00F0D3 CD 7B E6         [17] 2567         call    delay
      00F0D6 0E 05            [ 7] 2568         ld      c,#fdc_cmd_init_size
      00F0D8 DD 21 8B F0      [14] 2569         ld      ix,#fdc_cmd_init
      00F0DC                       2570 fdw_write_next_byte:
      00F0DC CD 99 F0         [17] 2571         call    fdc_write_byte_ix
      00F0DF 0D               [ 4] 2572         dec     c
      00F0E0 20 FA            [12] 2573         jr      nz,fdw_write_next_byte
      00F0E2 CD FD E3         [17] 2574         call    dev_fdd_wait_ready
      00F0E5                       2575 m_f0e5:
      00F0E5 3E 08            [ 7] 2576         ld      a,#FDC_CMD_SENSE_INTERRUPT_STATE
      00F0E7 CD 9E F0         [17] 2577         call    fdc_write_byte
      00F0EA CD A9 F0         [17] 2578         call    fdc_read_byte
      00F0ED FE 80            [ 7] 2579         cp      #0x80
      00F0EF 28 F4            [12] 2580         jr      z,m_f0e5
      00F0F1 CD A9 F0         [17] 2581         call    fdc_read_byte
      00F0F4 3E 44            [ 7] 2582         ld      a,#0x44
      00F0F6 D3 68            [11] 2583         out     (DMA_MODE_SET),a
      00F0F8 0E 09            [ 7] 2584         ld      c,#0x09
      00F0FA                       2585 m_f0fa:
      00F0FA CD 99 F0         [17] 2586         call    fdc_write_byte_ix
      00F0FD 0D               [ 4] 2587         dec     c
      00F0FE 20 FA            [12] 2588         jr      nz,m_f0fa
      00F100 CD FD E3         [17] 2589         call    dev_fdd_wait_ready
      00F103 CD A9 F0         [17] 2590         call    fdc_read_byte
      00F106 E6 C0            [ 7] 2591         and     #0xc0
      00F108 20 A8            [12] 2592         jr      nz,m_f0b2
      00F10A 0E 06            [ 7] 2593         ld      c,#0x06
      00F10C                       2594 m_f10c:
      00F10C CD A9 F0         [17] 2595         call    fdc_read_byte
      00F10F 0D               [ 4] 2596         dec     c
      00F110 20 FA            [12] 2597         jr      nz,m_f10c
      00F112 C3 A6 EF         [10] 2598         jp      m_efa6
      00F115                       2599 m_f115:
      00F115 21 64 FD         [10] 2600         ld      hl,#0xfd64
      00F118 11 25 E5         [10] 2601         ld      de,#0xe525
      00F11B 01 18 00         [10] 2602         ld      bc,#0x0018
      00F11E ED B0            [21] 2603         ldir
      00F120 11 85 E5         [10] 2604         ld      de,#0xe585
      00F123 01 18 00         [10] 2605         ld      bc,#0x0018
      00F126 ED B0            [21] 2606         ldir
      00F128 21 94 FD         [10] 2607         ld      hl,#0xfd94
      00F12B 11 67 E8         [10] 2608         ld      de,#0xe867
      00F12E 0E 08            [ 7] 2609         ld      c,#0x08
      00F130                       2610 m_f130:
      00F130 7E               [ 7] 2611         ld      a,(hl)
      00F131 12               [ 7] 2612         ld      (de),a
      00F132 23               [ 6] 2613         inc     hl
      00F133 13               [ 6] 2614         inc     de
      00F134 13               [ 6] 2615         inc     de
      00F135 13               [ 6] 2616         inc     de
      00F136 0D               [ 4] 2617         dec     c
      00F137 20 F7            [12] 2618         jr      nz,m_f130
      00F139 C9               [10] 2619         ret
      00F13A                       2620 set_german_ascii_range:
      00F13A F5               [11] 2621         push    af
      00F13B 3E 7E            [ 7] 2622         ld      a,#GERMAN_MAX_ASCII_CODE
      00F13D 32 50 E7         [13] 2623         ld      (opcode_compare+1),a
      00F140 F1               [10] 2624         pop     af
      00F141 C9               [10] 2625         ret
      00F142                       2626 m_f142:
      00F142 C9               [10] 2627         ret
                                   2628 ; unchecked data source
      00F143 00 00                 2629         .db     0x00,0x00                               ;..
      00F145                       2630 m_f145:
      00F145 C9               [10] 2631         ret
                                   2632 ; unchecked data source
      00F146 00 00                 2633         .db     0x00,0x00                               ;..
      00F148                       2634 m_f148:
      00F148 C9               [10] 2635         ret
                                   2636 ; unchecked data source
      00F149 00 00                 2637         .db     0x00,0x00                               ;..
      00F14B                       2638 m_f14b:
      00F14B C9               [10] 2639         ret
                                   2640 ; unchecked data source
      00F14C 00 00                 2641         .db     0x00,0x00                               ;..
      00F14E                       2642 m_f14e:
      00F14E C9               [10] 2643         ret
                                   2644 ; unchecked data source
      00F14F 00 00                 2645         .db     0x00,0x00                               ;..
      00F151                       2646 m_f151:
      00F151 C9               [10] 2647         ret
                                   2648 ; unchecked data source
      00F152 00 00 00 00 00 00 00  2649         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F15A 00 00 00 00 00 00 00  2650         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F162 00 00 00 00 00 00 00  2651         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F16A 00 00 00 00 00 00 00  2652         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F172 00 00 00 00 00 00 00  2653         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F17A 00 00 00 00 00 00 00  2654         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F182 00 00 00 00 00 00 00  2655         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F18A 00 00 00 00 00 00 00  2656         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F192 00 00 00 00 00 00 00  2657         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F19A 00 00 00 00 00 00 00  2658         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1A2 00 00 00 00 00 00 00  2659         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1AA 00 00 00 00 00 00 00  2660         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1B2 00 00 00 00 00 00 00  2661         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1BA 00 00 00 00 00 00 00  2662         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1C2 00 00 00 00 00 00 00  2663         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1CA 00 00 00 00 00 00 00  2664         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1D2 00 00 00 00 00 00 00  2665         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1DA 00 00 00 00 00 00 00  2666         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1E2 00 00 00 00 00 00 00  2667         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1EA 00 00 00 00 00 00 00  2668         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1F2 00 00 00 00 00 00 00  2669         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F1FA 00 00 00 00 00 00 00  2670         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F202 00 00 00 00 00 00 00  2671         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F20A 00 00 00 00 00 00 00  2672         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F212 00 00 00 00 00 00 00  2673         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F21A 00 00 00 00 00 00 00  2674         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F222 00 00 00 00 00 00 00  2675         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F22A 00 00 00 00 00 00 00  2676         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F232 00 00 00 00 00 00 00  2677         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F23A 00 00 00 00 00 00 00  2678         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F242 00 00 00 00 00 00 00  2679         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F24A 00 00 00 00 00 00 00  2680         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F252 00 00 00 00 00 00 00  2681         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F25A 00 00 00 00 00 00 00  2682         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F262 00 00 00 00 00 00 00  2683         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F26A 00 00 00 00 00 00 00  2684         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F272 00 00 00 00 00 00 00  2685         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F27A 00 00 00 00 00 00 00  2686         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F282 00 00 00 00 00 00 00  2687         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F28A 00 00 00 00 00 00 00  2688         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F292 00 00 00 00 00 00 00  2689         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F29A 00 00 00 00 00 00 00  2690         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2A2 00 00 00 00 00 00 00  2691         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2AA 00 00 00 00 00 00 00  2692         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2B2 00 00 00 00 00 00 00  2693         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2BA 00 00 00 00 00 00 00  2694         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2C2 00 00 00 00 00 00 00  2695         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2CA 00 00 00 00 00 00 00  2696         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2D2 00 00 00 00 00 00 00  2697         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2DA 00 00 00 00 00 00 00  2698         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2E2 00 00 00 00 00 00 00  2699         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2EA 00 00 00 00 00 00 00  2700         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2F2 00 00 00 00 00 00 00  2701         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F2FA 00 00 00 00 00 00 00  2702         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F302 00 00 00 00 00 00 00  2703         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F30A 00 00 00 00 00 00 00  2704         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F312 00 00 00 00 00 00 00  2705         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F31A 00 00 00 00 00 00 00  2706         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F322 00 00 00 00 00 00 00  2707         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F32A 00 00 00 00 00 00 00  2708         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F332 00 00 00 00 00 00 00  2709         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F33A 00 00 00 00 00 00 00  2710         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F342 00 00 00 00 00 00 00  2711         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F34A 00 00 00 00 00 00 00  2712         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F352 00 00 00 00 00 00 00  2713         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F35A 00 00 00 00 00 00 00  2714         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F362 00 00 00 00 00 00 00  2715         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F36A 00 00 00 00 00 00 00  2716         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F372 00 00 00 00 00 00 00  2717         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F37A 00 00 00 00 00 00 00  2718         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F382 00 00 00 00 00 00 00  2719         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F38A 00 00 00 00 00 00 00  2720         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F392 00 00 00 00 00 00 00  2721         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F39A 00 00 00 00 00 00 00  2722         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3A2 00 00 00 00 00 00 00  2723         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3AA 00 00 00 00 00 00 00  2724         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3B2 00 00 00 00 00 00 00  2725         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3BA 00 00 00 00 00 00 00  2726         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3C2 00 00 00 00 00 00 00  2727         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3CA 00 00 00 00 00 00 00  2728         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3D2 00 00 00 00 00 00 00  2729         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3DA 00 00 00 00 00 00 00  2730         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3E2 00 00 00 00 00 00 00  2731         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3EA 00 00 00 00 00 00 00  2732         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3F2 00 00 00 00 00 00 00  2733         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F3FA 00 00 00 00 00 00 00  2734         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F402 00 00 00 00 00 00 00  2735         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F40A 00 00 00 00 00 00 00  2736         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F412 00 00 00 00 00 00 00  2737         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F41A 00 00 00 00 00 00 00  2738         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F422 00 00 00 00 00 00 00  2739         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F42A 00 00 00 00 00 00 00  2740         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F432 00 00 00 00 00 00 00  2741         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F43A 00 00 00 00 00 00 00  2742         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F442 00 00 00 00 00 00 00  2743         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F44A 00 00 00 00 00 00 00  2744         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F452 00 00 00 00 00 00 00  2745         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F45A 00 00 00 00 00 00 00  2746         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F462 00 00 00 00 00 00 00  2747         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F46A 00 00 00 00 00 00 00  2748         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F472 00 00 00 00 00 00 00  2749         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F47A 00 00 00 00 00 00 00  2750         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F482 00 00 00 00 00 00 00  2751         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F48A 00 00 00 00 00 00 00  2752         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F492 00 00 00 00 00 00 00  2753         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F49A 00 00 00 00 00 00 00  2754         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4A2 00 00 00 00 00 00 00  2755         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4AA 00 00 00 00 00 00 00  2756         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4B2 00 00 00 00 00 00 00  2757         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4BA 00 00 00 00 00 00 00  2758         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4C2 00 00 00 00 00 00 00  2759         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4CA 00 00 00 00 00 00 00  2760         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4D2 00 00 00 00 00 00 00  2761         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4DA 00 00 00 00 00 00 00  2762         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4E2 00 00 00 00 00 00 00  2763         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4EA 00 00 00 00 00 00 00  2764         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4F2 00 00 00 00 00 00 00  2765         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F4FA 00 00 00 00 00 00 00  2766         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F502 00 00 00 00 00 00 00  2767         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F50A 00 00 00 00 00 00 00  2768         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F512 00 00 00 00 00 00 00  2769         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F51A 00 00 00 00 00 00 00  2770         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F522 00 00 00 00 00 00 00  2771         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F52A 00 00 00 00 00 00 00  2772         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F532 00 00 00 00 00 00 00  2773         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F53A 00 00 00 00 00 00 00  2774         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F542 00 00 00 00 00 00 00  2775         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F54A 00 00 00 00 00 00 00  2776         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F552 00 00 00 00 00 00 00  2777         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F55A 00 00 00 00 00 00 00  2778         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F562 00 00 00 00 00 00 00  2779         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F56A 00 00 00 00 00 00 00  2780         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F572 00 00 00 00 00 00 00  2781         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F57A 00 00 00 00 00 00 00  2782         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F582 00 00 00 00 00 00 00  2783         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F58A 00 00 00 00 00 00 00  2784         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F592 00 00 00 00 00 00 00  2785         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F59A 00 00 00 00 00 00 00  2786         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5A2 00 00 00 00 00 00 00  2787         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5AA 00 00 00 00 00 00 00  2788         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5B2 00 00 00 00 00 00 00  2789         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5BA 00 00 00 00 00 00 00  2790         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5C2 00 00 00 00 00 00 00  2791         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5CA 00 00 00 00 00 00 00  2792         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5D2 00 00 00 00 00 00 00  2793         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5DA 00 00 00 00 00 00 00  2794         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5E2 00 00 00 00 00 00 00  2795         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5EA 00 00 00 00 00 00 00  2796         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5F2 00 00 00 00 00 00 00  2797         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5FA 00 00 00 00 00 00 00  2798         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F602 00 00 00 00 00 00 00  2799         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F60A 00 00 00 00 00 00 00  2800         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F612 00 00 00 00 00 00 00  2801         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F61A 00 00 00 00 00 00 00  2802         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F622 00 00 00 00 00 00 00  2803         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F62A 00 00 00 00 00 00 00  2804         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F632 00 00 00 00 00 00 00  2805         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F63A 00 00 00 00 00 00 00  2806         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F642 00 00 00 00 00 00 00  2807         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F64A 00 00 00 00 00 00 00  2808         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F652 00 00 00 00 00 00 00  2809         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F65A 00 00 00 00 00 00 00  2810         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F662 00 00 00 00 00 00 00  2811         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F66A 00 00 00 00 00 00 00  2812         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F672 00 00 00 00 00 00 00  2813         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F67A 00 00 00 00 00 00 00  2814         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F682 00 00 00 00 00 00 00  2815         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F68A 00 00 00 00 00 00 00  2816         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F692 00 00 00 00 00 00 00  2817         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F69A 00 00 00 00 00 00 00  2818         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6A2 00 00 00 00 00 00 00  2819         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6AA 00 00 00 00 00 00 00  2820         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6B2 00 00 00 00 00 00 00  2821         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6BA 00 00 00 00 00 00 00  2822         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6C2 00 00 00 00 00 00 00  2823         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6CA 00 00 00 00 00 00 00  2824         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6D2 00 00 00 00 00 00 00  2825         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6DA 00 00 00 00 00 00 00  2826         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6E2 00 00 00 00 00 00 00  2827         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6EA 00 00 00 00 00 00 00  2828         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6F2 00 00 00 00 00 00 00  2829         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6FA 00 00 00 00 00 00 00  2830         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F702 00 00 00 00 00 00 00  2831         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F70A 00 00 00 00 00 00 00  2832         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F712 00 00 00 00 00 00 00  2833         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F71A 00 00 00 00 00 00 00  2834         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F722 00 00 00 00 00 00 00  2835         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F72A 00 00 00 00 00 00 00  2836         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F732 00 00 00 00 00 00 00  2837         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F73A 00 00 00 00 00 00 00  2838         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F742 00 00 00 00 00 00 00  2839         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F74A 00 00 00 00 00 00 00  2840         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F752 00 00 00 00 00 00 00  2841         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F75A 00 00 00 00 00 00 00  2842         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F762 00 00 00 00 00 00 00  2843         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F76A 00 00 00 00 00 00 00  2844         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F772 00 00 00 00 00 00 00  2845         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F77A 00 00 00 00 00 00 00  2846         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F782 00 00 00 00 00 00 00  2847         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F78A 00 00 00 00 00 00 00  2848         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F792 00 00 00 00 00 00 00  2849         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F79A 00 00 00 00 00 00 00  2850         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7A2 00 00 00 00 00 00 00  2851         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7AA 00 00 00 00 00 00 00  2852         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7B2 00 00 00 00 00 00 00  2853         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7BA 00 00 00 00 00 00 00  2854         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7C2 00 00 00 00 00 00 00  2855         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7CA 00 00 00 00 00 00 00  2856         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7D2 00 00 00 00 00 00 00  2857         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7DA 00 00 00 00 00 00 00  2858         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7E2 00 00 00 00 00 00 00  2859         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7EA 00 00 00 00 00 00 00  2860         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7F2 00 00 00 00 00 00 00  2861         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7FA 00 00 00 00 00 00     2862         .db     0x00,0x00,0x00,0x00,0x00,0x00           ;......
      00F800                       2863 kbd_table_int:
      00F800 30 31 32 33 34 35 36  2864         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F808 38 39 2E FF 2B 2D 3D  2865         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00F810 FF 61 62 63 64 65 66  2866         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00F818 68 69 6A 6B 6C 6D 6E  2867         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00F820 70 71 72 73 74 75 76  2868         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00F828 78 7A 79 FF FF FF FF  2869         .db     0x78,0x7a,0x79,0xff,0xff,0xff,0xff,0xff ;xzy.....
             FF
      00F830 30 31 32 33 34 35 36  2870         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F838 38 39 7E 27 7D 2B 23  2871         .db     0x38,0x39,0x7e,0x27,0x7d,0x2b,0x23,0x7b ;89~'}+#{
             7B
      00F840 FF FF 20 3C 2C 2E 2D  2872         .db     0xff,0xff,0x20,0x3c,0x2c,0x2e,0x2d,0x7c ;.. <,.-|
             7C
      00F848 1F 1C 1D 1E 9B FF 7F  2873         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00F850 FF 7F FF 09 0D DF 0B  2874         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00F858 FF FF 86 85 84 83 82  2875         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00F860                       2876 kbd_table_int_sh:
      00F860 E4 E2 EB E3 E8 E6 E9  2877         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00F868 EA E1 E5 FF 2A 2F E7  2878         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00F870 FF 41 42 43 44 45 46  2879         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00F878 48 49 4A 4B 4C 4D 4E  2880         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00F880 50 51 52 53 54 55 56  2881         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00F888 58 5A 59 FF FF FF FF  2882         .db     0x58,0x5a,0x59,0xff,0xff,0xff,0xff,0xff ;XZY.....
             FF
      00F890 3D 21 22 40 24 25 26  2883         .db     0x3d,0x21,0x22,0x40,0x24,0x25,0x26,0x2f ;=!"@$%&/
             2F
      00F898 28 29 3F 60 5D 2A 5E  2884         .db     0x28,0x29,0x3f,0x60,0x5d,0x2a,0x5e,0x5b ;()?`]*^[
             5B
      00F8A0 FF FF 20 3E 3B 3A 5F  2885         .db     0xff,0xff,0x20,0x3e,0x3b,0x3a,0x5f,0x5c ;.. >;:_\
             5C
      00F8A8 EC EF EE ED 9B FF 7F  2886         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00F8B0 FF 12 FF 09 0D DF 0C  2887         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00F8B8 FF FF 8C 8B 8A 89 88  2888         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00F8C0                       2889 kbd_table_de:
      00F8C0 30 31 32 33 34 35 36  2890         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F8C8 38 39 2E FF 2B 2D 3D  2891         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00F8D0 FF 61 62 63 64 65 66  2892         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00F8D8 68 69 6A 6B 6C 6D 6E  2893         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00F8E0 70 71 72 73 74 75 76  2894         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00F8E8 58 59 5A FF FF FF FF  2895         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00F8F0 30 31 32 33 34 35 36  2896         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F8F8 38 39 2D 5E 40 5B 5D  2897         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00F900 FF FF 20 5C 2C 2E 2F  2898         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00F908 1F 1C 1D 1E 9B FF 7F  2899         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00F910 FF 7F FF 09 0D DF 0B  2900         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00F918 FF FF 86 85 84 83 82  2901         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00F920 E4 E2 EB E3 E8 E6 E9  2902         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00F928 EA E1 E5 FF 2A 2F E7  2903         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00F930 FF 41 42 43 44 45 46  2904         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00F938 48 49 4A 4B 4C 4D 4E  2905         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00F940 50 51 52 53 54 55 56  2906         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00F948 58 59 5A FF FF FF FF  2907         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00F950 5F 21 22 23 24 25 26  2908         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00F958 28 29 3D 7E 60 7B 7D  2909         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00F960 FF FF 20 7C 3C 3E 3F  2910         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00F968 EC EF EE ED 9B FF 7F  2911         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00F970 FF 12 FF 09 0D DF 0C  2912         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00F978 FF FF 8C 8B 8A 89 88  2913         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00F980                       2914 kbd_table_us:
      00F980 30 31 32 33 34 35 36  2915         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F988 38 39 2E FF 2B 2D 3D  2916         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00F990 FF 71 62 63 64 65 66  2917         .db     0xff,0x71,0x62,0x63,0x64,0x65,0x66,0x67 ;.qbcdefg
             67
      00F998 68 69 6A 6B 6C 2C 6E  2918         .db     0x68,0x69,0x6a,0x6b,0x6c,0x2c,0x6e,0x6f ;hijkl,no
             6F
      00F9A0 70 61 72 73 74 75 76  2919         .db     0x70,0x61,0x72,0x73,0x74,0x75,0x76,0x7a ;parstuvz
             7A
      00F9A8 78 79 77 FF FF FF FF  2920         .db     0x78,0x79,0x77,0xff,0xff,0xff,0xff,0xff ;xyw.....
             FF
      00F9B0 30 31 32 33 34 35 36  2921         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F9B8 38 39 24 21 5E 26 23  2922         .db     0x38,0x39,0x24,0x21,0x5e,0x26,0x23,0x7c ;89$!^&#|
             7C
      00F9C0 FF FF 20 3C 2E 2F 3D  2923         .db     0xff,0xff,0x20,0x3c,0x2e,0x2f,0x3d,0x6d ;.. <./=m
             6D
      00F9C8 1F 1C 1D 1E 9B FF 7F  2924         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00F9D0 FF 7F FF 09 0D DF 0B  2925         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00F9D8 FF FF 86 85 84 83 82  2926         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00F9E0 E4 E2 EB E3 E8 E6 E9  2927         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00F9E8 EA E1 E5 FF 2A 2F E7  2928         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00F9F0 FF 51 42 43 44 45 46  2929         .db     0xff,0x51,0x42,0x43,0x44,0x45,0x46,0x47 ;.QBCDEFG
             47
      00F9F8 48 49 4A 4B 4C 3B 4E  2930         .db     0x48,0x49,0x4a,0x4b,0x4c,0x3b,0x4e,0x4f ;HIJKL;NO
             4F
      00FA00 50 41 52 53 54 55 56  2931         .db     0x50,0x41,0x52,0x53,0x54,0x55,0x56,0x5a ;PARSTUVZ
             5A
      00FA08 58 59 57 FF FF FF FF  2932         .db     0x58,0x59,0x57,0xff,0xff,0xff,0xff,0xff ;XYW.....
             FF
      00FA10 40 2A 7B 22 27 28 2D  2933         .db     0x40,0x2a,0x7b,0x22,0x27,0x28,0x2d,0x7d ;@*{"'(-}
             7D
      00FA18 5F 5C 29 5D 7E 60 2B  2934         .db     0x5f,0x5c,0x29,0x5d,0x7e,0x60,0x2b,0x25 ;_\)]~`+%
             25
      00FA20 FF FF 20 3E 3A 3F 5B  2935         .db     0xff,0xff,0x20,0x3e,0x3a,0x3f,0x5b,0x4d ;.. >:?[M
             4D
      00FA28 EC EF EE ED 9B FF 7F  2936         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FA30 FF 12 FF 09 0D DF 0C  2937         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FA38 FF FF 8C 8B 8A 89 88  2938         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FA40                       2939 kbd_table_fr:
      00FA40 30 31 32 33 34 35 36  2940         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FA48 38 39 2E FF 2B 2D 3D  2941         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FA50 FF 61 62 63 64 65 66  2942         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FA58 68 69 6A 6B 6C 6D 6E  2943         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00FA60 70 71 72 73 74 75 76  2944         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00FA68 78 79 7A FF FF FF FF  2945         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00FA70 30 31 32 33 34 35 36  2946         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FA78 38 39 2D 5E 40 5B 5D  2947         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00FA80 FF FF 20 3C 2C 2E 2F  2948         .db     0xff,0xff,0x20,0x3c,0x2c,0x2e,0x2f,0x3b ;.. <,./;
             3B
      00FA88 1F 1C 1D 1E 9B FF 7F  2949         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FA90 FF 7F FF 09 0D DF 0B  2950         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FA98 FF FF 86 85 84 83 82  2951         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FAA0 E4 E2 EB E3 E8 E6 E9  2952         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FAA8 EA E1 E5 FF 2A 2F E7  2953         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FAB0 FF 41 42 43 44 45 46  2954         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FAB8 48 49 4A 4B 4C 4D 4E  2955         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00FAC0 50 51 52 53 54 55 56  2956         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00FAC8 58 59 5A FF FF FF FF  2957         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00FAD0 3D 21 22 23 24 25 26  2958         .db     0x3d,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;=!"#$%&'
             27
      00FAD8 28 29 5F 7E 60 7B 7D  2959         .db     0x28,0x29,0x5f,0x7e,0x60,0x7b,0x7d,0x2a ;()_~`{}*
             2A
      00FAE0 FF FF 20 3E 5C 7C 3F  2960         .db     0xff,0xff,0x20,0x3e,0x5c,0x7c,0x3f,0x2b ;.. >\|?+
             2B
      00FAE8 EC EF EE ED 9B FF 7F  2961         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FAF0 FF 12 FF 09 0D DF 0C  2962         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FAF8 FF FF 8C 8B 8A 89 88  2963         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FB00                       2964 kbd_table_uk:
      00FB00 30 31 32 33 34 35 36  2965         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FB08 38 39 2E FF 2B 2D 3D  2966         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FB10 FF 61 62 63 64 65 66  2967         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FB18 68 69 6A 6B 6C 2C 6E  2968         .db     0x68,0x69,0x6a,0x6b,0x6c,0x2c,0x6e,0x6f ;hijkl,no
             6F
      00FB20 70 71 72 73 74 75 76  2969         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x7a ;pqrstuvz
             7A
      00FB28 78 79 77 FF FF FF FF  2970         .db     0x78,0x79,0x77,0xff,0xff,0xff,0xff,0xff ;xyw.....
             FF
      00FB30 30 31 32 33 34 35 36  2971         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FB38 38 39 24 5E 7E 26 23  2972         .db     0x38,0x39,0x24,0x5e,0x7e,0x26,0x23,0x7c ;89$^~&#|
             7C
      00FB40 FF FF 20 3C 2E 2F 5B  2973         .db     0xff,0xff,0x20,0x3c,0x2e,0x2f,0x5b,0x6d ;.. <./[m
             6D
      00FB48 1F 1C 1D 1E 9B FF 7F  2974         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FB50 FF 7F FF 09 0D DF 0B  2975         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FB58 FF FF 86 85 84 83 82  2976         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FB60 E4 E2 EB E3 E8 E6 E9  2977         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FB68 EA E1 E5 FF 2A 2F E7  2978         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FB70 FF 41 42 43 44 45 46  2979         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FB78 48 49 4A 4B 4C 3B 4E  2980         .db     0x48,0x49,0x4a,0x4b,0x4c,0x3b,0x4e,0x4f ;HIJKL;NO
             4F
      00FB80 50 51 52 53 54 55 56  2981         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x5a ;PQRSTUVZ
             5A
      00FB88 58 59 57 FF FF FF FF  2982         .db     0x58,0x59,0x57,0xff,0xff,0xff,0xff,0xff ;XYW.....
             FF
      00FB90 40 2A 7B 22 27 28 2D  2983         .db     0x40,0x2a,0x7b,0x22,0x27,0x28,0x2d,0x7d ;@*{"'(-}
             7D
      00FB98 5F 5C 29 5D 3D 60 2B  2984         .db     0x5f,0x5c,0x29,0x5d,0x3d,0x60,0x2b,0x25 ;_\)]=`+%
             25
      00FBA0 FF FF 20 3E 3A 3F 21  2985         .db     0xff,0xff,0x20,0x3e,0x3a,0x3f,0x21,0x4d ;.. >:?!M
             4D
      00FBA8 EC EF EE ED 9B FF 7F  2986         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FBB0 FF 12 FF 09 0D DF 0C  2987         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FBB8 FF FF 8C 8B 8A 89 88  2988         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FBC0                       2989 kbd_table_it:
      00FBC0 30 31 32 33 34 35 36  2990         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FBC8 38 39 2E FF 2B 2D 3D  2991         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FBD0 FF 61 62 63 64 65 66  2992         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FBD8 68 69 6A 6B 6C 6D 6E  2993         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00FBE0 70 71 72 73 74 75 76  2994         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00FBE8 78 79 7A FF FF FF FF  2995         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00FBF0 30 31 32 33 34 35 36  2996         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FBF8 38 39 2D 5E 40 5B 5D  2997         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00FC00 FF FF 20 5C 2C 2E 2F  2998         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00FC08 1F 1C 1D 1E 9B FF 7F  2999         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FC10 FF 7F FF 09 0D DF 0B  3000         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FC18 FF FF 86 85 84 83 82  3001         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FC20 E4 E2 EB E3 E8 E6 E9  3002         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FC28 EA E1 E5 FF 2A 2F E7  3003         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FC30 FF 41 42 43 44 45 46  3004         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FC38 48 49 4A 4B 4C 4D 4E  3005         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00FC40 50 51 52 53 54 55 56  3006         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00FC48 58 59 5A FF FF FF FF  3007         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00FC50 5F 21 22 23 24 25 26  3008         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00FC58 28 29 3D 7E 60 7B 7D  3009         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00FC60 FF FF 20 7C 3C 3E 3F  3010         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00FC68 EC EF EE ED 9B FF 7F  3011         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FC70 FF 12 FF 09 0D DF 0C  3012         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FC78 FF FF 8C 8B 8A 89 88  3013         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FC80                       3014 kbd_table_es:
      00FC80 30 31 32 33 34 35 36  3015         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FC88 38 39 2E FF 2B 2D 3D  3016         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FC90 FF 61 62 63 64 65 66  3017         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FC98 68 69 6A 6B 6C 6D 6E  3018         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00FCA0 70 71 72 73 74 75 76  3019         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00FCA8 78 79 7A FF FF FF FF  3020         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00FCB0 30 31 32 33 34 35 36  3021         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FCB8 38 39 2D 5E 40 5B 5D  3022         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00FCC0 FF FF 20 5C 2C 2E 2F  3023         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00FCC8 1F 1C 1D 1E 9B FF 7F  3024         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FCD0 FF 7F FF 09 0D DF 0B  3025         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FCD8 FF FF 86 85 84 83 82  3026         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FCE0 E4 E2 EB E3 E8 E6 E9  3027         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FCE8 EA E1 E5 FF 2A 2F E7  3028         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FCF0 FF 41 42 43 44 45 46  3029         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FCF8 48 49 4A 4B 4C 4D 4E  3030         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00FD00 50 51 52 53 54 55 56  3031         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00FD08 58 59 5A FF FF FF FF  3032         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00FD10 5F 21 22 23 24 25 26  3033         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00FD18 28 29 3D 7E 60 7B 7D  3034         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00FD20 FF FF 20 7C 3C 3E 3F  3035         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00FD28 EC EF EE ED 9B FF 7F  3036         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FD30 FF 12 FF 09 0D DF 0C  3037         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FD38 FF FF 8C 8B 8A 89 88  3038         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FD40                       3039 crt_table_ntsc:
      00FD40 38 28 2E 55 20 06 18  3040         .db     0x38,0x28,0x2e,0x55,0x20,0x06,0x18,0x1c ;8(.U ...
             1C
      00FD48 00 07 47 07 00 00 00  3041         .db     0x00,0x07,0x47,0x07,0x00,0x00,0x00,0x00 ;..G.....
             00
      00FD50 00 00 7E 50 5F 5C 1D  3042         .db     0x00,0x00,0x7e,0x50,0x5f,0x5c,0x1d,0x01 ;..~P_\..
             01
      00FD58 18 1A 00 08 48 08 00  3043         .db     0x18,0x1a,0x00,0x08,0x48,0x08,0x00,0x00 ;....H...
             00
      00FD60 00 00 00 00           3044         .db     0x00,0x00,0x00,0x00                     ;....
                                   3045 ; unchecked data source
      00FD64 8B 82 08 89 84 FF 7F  3046         .db     0x8b,0x82,0x08,0x89,0x84,0xff,0x7f,0x1b ;........
             1B
      00FD6C FF 96 FF 09 0D DF 8F  3047         .db     0xff,0x96,0xff,0x09,0x0d,0xdf,0x8f,0x03 ;....._..
             03
      00FD74 FF FF 8C 8A 88 87 86  3048         .db     0xff,0xff,0x8c,0x8a,0x88,0x87,0x86,0x85 ;........
             85
      00FD7C EC EF EE ED 84 FF 7F  3049         .db     0xec,0xef,0xee,0xed,0x84,0xff,0x7f,0x1b ;lonm....
             1B
      00FD84 FF 95 FF 09 0D DF 0C  3050         .db     0xff,0x95,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FD8C FF FF 80 94 93 92 91  3051         .db     0xff,0xff,0x80,0x94,0x93,0x92,0x91,0x90 ;........
             90
      00FD94 95 82 08 89 8B 96 1C  3052         .db     0x95,0x82,0x08,0x89,0x8b,0x96,0x1c,0x12 ;........
             12
      00FD9C 00 00 00 00 00 00 00  3053         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDA4 00 00 00 00 00 00 00  3054         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDAC 00 00 00 00 00 00 00  3055         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDB4 00 00 00 00 00 00 00  3056         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDBC 00 00 00 00 00 00 00  3057         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDC4 00 00 00 00 00 00 00  3058         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDCC 00 00 00 00 00 00 00  3059         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDD4 00 00 00 00 00 00 00  3060         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDDC 00 00 00 00 00 00 00  3061         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDE4 00 00 00 00 00 00 00  3062         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDEC 00 00 00 00 00 00 00  3063         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDF4 00 00 00 00 00 00 00  3064         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDFC 00 00 00 00 00 00 00  3065         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE04 00 00 00 00 00 00 00  3066         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE0C 00 00 00 00 00 00 00  3067         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE14 00 00 00 00 00 00 00  3068         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE1C 00 00 00 00 00 00 00  3069         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE24 00 00 00 00 00 00 00  3070         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE2C 00 00 00 00 00 00 00  3071         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE34 00 00 00 00 00 00 00  3072         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE3C 00 00 00 00 00 00 00  3073         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE44 00 00 00 00 00 00 00  3074         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE4C 00 00 00 00 00 00 00  3075         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE54 00 00 00 00 00 00 00  3076         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE5C 00 00 00 00 00 00 00  3077         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE64 00 00 00 00 00 00 00  3078         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE6C 00 00 00 00 00 00 00  3079         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE74 00 00 00 00 00 00 00  3080         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE7C 00 00 00 00 00 00 00  3081         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE84 00 00 00 00 00 00 00  3082         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE8C 00 00 00 00 00 00 00  3083         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE94 00 00 00 00 00 00 00  3084         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE9C 00 00 00 00 00 00 00  3085         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEA4 00 00 00 00 00 00 00  3086         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEAC 00 00 00 00 00 00 00  3087         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEB4 00 00 00 00 00 00 00  3088         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEBC 00 00 00 00 00 00 00  3089         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEC4 00 00 00 00 00 00 00  3090         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FECC 00 00 00 00 00 00 00  3091         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FED4 00 00 00 00 00 00 00  3092         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEDC 00 00 00 00 00 00 00  3093         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEE4 00 00 00 00 00 00 00  3094         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEEC 00 00 00 00 00 00 00  3095         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEF4 00 00 00 00 00 00 00  3096         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEFC 00 00 00 00 00 00 00  3097         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF04 00 00 00 00 00 00 00  3098         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF0C 00 00 00 00 00 00 00  3099         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF14 00 00 00 00 00 00 00  3100         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF1C 00 00 00 00 00 00 00  3101         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF24 00 00 00 00 00 00 00  3102         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF2C 00 00 00 00 00 00 00  3103         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF34 00 00 00 00 00 00 00  3104         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF3C 00 00 00 00 00 00 00  3105         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF44 00 00 00 00 00 00 00  3106         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF4C 00 00 00 00 00 00 00  3107         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF54 00 00 00 00 00 00 00  3108         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF5C 00 00 00 00 00 00 00  3109         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF64 00 00 00 00 00 00 00  3110         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF6C 00 00 00 00 00 00 00  3111         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF74 00 00 00 00 00 00 00  3112         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF7C 00 00 00 00 00 00 00  3113         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF84 00 00 00 00 00 00 00  3114         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF8C 00 00 00 00 00 00 00  3115         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF94 00 00 00 00 00 00 00  3116         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF9C 00 00 00 00 00 00 00  3117         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFA4 00 00 00 00 00 00 00  3118         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFAC 00 00 00 00 00 00 00  3119         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFB4 00 00 00 00 00 00 00  3120         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFBC 00 00 00 00 00 00 00  3121         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFC4 00 00 00 00 00 00 00  3122         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFCC 00 00 00 00 00 00 00  3123         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFD4 00 00 00 00 00 00 00  3124         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFDC 00 00 00 00 00 00 00  3125         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFE4 00 00 00 00 00 00 00  3126         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFEC 00 00 00 00 00 00 00  3127         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFF4 00 00 00 00 00 00 00  3128         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFFC 00 00 00 00           3129         .db     0x00,0x00,0x00,0x00                     ;....
                                   3130 ; end of source
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.                                                    =  002710 GL
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 GL
    .__.H$L.                                                    =  000000 GL
    BWS                                                         =  00F000 G
    CEN_DATA                                                    =  000030 G
    CEN_RESET                                                   =  000001 G
    CEN_STROBE                                                  =  000002 G
    CFG10                                                       =  000010 G
    CFG20                                                       =  000020 G
    CMT_MOTOR_START                                             =  000003 G
    CMT_RS232_SELECT                                            =  000002 G
    COUNTRY_07                                                  =  000007 G
    COUNTRY_DE                                                  =  000001 G
    COUNTRY_ES                                                  =  000006 G
    COUNTRY_FR                                                  =  000003 G
    COUNTRY_INTERNATIONAL                                       =  000000 G
    COUNTRY_IT                                                  =  000005 G
    COUNTRY_UK                                                  =  000004 G
    COUNTRY_US                                                  =  000002 G
    CRT_DATA                                                    =  000051 G
    CRT_REG                                                     =  000050 G
    CRT_RESET                                                   =  000000 G
    DIO_Data_input_output                                       =  000006 G
    DMA                                                         =  000060 G
    DMA_MODE_SET                                                =  000068 G
  0 ENTRY                                                          000FC1 GR
    FDC_CMD_SENSE_INTERRUPT_STATE                               =  000008 G
    FDC_UNIT                                                    =  0000F0 G
    GERMAN_MAX_ASCII_CODE                                       =  00007E G
    GLED                                                        =  000004 G
    HIGH_ZERO                                                   =  000000 G
    ID_IS_BASIC                                                 =  00007E G
    ID_JMP                                                      =  0000C3 G
    KBD_BREAK                                                   =  000007 G
    KBD_COLUMNS                                                 =  00000C G
    KBD_POSITION_COMMAND                                        =  00004D G
    KBD_POSITION_CTRL                                           =  00004F G
    KBD_POSITION_GRAPH                                          =  000056 G
    KBD_POSITION_SHIFT                                          =  000053 G
    KBD_POSITION_SHIFT_LOCK                                     =  00004E G
    MASK_CAPITALIZE                                             =  00005F G
    MASK_COUNTRY_BITS                                           =  000007 G
    MASK_COUNTRY_SELECT                                         =  00001C G
    MAX_ADDRESS                                                 =  00FFFF G
    MODIFIER_SHIFT                                              =  000001 G
    MONINH                                                      =  000003 G
    OFF                                                         =  000000 G
    OFFSET_COLOR                                                =  000800 G
    ON                                                          =  000001 G
    PIC_ICW1                                                    =  000070 G
    PIC_ICW2                                                    =  000071 G
    PIC_OCW1                                                    =  000071 G
    REG_0                                                       =  000000 G
    REG_14_CURSOR_H                                             =  00000E G
    REG_14_CURSOR_L                                             =  00000F G
    ROM_ACCESS_EN                                               =  000007 G
    ROM_PACK_16K                                                =  00A000 G
    ROM_PACK_8K                                                 =  00C000 G
    ROM_PACK_EN                                                 =  000006 G
    RQM_Request_for_master                                      =  000007 G
    SCREEN_HEIGHT                                               =  000018 G
    SLED                                                        =  000005 G
    STATUS10                                                    =  000010 G
    STATUS30                                                    =  000030 G
    STATUS_GLED                                                 =  000002 G
    STATUS_KBD                                                  =  000020 G
    STATUS_SLED                                                 =  000000 G
    TOGGLE_GLED                                                 =  000004 G
    TOGGLE_SLED                                                 =  000001 G
    UPD765_DATA                                                 =  0000F8 G
    UPD765_MAIN_STATUS                                          =  0000F9 G
    UPD765_STATE                                                =  0000F0 G
    UPPER_MONITOR_SEL                                           =  000006 G
    VK_DEL                                                      =  00007F G
    VK_DOWN                                                     =  00001F G
    VK_ENTER                                                    =  00000D G
    VK_ESC                                                      =  00001B G
    VK_LEFT                                                     =  00001D G
    VK_RIGHT                                                    =  00001C G
    VK_UP                                                       =  00001E G
    _BUZZER_ON                                                  =  000004 G
    _CEN_ACKNOWLEDGE                                            =  000002 G
    _CEN_BUSY                                                   =  000003 G
    _CRT80                                                      =  000001 G
    _CRT_DISPLAY                                                =  000007 G
    _CRT_NTSC                                                   =  000006 G
    _CRT_VSYNC_PERIOD                                           =  000001 G
    _DISPLAY_INHIBIT                                            =  000001 G
    _FDD_PRESENT                                                =  000000 G
    _GFX_AVAILABLE                                              =  000001 G
    _PRT_SERIAL                                                 =  000005 G
    _SIOC                                                       =  000000 G
  0 add_column_size                                                0009E3 GR
  0 alternate_keyboard_table                                       000CD1 GR
  0 asc_07                                                         000858 GR
  0 asc_08                                                         00085B GR
  0 asc_0a                                                         00085E GR
  0 asc_0c                                                         000861 GR
  0 asc_0d                                                         000864 GR
  0 asc_12                                                         000867 GR
  0 asc_1c                                                         00086A GR
  0 asc_1d                                                         00086D GR
  0 asc_1e                                                         000870 GR
  0 asc_1f                                                         000873 GR
  0 asc_7f                                                         000876 GR
  0 asc_99                                                         000879 GR
  0 asc_9a                                                         00087C GR
  0 attrib_color                                                   000467 GR
    basic_start                                                 =  00003B G
  0 beep_delay                                                     0004D2 GR
  0 boot                                                           000FF0 GR
    boot_sector                                                 =  00C200 G
  0 buzzer_on                                                      000A96 GR
  0 calc_column_offset                                             0009DE GR
  0 cfg10_settings                                                 000468 GR
  0 cfg20_settings                                                 000469 GR
  0 chr_03                                                         000891 GR
  0 chr_12                                                         000894 GR
  0 chr_7f                                                         000897 GR
  0 chr_backspace                                                  000A74 GR
  0 chr_beep                                                       000A7E GR
  0 chr_carrige_return                                             000909 GR
  0 chr_clear_screen                                               0009E8 GR
  0 chr_cursor_down                                                000A5F GR
  0 chr_cursor_left                                                000A35 GR
  0 chr_cursor_right                                               000A50 GR
  0 chr_cursor_up                                                  000A44 GR
  0 chr_inverse_off                                                00089A GR
  0 chr_inverse_on                                                 0008A0 GR
  0 chr_line_feed                                                  000880 GR
  0 clear_kbd_modifiers                                            00064B GR
  0 cmp_kbd_entry                                                  0005FE GR
    cold_start                                                  =  000000 G
  0 column_count                                                   000462 GR
  0 com_read_byte                                                  000AF6 GR
  0 com_rx_ready                                                   000B10 GR
  0 com_tx_ready                                                   000AE3 GR
  0 com_write_byte                                                 000AEC GR
  0 copy_kbd_table                                                 001064 GR
  0 crt_set_cursor                                                 000931 GR
  0 crt_set_cursor_at_row_start                                    00098C GR
  0 crt_table40                                                    000ECF GR
    crt_table40_size                                            =  000010 G
  0 crt_table80                                                    000EE1 GR
    crt_table80_size                                            =  000010 G
  0 crt_table_ntsc                                                 001D40 GR
    crt_table_ntsc_size                                         =  000024 G
  0 crt_write_reg                                                  000EB5 GR
  0 cursor_abs                                                     000490 GR
  0 cursor_abs_color                                               000492 GR
  0 cursor_column                                                  00046E GR
  0 cursor_row                                                     00046D GR
  0 cursor_row_adjusted                                            000A69 GR
  0 cursor_start                                                   000470 GR
  0 decrement_kbd_debounce_cnt                                     000641 GR
  0 delay                                                          00067B GR
  0 dev_fdd_wait_ready                                             0003FD GR
  0 dev_kbd_inkey                                                  00040F GR
  0 dev_kbd_status                                                 00040C GR
  0 dev_monitor                                                    000400 GR
  0 dev_printer_write_byte                                         000439 GR
  0 dev_serial_read_byte                                           000406 GR
  0 dev_serial_ready                                               000403 GR
  0 dev_serial_tx_ready                                            000433 GR
  0 dev_serial_write_byte                                          000436 GR
  0 display_inhibit                                                000A0F GR
  0 display_status_set                                             000A21 GR
  0 enable_protocol_printer                                        000257 GR
  0 erase_line                                                     000DCF GR
  0 erase_rest_of_line                                             000D99 GR
  0 fdc_cmd_init                                                   00108B GR
    fdc_cmd_init_size                                           =  000005 G
  0 fdc_cmd_read_boot                                              001090 GR
    fdc_cmd_read_boot_size                                      =  000009 G
  0 fdc_read_byte                                                  0010A9 GR
  0 fdc_write_byte                                                 00109E GR
  0 fdc_write_byte_ix                                              001099 GR
  0 fdd_available                                                  000F98 GR
  0 fdw_write_next_byte                                            0010DC GR
  0 fill_cnt                                                       000DBA GR
  0 function_0c                                                    000C13 GR
  0 function_4a                                                    000DDD GR
  0 function_more_0c0                                              000CE1 GR
  0 function_more_0c1                                              000E2A GR
  0 function_more_0c10                                             000D1B GR
  0 function_more_0c11                                             000D65 GR
  0 function_more_0c12                                             000E68 GR
  0 function_more_0c13                                             000CED GR
  0 function_more_0c14                                             000D0E GR
  0 function_more_0c15                                             000C3D GR
  0 function_more_0c17                                             000D42 GR
  0 function_more_0c2                                              000D35 GR
  0 function_more_0c3                                              000E5F GR
  0 function_more_0c4                                              000DE7 GR
  0 function_more_0c5                                              000DFC GR
  0 function_more_0c6                                              000E75 GR
  0 function_more_0c7                                              000C34 GR
  0 function_more_0c9                                              000C6A GR
  0 get_char_echoed                                                0003F2 GR
  0 get_cursor_abs                                                 0009CC GR
  0 get_cursor_pos                                                 000CA6 GR
  0 get_hex_digit                                                  000F34 GR
  0 get_hex_number                                                 000F53 GR
  0 get_kbd_table_address                                          00105E GR
  0 go_basic                                                       000045 GR
  0 go_monitor                                                     000060 GR
  0 graphic_mode_on                                                000C18 GR
    id_basic                                                    =  000008 G
  0 init_crt_param                                                 00106D GR
  0 init_kbd_table                                                 00102C GR
  0 init_pic                                                       00107E GR
  0 init_serial                                                    000B2C GR
  0 is_vsync                                                       000A16 GR
  0 just_go_back                                                   00027D GR
  0 kbd_ascii                                                      00048F GR
  0 kbd_buffer_check_colum                                         00068C GR
  0 kbd_buffer_clear                                               0005A3 GR
  0 kbd_buffer_clear_beep                                          00059D GR
  0 kbd_copy_state                                                 00066E GR
  0 kbd_debounce_cnt                                               000471 GR
  0 kbd_matrix_buffer                                              000472 GR
  0 kbd_matrix_buffer2                                             00047E GR
    kbd_matrix_buffer2_size                                     =  00000C G
    kbd_matrix_buffer_size                                      =  00000C G
  0 kbd_modifiers                                                  00048B GR
  0 kbd_position                                                   00048E GR
  0 kbd_scan_columns                                               000672 GR
  0 kbd_table_de                                                   0018C0 GR
    kbd_table_de_size                                           =  0000C0 G
  0 kbd_table_es                                                   001C80 GR
    kbd_table_es_size                                           =  0000C0 G
  0 kbd_table_fr                                                   001A40 GR
    kbd_table_fr_size                                           =  0000C0 G
  0 kbd_table_int                                                  001800 GR
  0 kbd_table_int_sh                                               001860 GR
    kbd_table_int_sh_size                                       =  000060 G
    kbd_table_int_size                                          =  000060 G
  0 kbd_table_it                                                   001BC0 GR
    kbd_table_it_size                                           =  0000C0 G
  0 kbd_table_lookup                                               0004DD GR
    kbd_table_lookup_size                                       =  0000C0 G
  0 kbd_table_uk                                                   001B00 GR
    kbd_table_uk_size                                           =  0000C0 G
  0 kbd_table_us                                                   001980 GR
    kbd_table_us_size                                           =  0000C0 G
  0 key_code                                                       000498 GR
  0 key_found                                                      000C2A GR
  0 led_status                                                     00046F GR
  0 lpt_busy                                                       000AB5 GR
  0 lpt_write_byte                                                 000AC2 GR
  0 m_e000                                                         000000 GR
  0 m_e06d                                                         00006D GR
  0 m_e07f                                                         00007F GR
  0 m_e089                                                         000089 GR
  0 m_e0cd                                                         0000CD GR
  0 m_e0d0                                                         0000D0 GR
  0 m_e0db                                                         0000DB GR
  0 m_e0e3                                                         0000E3 GR
  0 m_e0ec                                                         0000EC GR
  0 m_e14e                                                         00014E GR
  0 m_e157                                                         000157 GR
  0 m_e15e                                                         00015E GR
  0 m_e16c                                                         00016C GR
  0 m_e178                                                         000178 GR
  0 m_e19c                                                         00019C GR
  0 m_e1a9                                                         0001A9 GR
  0 m_e1c9                                                         0001C9 GR
  0 m_e1ea                                                         0001EA GR
  0 m_e21d                                                         00021D GR
  0 m_e22e                                                         00022E GR
  0 m_e262                                                         000262 GR
  0 m_e269                                                         000269 GR
  0 m_e282                                                         000282 GR
  0 m_e299                                                         000299 GR
  0 m_e2a7                                                         0002A7 GR
  0 m_e2b6                                                         0002B6 GR
  0 m_e2c3                                                         0002C3 GR
  0 m_e2d0                                                         0002D0 GR
  0 m_e2d5                                                         0002D5 GR
  0 m_e2dc                                                         0002DC GR
  0 m_e38d                                                         00038D GR
  0 m_e393                                                         000393 GR
  0 m_e398                                                         000398 GR
  0 m_e39c                                                         00039C GR
  0 m_e3ab                                                         0003AB GR
  0 m_e3b2                                                         0003B2 GR
  0 m_e3ba                                                         0003BA GR
  0 m_e3bb                                                         0003BB GR
  0 m_e3bf                                                         0003BF GR
  0 m_e3d0                                                         0003D0 GR
  0 m_e3e0                                                         0003E0 GR
  0 m_e445                                                         000445 GR
  0 m_e5b1                                                         0005B1 GR
  0 m_e5ca                                                         0005CA GR
  0 m_e5d5                                                         0005D5 GR
  0 m_e5e1                                                         0005E1 GR
  0 m_e5e3                                                         0005E3 GR
  0 m_e5e7                                                         0005E7 GR
  0 m_e647                                                         000647 GR
  0 m_e64f                                                         00064F GR
  0 m_e656                                                         000656 GR
  0 m_e664                                                         000664 GR
  0 m_e66a                                                         00066A GR
  0 m_e682                                                         000682 GR
  0 m_e696                                                         000696 GR
  0 m_e69d                                                         00069D GR
  0 m_e6a0                                                         0006A0 GR
  0 m_e6a8                                                         0006A8 GR
  0 m_e6ae                                                         0006AE GR
  0 m_e6c3                                                         0006C3 GR
  0 m_e6d4                                                         0006D4 GR
  0 m_e6ec                                                         0006EC GR
  0 m_e6f6                                                         0006F6 GR
  0 m_e6ff                                                         0006FF GR
  0 m_e70f                                                         00070F GR
  0 m_e729                                                         000729 GR
  0 m_e72c                                                         00072C GR
  0 m_e739                                                         000739 GR
  0 m_e762                                                         000762 GR
  0 m_e765                                                         000765 GR
  0 m_e77a                                                         00077A GR
  0 m_e794                                                         000794 GR
  0 m_e799                                                         000799 GR
  0 m_e7a2                                                         0007A2 GR
  0 m_e7a8                                                         0007A8 GR
  0 m_e7ac                                                         0007AC GR
  0 m_e7cc                                                         0007CC GR
  0 m_e7d8                                                         0007D8 GR
  0 m_e7dc                                                         0007DC GR
  0 m_e7df                                                         0007DF GR
  0 m_e7e7                                                         0007E7 GR
  0 m_e7ef                                                         0007EF GR
  0 m_e808                                                         000808 GR
  0 m_e80d                                                         00080D GR
  0 m_e817                                                         000817 GR
  0 m_e81e                                                         00081E GR
  0 m_e823                                                         000823 GR
  0 m_e828                                                         000828 GR
  0 m_e835                                                         000835 GR
  0 m_e83c                                                         00083C GR
  0 m_e83f                                                         00083F GR
  0 m_e84c                                                         00084C GR
  0 m_e8a6                                                         0008A6 GR
  0 m_e8ab                                                         0008AB GR
  0 m_e8b7                                                         0008B7 GR
  0 m_e8bb                                                         0008BB GR
  0 m_e8bf                                                         0008BF GR
  0 m_e8d2                                                         0008D2 GR
  0 m_e8d6                                                         0008D6 GR
  0 m_e8e5                                                         0008E5 GR
  0 m_e8e8                                                         0008E8 GR
  0 m_e8ec                                                         0008EC GR
  0 m_e8fa                                                         0008FA GR
  0 m_e922                                                         000922 GR
  0 m_e925                                                         000925 GR
  0 m_e92e                                                         00092E GR
  0 m_e947                                                         000947 GR
  0 m_e94a                                                         00094A GR
  0 m_e95d                                                         00095D GR
  0 m_e963                                                         000963 GR
  0 m_e97d                                                         00097D GR
  0 m_e999                                                         000999 GR
  0 m_e9ed                                                         0009ED GR
  0 m_ea1c                                                         000A1C GR
  0 m_ea2e                                                         000A2E GR
  0 m_ea6c                                                         000A6C GR
  0 m_ea6f                                                         000A6F GR
  0 m_ea8f                                                         000A8F GR
  0 m_ea91                                                         000A91 GR
  0 m_ea9e                                                         000A9E GR
  0 m_eaa4                                                         000AA4 GR
  0 m_ead6                                                         000AD6 GR
  0 m_eadd                                                         000ADD GR
  0 m_eaf2                                                         000AF2 GR
  0 m_eaff                                                         000AFF GR
  0 m_eb08                                                         000B08 GR
  0 m_eb0d                                                         000B0D GR
  0 m_eb44                                                         000B44 GR
  0 m_ebe3                                                         000BE3 GR
  0 m_ebfb                                                         000BFB GR
  0 m_ec03                                                         000C03 GR
  0 m_ec10                                                         000C10 GR
  0 m_ec14                                                         000C14 GR
  0 m_ec4e                                                         000C4E GR
  0 m_ec83                                                         000C83 GR
  0 m_ec93                                                         000C93 GR
  0 m_ecc3                                                         000CC3 GR
  0 m_eccb                                                         000CCB GR
  0 m_ecd6                                                         000CD6 GR
  0 m_ecf1                                                         000CF1 GR
  0 m_ed07                                                         000D07 GR
  0 m_ed28                                                         000D28 GR
  0 m_ed2e                                                         000D2E GR
  0 m_ed31                                                         000D31 GR
  0 m_ed49                                                         000D49 GR
  0 m_ed52                                                         000D52 GR
  0 m_ed5e                                                         000D5E GR
  0 m_ed61                                                         000D61 GR
  0 m_ed73                                                         000D73 GR
  0 m_ed9b                                                         000D9B GR
  0 m_ed9e                                                         000D9E GR
  0 m_eda3                                                         000DA3 GR
  0 m_edc9                                                         000DC9 GR
  0 m_edeb                                                         000DEB GR
  0 m_edf6                                                         000DF6 GR
  0 m_ee04                                                         000E04 GR
  0 m_ee11                                                         000E11 GR
  0 m_ee28                                                         000E28 GR
  0 m_ee32                                                         000E32 GR
  0 m_ee3c                                                         000E3C GR
  0 m_ee45                                                         000E45 GR
  0 m_ee48                                                         000E48 GR
  0 m_ee4c                                                         000E4C GR
  0 m_ee5b                                                         000E5B GR
  0 m_ee78                                                         000E78 GR
  0 m_ee88                                                         000E88 GR
  0 m_ee90                                                         000E90 GR
  0 m_ee96                                                         000E96 GR
  0 m_eec9                                                         000EC9 GR
  0 m_ef4b                                                         000F4B GR
  0 m_ef4d                                                         000F4D GR
  0 m_ef51                                                         000F51 GR
  0 m_ef5b                                                         000F5B GR
  0 m_ef68                                                         000F68 GR
  0 m_efa6                                                         000FA6 GR
  0 m_f010                                                         001010 GR
  0 m_f09f                                                         00109F GR
  0 m_f0b2                                                         0010B2 GR
  0 m_f0e5                                                         0010E5 GR
  0 m_f0fa                                                         0010FA GR
  0 m_f10c                                                         00110C GR
  0 m_f115                                                         001115 GR
  0 m_f130                                                         001130 GR
  0 m_f142                                                         001142 GR
  0 m_f145                                                         001145 GR
  0 m_f148                                                         001148 GR
  0 m_f14b                                                         00114B GR
  0 m_f14e                                                         00114E GR
  0 m_f151                                                         001151 GR
  0 map_C_to_PTR                                                   000C1F GR
  0 map_ch_0c                                                      000B54 GR
  0 map_ch_10                                                      000B57 GR
  0 map_ch_11                                                      000B5A GR
  0 map_ch_12                                                      000B5D GR
  0 map_ch_13                                                      000B60 GR
  0 map_ch_16                                                      000B63 GR
  0 map_ch_17                                                      000B66 GR
  0 map_ch_18                                                      000B69 GR
  0 map_ch_19                                                      000B6C GR
  0 map_ch_1a                                                      000B6F GR
  0 map_ch_1c                                                      000B72 GR
  0 map_ch_1d                                                      000B75 GR
  0 map_ch_31                                                      000B78 GR
  0 map_ch_41                                                      000B7B GR
  0 map_ch_42                                                      000B7E GR
  0 map_ch_43                                                      000B81 GR
  0 map_ch_44                                                      000B84 GR
  0 map_ch_45                                                      000B87 GR
  0 map_ch_46                                                      000B8A GR
  0 map_ch_47                                                      000B8D GR
  0 map_ch_48                                                      000B90 GR
  0 map_ch_49                                                      000B93 GR
  0 map_ch_4a                                                      000B96 GR
  0 map_ch_4b                                                      000B99 GR
  0 map_ch_53                                                      000B9C GR
  0 map_ch_54                                                      000B9F GR
  0 map_ch_55                                                      000BA2 GR
  0 map_ch_56                                                      000BA5 GR
  0 map_ch_59                                                      000BA8 GR
  0 map_ch_end                                                     000BAB GR
  0 map_ch_more1                                                   000BAF GR
  0 map_ch_more10                                                  000BCA GR
  0 map_ch_more11                                                  000BCD GR
  0 map_ch_more12                                                  000BD0 GR
  0 map_ch_more13                                                  000BD3 GR
  0 map_ch_more14                                                  000BD6 GR
  0 map_ch_more15                                                  000BD9 GR
  0 map_ch_more16                                                  000BDC GR
  0 map_ch_more17                                                  000BDF GR
  0 map_ch_more2                                                   000BB2 GR
  0 map_ch_more3                                                   000BB5 GR
  0 map_ch_more4                                                   000BB8 GR
  0 map_ch_more5                                                   000BBB GR
  0 map_ch_more6                                                   000BBE GR
  0 map_ch_more7                                                   000BC1 GR
  0 map_ch_more8                                                   000BC4 GR
  0 map_ch_more9                                                   000BC7 GR
  0 map_esc_list                                                   000B51 GR
  0 map_more_codes                                                 000BAC GR
  0 map_more_codes_end                                             000BE2 GR
  0 modify_if_graphic_B                                            00071A GR
  0 monitor_cmd_loop                                               00008C GR
  0 monitor_cmd_mem_move                                           0000F2 GR
  0 non_char_printable                                             0002C1 GR
  0 op_return                                                      0001E6 GR
  0 opcode_compare                                                 00074F GR
  0 os_patch                                                       0004D0 GR
  0 param_1                                                        00049E GR
  0 param_2                                                        0004A0 GR
  0 param_3                                                        0004A2 GR
  0 param_word                                                     00049C GR
  0 patch_os_functions                                             000F74 GR
  0 patch_printer_ptr                                              001020 GR
  0 patch_rom_code                                                 000F81 GR
  0 patch_table_1                                                  000F20 GR
  0 patch_table_2                                                  000F2A GR
  0 print_new_line                                                 0003C3 GR
  0 print_space                                                    0003CD GR
  0 printer_protocol_flag                                          0004B6 GR
  0 put_char                                                       0003D5 GR
  0 puts                                                           000F6A GR
  0 read_character                                                 000D88 GR
  0 restore_os_functions                                           000F8C GR
  0 return_to_basic                                                000270 GR
  0 rst38_vec                                                      0001E7 GR
    rst_38                                                      =  000038 G
  0 save_stack                                                     0004C6 GR
  0 scan_is_stable                                                 000609 GR
  0 set_cfg10                                                      000B39 GR
  0 set_cursor_abs                                                 0009B7 GR
  0 set_cursor_home                                                0009FF GR
  0 set_cursor_off                                                 000C91 GR
  0 set_cursor_on                                                  000C8D GR
  0 set_german_ascii_range                                         00113A GR
  0 set_kbd_debounce_cnt                                           00065F GR
  0 set_kbd_modifiers                                              0006E7 GR
  0 set_kbd_shift_lock                                             0006E2 GR
  0 special_characters                                             000855 GR
    stack_at_boot                                               =  00F000 G
  0 str_area_over                                                  000328 GR
    str_area_over_size                                          =  000010 G
  0 str_break_at                                                   000353 GR
    str_break_at_size                                           =  00000D G
  0 str_completed                                                  00031A GR
    str_completed_size                                          =  00000E G
  0 str_memory                                                     00030C GR
    str_memory_size                                             =  00000E G
  0 str_monitor                                                    0002E9 GR
    str_monitor_size                                            =  000023 G
  0 str_print_off                                                  000338 GR
    str_print_off_size                                          =  00000E G
  0 str_print_on                                                   000346 GR
    str_print_on_size                                           =  00000D G
  0 str_reg                                                        000360 GR
    str_reg_size                                                =  00002D G
  0 unreferenced                                                   000758 GR
  0 unreferenced_02                                                0002E3 GR
  0 unreferenced_03                                                0004D4 GR
  0 unreferenced_04                                                0004D7 GR
  0 unreferenced_05                                                0004DA GR
  0 unreferenced_06                                                000B1D GR
  0 unreferenced_07                                                000B3F GR
  0 unreferenced_08                                                000B4A GR
  0 wait_fdd_ready                                                 000F91 GR
  0 wait_flicker_free                                              000A28 GR
  0 wait_flicker_free_save_A                                       000A27 GR
  0 wait_vsync                                                     000A09 GR
  0 write_character                                                000D6A GR


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size   2000   flags    0


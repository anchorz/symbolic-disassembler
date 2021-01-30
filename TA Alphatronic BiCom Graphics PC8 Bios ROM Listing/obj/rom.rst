                                      1 ; source : tapcgv2_ic1038.bicom.bin
                                      2 ; created: 2021-01-30 13:27:36
                                      3 ; by     : Jayne
                                      4 ; md5    : 1f8bedb609bba5b511182a4509fa345b
                                      5 ; 
                                      6 ; constant
                                      7 ; 
                           000007     8 FG_WHITE                         = 0x07
                           000000     9 BG_BLACK                         = 0x00
                           000007    10 ATTR_INVERS                      = 0x07
                           000006    11 ATTR_BLINK                       = 0x06
                           0000C0    12 MASK_ATTR                        = 0xc0
                           000030    13 ESC_53_CRT40                     = 0x30
                           000031    14 ESC_53_CRT80                     = 0x31
                           000007    15 ESC_0C_CLS                       = 0x07
                           000006    16 ESC_0C_FB_SAME_COLOR             = 0x06
                           000002    17 ESC_0C_CTRL_INTERNAL             = 0x02
                           000003    18 ESC_0C_COMMAND_KEY               = 0x03
                           000000    19 ESC_0C_SCROLL_MODE               = 0x00
                           000001    20 MASK_ESC_0C_SCROLL_MODE          = 0x01
                           000000    21 HIGH_ZERO                        = 0x00
                           000001    22 ON                               = 0x01
                           000001    23 TOGGLE_SLED                      = 0x01
                           000000    24 STATUS_SLED                      = 0x00
                           000004    25 TOGGLE_GLED                      = 0x04
                           000080    26 INPUT_MODE_GRAPH                 = 0x80
                           0000B1    27 INPUT_MODE_B1                    = 0xb1
                           000032    28 INPUT_MODE_32                    = 0x32
                           000002    29 STATUS_GLED                      = 0x02
                           000000    30 OFF                              = 0x00
                           000000    31 REG_0                            = 0x00
                           00000A    32 REG_10_CURSOR_START              = 0x0a
                           000020    33 CURSOR_INVISIBLE                 = 0x20
                           000040    34 CURSOR_BLINK_SLOW                = 0x40
                           00001F    35 MASK_CURSOR_LINE                 = 0x1f
                           00000E    36 REG_14_CURSOR_H                  = 0x0e
                           00000F    37 REG_14_CURSOR_L                  = 0x0f
                           000003    38 BICOM_GFX                        = 0x03
                           000010    39 CFG10                            = 0x10
                           000007    40 ROM_ACCESS_EN                    = 0x07
                           000006    41 ROM_PACK_EN                      = 0x06
                           000005    42 MUST_BE_ZERO                     = 0x05
                           000004    43 _BUZZER_ON                       = 0x04
                           000003    44 CMT_MOTOR_START                  = 0x03
                           000002    45 CMT_RS232_SELECT                 = 0x02
                           000001    46 _DISPLAY_INHIBIT                 = 0x01
                           000000    47 _CRT80                           = 0x00
                           000018    48 MASK_WIDTH_40_80                 = 0x18
                           000010    49 STATUS10                         = 0x10
                           000007    50 _CRT_DISPLAY                     = 0x07
                           000006    51 _CRT_NTSC                        = 0x06
                           000005    52 _PRT_SERIAL                      = 0x05
                           000001    53 _GFX_AVAILABLE                   = 0x01
                           000000    54 _FDD_PRESENT                     = 0x00
                           00001C    55 MASK_COUNTRY_SELECT              = 0x1c
                           000007    56 MASK_COUNTRY_BITS                = 0x07
                           000000    57 COUNTRY_INTERNATIONAL            = 0x00
                           000001    58 COUNTRY_DE                       = 0x01
                           000002    59 COUNTRY_US                       = 0x02
                           000003    60 COUNTRY_FR                       = 0x03
                           000004    61 COUNTRY_UK                       = 0x04
                           000005    62 COUNTRY_IT                       = 0x05
                           000006    63 COUNTRY_ES                       = 0x06
                           000007    64 COUNTRY_07                       = 0x07
                           000020    65 CFG20                            = 0x20
                           000000    66 CRT_RESET                        = 0x00
                           000001    67 CEN_RESET                        = 0x01
                           000002    68 CEN_STROBE                       = 0x02
                           000003    69 MONINH                           = 0x03
                           000004    70 GLED                             = 0x04
                           000005    71 SLED                             = 0x05
                           000006    72 UPPER_MONITOR_SEL                = 0x06
                           000020    73 STATUS_KBD                       = 0x20
                           00000C    74 KBD_COLUMNS                      = 0x0c
                           000049    75 KBD_POSITION_LEFT                = 0x49
                           00004F    76 KBD_POSITION_CTRL                = 0x4f
                           000053    77 KBD_POSITION_SHIFT               = 0x53
                           00004E    78 KBD_POSITION_SHIFT_LOCK          = 0x4e
                           00004D    79 KBD_POSITION_COMMAND             = 0x4d
                           000056    80 KBD_POSITION_GRAPH               = 0x56
                           000007    81 KBD_BREAK                        = 0x07
                           000001    82 MODIFIER_SHIFT                   = 0x01
                           000000    83 KBD_MOD_SHIFT                    = 0x00
                           000002    84 KBD_MOD_CTRL                     = 0x02
                           000030    85 STATUS30                         = 0x30
                           000030    86 CEN_DATA                         = 0x30
                           000000    87 _SIOC                            = 0x00
                           000001    88 _CRT_VSYNC_PERIOD                = 0x01
                           000002    89 _CEN_ACKNOWLEDGE                 = 0x02
                           000003    90 _CEN_BUSY                        = 0x03
                           000041    91 UART_CONTROL                     = 0x41
                           000050    92 CRT_REG                          = 0x50
                           000051    93 CRT_DATA                         = 0x51
                           000060    94 DMA                              = 0x60
                           000068    95 DMA_MODE_SET                     = 0x68
                           000070    96 PIC_ICW1                         = 0x70
                           000071    97 PIC_ICW2                         = 0x71
                           000071    98 PIC_OCW1                         = 0x71
                           000008    99 FDC_CMD_SENSE_INTERRUPT_STATE    = 0x08
                           0000F0   100 FDC_UNIT                         = 0xf0
                           0000F0   101 UPD765_STATE                     = 0xf0
                           0000F8   102 UPD765_DATA                      = 0xf8
                           0000F9   103 UPD765_MAIN_STATUS               = 0xf9
                           000007   104 RQM_Request_for_master           = 0x07
                           000006   105 DIO_Data_input_output            = 0x06
                           0000C3   106 ID_JMP                           = 0xc3
                           00007E   107 ID_IS_BASIC                      = 0x7e
                           000016   108 ID_IS_BOOT                       = 0x16
                           000018   109 SCREEN_HEIGHT                    = 0x18
                           00000D   110 VK_ENTER                         = 0x0d
                           00000A   111 VK_NL                            = 0x0a
                           00001B   112 VK_ESC                           = 0x1b
                           00001D   113 VK_LEFT                          = 0x1d
                           00001C   114 VK_RIGHT                         = 0x1c
                           00001E   115 VK_UP                            = 0x1e
                           00001F   116 VK_DOWN                          = 0x1f
                           00007F   117 VK_DEL                           = 0x7f
                           00007E   118 GERMAN_MAX_ASCII_CODE            = 0x7e
                           00005F   119 MASK_CAPITALIZE                  = 0x5f
                                    120 
                           00C200   121 boot_sector                      = 0xc200
                           000000   122 cold_start                       = 0x0000
                           000008   123 id_basic                         = 0x0008
                           000038   124 rst_38                           = 0x0038
                           00003B   125 basic_start                      = 0x003b
                           00F000   126 BWS                              = 0xf000
                           00F000   127 stack_at_boot                    = 0xf000
                           000800   128 OFFSET_COLOR                     = 0x0800
                           00A000   129 ROM_PACK_16K                     = 0xa000
                           00C000   130 ROM_PACK_8K                      = 0xc000
                           00FFFF   131 MAX_ADDRESS                      = 0xffff
                           000108   132 BICOM_HEIGHT                     = 0x0108
                           0003E8   133 DELAY_7MS                        = 0x03e8
                           0005DC   134 DELAY_11MS                       = 0x05dc
                           000BB8   135 DELAY_22MS                       = 0x0bb8
                           000010   136 sprintf_buffer_size              = 0x0010
                           000018   137 str_monitor_size                 = 0x0018
                           00000A   138 str_ready_size                   = 0x000a
                           00000A   139 str_error_size                   = 0x000a
                           00000E   140 str_print_off_size               = 0x000e
                           00000D   141 str_print_on_size                = 0x000d
                           00000D   142 str_break_at_size                = 0x000d
                           00002D   143 str_reg_size                     = 0x002d
                           00000C   144 kbd_matrix_buffer_size           = 0x000c
                           00000C   145 kbd_matrix_buffer2_size          = 0x000c
                           0000C0   146 kbd_table_lookup_size            = 0x00c0
                           000010   147 crt_table40_size                 = 0x0010
                           000010   148 crt_table80_size                 = 0x0010
                           000005   149 fdc_cmd_init_size                = 0x0005
                           000009   150 fdc_cmd_read_boot_size           = 0x0009
                           000060   151 kbd_table_int_size               = 0x0060
                           000060   152 kbd_table_int_sh_size            = 0x0060
                           0000C0   153 kbd_table_de_size                = 0x00c0
                           0000C0   154 kbd_table_us_size                = 0x00c0
                           0000C0   155 kbd_table_fr_size                = 0x00c0
                           0000C0   156 kbd_table_uk_size                = 0x00c0
                           0000C0   157 kbd_table_it_size                = 0x00c0
                           0000C0   158 kbd_table_es_size                = 0x00c0
                           000010   159 version_size                     = 0x0010
                           000024   160 crt_table_ntsc_size              = 0x0024
                           000018   161 kbc_cpm_control_keys_size        = 0x0018
                           000018   162 kbc_cpm_control_keys_shift_size  = 0x0018
                           000008   163 cpm_special_character_mods_size  = 0x0008
                           000010   164 bicom_glp1_prt_gfx_size          = 0x0010
                           000010   165 bicom_glp2_prt_2nd_line_size     = 0x0010
                           000010   166 bicom_glp3_prt_crlf_size         = 0x0010
                           000010   167 bicom_glp4_prt_ld_size           = 0x0010
                           000010   168 bicom_glp5_prt_ld_size           = 0x0010
                                    169 ;
                                    170 ;
                                    171 ;
      00E000                        172 boot_strap:
      00E000 21 69 E4         [10]  173         ld      hl,#cfg20_settings
      00E003 CB DE            [15]  174         set     3,(hl)                                  ;MONINH=1
      00E005 7E               [ 7]  175         ld      a,(hl)
      00E006 D3 20            [11]  176         out     (CFG20),a
      00E008 CD 9D E5         [17]  177         call    kbd_buffer_clear_beep
      00E00B 21 68 E4         [10]  178         ld      hl,#cfg10_settings
      00E00E CB F6            [15]  179         set     6,(hl)                                  ;ROM_PACK_EN=1
      00E010 7E               [ 7]  180         ld      a,(hl)
      00E011 D3 10            [11]  181         out     (CFG10),a
      00E013 3A 00 A0         [13]  182         ld      a,(ROM_PACK_16K)
      00E016 FE C3            [ 7]  183         cp      #ID_JMP
      00E018 CA 00 A0         [10]  184         jp      z,ROM_PACK_16K
      00E01B 3A 00 C0         [13]  185         ld      a,(ROM_PACK_8K)
      00E01E FE C3            [ 7]  186         cp      #ID_JMP
      00E020 CA 00 C0         [10]  187         jp      z,ROM_PACK_8K
      00E023 21 68 E4         [10]  188         ld      hl,#cfg10_settings
      00E026 CB B6            [15]  189         res     6,(hl)                                  ;ROM_PACK_EN=0
      00E028 7E               [ 7]  190         ld      a,(hl)
      00E029 D3 10            [11]  191         out     (CFG10),a
      00E02B DB 10            [11]  192         in      a,(STATUS10)
      00E02D 1F               [ 4]  193         rra
      00E02E 30 09            [12]  194         jr      nc,_mf
      00E030 CD 13 EA         [17]  195         call    display_inhibit
      00E033 CD A3 EF         [17]  196         call    rom_enable
      00E036 C3 B5 F0         [10]  197         jp      fdc_read_boot_sector
      00E039                        198 _mf:
      00E039 CD 42 E2         [17]  199         call    prepare_basic
      00E03C CA 3B 00         [10]  200         jp      z,basic_start
      00E03F CD 55 E0         [17]  201         call    rom_disable
      00E042 18 1C            [12]  202         jr      go_monitor
      00E044                        203 ram_boot:
      00E044 CD 96 EF         [17]  204         call    monitor_inhibit
      00E047 CD 55 E0         [17]  205         call    rom_disable
      00E04A 3A 00 C2         [13]  206         ld      a,(boot_sector)
      00E04D FE 16            [ 7]  207         cp      #ID_IS_BOOT
      00E04F CC D1 E3         [17]  208         call    z,patch_os_functions
      00E052 C3 00 C2         [10]  209         jp      boot_sector
      00E055                        210 rom_disable:
      00E055 21 68 E4         [10]  211         ld      hl,#cfg10_settings
      00E058 CB FE            [15]  212         set     7,(hl)                                  ;ROM_ACCESS_EN=1
      00E05A 7E               [ 7]  213         ld      a,(hl)
      00E05B D3 10            [11]  214         out     (CFG10),a
      00E05D C9               [10]  215         ret
                                    216 ; unchecked data source
      00E05E 00 00                  217         .db     0x00,0x00                               ;..
      00E060                        218 go_monitor:
      00E060 ED 73 C6 E4      [20]  219         ld      (save_stack),sp
      00E064 31 00 F0         [10]  220         ld      sp,#stack_at_boot
      00E067 CD E7 E3         [17]  221         call    restore_os_functions
      00E06A 21 AC E2         [10]  222         ld      hl,#str_monitor
      00E06D CD 24 E1         [17]  223         call    puts
      00E070                        224 monitor_cmd_loop:
      00E070 21 70 E0         [10]  225         ld      hl,#monitor_cmd_loop
      00E073 E5               [11]  226         push    hl
      00E074 CD 5F E3         [17]  227         call    print_new_line
      00E077 0E 2A            [ 7]  228         ld      c,#'*'
      00E079 CD 71 E3         [17]  229         call    put_char
      00E07C CD 8E E3         [17]  230         call    get_char_echoed
      00E07F E6 5F            [ 7]  231         and     #MASK_CAPITALIZE
      00E081 FE 45            [ 7]  232         cp      #'E'
      00E083 CA 35 E2         [10]  233         jp      z,return_to_basic
      00E086 FE 50            [ 7]  234         cp      #'P'
      00E088 CA 1C E2         [10]  235         jp      z,enable_protocol_printer
      00E08B FE 4D            [ 7]  236         cp      #'M'
      00E08D 28 40            [12]  237         jr      z,monitor_cmd_mem_move
      00E08F FE 44            [ 7]  238         cp      #'D'
      00E091 CA 3E E1         [10]  239         jp      z,monitor_cmd_display
      00E094 FE 47            [ 7]  240         cp      #'G'
      00E096 CA 8C E1         [10]  241         jp      z,monitor_cmd_go
      00E099 FE 52            [ 7]  242         cp      #'R'
      00E09B CA DD E1         [10]  243         jp      z,monitor_cmd_reg
      00E09E FE 43            [ 7]  244         cp      #'C'
      00E0A0 C0               [11]  245         ret     nz
      00E0A1 CD B7 E3         [17]  246         call    get_hex_number_sp
      00E0A4 FE 0D            [ 7]  247         cp      #VK_ENTER
      00E0A6 C0               [11]  248         ret     nz
      00E0A7 2A 9C E4         [16]  249         ld      hl,(param_word)
      00E0AA                        250 byte_change:
      00E0AA CD 15 E2         [17]  251         call    print_nl_hx16
      00E0AD                        252 _m11:
      00E0AD E5               [11]  253         push    hl
      00E0AE CD 47 E3         [17]  254         call    out_sphx8_minus
      00E0B1 CD 7C E3         [17]  255         call    input_hex_byte
      00E0B4 E1               [10]  256         pop     hl
      00E0B5 38 09            [12]  257         jr      c,_err3
      00E0B7 77               [ 7]  258         ld      (hl),a
      00E0B8                        259 _m10:
      00E0B8 23               [ 6]  260         inc     hl
      00E0B9 7D               [ 4]  261         ld      a,l
      00E0BA E6 07            [ 7]  262         and     #0x07
      00E0BC 20 EF            [12]  263         jr      nz,_m11
      00E0BE 18 EA            [12]  264         jr      byte_change
      00E0C0                        265 _err3:
      00E0C0 FE 20            [ 7]  266         cp      #' '
      00E0C2 20 05            [12]  267         jr      nz,test_decrement_key
      00E0C4 CD 69 E3         [17]  268         call    print_space
      00E0C7 18 EF            [12]  269         jr      _m10
      00E0C9                        270 test_decrement_key:
      00E0C9 FE 2D            [ 7]  271         cp      #'-'
      00E0CB C0               [11]  272         ret     nz
      00E0CC 2B               [ 6]  273         dec     hl
      00E0CD 18 DB            [12]  274         jr      byte_change
      00E0CF                        275 monitor_cmd_mem_move:
      00E0CF CD B7 E3         [17]  276         call    get_hex_number_sp
      00E0D2 FE 2C            [ 7]  277         cp      #','
      00E0D4 C0               [11]  278         ret     nz
      00E0D5 2A 9C E4         [16]  279         ld      hl,(param_word)
      00E0D8 22 9E E4         [16]  280         ld      (param_1),hl
      00E0DB CD BA E3         [17]  281         call    get_hex_number
      00E0DE FE 2C            [ 7]  282         cp      #','
      00E0E0 C0               [11]  283         ret     nz
      00E0E1 2A 9E E4         [16]  284         ld      hl,(param_1)
      00E0E4 EB               [ 4]  285         ex      de,hl
      00E0E5 2A 9C E4         [16]  286         ld      hl,(param_word)
      00E0E8 22 A0 E4         [16]  287         ld      (param_2),hl
      00E0EB B7               [ 4]  288         or      a
      00E0EC ED 52            [15]  289         sbc     hl,de
      00E0EE D8               [11]  290         ret     c
      00E0EF 23               [ 6]  291         inc     hl
      00E0F0 22 A2 E4         [16]  292         ld      (param_3),hl
      00E0F3 CD BA E3         [17]  293         call    get_hex_number
      00E0F6 FE 0D            [ 7]  294         cp      #VK_ENTER
      00E0F8 C0               [11]  295         ret     nz
      00E0F9 2A A2 E4         [16]  296         ld      hl,(param_3)
      00E0FC 2B               [ 6]  297         dec     hl
      00E0FD EB               [ 4]  298         ex      de,hl
      00E0FE 2A 9C E4         [16]  299         ld      hl,(param_word)
      00E101 B7               [ 4]  300         or      a
      00E102 ED 5A            [15]  301         adc     hl,de
      00E104 38 31            [12]  302         jr      c,_err_area_overlap
      00E106 E5               [11]  303         push    hl
      00E107 2A 9E E4         [16]  304         ld      hl,(param_1)
      00E10A EB               [ 4]  305         ex      de,hl
      00E10B 2A 9C E4         [16]  306         ld      hl,(param_word)
      00E10E B7               [ 4]  307         or      a
      00E10F ED 52            [15]  308         sbc     hl,de
      00E111 ED 4B A2 E4      [20]  309         ld      bc,(param_3)
      00E115 38 17            [12]  310         jr      c,_continue_ldir
      00E117 D1               [10]  311         pop     de
      00E118 7C               [ 4]  312         ld      a,h
      00E119 B5               [ 4]  313         or      l
      00E11A 28 05            [12]  314         jr      z,ready_msg_after_ldir
      00E11C 2A A0 E4         [16]  315         ld      hl,(param_2)
      00E11F ED B8            [21]  316         lddr
      00E121                        317 ready_msg_after_ldir:
      00E121 21 C4 E2         [10]  318         ld      hl,#str_ready
      00E124                        319 puts:
      00E124 7E               [ 7]  320         ld      a,(hl)
      00E125 B7               [ 4]  321         or      a
      00E126 C8               [11]  322         ret     z
      00E127 4F               [ 4]  323         ld      c,a
      00E128 CD 71 E3         [17]  324         call    put_char
      00E12B 23               [ 6]  325         inc     hl
      00E12C 18 F6            [12]  326         jr      puts
      00E12E                        327 _continue_ldir:
      00E12E 2A 9C E4         [16]  328         ld      hl,(param_word)
      00E131 EB               [ 4]  329         ex      de,hl
      00E132 ED B0            [21]  330         ldir
      00E134 D1               [10]  331         pop     de
      00E135 18 EA            [12]  332         jr      ready_msg_after_ldir
      00E137                        333 _err_area_overlap:
      00E137 21 CE E2         [10]  334         ld      hl,#str_error
      00E13A CD 24 E1         [17]  335         call    puts
      00E13D C9               [10]  336         ret
      00E13E                        337 monitor_cmd_display:
      00E13E CD B7 E3         [17]  338         call    get_hex_number_sp
      00E141 FE 2C            [ 7]  339         cp      #','
      00E143 C0               [11]  340         ret     nz
      00E144 2A 9C E4         [16]  341         ld      hl,(param_word)
      00E147 22 9E E4         [16]  342         ld      (param_1),hl
      00E14A CD BA E3         [17]  343         call    get_hex_number
      00E14D FE 0D            [ 7]  344         cp      #VK_ENTER
      00E14F C0               [11]  345         ret     nz
      00E150 2A 9E E4         [16]  346         ld      hl,(param_1)
      00E153 EB               [ 4]  347         ex      de,hl
      00E154 2A 9C E4         [16]  348         ld      hl,(param_word)
      00E157 B7               [ 4]  349         or      a
      00E158 ED 52            [15]  350         sbc     hl,de
      00E15A D8               [11]  351         ret     c
      00E15B 23               [ 6]  352         inc     hl
      00E15C E5               [11]  353         push    hl
      00E15D EB               [ 4]  354         ex      de,hl
      00E15E C1               [10]  355         pop     bc
      00E15F                        356 _display_line:
      00E15F C5               [11]  357         push    bc
      00E160 E5               [11]  358         push    hl
      00E161 CD 15 E2         [17]  359         call    print_nl_hx16
      00E164 CD 9A E2         [17]  360         call    _sprintf_clean
      00E167 E1               [10]  361         pop     hl
      00E168 C1               [10]  362         pop     bc
      00E169 11 A6 E4         [10]  363         ld      de,#sprintf_buffer
      00E16C                        364 _display_byte:
      00E16C CD 2D E3         [17]  365         call    outsphx8
      00E16F 7E               [ 7]  366         ld      a,(hl)
      00E170 12               [ 7]  367         ld      (de),a
      00E171 0B               [ 6]  368         dec     bc
      00E172 78               [ 4]  369         ld      a,b
      00E173 B1               [ 4]  370         or      c
      00E174 23               [ 6]  371         inc     hl
      00E175 13               [ 6]  372         inc     de
      00E176 CA 4C E2         [10]  373         jp      z,display_ascii_dump
      00E179 3A 62 E4         [13]  374         ld      a,(column_count)
      00E17C EE 0F            [ 7]  375         xor     #0x0f
      00E17E E6 0F            [ 7]  376         and     #0x0f
      00E180 C5               [11]  377         push    bc
      00E181 47               [ 4]  378         ld      b,a
      00E182 7D               [ 4]  379         ld      a,l
      00E183 A0               [ 4]  380         and     b
      00E184 C1               [10]  381         pop     bc
      00E185 20 E5            [12]  382         jr      nz,_display_byte
      00E187 CD 4C E2         [17]  383         call    display_ascii_dump
      00E18A 18 D3            [12]  384         jr      _display_line
      00E18C                        385 monitor_cmd_go:
      00E18C CD B7 E3         [17]  386         call    get_hex_number_sp
      00E18F FE 0D            [ 7]  387         cp      #VK_ENTER
      00E191 C0               [11]  388         ret     nz
      00E192 21 38 00         [10]  389         ld      hl,#rst_38
      00E195 EB               [ 4]  390         ex      de,hl
      00E196 21 A7 E1         [10]  391         ld      hl,#rst38_vec
      00E199 01 03 00         [10]  392         ld      bc,#3
      00E19C ED B0            [21]  393         ldir
      00E19E 21 A6 E1         [10]  394         ld      hl,#op_return
      00E1A1 E5               [11]  395         push    hl
      00E1A2 2A 9C E4         [16]  396         ld      hl,(param_word)
      00E1A5 E9               [ 4]  397         jp      (hl)
      00E1A6                        398 op_return:
      00E1A6 C9               [10]  399         ret
      00E1A7                        400 rst38_vec:
      00E1A7 C3 AA E1         [10]  401         jp      brk_handler
      00E1AA                        402 brk_handler:
      00E1AA 22 BD E4         [16]  403         ld      (reg_hl),hl
      00E1AD E1               [10]  404         pop     hl
      00E1AE 22 B7 E4         [16]  405         ld      (ret_pc),hl
      00E1B1 F5               [11]  406         push    af
      00E1B2 E1               [10]  407         pop     hl
      00E1B3 22 BF E4         [16]  408         ld      (reg_af),hl
      00E1B6 ED 43 B9 E4      [20]  409         ld      (reg_bc),bc
      00E1BA ED 53 BB E4      [20]  410         ld      (reg_de),de
      00E1BE ED 57            [ 9]  411         ld      a,i
      00E1C0 32 C1 E4         [13]  412         ld      (reg_i),a
      00E1C3 DD 22 C2 E4      [20]  413         ld      (reg_ix),ix
      00E1C7 FD 22 C4 E4      [20]  414         ld      (reg_iy),iy
      00E1CB 21 F3 E2         [10]  415         ld      hl,#str_break_at
      00E1CE CD 24 E1         [17]  416         call    puts
      00E1D1 2A B7 E4         [16]  417         ld      hl,(ret_pc)
      00E1D4 CD 33 E3         [17]  418         call    outhx16
      00E1D7 31 00 F0         [10]  419         ld      sp,#stack_at_boot
      00E1DA C3 70 E0         [10]  420         jp      monitor_cmd_loop
      00E1DD                        421 monitor_cmd_reg:
      00E1DD 21 00 E3         [10]  422         ld      hl,#str_reg
      00E1E0 CD 24 E1         [17]  423         call    puts
      00E1E3 2A B7 E4         [16]  424         ld      hl,(ret_pc)
      00E1E6 CD 33 E3         [17]  425         call    outhx16
      00E1E9 21 B9 E4         [10]  426         ld      hl,#reg_bc
      00E1EC 0E 04            [ 7]  427         ld      c,#4
      00E1EE                        428 _print_reg8:
      00E1EE C5               [11]  429         push    bc
      00E1EF 23               [ 6]  430         inc     hl
      00E1F0 E5               [11]  431         push    hl
      00E1F1 CD 2D E3         [17]  432         call    outsphx8
      00E1F4 E1               [10]  433         pop     hl
      00E1F5 2B               [ 6]  434         dec     hl
      00E1F6 E5               [11]  435         push    hl
      00E1F7 CD 2D E3         [17]  436         call    outsphx8
      00E1FA E1               [10]  437         pop     hl
      00E1FB 23               [ 6]  438         inc     hl
      00E1FC 23               [ 6]  439         inc     hl
      00E1FD C1               [10]  440         pop     bc
      00E1FE 0D               [ 4]  441         dec     c
      00E1FF 20 ED            [12]  442         jr      nz,_print_reg8
      00E201 CD 2D E3         [17]  443         call    outsphx8
      00E204 CD 69 E3         [17]  444         call    print_space
      00E207 2A C2 E4         [16]  445         ld      hl,(reg_ix)
      00E20A CD 33 E3         [17]  446         call    outhx16
      00E20D CD 69 E3         [17]  447         call    print_space
      00E210 2A C4 E4         [16]  448         ld      hl,(reg_iy)
      00E213 18 03            [12]  449         jr      _m12
      00E215                        450 print_nl_hx16:
      00E215 CD 5F E3         [17]  451         call    print_new_line
      00E218                        452 _m12:
      00E218 CD 33 E3         [17]  453         call    outhx16
      00E21B C9               [10]  454         ret
      00E21C                        455 enable_protocol_printer:
      00E21C 3A B6 E4         [13]  456         ld      a,(printer_protocol_flag)
      00E21F B7               [ 4]  457         or      a
      00E220 28 0C            [12]  458         jr      z,_print_on
      00E222 3E 00            [ 7]  459         ld      a,#OFF
      00E224 21 D8 E2         [10]  460         ld      hl,#str_print_off
      00E227                        461 _m13:
      00E227 32 B6 E4         [13]  462         ld      (printer_protocol_flag),a
      00E22A CD 24 E1         [17]  463         call    puts
      00E22D C9               [10]  464         ret
      00E22E                        465 _print_on:
      00E22E 3E 01            [ 7]  466         ld      a,#ON
      00E230 21 E6 E2         [10]  467         ld      hl,#str_print_on
      00E233 18 F2            [12]  468         jr      _m13
      00E235                        469 return_to_basic:
      00E235 CD 42 E2         [17]  470         call    prepare_basic
      00E238 20 03            [12]  471         jr      nz,just_go_back
      00E23A 3E 0C            [ 7]  472         ld      a,#0x0c
      00E23C DF               [11]  473         rst     0x18
      00E23D                        474 just_go_back:
      00E23D ED 7B C6 E4      [20]  475         ld      sp,(save_stack)
      00E241 C9               [10]  476         ret
      00E242                        477 prepare_basic:
      00E242 3A 08 00         [13]  478         ld      a,(id_basic)
      00E245 FE 7E            [ 7]  479         cp      #ID_IS_BASIC
      00E247 C0               [11]  480         ret     nz
      00E248 CD D1 E3         [17]  481         call    patch_os_functions
      00E24B C9               [10]  482         ret
      00E24C                        483 display_ascii_dump:
      00E24C E5               [11]  484         push    hl
      00E24D C5               [11]  485         push    bc
      00E24E 3A 62 E4         [13]  486         ld      a,(column_count)
      00E251 E6 18            [ 7]  487         and     #MASK_WIDTH_40_80
      00E253 4F               [ 4]  488         ld      c,a
      00E254 06 00            [ 7]  489         ld      b,#0
      00E256 21 A6 E4         [10]  490         ld      hl,#sprintf_buffer
      00E259 B7               [ 4]  491         or      a
      00E25A ED 4A            [15]  492         adc     hl,bc
      00E25C B7               [ 4]  493         or      a
      00E25D ED 52            [15]  494         sbc     hl,de
      00E25F 7D               [ 4]  495         ld      a,l
      00E260 B7               [ 4]  496         or      a
      00E261 28 0E            [12]  497         jr      z,_m16
      00E263                        498 _m17:
      00E263 E5               [11]  499         push    hl
      00E264 CD 69 E3         [17]  500         call    print_space
      00E267 CD 69 E3         [17]  501         call    print_space
      00E26A CD 69 E3         [17]  502         call    print_space
      00E26D E1               [10]  503         pop     hl
      00E26E 2D               [ 4]  504         dec     l
      00E26F 20 F2            [12]  505         jr      nz,_m17
      00E271                        506 _m16:
      00E271 CD 69 E3         [17]  507         call    print_space
      00E274 CD 69 E3         [17]  508         call    print_space
      00E277 3A 62 E4         [13]  509         ld      a,(column_count)
      00E27A E6 18            [ 7]  510         and     #MASK_WIDTH_40_80
      00E27C 47               [ 4]  511         ld      b,a
      00E27D 21 A6 E4         [10]  512         ld      hl,#sprintf_buffer
      00E280                        513 _m15:
      00E280 E5               [11]  514         push    hl
      00E281 C5               [11]  515         push    bc
      00E282 7E               [ 7]  516         ld      a,(hl)
      00E283 FE 20            [ 7]  517         cp      #' '
      00E285 38 04            [12]  518         jr      c,non_char_printable
      00E287 FE 7F            [ 7]  519         cp      #VK_DEL
      00E289 38 02            [12]  520         jr      c,_printable_char
      00E28B                        521 non_char_printable:
      00E28B 3E 2E            [ 7]  522         ld      a,#'.'
      00E28D                        523 _printable_char:
      00E28D 4F               [ 4]  524         ld      c,a
      00E28E CD 71 E3         [17]  525         call    put_char
      00E291 C1               [10]  526         pop     bc
      00E292 E1               [10]  527         pop     hl
      00E293 23               [ 6]  528         inc     hl
      00E294 05               [ 4]  529         dec     b
      00E295 20 E9            [12]  530         jr      nz,_m15
      00E297 C1               [10]  531         pop     bc
      00E298 E1               [10]  532         pop     hl
      00E299 C9               [10]  533         ret
      00E29A                        534 _sprintf_clean:
      00E29A 21 A6 E4         [10]  535         ld      hl,#sprintf_buffer
      00E29D 06 10            [ 7]  536         ld      b,#sprintf_buffer_size
      00E29F                        537 _m14:
      00E29F 36 00            [10]  538         ld      (hl),#0
      00E2A1 23               [ 6]  539         inc     hl
      00E2A2 05               [ 4]  540         dec     b
      00E2A3 20 FA            [12]  541         jr      nz,_m14
      00E2A5 C9               [10]  542         ret
      00E2A6                        543 unreferenced_02:
      00E2A6 CD 8E E3         [17]  544         call    get_char_echoed
      00E2A9 FE 2C            [ 7]  545         cp      #','
      00E2AB C9               [10]  546         ret
      00E2AC                        547 str_monitor:
      00E2AC 0C 4D 6F 6E 69 74 6F   548         .db     0x0c,0x4d,0x6f,0x6e,0x69,0x74,0x6f,0x72 ;.Monitor
             72
      00E2B4 20 56 65 72 73 2E 20   549         .db     0x20,0x56,0x65,0x72,0x73,0x2e,0x20,0x31 ; Vers. 1
             31
      00E2BC 2E 32 20 47 0D 0A 0A   550         .db     0x2e,0x32,0x20,0x47,0x0d,0x0a,0x0a,0x00 ;.2 G....
             00
      00E2C4                        551 str_ready:
      00E2C4 0D 0A 52 65 61 64 79   552         .db     0x0d,0x0a,0x52,0x65,0x61,0x64,0x79,0x0d ;..Ready.
             0D
      00E2CC 0A 00                  553         .db     0x0a,0x00                               ;..
      00E2CE                        554 str_error:
      00E2CE 0D 0A 45 72 72 6F 72   555         .db     0x0d,0x0a,0x45,0x72,0x72,0x6f,0x72,0x0d ;..Error.
             0D
      00E2D6 0A 00                  556         .db     0x0a,0x00                               ;..
      00E2D8                        557 str_print_off:
      00E2D8 0D 0A 50 72 69 6E 74   558         .db     0x0d,0x0a,0x50,0x72,0x69,0x6e,0x74,0x20 ;..Print 
             20
      00E2E0 4F 46 46 0D 0A 00      559         .db     0x4f,0x46,0x46,0x0d,0x0a,0x00           ;OFF...
      00E2E6                        560 str_print_on:
      00E2E6 0D 0A 50 72 69 6E 74   561         .db     0x0d,0x0a,0x50,0x72,0x69,0x6e,0x74,0x20 ;..Print 
             20
      00E2EE 4F 4E 0D 0A 00         562         .db     0x4f,0x4e,0x0d,0x0a,0x00                ;ON...
      00E2F3                        563 str_break_at:
      00E2F3 0D 0A 42 72 65 61 6B   564         .db     0x0d,0x0a,0x42,0x72,0x65,0x61,0x6b,0x20 ;..Break 
             20
      00E2FB 61 74 20 23 00         565         .db     0x61,0x74,0x20,0x23,0x00                ;at #.
      00E300                        566 str_reg:
      00E300 0D 0A 20 50 43 20 20   567         .db     0x0d,0x0a,0x20,0x50,0x43,0x20,0x20,0x20 ;.. PC   
             20
      00E308 42 20 20 43 20 20 44   568         .db     0x42,0x20,0x20,0x43,0x20,0x20,0x44,0x20 ;B  C  D 
             20
      00E310 20 45 20 20 48 20 20   569         .db     0x20,0x45,0x20,0x20,0x48,0x20,0x20,0x4c ; E  H  L
             4C
      00E318 20 20 41 20 20 46 20   570         .db     0x20,0x20,0x41,0x20,0x20,0x46,0x20,0x20 ;  A  F  
             20
      00E320 49 20 20 49 58 20 20   571         .db     0x49,0x20,0x20,0x49,0x58,0x20,0x20,0x20 ;I  IX   
             20
      00E328 49 59 0D 0A 00         572         .db     0x49,0x59,0x0d,0x0a,0x00                ;IY...
      00E32D                        573 outsphx8:
      00E32D CD 69 E3         [17]  574         call    print_space
      00E330 7E               [ 7]  575         ld      a,(hl)
      00E331 18 05            [12]  576         jr      outhx8
      00E333                        577 outhx16:
      00E333 7C               [ 4]  578         ld      a,h
      00E334 CD 38 E3         [17]  579         call    outhx8
      00E337 7D               [ 4]  580         ld      a,l
      00E338                        581 outhx8:
      00E338 C5               [11]  582         push    bc
      00E339 F5               [11]  583         push    af
      00E33A 0F               [ 4]  584         rrca
      00E33B 0F               [ 4]  585         rrca
      00E33C 0F               [ 4]  586         rrca
      00E33D 0F               [ 4]  587         rrca
      00E33E CD 4E E3         [17]  588         call    outhx4
      00E341 F1               [10]  589         pop     af
      00E342 CD 4E E3         [17]  590         call    outhx4
      00E345 C1               [10]  591         pop     bc
      00E346 C9               [10]  592         ret
      00E347                        593 out_sphx8_minus:
      00E347 CD 2D E3         [17]  594         call    outsphx8
      00E34A 0E 2D            [ 7]  595         ld      c,#'-'
      00E34C 18 09            [12]  596         jr      _m18
      00E34E                        597 outhx4:
      00E34E E6 0F            [ 7]  598         and     #0x0f
      00E350 FE 0A            [ 7]  599         cp      #10
      00E352 30 07            [12]  600         jr      nc,_correct_hex_digit
      00E354 C6 30            [ 7]  601         add     a,#'0'
      00E356                        602 _me:
      00E356 4F               [ 4]  603         ld      c,a
      00E357                        604 _m18:
      00E357 CD 71 E3         [17]  605         call    put_char
      00E35A C9               [10]  606         ret
      00E35B                        607 _correct_hex_digit:
      00E35B C6 37            [ 7]  608         add     a,#'A'-10
      00E35D 18 F7            [12]  609         jr      _me
      00E35F                        610 print_new_line:
      00E35F C5               [11]  611         push    bc
      00E360 0E 0D            [ 7]  612         ld      c,#VK_ENTER
      00E362 CD 71 E3         [17]  613         call    put_char
      00E365 0E 0A            [ 7]  614         ld      c,#VK_NL
      00E367 18 03            [12]  615         jr      _print_next_char
      00E369                        616 print_space:
      00E369 C5               [11]  617         push    bc
      00E36A 0E 20            [ 7]  618         ld      c,#' '
      00E36C                        619 _print_next_char:
      00E36C CD 71 E3         [17]  620         call    put_char
      00E36F C1               [10]  621         pop     bc
      00E370 C9               [10]  622         ret
      00E371                        623 put_char:
      00E371 CD AC E7         [17]  624         call    put_char_crt
      00E374 3A B6 E4         [13]  625         ld      a,(printer_protocol_flag)
      00E377 B7               [ 4]  626         or      a
      00E378 C4 39 E4         [17]  627         call    nz,dev_printer_write_byte
      00E37B C9               [10]  628         ret
      00E37C                        629 input_hex_byte:
      00E37C CD 98 E3         [17]  630         call    get_hex_digit
      00E37F D8               [11]  631         ret     c
      00E380 07               [ 4]  632         rlca
      00E381 07               [ 4]  633         rlca
      00E382 07               [ 4]  634         rlca
      00E383 07               [ 4]  635         rlca
      00E384 47               [ 4]  636         ld      b,a
      00E385 CD 98 E3         [17]  637         call    get_hex_digit
      00E388 D8               [11]  638         ret     c
      00E389 80               [ 4]  639         add     a,b
      00E38A 32 9C E4         [13]  640         ld      (param_word),a
      00E38D C9               [10]  641         ret
      00E38E                        642 get_char_echoed:
      00E38E CD 62 E7         [17]  643         call    kbd_inch
      00E391 F5               [11]  644         push    af
      00E392 4F               [ 4]  645         ld      c,a
      00E393 CD 71 E3         [17]  646         call    put_char
      00E396 F1               [10]  647         pop     af
      00E397 C9               [10]  648         ret
      00E398                        649 get_hex_digit:
      00E398 CD 8E E3         [17]  650         call    get_char_echoed
      00E39B FE 30            [ 7]  651         cp      #'0'
      00E39D 38 16            [12]  652         jr      c,_m1a
      00E39F FE 3A            [ 7]  653         cp      #'9'+1
      00E3A1 38 0E            [12]  654         jr      c,_m19
      00E3A3 E6 5F            [ 7]  655         and     #MASK_CAPITALIZE
      00E3A5 FE 41            [ 7]  656         cp      #'A'
      00E3A7 38 0C            [12]  657         jr      c,_m1a
      00E3A9 FE 47            [ 7]  658         cp      #'F'+1
      00E3AB 30 08            [12]  659         jr      nc,_m1a
      00E3AD D6 37            [ 7]  660         sub     #'A'-10
      00E3AF                        661 _m1b:
      00E3AF A7               [ 4]  662         and     a
      00E3B0 C9               [10]  663         ret
      00E3B1                        664 _m19:
      00E3B1 D6 30            [ 7]  665         sub     #'0'
      00E3B3 18 FA            [12]  666         jr      _m1b
      00E3B5                        667 _m1a:
      00E3B5 37               [ 4]  668         scf
      00E3B6 C9               [10]  669         ret
      00E3B7                        670 get_hex_number_sp:
      00E3B7 CD 69 E3         [17]  671         call    print_space
      00E3BA                        672 get_hex_number:
      00E3BA E5               [11]  673         push    hl
      00E3BB 21 9D E4         [10]  674         ld      hl,#param_word+1
      00E3BE AF               [ 4]  675         xor     a
      00E3BF 77               [ 7]  676         ld      (hl),a
      00E3C0 2B               [ 6]  677         dec     hl
      00E3C1 77               [ 7]  678         ld      (hl),a
      00E3C2                        679 _m1c:
      00E3C2 CD 98 E3         [17]  680         call    get_hex_digit
      00E3C5 38 08            [12]  681         jr      c,_m1d
      00E3C7 ED 6F            [18]  682         rld
      00E3C9 23               [ 6]  683         inc     hl
      00E3CA ED 6F            [18]  684         rld
      00E3CC 2B               [ 6]  685         dec     hl
      00E3CD 18 F3            [12]  686         jr      _m1c
      00E3CF                        687 _m1d:
      00E3CF E1               [10]  688         pop     hl
      00E3D0 C9               [10]  689         ret
      00E3D1                        690 patch_os_functions:
      00E3D1 3E 01            [ 7]  691         ld      a,#ON
      00E3D3 32 D0 E4         [13]  692         ld      (os_patch),a
      00E3D6 3A D0 E4         [13]  693         ld      a,(os_patch)
      00E3D9 B7               [ 4]  694         or      a
      00E3DA C8               [11]  695         ret     z
      00E3DB 21 9C FD         [10]  696         ld      hl,#patch_table_1
      00E3DE                        697 _md:
      00E3DE CD A3 EF         [17]  698         call    rom_enable
      00E3E1 CD B0 FD         [17]  699         call    patch_rom_code
      00E3E4 C3 96 EF         [10]  700         jp      monitor_inhibit
      00E3E7                        701 restore_os_functions:
      00E3E7 21 A6 FD         [10]  702         ld      hl,#patch_table_2
      00E3EA 18 F2            [12]  703         jr      _md
                                    704 ; unchecked data source
      00E3EC EB 00 00 00 00 00 00   705         .db     0xeb,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;k.......
             00
      00E3F4 00 00 00 00 00 00 00   706         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E3FC 00                     707         .db     0x00                                    ;.
      00E3FD                        708 dev_fdd_wait_ready:
      00E3FD C3 C7 EF         [10]  709         jp      wait_fdd_ready
      00E400                        710 dev_monitor:
      00E400 C3 60 E0         [10]  711         jp      go_monitor
      00E403                        712 dev_serial_ready:
      00E403 C3 12 EB         [10]  713         jp      com_rx_ready
      00E406                        714 dev_serial_read_byte:
      00E406 C3 F8 EA         [10]  715         jp      com_read_byte
      00E409 C3 EE EA         [10]  716         jp      com_write_byte
      00E40C                        717 dev_kbd_status:
      00E40C C3 B1 E5         [10]  718         jp      kbd_matrix_read
      00E40F                        719 dev_kbd_inch:
      00E40F C3 62 E7         [10]  720         jp      kbd_inch
      00E412 C3 AC E7         [10]  721         jp      put_char_crt
      00E415 C3 B1 E5         [10]  722         jp      kbd_matrix_read
      00E418 C3 62 E7         [10]  723         jp      kbd_inch
      00E41B C3 AC E7         [10]  724         jp      put_char_crt
      00E41E C3 B1 E5         [10]  725         jp      kbd_matrix_read
      00E421 C3 62 E7         [10]  726         jp      kbd_inch
      00E424 C3 AC E7         [10]  727         jp      put_char_crt
      00E427 C3 62 E7         [10]  728         jp      kbd_inch
      00E42A C3 F8 EA         [10]  729         jp      com_read_byte
      00E42D C3 F8 EA         [10]  730         jp      com_read_byte
      00E430 C3 AC E7         [10]  731         jp      put_char_crt
      00E433                        732 dev_serial_tx_ready:
      00E433 C3 E5 EA         [10]  733         jp      com_tx_ready
      00E436                        734 dev_serial_write_byte:
      00E436 C3 EE EA         [10]  735         jp      com_write_byte
      00E439                        736 dev_printer_write_byte:
      00E439 C3 C4 EA         [10]  737         jp      lpt_write_byte
      00E43C C3 C4 EA         [10]  738         jp      lpt_write_byte
      00E43F                        739 api_call_23:
      00E43F 3E FF            [ 7]  740         ld      a,#-1
      00E441 C9               [10]  741         ret
      00E442                        742 api_call_24:
      00E442 00               [ 4]  743         nop
      00E443 AF               [ 4]  744         xor     a
      00E444 C9               [10]  745         ret
      00E445                        746 dev_printer_busy:
      00E445 C3 B7 EA         [10]  747         jp      lpt_busy
      00E448                        748 api_call_26:
      00E448 00               [ 4]  749         nop
      00E449 AF               [ 4]  750         xor     a
      00E44A C9               [10]  751         ret
      00E44B                        752 api_call_27:
      00E44B C3 9D E5         [10]  753         jp      kbd_buffer_clear_beep
      00E44E                        754 api_call_28:
      00E44E C3 A3 E5         [10]  755         jp      kbd_buffer_clear
      00E451                        756 api_call_29:
      00E451 C3 7B E6         [10]  757         jp      delay
      00E454                        758 api_call_30:
      00E454 C3 A0 EA         [10]  759         jp      buzzer_off
      00E457                        760 api_call_31:
      00E457 C3 98 EA         [10]  761         jp      buzzer_on
      00E45A                        762 api_call_32:
      00E45A C3 AA E1         [10]  763         jp      brk_handler
      00E45D                        764 api_call_33:
      00E45D C3 18 F1         [10]  765         jp      kbd_adjust_keyboard_table
      00E460                        766 terminal_row1:
      00E460 18                     767         .db     0x18                                    ;.
      00E461                        768 terminal_row2:
      00E461 18                     769         .db     0x18                                    ;.
      00E462                        770 column_count:
      00E462 50                     771         .db     0x50                                    ;P
      00E463                        772 row_start:
      00E463 00                     773         .db     0x00                                    ;.
      00E464                        774 terminal_row3:
      00E464 18                     775         .db     0x18                                    ;.
      00E465                        776 terminal_row4:
      00E465 18                     777         .db     0x18                                    ;.
      00E466                        778 buffer_put_char:
      00E466 30                     779         .db     0x30                                    ;0
      00E467                        780 attrib_color:
      00E467 07                     781         .db     0x07                                    ;.
      00E468                        782 cfg10_settings:
      00E468 00                     783         .db     0x00                                    ;.
      00E469                        784 cfg20_settings:
      00E469 00                     785         .db     0x00                                    ;.
      00E46A                        786 screen_driver_settings:
      00E46A 05                     787         .db     0x05                                    ;.
                                    788 ; unchecked data source
      00E46B 00 CA                  789         .db     0x00,0xca                               ;.J
      00E46D                        790 cursor_row:
      00E46D 00                     791         .db     0x00                                    ;.
      00E46E                        792 cursor_column:
      00E46E 00                     793         .db     0x00                                    ;.
      00E46F                        794 led_status:
      00E46F 00                     795         .db     0x00                                    ;.
      00E470                        796 cursor_start:
      00E470 00                     797         .db     0x00                                    ;.
      00E471                        798 kbd_debounce_cnt:
      00E471 00                     799         .db     0x00                                    ;.
      00E472                        800 kbd_matrix_buffer:
      00E472 00 00 00 00 00 00 00   801         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E47A 00 00 00 00            802         .db     0x00,0x00,0x00,0x00                     ;....
      00E47E                        803 kbd_matrix_buffer2:
      00E47E 00 00 00 00 00 00 00   804         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E486 00 00 00 00            805         .db     0x00,0x00,0x00,0x00                     ;....
      00E48A                        806 kbd_command_mode:
      00E48A 00                     807         .db     0x00                                    ;.
      00E48B                        808 kbd_modifiers:
      00E48B 00                     809         .db     0x00                                    ;.
      00E48C                        810 input_mode:
      00E48C 00                     811         .db     0x00                                    ;.
                                    812 ; unchecked data source
      00E48D 00                     813         .db     0x00                                    ;.
      00E48E                        814 kbd_position:
      00E48E 00                     815         .db     0x00                                    ;.
      00E48F                        816 kbd_ascii:
      00E48F 00                     817         .db     0x00                                    ;.
      00E490                        818 cursor_abs:
      00E490 00 00                  819         .db     0x00,0x00                               ;..
      00E492                        820 cursor_abs_color:
      00E492 00 00                  821         .db     0x00,0x00                               ;..
      00E494                        822 column_offset_tmp:
      00E494 00 00                  823         .db     0x00,0x00                               ;..
      00E496                        824 cursor_tmp:
      00E496 00                     825         .db     0x00                                    ;.
                                    826 ; unchecked data source
      00E497 00                     827         .db     0x00                                    ;.
      00E498                        828 key_code:
      00E498 00                     829         .db     0x00                                    ;.
      00E499                        830 attrib_tmp:
      00E499 00                     831         .db     0x00                                    ;.
                                    832 ; unchecked data source
      00E49A 00 00                  833         .db     0x00,0x00                               ;..
      00E49C                        834 param_word:
      00E49C 00 00                  835         .db     0x00,0x00                               ;..
      00E49E                        836 param_1:
      00E49E 00 00                  837         .db     0x00,0x00                               ;..
      00E4A0                        838 param_2:
      00E4A0 00 00                  839         .db     0x00,0x00                               ;..
      00E4A2                        840 param_3:
      00E4A2 00 00                  841         .db     0x00,0x00                               ;..
                                    842 ; unchecked data source
      00E4A4 00 00                  843         .db     0x00,0x00                               ;..
      00E4A6                        844 sprintf_buffer:
      00E4A6 00 00 00 00 00 00 00   845         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E4AE 00 00 00 00 00 00 00   846         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00E4B6                        847 printer_protocol_flag:
      00E4B6 00                     848         .db     0x00                                    ;.
      00E4B7                        849 ret_pc:
      00E4B7 00 00                  850         .db     0x00,0x00                               ;..
      00E4B9                        851 reg_bc:
      00E4B9 00 00                  852         .db     0x00,0x00                               ;..
      00E4BB                        853 reg_de:
      00E4BB 00 00                  854         .db     0x00,0x00                               ;..
      00E4BD                        855 reg_hl:
      00E4BD 00 00                  856         .db     0x00,0x00                               ;..
      00E4BF                        857 reg_af:
      00E4BF 00 00                  858         .db     0x00,0x00                               ;..
      00E4C1                        859 reg_i:
      00E4C1 00                     860         .db     0x00                                    ;.
      00E4C2                        861 reg_ix:
      00E4C2 00 00                  862         .db     0x00,0x00                               ;..
      00E4C4                        863 reg_iy:
      00E4C4 00 00                  864         .db     0x00,0x00                               ;..
      00E4C6                        865 save_stack:
      00E4C6 00 00                  866         .db     0x00,0x00                               ;..
                                    867 ; unchecked data source
      00E4C8 00 00 00               868         .db     0x00,0x00,0x00                          ;...
      00E4CB                        869 cursor_flag:
      00E4CB 00                     870         .db     0x00                                    ;.
      00E4CC                        871 cursor_row_column_rel:
      00E4CC 00                     872         .db     0x00                                    ;.
                                    873 ; unchecked data source
      00E4CD 00                     874         .db     0x00                                    ;.
      00E4CE                        875 char_tmp:
      00E4CE 00                     876         .db     0x00                                    ;.
                                    877 ; unchecked data source
      00E4CF 00                     878         .db     0x00                                    ;.
      00E4D0                        879 os_patch:
      00E4D0 00                     880         .db     0x00                                    ;.
                                    881 ; unchecked data source
      00E4D1 00                     882         .db     0x00                                    ;.
      00E4D2                        883 beep_delay:
      00E4D2 00 80                  884         .db     0x00,0x80                               ;..
      00E4D4                        885 crt_wait_vsync:
      00E4D4 C3 0D EA         [10]  886         jp      wait_vsync
      00E4D7                        887 crt_is_vsync:
      00E4D7 C3 1A EA         [10]  888         jp      is_vsync
      00E4DA                        889 crt_wait_flicker_free_save_A:
      00E4DA C3 2B EA         [10]  890         jp      wait_flicker_free_save_A
      00E4DD                        891 kbd_table_lookup:
      00E4DD 30 31 32 33 34 35 36   892         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00E4E5 38 39 2E FF 2B 2D 3D   893         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00E4ED FF 61 62 63 64 65 66   894         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00E4F5 68 69 6A 6B 6C 6D 6E   895         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00E4FD 70 71 72 73 74 75 76   896         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00E505 78 79 7A FF FF FF FF   897         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00E50D 30 31 32 33 34 35 36   898         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00E515 38 39 2D 5E 40 5B 5D   899         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00E51D FF FF 20 5C 2C 2E 2F   900         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00E525 1F 1C 1D 1E 9B FF 7F   901         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00E52D FF 7F FF 09 0D DF 0B   902         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00E535 FF FF 86 85 84 83 82   903         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00E53D E4 E2 EB E3 E8 E6 E9   904         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00E545 EA E1 E5 FF 2A 2F E7   905         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00E54D FF 41 42 43 44 45 46   906         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00E555 48 49 4A 4B 4C 4D 4E   907         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00E55D 50 51 52 53 54 55 56   908         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00E565 58 59 5A FF FF FF FF   909         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00E56D 5F 21 22 23 24 25 26   910         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00E575 28 29 3D 7E 60 7B 7D   911         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00E57D FF FF 20 7C 3C 3E 3F   912         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00E585 EC EF EE ED 9B FF 7F   913         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00E58D FF 12 FF 09 0D DF 0C   914         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00E595 FF FF 8C 8B 8A 89 88   915         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00E59D                        916 kbd_buffer_clear_beep:
      00E59D CD 80 EA         [17]  917         call    chr_beep
      00E5A0 CD 7A EE         [17]  918         call    switch_crt_mode
      00E5A3                        919 kbd_buffer_clear:
      00E5A3 21 71 E4         [10]  920         ld      hl,#kbd_debounce_cnt
      00E5A6 11 72 E4         [10]  921         ld      de,#kbd_matrix_buffer
      00E5A9 01 60 00         [10]  922         ld      bc,#kbd_table_int_size
      00E5AC 36 00            [10]  923         ld      (hl),#0
      00E5AE ED B0            [21]  924         ldir
      00E5B0 C9               [10]  925         ret
      00E5B1                        926 kbd_matrix_read:
      00E5B1 E5               [11]  927         push    hl
      00E5B2 D5               [11]  928         push    de
      00E5B3 C5               [11]  929         push    bc
      00E5B4 3A 8A E4         [13]  930         ld      a,(kbd_command_mode)
      00E5B7 FE 80            [ 7]  931         cp      #0x80                                   
      00E5B9 28 26            [12]  932         jr      z,_err4
      00E5BB FE 88            [ 7]  933         cp      #0x88                                   
      00E5BD 28 22            [12]  934         jr      z,_err4
      00E5BF 21 7E E4         [10]  935         ld      hl,#kbd_matrix_buffer2
      00E5C2 CD 6E E6         [17]  936         call    kbd_fetch_from_io
      00E5C5 21 7E E4         [10]  937         ld      hl,#kbd_matrix_buffer2
      00E5C8 06 0C            [ 7]  938         ld      b,#kbd_matrix_buffer_size
      00E5CA                        939 _m1e:
      00E5CA 7E               [ 7]  940         ld      a,(hl)
      00E5CB B7               [ 4]  941         or      a
      00E5CC 20 07            [12]  942         jr      nz,kbd_pressed2
      00E5CE 05               [ 4]  943         dec     b
      00E5CF CA 47 E6         [10]  944         jp      z,kbd_not_pressed
      00E5D2 23               [ 6]  945         inc     hl
      00E5D3 18 F5            [12]  946         jr      _m1e
      00E5D5                        947 kbd_pressed2:
      00E5D5 CD E7 E5         [17]  948         call    m_e5e7
      00E5D8 3A 8A E4         [13]  949         ld      a,(kbd_command_mode)
      00E5DB FE 80            [ 7]  950         cp      #0x80                                   
      00E5DD 3E 00            [ 7]  951         ld      a,#0x00                                 
      00E5DF 20 02            [12]  952         jr      nz,m_e5e3
      00E5E1                        953 _err4:
      00E5E1 3E FF            [ 7]  954         ld      a,#-1
      00E5E3                        955 m_e5e3:
      00E5E3 C1               [10]  956         pop     bc
      00E5E4 D1               [10]  957         pop     de
      00E5E5 E1               [10]  958         pop     hl
      00E5E6 C9               [10]  959         ret
      00E5E7                        960 m_e5e7:
      00E5E7 E5               [11]  961         push    hl
      00E5E8 D5               [11]  962         push    de
      00E5E9 C5               [11]  963         push    bc
      00E5EA 21 E8 03         [10]  964         ld      hl,#DELAY_7MS
      00E5ED CD 7B E6         [17]  965         call    delay
      00E5F0 21 72 E4         [10]  966         ld      hl,#kbd_matrix_buffer
      00E5F3 CD 6E E6         [17]  967         call    kbd_fetch_from_io
      00E5F6 21 72 E4         [10]  968         ld      hl,#kbd_matrix_buffer
      00E5F9 11 7E E4         [10]  969         ld      de,#kbd_matrix_buffer2
      00E5FC 06 0C            [ 7]  970         ld      b,#kbd_matrix_buffer_size
      00E5FE                        971 cmp_kbd_entry:
      00E5FE 1A               [ 7]  972         ld      a,(de)
      00E5FF BE               [ 7]  973         cp      (hl)
      00E600 20 54            [12]  974         jr      nz,scans_different
      00E602 05               [ 4]  975         dec     b
      00E603 28 04            [12]  976         jr      z,scan_is_stable
      00E605 23               [ 6]  977         inc     hl
      00E606 13               [ 6]  978         inc     de
      00E607 18 F5            [12]  979         jr      cmp_kbd_entry
      00E609                        980 scan_is_stable:
      00E609 CD 82 E6         [17]  981         call    m_e682
      00E60C 3A 8A E4         [13]  982         ld      a,(kbd_command_mode)
      00E60F FE 80            [ 7]  983         cp      #0x80                                   
      00E611 20 38            [12]  984         jr      nz,clear_kbd_modifiers
      00E613 CD 2C E7         [17]  985         call    m_e72c
      00E616 3A 6F E4         [13]  986         ld      a,(led_status)
      00E619 CB 7F            [ 8]  987         bit     7,a                                     
      00E61B 20 32            [12]  988         jr      nz,kbd_no_key
      00E61D 3A 8F E4         [13]  989         ld      a,(kbd_ascii)
      00E620 FE FF            [ 7]  990         cp      #0xff                                   
      00E622 28 2B            [12]  991         jr      z,kbd_no_key
      00E624 B7               [ 4]  992         or      a
      00E625 28 28            [12]  993         jr      z,kbd_no_key
      00E627 CD 1A E7         [17]  994         call    modify_if_graphic_B
      00E62A 3A 98 E4         [13]  995         ld      a,(key_code)
      00E62D B8               [ 4]  996         cp      b
      00E62E 20 2F            [12]  997         jr      nz,set_kbd_debounce_cnt
      00E630 3A 71 E4         [13]  998         ld      a,(kbd_debounce_cnt)
      00E633 B7               [ 4]  999         or      a
      00E634 20 0B            [12] 1000         jr      nz,decrement_kbd_debounce_cnt
      00E636 21 B8 0B         [10] 1001         ld      hl,#DELAY_22MS
      00E639 CD 7B E6         [17] 1002         call    delay
      00E63C 18 26            [12] 1003         jr      update_key_code
                                   1004 ; unchecked data source
      00E63E AF 18 12              1005         .db     0xaf,0x18,0x12                          ;/..
      00E641                       1006 decrement_kbd_debounce_cnt:
      00E641 3D               [ 4] 1007         dec     a
      00E642 32 71 E4         [13] 1008         ld      (kbd_debounce_cnt),a
      00E645 18 0F            [12] 1009         jr      scans_different
      00E647                       1010 kbd_not_pressed:
      00E647 AF               [ 4] 1011         xor     a
      00E648 32 C9 E4         [13] 1012         ld      (0xe4c9),a                              
      00E64B                       1013 clear_kbd_modifiers:
      00E64B AF               [ 4] 1014         xor     a
      00E64C 32 8B E4         [13] 1015         ld      (kbd_modifiers),a
      00E64F                       1016 kbd_no_key:
      00E64F AF               [ 4] 1017         xor     a
      00E650 32 98 E4         [13] 1018         ld      (key_code),a
      00E653 32 71 E4         [13] 1019         ld      (kbd_debounce_cnt),a
      00E656                       1020 scans_different:
      00E656 AF               [ 4] 1021         xor     a
      00E657 32 8A E4         [13] 1022         ld      (kbd_command_mode),a
      00E65A 32 8F E4         [13] 1023         ld      (kbd_ascii),a
      00E65D 18 0B            [12] 1024         jr      kbd_exit
      00E65F                       1025 set_kbd_debounce_cnt:
      00E65F 3E 20            [ 7] 1026         ld      a,#32
      00E661 32 71 E4         [13] 1027         ld      (kbd_debounce_cnt),a
      00E664                       1028 update_key_code:
      00E664 3A 8F E4         [13] 1029         ld      a,(kbd_ascii)
      00E667 32 98 E4         [13] 1030         ld      (key_code),a
      00E66A                       1031 kbd_exit:
      00E66A C1               [10] 1032         pop     bc
      00E66B D1               [10] 1033         pop     de
      00E66C E1               [10] 1034         pop     hl
      00E66D C9               [10] 1035         ret
      00E66E                       1036 kbd_fetch_from_io:
      00E66E 0E 20            [ 7] 1037         ld      c,#STATUS_KBD
      00E670 06 0C            [ 7] 1038         ld      b,#KBD_COLUMNS
      00E672                       1039 kbd_scan_columns:
      00E672 ED 78            [12] 1040         in      a,(c)
      00E674 77               [ 7] 1041         ld      (hl),a
      00E675 23               [ 6] 1042         inc     hl
      00E676 0C               [ 4] 1043         inc     c
      00E677 05               [ 4] 1044         dec     b
      00E678 20 F8            [12] 1045         jr      nz,kbd_scan_columns
      00E67A C9               [10] 1046         ret
      00E67B                       1047 delay:
      00E67B 00               [ 4] 1048         nop
      00E67C 2B               [ 6] 1049         dec     hl
      00E67D 7C               [ 4] 1050         ld      a,h
      00E67E B5               [ 4] 1051         or      l
      00E67F 20 FA            [12] 1052         jr      nz,delay
      00E681 C9               [10] 1053         ret
      00E682                       1054 m_e682:
      00E682 DD 21 7E E4      [14] 1055         ld      ix,#kbd_matrix_buffer2
      00E686 AF               [ 4] 1056         xor     a
      00E687 4F               [ 4] 1057         ld      c,a
      00E688 5F               [ 4] 1058         ld      e,a
      00E689 32 8A E4         [13] 1059         ld      (kbd_command_mode),a
      00E68C                       1060 kbd_buffer_check_colum:
      00E68C DD 7E 00         [19] 1061         ld      a,0(ix)
      00E68F B7               [ 4] 1062         or      a
      00E690 20 0B            [12] 1063         jr      nz,m_e69d
      00E692 79               [ 4] 1064         ld      a,c
      00E693 C6 08            [ 7] 1065         add     a,#0x08                                 
      00E695 4F               [ 4] 1066         ld      c,a
      00E696                       1067 m_e696:
      00E696 FE 60            [ 7] 1068         cp      #kbd_table_int_size
      00E698 C8               [11] 1069         ret     z
      00E699 DD 23            [10] 1070         inc     ix
      00E69B 18 EF            [12] 1071         jr      kbd_buffer_check_colum
      00E69D                       1072 m_e69d:
      00E69D 16 08            [ 7] 1073         ld      d,#8
      00E69F 67               [ 4] 1074         ld      h,a
      00E6A0                       1075 m_e6a0:
      00E6A0 0C               [ 4] 1076         inc     c
      00E6A1 7C               [ 4] 1077         ld      a,h
      00E6A2 B7               [ 4] 1078         or      a
      00E6A3 CB 3F            [ 8] 1079         srl     a
      00E6A5 67               [ 4] 1080         ld      h,a
      00E6A6 38 06            [12] 1081         jr      c,m_e6ae
      00E6A8                       1082 m_e6a8:
      00E6A8 15               [ 4] 1083         dec     d
      00E6A9 20 F5            [12] 1084         jr      nz,m_e6a0
      00E6AB 79               [ 4] 1085         ld      a,c
      00E6AC 18 E8            [12] 1086         jr      m_e696
      00E6AE                       1087 m_e6ae:
      00E6AE 79               [ 4] 1088         ld      a,c
      00E6AF FE 4F            [ 7] 1089         cp      #KBD_POSITION_CTRL
      00E6B1 28 21            [12] 1090         jr      z,kbd_handle_ctrl
      00E6B3 FE 53            [ 7] 1091         cp      #KBD_POSITION_SHIFT
      00E6B5 28 2B            [12] 1092         jr      z,handle_kbd_shift
      00E6B7 FE 4E            [ 7] 1093         cp      #KBD_POSITION_SHIFT_LOCK
      00E6B9 28 31            [12] 1094         jr      z,handle_kbd_shift_lock
      00E6BB FE 4D            [ 7] 1095         cp      #KBD_POSITION_COMMAND
      00E6BD 28 37            [12] 1096         jr      z,handle_kbd_command
      00E6BF FE 56            [ 7] 1097         cp      #KBD_POSITION_GRAPH
      00E6C1 28 3C            [12] 1098         jr      z,handle_kbd_graph
      00E6C3                       1099 m_e6c3:
      00E6C3 7B               [ 4] 1100         ld      a,e
      00E6C4 B7               [ 4] 1101         or      a
      00E6C5 20 E1            [12] 1102         jr      nz,m_e6a8
      00E6C7 1E 01            [ 7] 1103         ld      e,#0x01                                 
      00E6C9 79               [ 4] 1104         ld      a,c
      00E6CA 32 8E E4         [13] 1105         ld      (kbd_position),a
      00E6CD 3E 80            [ 7] 1106         ld      a,#0x80                                 
      00E6CF 32 8A E4         [13] 1107         ld      (kbd_command_mode),a
      00E6D2 18 D4            [12] 1108         jr      m_e6a8
      00E6D4                       1109 kbd_handle_ctrl:
      00E6D4 3A 6A E4         [13] 1110         ld      a,(screen_driver_settings)
      00E6D7 CB 57            [ 8] 1111         bit     2,a                                     ;ESC_0C_CTRL_INTERNAL==0
      00E6D9 28 E8            [12] 1112         jr      z,m_e6c3
      00E6DB 3A 8B E4         [13] 1113         ld      a,(kbd_modifiers)
      00E6DE CB D7            [ 8] 1114         set     2,a                                     ;KBD_MOD_CTRL=1
      00E6E0 18 05            [12] 1115         jr      set_kbd_modifiers
      00E6E2                       1116 handle_kbd_shift:
      00E6E2 3A 8B E4         [13] 1117         ld      a,(kbd_modifiers)
      00E6E5 CB C7            [ 8] 1118         set     0,a                                     ;KBD_MOD_SHIFT=1
      00E6E7                       1119 set_kbd_modifiers:
      00E6E7 32 8B E4         [13] 1120         ld      (kbd_modifiers),a
      00E6EA 18 BC            [12] 1121         jr      m_e6a8
      00E6EC                       1122 handle_kbd_shift_lock:
      00E6EC CD 0F E7         [17] 1123         call    m_e70f
      00E6EF 20 B7            [12] 1124         jr      nz,m_e6a8
      00E6F1 CD BF E8         [17] 1125         call    m_e8bf
      00E6F4 18 B2            [12] 1126         jr      m_e6a8
      00E6F6                       1127 handle_kbd_command:
      00E6F6 3A 6A E4         [13] 1128         ld      a,(screen_driver_settings)
      00E6F9 CB 5F            [ 8] 1129         bit     3,a                                     ;ESC_0C_COMMAND_KEY==0
      00E6FB 20 C6            [12] 1130         jr      nz,m_e6c3
      00E6FD 18 A9            [12] 1131         jr      m_e6a8
      00E6FF                       1132 handle_kbd_graph:
      00E6FF CD 0F E7         [17] 1133         call    m_e70f
      00E702 20 A4            [12] 1134         jr      nz,m_e6a8
      00E704 CD A6 E8         [17] 1135         call    kbd_toggle_gled
      00E707 3A D0 E4         [13] 1136         ld      a,(os_patch)
      00E70A B7               [ 4] 1137         or      a
      00E70B 28 B6            [12] 1138         jr      z,m_e6c3
      00E70D 18 99            [12] 1139         jr      m_e6a8
      00E70F                       1140 m_e70f:
      00E70F 3A C9 E4         [13] 1141         ld      a,(0xe4c9)                              
      00E712 B7               [ 4] 1142         or      a
      00E713 C0               [11] 1143         ret     nz
      00E714 3E 01            [ 7] 1144         ld      a,#0x01                                 
      00E716 32 C9 E4         [13] 1145         ld      (0xe4c9),a                              
      00E719 C9               [10] 1146         ret
      00E71A                       1147 modify_if_graphic_B:
      00E71A 3A 8B E4         [13] 1148         ld      a,(kbd_modifiers)
      00E71D CB 57            [ 8] 1149         bit     2,a                                     ;KBD_MOD_CTRL==0
      00E71F E5               [11] 1150         push    hl
      00E720 21 8F E4         [10] 1151         ld      hl,#kbd_ascii
      00E723 28 04            [12] 1152         jr      z,m_e729
      00E725 CB B6            [15] 1153         res     6,(hl)                                  
      00E727 CB AE            [15] 1154         res     5,(hl)                                  
      00E729                       1155 m_e729:
      00E729 46               [ 7] 1156         ld      b,(hl)
      00E72A E1               [10] 1157         pop     hl
      00E72B C9               [10] 1158         ret
      00E72C                       1159 m_e72c:
      00E72C 3A 8B E4         [13] 1160         ld      a,(kbd_modifiers)
      00E72F E6 01            [ 7] 1161         and     #MODIFIER_SHIFT
      00E731 21 DD E4         [10] 1162         ld      hl,#kbd_table_lookup
      00E734 28 03            [12] 1163         jr      z,m_e739
      00E736 21 3D E5         [10] 1164         ld      hl,#kbd_table_lookup+0x60
      00E739                       1165 m_e739:
      00E739 16 00            [ 7] 1166         ld      d,#HIGH_ZERO
      00E73B 3A 8E E4         [13] 1167         ld      a,(kbd_position)
      00E73E 5F               [ 4] 1168         ld      e,a
      00E73F 19               [11] 1169         add     hl,de
      00E740 2B               [ 6] 1170         dec     hl
      00E741 7E               [ 7] 1171         ld      a,(hl)
      00E742 32 8F E4         [13] 1172         ld      (kbd_ascii),a
      00E745 3A 6F E4         [13] 1173         ld      a,(led_status)
      00E748 CB 47            [ 8] 1174         bit     0,a                                     ;STATUS_SLED==0
      00E74A C8               [11] 1175         ret     z
      00E74B 7E               [ 7] 1176         ld      a,(hl)
      00E74C FE 61            [ 7] 1177         cp      #0x61                                   
      00E74E D8               [11] 1178         ret     c
      00E74F                       1179 opcode_compare:
      00E74F FE 7B            [ 7] 1180         cp      #0x7b                                   
      00E751 D0               [11] 1181         ret     nc
      00E752 E6 5F            [ 7] 1182         and     #0x5f                                   
      00E754 32 8F E4         [13] 1183         ld      (kbd_ascii),a
      00E757 C9               [10] 1184         ret
      00E758                       1185 unreferenced_09:
      00E758 E5               [11] 1186         push    hl
      00E759 21 6F E4         [10] 1187         ld      hl,#led_status
      00E75C CB BE            [15] 1188         res     7,(hl)                                  ;unknown_status_flag=0
      00E75E E1               [10] 1189         pop     hl
      00E75F C3 A0 EA         [10] 1190         jp      buzzer_off
      00E762                       1191 kbd_inch:
      00E762 E5               [11] 1192         push    hl
      00E763 D5               [11] 1193         push    de
      00E764 C5               [11] 1194         push    bc
      00E765                       1195 m_e765:
      00E765 3A 8A E4         [13] 1196         ld      a,(kbd_command_mode)
      00E768 FE 80            [ 7] 1197         cp      #0x80                                   
      00E76A 28 0E            [12] 1198         jr      z,m_e77a
      00E76C FE 88            [ 7] 1199         cp      #0x88                                   
      00E76E 3E 00            [ 7] 1200         ld      a,#0x00                                 
      00E770 32 8A E4         [13] 1201         ld      (kbd_command_mode),a
      00E773 28 2D            [12] 1202         jr      z,m_e7a2
      00E775 CD B1 E5         [17] 1203         call    kbd_matrix_read
      00E778 18 EB            [12] 1204         jr      m_e765
      00E77A                       1205 m_e77a:
      00E77A AF               [ 4] 1206         xor     a
      00E77B 32 8A E4         [13] 1207         ld      (kbd_command_mode),a
      00E77E 3A 8F E4         [13] 1208         ld      a,(kbd_ascii)
      00E781 E6 7F            [ 7] 1209         and     #0x7f                                   
      00E783 FE 20            [ 7] 1210         cp      #0x20                                   
      00E785 38 0D            [12] 1211         jr      c,m_e794
      00E787 3A D0 E4         [13] 1212         ld      a,(os_patch)
      00E78A B7               [ 4] 1213         or      a
      00E78B 28 07            [12] 1214         jr      z,m_e794
      00E78D 3A 6F E4         [13] 1215         ld      a,(led_status)
      00E790 CB 57            [ 8] 1216         bit     2,a                                     ;STATUS_GLED==0
      00E792 20 05            [12] 1217         jr      nz,m_e799
      00E794                       1218 m_e794:
      00E794 3A 8F E4         [13] 1219         ld      a,(kbd_ascii)
      00E797 18 0F            [12] 1220         jr      m_e7a8
      00E799                       1221 m_e799:
      00E799 3E 88            [ 7] 1222         ld      a,#0x88                                 
      00E79B 32 8A E4         [13] 1223         ld      (kbd_command_mode),a
      00E79E 3E DF            [ 7] 1224         ld      a,#0xdf                                 
      00E7A0 18 06            [12] 1225         jr      m_e7a8
      00E7A2                       1226 m_e7a2:
      00E7A2 3A 8F E4         [13] 1227         ld      a,(kbd_ascii)
      00E7A5 CD 28 E8         [17] 1228         call    map_char_to_graphic
      00E7A8                       1229 m_e7a8:
      00E7A8 C1               [10] 1230         pop     bc
      00E7A9 D1               [10] 1231         pop     de
      00E7AA E1               [10] 1232         pop     hl
      00E7AB C9               [10] 1233         ret
      00E7AC                       1234 put_char_crt:
      00E7AC E5               [11] 1235         push    hl
      00E7AD D5               [11] 1236         push    de
      00E7AE C5               [11] 1237         push    bc
      00E7AF 79               [ 4] 1238         ld      a,c
      00E7B0 32 66 E4         [13] 1239         ld      (buffer_put_char),a
      00E7B3 3A 8C E4         [13] 1240         ld      a,(input_mode)
      00E7B6 B7               [ 4] 1241         or      a
      00E7B7 20 6A            [12] 1242         jr      nz,m_e823
      00E7B9 3A D0 E4         [13] 1243         ld      a,(os_patch)
      00E7BC B7               [ 4] 1244         or      a
      00E7BD 28 30            [12] 1245         jr      z,m_e7ef
      00E7BF 3A C8 E4         [13] 1246         ld      a,(0xe4c8)                              
      00E7C2 B7               [ 4] 1247         or      a
      00E7C3 3A 66 E4         [13] 1248         ld      a,(buffer_put_char)
      00E7C6 20 10            [12] 1249         jr      nz,m_e7d8
      00E7C8 FE DF            [ 7] 1250         cp      #0xdf                                   
      00E7CA 28 4B            [12] 1251         jr      z,m_e817
      00E7CC                       1252 m_e7cc:
      00E7CC E6 7F            [ 7] 1253         and     #0x7f                                   
      00E7CE 28 0F            [12] 1254         jr      z,m_e7df
      00E7D0 FE 7F            [ 7] 1255         cp      #0x7f                                   
      00E7D2 28 4A            [12] 1256         jr      z,m_e81e
      00E7D4 FE 20            [ 7] 1257         cp      #0x20                                   
      00E7D6 38 46            [12] 1258         jr      c,m_e81e
      00E7D8                       1259 m_e7d8:
      00E7D8 AF               [ 4] 1260         xor     a
      00E7D9 32 C8 E4         [13] 1261         ld      (0xe4c8),a                              
      00E7DC                       1262 m_e7dc:
      00E7DC CD EC E8         [17] 1263         call    crt_write_char_with_color
      00E7DF                       1264 m_e7df:
      00E7DF C1               [10] 1265         pop     bc
      00E7E0 D1               [10] 1266         pop     de
      00E7E1 3A CB E4         [13] 1267         ld      a,(cursor_flag)
      00E7E4 B7               [ 4] 1268         or      a
      00E7E5 20 26            [12] 1269         jr      nz,m_e80d
      00E7E7                       1270 m_e7e7:
      00E7E7 3A 66 E4         [13] 1271         ld      a,(buffer_put_char)
      00E7EA 32 6C E4         [13] 1272         ld      (0xe46c),a                              
      00E7ED E1               [10] 1273         pop     hl
      00E7EE C9               [10] 1274         ret
      00E7EF                       1275 m_e7ef:
      00E7EF 3A 66 E4         [13] 1276         ld      a,(buffer_put_char)
      00E7F2 47               [ 4] 1277         ld      b,a
      00E7F3 FE DF            [ 7] 1278         cp      #0xdf                                   
      00E7F5 28 11            [12] 1279         jr      z,m_e808
      00E7F7 3A C8 E4         [13] 1280         ld      a,(0xe4c8)                              
      00E7FA B7               [ 4] 1281         or      a
      00E7FB 78               [ 4] 1282         ld      a,b
      00E7FC 28 CE            [12] 1283         jr      z,m_e7cc
      00E7FE CD 28 E8         [17] 1284         call    map_char_to_graphic
      00E801 32 66 E4         [13] 1285         ld      (buffer_put_char),a
      00E804 38 18            [12] 1286         jr      c,m_e81e
      00E806 18 D4            [12] 1287         jr      m_e7dc
      00E808                       1288 m_e808:
      00E808 CD D6 E8         [17] 1289         call    m_e8d6
      00E80B 18 D2            [12] 1290         jr      m_e7df
      00E80D                       1291 m_e80d:
      00E80D 2A CC E4         [16] 1292         ld      hl,(cursor_row_column_rel)
      00E810 EB               [ 4] 1293         ex      de,hl
      00E811 AF               [ 4] 1294         xor     a
      00E812 32 CB E4         [13] 1295         ld      (cursor_flag),a
      00E815 18 D0            [12] 1296         jr      m_e7e7
      00E817                       1297 m_e817:
      00E817 3E 01            [ 7] 1298         ld      a,#0x01                                 
      00E819 32 C8 E4         [13] 1299         ld      (0xe4c8),a                              
      00E81C 18 C1            [12] 1300         jr      m_e7df
      00E81E                       1301 m_e81e:
      00E81E CD 3F E8         [17] 1302         call    m_e83f
      00E821 18 BC            [12] 1303         jr      m_e7df
      00E823                       1304 m_e823:
      00E823 CD E5 EB         [17] 1305         call    _m2e
      00E826 18 B7            [12] 1306         jr      m_e7df
      00E828                       1307 map_char_to_graphic:
      00E828 FE 20            [ 7] 1308         cp      #0x20                                   
      00E82A D8               [11] 1309         ret     c
      00E82B FE 60            [ 7] 1310         cp      #0x60                                   
      00E82D 38 06            [12] 1311         jr      c,m_e835
      00E82F FE 80            [ 7] 1312         cp      #0x80                                   
      00E831 D0               [11] 1313         ret     nc
      00E832 F6 80            [ 7] 1314         or      #0x80                                   
      00E834 C9               [10] 1315         ret
      00E835                       1316 m_e835:
      00E835 FE 40            [ 7] 1317         cp      #0x40                                   
      00E837 38 03            [12] 1318         jr      c,m_e83c
      00E839 EE C0            [ 7] 1319         xor     #0xc0                                   
      00E83B C9               [10] 1320         ret
      00E83C                       1321 m_e83c:
      00E83C EE 20            [ 7] 1322         xor     #0x20                                   
      00E83E C9               [10] 1323         ret
      00E83F                       1324 m_e83f:
      00E83F 3A 66 E4         [13] 1325         ld      a,(buffer_put_char)
      00E842 FE 1B            [ 7] 1326         cp      #VK_ESC
      00E844 20 06            [12] 1327         jr      nz,m_e84c
      00E846 3E 01            [ 7] 1328         ld      a,#0x01                                 
      00E848 32 8C E4         [13] 1329         ld      (0xe48c),a                              
      00E84B C9               [10] 1330         ret
      00E84C                       1331 m_e84c:
      00E84C 4F               [ 4] 1332         ld      c,a
      00E84D 21 55 E8         [10] 1333         ld      hl,#special_characters
      00E850 CD 21 EC         [17] 1334         call    map_C_to_PTR
      00E853 C8               [11] 1335         ret     z
      00E854 E9               [ 4] 1336         jp      (hl)
      00E855                       1337 special_characters:
      00E855 03                    1338         .db     0x03                                    ;.
      00E856 91 E8                 1339         .dw     chr_03
      00E858                       1340 asc_07:
      00E858 07                    1341         .db     0x07                                    ;.
      00E859 80 EA                 1342         .dw     chr_beep
      00E85B                       1343 asc_08:
      00E85B 08                    1344         .db     0x08                                    ;.
      00E85C 76 EA                 1345         .dw     chr_backspace
      00E85E                       1346 asc_0a:
      00E85E 0A                    1347         .db     0x0a                                    ;.
      00E85F 86 E8                 1348         .dw     chr_line_feed
      00E861                       1349 asc_0c:
      00E861 0C                    1350         .db     0x0c                                    ;.
      00E862 EC E9                 1351         .dw     chr_clear_screen
      00E864                       1352 asc_0d:
      00E864 0D                    1353         .db     0x0d                                    ;.
      00E865 47 E9                 1354         .dw     chr_carrige_returnX
      00E867                       1355 asc_12:
      00E867 12                    1356         .db     0x12                                    ;.
      00E868 94 E8                 1357         .dw     chr_12
      00E86A                       1358 asc_1c:
      00E86A 1C                    1359         .db     0x1c                                    ;.
      00E86B 52 EA                 1360         .dw     chr_cursor_right
      00E86D                       1361 asc_1d:
      00E86D 1D                    1362         .db     0x1d                                    ;.
      00E86E 37 EA                 1363         .dw     chr_cursor_left
      00E870                       1364 asc_1e:
      00E870 1E                    1365         .db     0x1e                                    ;.
      00E871 46 EA                 1366         .dw     chr_cursor_up
      00E873                       1367 asc_1f:
      00E873 1F                    1368         .db     0x1f                                    ;.
      00E874 61 EA                 1369         .dw     chr_cursor_down
      00E876                       1370 asc_7f:
      00E876 7F                    1371         .db     0x7f                                    ;.
      00E877 97 E8                 1372         .dw     chr_7f
      00E879                       1373 asc_99:
      00E879 99                    1374         .db     0x99                                    ;.
      00E87A A0 E8                 1375         .dw     chr_inverse_on
      00E87C                       1376 asc_9a:
      00E87C 9A                    1377         .db     0x9a                                    ;.
      00E87D 9A E8                 1378         .dw     chr_inverse_off
                                   1379 ; unchecked data source
      00E87F 00 00 00 00 00 00 00  1380         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00      ;.......
      00E886                       1381 chr_line_feed:
      00E886 3A 6E E4         [13] 1382         ld      a,(cursor_column)
      00E889 F6 80            [ 7] 1383         or      #0x80                                   
      00E88B 32 CA E4         [13] 1384         ld      (0xe4ca),a                              
      00E88E C3 09 E9         [10] 1385         jp      chr_carrige_return
      00E891                       1386 chr_03:
      00E891 C9               [10] 1387         ret
                                   1388 ; unchecked data source
      00E892 00 00                 1389         .db     0x00,0x00                               ;..
      00E894                       1390 chr_12:
      00E894 C9               [10] 1391         ret
                                   1392 ; unchecked data source
      00E895 00 00                 1393         .db     0x00,0x00                               ;..
      00E897                       1394 chr_7f:
      00E897 C9               [10] 1395         ret
                                   1396 ; unchecked data source
      00E898 00 00                 1397         .db     0x00,0x00                               ;..
      00E89A                       1398 chr_inverse_off:
      00E89A 21 67 E4         [10] 1399         ld      hl,#attrib_color
      00E89D CB BE            [15] 1400         res     7,(hl)                                  ;ATTR_INVERS=0
      00E89F C9               [10] 1401         ret
      00E8A0                       1402 chr_inverse_on:
      00E8A0 21 67 E4         [10] 1403         ld      hl,#attrib_color
      00E8A3 CB FE            [15] 1404         set     7,(hl)                                  ;ATTR_INVERS=1
      00E8A5 C9               [10] 1405         ret
      00E8A6                       1406 kbd_toggle_gled:
      00E8A6 3A 6F E4         [13] 1407         ld      a,(led_status)
      00E8A9 EE 04            [ 7] 1408         xor     #TOGGLE_GLED
      00E8AB                       1409 kbd_update_gled:
      00E8AB 32 6F E4         [13] 1410         ld      (led_status),a
      00E8AE CB 57            [ 8] 1411         bit     2,a                                     ;STATUS_GLED==0
      00E8B0 21 69 E4         [10] 1412         ld      hl,#cfg20_settings
      00E8B3 28 06            [12] 1413         jr      z,m_e8bb
      00E8B5 CB E6            [15] 1414         set     4,(hl)                                  ;GLED=1
      00E8B7                       1415 m_e8b7:
      00E8B7 7E               [ 7] 1416         ld      a,(hl)
      00E8B8 D3 20            [11] 1417         out     (CFG20),a
      00E8BA C9               [10] 1418         ret
      00E8BB                       1419 m_e8bb:
      00E8BB CB A6            [15] 1420         res     4,(hl)                                  ;GLED=0
      00E8BD 18 F8            [12] 1421         jr      m_e8b7
      00E8BF                       1422 m_e8bf:
      00E8BF 3A 6F E4         [13] 1423         ld      a,(led_status)
      00E8C2 EE 01            [ 7] 1424         xor     #TOGGLE_SLED
      00E8C4 32 6F E4         [13] 1425         ld      (led_status),a
      00E8C7 CB 47            [ 8] 1426         bit     0,a                                     ;STATUS_SLED==0
      00E8C9 21 69 E4         [10] 1427         ld      hl,#cfg20_settings
      00E8CC 28 04            [12] 1428         jr      z,m_e8d2
      00E8CE CB EE            [15] 1429         set     5,(hl)                                  ;SLED=1
      00E8D0 18 E5            [12] 1430         jr      m_e8b7
      00E8D2                       1431 m_e8d2:
      00E8D2 CB AE            [15] 1432         res     5,(hl)                                  ;SLED=0
      00E8D4 18 E1            [12] 1433         jr      m_e8b7
      00E8D6                       1434 m_e8d6:
      00E8D6 3A C8 E4         [13] 1435         ld      a,(0xe4c8)                              
      00E8D9 EE 01            [ 7] 1436         xor     #0x01                                   
      00E8DB 32 C8 E4         [13] 1437         ld      (0xe4c8),a                              
      00E8DE 3A 6F E4         [13] 1438         ld      a,(led_status)
      00E8E1 28 05            [12] 1439         jr      z,m_e8e8
      00E8E3 CB D7            [ 8] 1440         set     2,a                                     ;STATUS_GLED=1
      00E8E5                       1441 m_e8e5:
      00E8E5 C3 AB E8         [10] 1442         jp      kbd_update_gled
      00E8E8                       1443 m_e8e8:
      00E8E8 CB 97            [ 8] 1444         res     2,a                                     ;STATUS_GLED=0
      00E8EA 18 F9            [12] 1445         jr      m_e8e5
      00E8EC                       1446 crt_write_char_with_color:
      00E8EC CD BB E9         [17] 1447         call    set_cursor_abs
      00E8EF 3A 66 E4         [13] 1448         ld      a,(buffer_put_char)
      00E8F2 CD 2B EA         [17] 1449         call    wait_flicker_free_save_A
      00E8F5 70               [ 7] 1450         ld      (hl),b
      00E8F6 3A 67 E4         [13] 1451         ld      a,(attrib_color)
      00E8F9 12               [ 7] 1452         ld      (de),a
      00E8FA                       1453 cursor_move_right:
      00E8FA 3A 6E E4         [13] 1454         ld      a,(cursor_column)
      00E8FD 3C               [ 4] 1455         inc     a
      00E8FE 32 6E E4         [13] 1456         ld      (cursor_column),a
      00E901 47               [ 4] 1457         ld      b,a
      00E902 3A 62 E4         [13] 1458         ld      a,(column_count)
      00E905 3D               [ 4] 1459         dec     a
      00E906 B8               [ 4] 1460         cp      b
      00E907 30 28            [12] 1461         jr      nc,crt_set_cursor
      00E909                       1462 chr_carrige_return:
      00E909 3A 6D E4         [13] 1463         ld      a,(cursor_row)
      00E90C 3C               [ 4] 1464         inc     a
      00E90D 32 6D E4         [13] 1465         ld      (cursor_row),a
      00E910 47               [ 4] 1466         ld      b,a
      00E911 3A 65 E4         [13] 1467         ld      a,(0xe465)                              
      00E914 B8               [ 4] 1468         cp      b
      00E915 28 33            [12] 1469         jr      z,m_e94a
      00E917 3A 60 E4         [13] 1470         ld      a,(0xe460)                              
      00E91A B8               [ 4] 1471         cp      b
      00E91B 28 46            [12] 1472         jr      z,m_e963
      00E91D DC 03 EA         [17] 1473         call    c,set_cursor_home
      00E920 18 03            [12] 1474         jr      m_e925
      00E922                       1475 m_e922:
      00E922 CD D1 ED         [17] 1476         call    erase_line
      00E925                       1477 m_e925:
      00E925 3A CA E4         [13] 1478         ld      a,(0xe4ca)                              
      00E928 CB 7F            [ 8] 1479         bit     7,a                                     
      00E92A 28 1B            [12] 1480         jr      z,chr_carrige_returnX
      00E92C E6 7F            [ 7] 1481         and     #0x7f                                   
      00E92E                       1482 m_e92e:
      00E92E 32 6E E4         [13] 1483         ld      (cursor_column),a
      00E931                       1484 crt_set_cursor:
      00E931 CD D0 E9         [17] 1485         call    get_cursor_abs
      00E934 3E 0E            [ 7] 1486         ld      a,#REG_14_CURSOR_H
      00E936 D3 50            [11] 1487         out     (CRT_REG),a
      00E938 7C               [ 4] 1488         ld      a,h
      00E939 D3 51            [11] 1489         out     (CRT_DATA),a
      00E93B 3E 0F            [ 7] 1490         ld      a,#REG_14_CURSOR_L
      00E93D D3 50            [11] 1491         out     (CRT_REG),a
      00E93F 7D               [ 4] 1492         ld      a,l
      00E940 D3 51            [11] 1493         out     (CRT_DATA),a
      00E942 AF               [ 4] 1494         xor     a
      00E943 32 CA E4         [13] 1495         ld      (0xe4ca),a                              
      00E946 C9               [10] 1496         ret
      00E947                       1497 chr_carrige_returnX:
      00E947 AF               [ 4] 1498         xor     a
      00E948 18 E4            [12] 1499         jr      m_e92e
      00E94A                       1500 m_e94a:
      00E94A 3A 63 E4         [13] 1501         ld      a,(0xe463)                              
      00E94D CD 7D E9         [17] 1502         call    crt_set_cursor_at_row_start
      00E950 28 D3            [12] 1503         jr      z,m_e925
      00E952 3A 64 E4         [13] 1504         ld      a,(0xe464)                              
      00E955 FE 01            [ 7] 1505         cp      #0x01                                   
      00E957 C4 8A E9         [17] 1506         call    nz,_m32
      00E95A 3A 65 E4         [13] 1507         ld      a,(0xe465)                              
      00E95D                       1508 m_e95d:
      00E95D 3D               [ 4] 1509         dec     a
      00E95E 32 6D E4         [13] 1510         ld      (cursor_row),a
      00E961 18 BF            [12] 1511         jr      m_e922
      00E963                       1512 m_e963:
      00E963 3A 65 E4         [13] 1513         ld      a,(0xe465)                              
      00E966 CD 7D E9         [17] 1514         call    crt_set_cursor_at_row_start
      00E969 28 BA            [12] 1515         jr      z,m_e925
      00E96B 3A 65 E4         [13] 1516         ld      a,(0xe465)                              
      00E96E 47               [ 4] 1517         ld      b,a
      00E96F 3A 60 E4         [13] 1518         ld      a,(0xe460)                              
      00E972 90               [ 4] 1519         sub     b
      00E973 FE 01            [ 7] 1520         cp      #0x01                                   
      00E975 C4 8A E9         [17] 1521         call    nz,_m32
      00E978 3A 60 E4         [13] 1522         ld      a,(0xe460)                              
      00E97B 18 E0            [12] 1523         jr      m_e95d
      00E97D                       1524 crt_set_cursor_at_row_start:
      00E97D 32 6D E4         [13] 1525         ld      (cursor_row),a
      00E980 AF               [ 4] 1526         xor     a
      00E981 32 6E E4         [13] 1527         ld      (cursor_column),a
      00E984 3A 6A E4         [13] 1528         ld      a,(screen_driver_settings)
      00E987 E6 01            [ 7] 1529         and     #MASK_ESC_0C_SCROLL_MODE
      00E989 C9               [10] 1530         ret
      00E98A                       1531 _m32:
      00E98A 3D               [ 4] 1532         dec     a
      00E98B 21 00 00         [10] 1533         ld      hl,#0
      00E98E 16 00            [ 7] 1534         ld      d,#HIGH_ZERO
      00E990 CD E2 E9         [17] 1535         call    calc_column_offset
      00E993 22 94 E4         [16] 1536         ld      (column_offset_tmp),hl
      00E996 CD BB E9         [17] 1537         call    set_cursor_abs
      00E999 D5               [11] 1538         push    de
      00E99A CD 9E E9         [17] 1539         call    m_e99e
      00E99D E1               [10] 1540         pop     hl
      00E99E                       1541 m_e99e:
      00E99E EB               [ 4] 1542         ex      de,hl
      00E99F 3A 62 E4         [13] 1543         ld      a,(column_count)
      00E9A2 6F               [ 4] 1544         ld      l,a
      00E9A3 26 00            [ 7] 1545         ld      h,#HIGH_ZERO
      00E9A5 19               [11] 1546         add     hl,de
      00E9A6 ED 4B 94 E4      [20] 1547         ld      bc,(column_offset_tmp)
      00E9AA                       1548 m_e9aa:
      00E9AA DB 10            [11] 1549         in      a,(STATUS10)
      00E9AC 17               [ 4] 1550         rla
      00E9AD 30 FB            [12] 1551         jr      nc,m_e9aa
      00E9AF ED A0            [16] 1552         ldi
      00E9B1 ED A0            [16] 1553         ldi
      00E9B3 00               [ 4] 1554         nop
      00E9B4 00               [ 4] 1555         nop
      00E9B5 00               [ 4] 1556         nop
      00E9B6 00               [ 4] 1557         nop
      00E9B7 EA AA E9         [10] 1558         jp      pe,m_e9aa
      00E9BA C9               [10] 1559         ret
      00E9BB                       1560 set_cursor_abs:
      00E9BB CD D0 E9         [17] 1561         call    get_cursor_abs
      00E9BE 11 00 F0         [10] 1562         ld      de,#BWS
      00E9C1 19               [11] 1563         add     hl,de
      00E9C2 22 90 E4         [16] 1564         ld      (cursor_abs),hl
      00E9C5 E5               [11] 1565         push    hl
      00E9C6 11 00 08         [10] 1566         ld      de,#OFFSET_COLOR
      00E9C9 19               [11] 1567         add     hl,de
      00E9CA 22 92 E4         [16] 1568         ld      (cursor_abs_color),hl
      00E9CD EB               [ 4] 1569         ex      de,hl
      00E9CE E1               [10] 1570         pop     hl
      00E9CF C9               [10] 1571         ret
      00E9D0                       1572 get_cursor_abs:
      00E9D0 21 00 00         [10] 1573         ld      hl,#0
      00E9D3 16 00            [ 7] 1574         ld      d,#HIGH_ZERO
      00E9D5 3A 6D E4         [13] 1575         ld      a,(cursor_row)
      00E9D8 B7               [ 4] 1576         or      a
      00E9D9 C4 E2 E9         [17] 1577         call    nz,calc_column_offset
      00E9DC 3A 6E E4         [13] 1578         ld      a,(cursor_column)
      00E9DF 5F               [ 4] 1579         ld      e,a
      00E9E0 19               [11] 1580         add     hl,de
      00E9E1 C9               [10] 1581         ret
      00E9E2                       1582 calc_column_offset:
      00E9E2 47               [ 4] 1583         ld      b,a
      00E9E3 3A 62 E4         [13] 1584         ld      a,(column_count)
      00E9E6 5F               [ 4] 1585         ld      e,a
      00E9E7                       1586 add_column_size:
      00E9E7 19               [11] 1587         add     hl,de
      00E9E8 05               [ 4] 1588         dec     b
      00E9E9 20 FC            [12] 1589         jr      nz,add_column_size
      00E9EB C9               [10] 1590         ret
      00E9EC                       1591 chr_clear_screen:
      00E9EC 3E 07            [ 7] 1592         ld      a,#FG_WHITE|BG_BLACK
      00E9EE 32 67 E4         [13] 1593         ld      (attrib_color),a
      00E9F1                       1594 clear_screen_width_color:
      00E9F1 32 00 F8         [13] 1595         ld      (BWS+OFFSET_COLOR),a
      00E9F4 21 00 F0         [10] 1596         ld      hl,#BWS
      00E9F7 0E 19            [ 7] 1597         ld      c,#SCREEN_HEIGHT+1
      00E9F9 CD 0D EA         [17] 1598         call    wait_vsync
      00E9FC AF               [ 4] 1599         xor     a
      00E9FD CD A5 ED         [17] 1600         call    fill_bws_rows
      00EA00 CD 1A EA         [17] 1601         call    is_vsync
      00EA03                       1602 set_cursor_home:
      00EA03 AF               [ 4] 1603         xor     a
      00EA04 32 6D E4         [13] 1604         ld      (cursor_row),a
      00EA07 32 6E E4         [13] 1605         ld      (cursor_column),a
      00EA0A C3 31 E9         [10] 1606         jp      crt_set_cursor
      00EA0D                       1607 wait_vsync:
      00EA0D DB 30            [11] 1608         in      a,(STATUS30)
      00EA0F CB 4F            [ 8] 1609         bit     1,a                                     ;_CRT_VSYNC_PERIOD==0
      00EA11 28 FA            [12] 1610         jr      z,wait_vsync
      00EA13                       1611 display_inhibit:
      00EA13 3A 68 E4         [13] 1612         ld      a,(cfg10_settings)
      00EA16 CB CF            [ 8] 1613         set     1,a                                     ;_DISPLAY_INHIBIT=1
      00EA18 18 0B            [12] 1614         jr      display_status_set
      00EA1A                       1615 is_vsync:
      00EA1A DB 30            [11] 1616         in      a,(STATUS30)
      00EA1C CB 4F            [ 8] 1617         bit     1,a                                     ;_CRT_VSYNC_PERIOD==0
      00EA1E 28 FA            [12] 1618         jr      z,is_vsync
      00EA20                       1619 display_enable:
      00EA20 3A 68 E4         [13] 1620         ld      a,(cfg10_settings)
      00EA23 CB 8F            [ 8] 1621         res     1,a                                     ;_DISPLAY_INHIBIT=0
      00EA25                       1622 display_status_set:
      00EA25 32 68 E4         [13] 1623         ld      (cfg10_settings),a
      00EA28 D3 10            [11] 1624         out     (CFG10),a
      00EA2A C9               [10] 1625         ret
      00EA2B                       1626 wait_flicker_free_save_A:
      00EA2B 47               [ 4] 1627         ld      b,a
      00EA2C                       1628 wait_flicker_free:
      00EA2C DB 10            [11] 1629         in      a,(STATUS10)
      00EA2E 17               [ 4] 1630         rla
      00EA2F 38 FB            [12] 1631         jr      c,wait_flicker_free
      00EA31                       1632 _mb:
      00EA31 DB 10            [11] 1633         in      a,(STATUS10)
      00EA33 17               [ 4] 1634         rla
      00EA34 30 FB            [12] 1635         jr      nc,_mb
      00EA36 C9               [10] 1636         ret
      00EA37                       1637 chr_cursor_left:
      00EA37 3A 6E E4         [13] 1638         ld      a,(cursor_column)
      00EA3A 3D               [ 4] 1639         dec     a
      00EA3B FE FF            [ 7] 1640         cp      #-1
      00EA3D 20 32            [12] 1641         jr      nz,cursor_store_column
      00EA3F 3A 62 E4         [13] 1642         ld      a,(column_count)
      00EA42 3D               [ 4] 1643         dec     a
      00EA43 32 6E E4         [13] 1644         ld      (cursor_column),a
      00EA46                       1645 chr_cursor_up:
      00EA46 3A 6D E4         [13] 1646         ld      a,(cursor_row)
      00EA49 3D               [ 4] 1647         dec     a
      00EA4A FE FF            [ 7] 1648         cp      #-1
      00EA4C 20 1D            [12] 1649         jr      nz,cursor_row_adjusted
      00EA4E 3E 17            [ 7] 1650         ld      a,#SCREEN_HEIGHT-1
      00EA50 18 19            [12] 1651         jr      cursor_row_adjusted
      00EA52                       1652 chr_cursor_right:
      00EA52 3A 62 E4         [13] 1653         ld      a,(column_count)
      00EA55 47               [ 4] 1654         ld      b,a
      00EA56 3A 6E E4         [13] 1655         ld      a,(cursor_column)
      00EA59 3C               [ 4] 1656         inc     a
      00EA5A B8               [ 4] 1657         cp      b
      00EA5B 38 14            [12] 1658         jr      c,cursor_store_column
      00EA5D AF               [ 4] 1659         xor     a
      00EA5E 32 6E E4         [13] 1660         ld      (cursor_column),a
      00EA61                       1661 chr_cursor_down:
      00EA61 06 18            [ 7] 1662         ld      b,#SCREEN_HEIGHT
      00EA63 3A 6D E4         [13] 1663         ld      a,(cursor_row)
      00EA66 3C               [ 4] 1664         inc     a
      00EA67 B8               [ 4] 1665         cp      b
      00EA68 38 01            [12] 1666         jr      c,cursor_row_adjusted
      00EA6A AF               [ 4] 1667         xor     a
      00EA6B                       1668 cursor_row_adjusted:
      00EA6B 32 6D E4         [13] 1669         ld      (cursor_row),a
      00EA6E                       1670 _set_cursor:
      00EA6E C3 31 E9         [10] 1671         jp      crt_set_cursor
      00EA71                       1672 cursor_store_column:
      00EA71 32 6E E4         [13] 1673         ld      (cursor_column),a
      00EA74 18 F8            [12] 1674         jr      _set_cursor
      00EA76                       1675 chr_backspace:
      00EA76 CD BB E9         [17] 1676         call    set_cursor_abs
      00EA79 CD 2C EA         [17] 1677         call    wait_flicker_free
      00EA7C 36 20            [10] 1678         ld      (hl),#' '
      00EA7E 18 B7            [12] 1679         jr      chr_cursor_left
      00EA80                       1680 chr_beep:
      00EA80 E5               [11] 1681         push    hl
      00EA81 21 68 E4         [10] 1682         ld      hl,#cfg10_settings
      00EA84 CB E6            [15] 1683         set     4,(hl)                                  ;_BUZZER_ON=1
      00EA86 7E               [ 7] 1684         ld      a,(hl)
      00EA87 D3 10            [11] 1685         out     (CFG10),a
      00EA89 E5               [11] 1686         push    hl
      00EA8A 2A D2 E4         [16] 1687         ld      hl,(beep_delay)
      00EA8D CD 7B E6         [17] 1688         call    delay
      00EA90 E1               [10] 1689         pop     hl
      00EA91                       1690 _buz_off:
      00EA91 CB A6            [15] 1691         res     4,(hl)                                  ;_BUZZER_ON=0
      00EA93                       1692 _mc:
      00EA93 7E               [ 7] 1693         ld      a,(hl)
      00EA94 D3 10            [11] 1694         out     (CFG10),a
      00EA96 E1               [10] 1695         pop     hl
      00EA97 C9               [10] 1696         ret
      00EA98                       1697 buzzer_on:
      00EA98 E5               [11] 1698         push    hl
      00EA99 21 68 E4         [10] 1699         ld      hl,#cfg10_settings
      00EA9C CB E6            [15] 1700         set     4,(hl)                                  ;_BUZZER_ON=1
      00EA9E 18 F3            [12] 1701         jr      _mc
      00EAA0                       1702 buzzer_off:
      00EAA0 E5               [11] 1703         push    hl
      00EAA1 21 68 E4         [10] 1704         ld      hl,#cfg10_settings
      00EAA4 18 EB            [12] 1705         jr      _buz_off
      00EAA6                       1706 brk_exit:
      00EAA6 DB 2A            [11] 1707         in      a,(STATUS_KBD+10)
      00EAA8 B7               [ 4] 1708         or      a
      00EAA9 CB 7F            [ 8] 1709         bit     7,a                                     ;KBD_BREAK==0
      00EAAB C8               [11] 1710         ret     z
      00EAAC 3A D0 E4         [13] 1711         ld      a,(os_patch)
      00EAAF B7               [ 4] 1712         or      a
      00EAB0 CA 00 00         [10] 1713         jp      z,cold_start
      00EAB3 1E 18            [ 7] 1714         ld      e,#0x18                                 
      00EAB5 37               [ 4] 1715         scf
      00EAB6 C9               [10] 1716         ret
      00EAB7                       1717 lpt_busy:
      00EAB7 CD A6 EA         [17] 1718         call    brk_exit
      00EABA DB 30            [11] 1719         in      a,(STATUS30)
      00EABC CB 5F            [ 8] 1720         bit     3,a                                     ;_CEN_BUSY==0
      00EABE 3E 00            [ 7] 1721         ld      a,#0
      00EAC0 C8               [11] 1722         ret     z
      00EAC1 3E FF            [ 7] 1723         ld      a,#-1
      00EAC3 C9               [10] 1724         ret
      00EAC4                       1725 lpt_write_byte:
      00EAC4 CD 45 E4         [17] 1726         call    dev_printer_busy
      00EAC7 D8               [11] 1727         ret     c
      00EAC8 20 FA            [12] 1728         jr      nz,lpt_write_byte
      00EACA 79               [ 4] 1729         ld      a,c
      00EACB D3 30            [11] 1730         out     (CEN_DATA),a
      00EACD 3A 69 E4         [13] 1731         ld      a,(cfg20_settings)
      00EAD0 CB D7            [ 8] 1732         set     2,a                                     ;CEN_STROBE=1
      00EAD2 D3 20            [11] 1733         out     (CFG20),a
      00EAD4 CB 97            [ 8] 1734         res     2,a                                     ;CEN_STROBE=0
      00EAD6 D3 20            [11] 1735         out     (CFG20),a
      00EAD8                       1736 _m26:
      00EAD8 DB 30            [11] 1737         in      a,(STATUS30)
      00EADA CB 57            [ 8] 1738         bit     2,a                                     ;_CEN_ACKNOWLEDGE==0
      00EADC 20 01            [12] 1739         jr      nz,_m25
      00EADE C9               [10] 1740         ret
      00EADF                       1741 _m25:
      00EADF CD A6 EA         [17] 1742         call    brk_exit
      00EAE2 D8               [11] 1743         ret     c
      00EAE3 18 F3            [12] 1744         jr      _m26
      00EAE5                       1745 com_tx_ready:
      00EAE5 DB 41            [11] 1746         in      a,(0x41)                                
      00EAE7 CD 0A EB         [17] 1747         call    _m30
      00EAEA 28 F9            [12] 1748         jr      z,com_tx_ready
      00EAEC 18 06            [12] 1749         jr      _m27
      00EAEE                       1750 com_write_byte:
      00EAEE CD 01 EB         [17] 1751         call    _m31
      00EAF1 D8               [11] 1752         ret     c
      00EAF2 28 FA            [12] 1753         jr      z,com_write_byte
      00EAF4                       1754 _m27:
      00EAF4 79               [ 4] 1755         ld      a,c
      00EAF5 D3 40            [11] 1756         out     (0x40),a                                
      00EAF7 C9               [10] 1757         ret
      00EAF8                       1758 com_read_byte:
      00EAF8 CD 12 EB         [17] 1759         call    com_rx_ready
      00EAFB D8               [11] 1760         ret     c
      00EAFC 28 FA            [12] 1761         jr      z,com_read_byte
      00EAFE DB 40            [11] 1762         in      a,(0x40)                                
      00EB00 C9               [10] 1763         ret
      00EB01                       1764 _m31:
      00EB01 CD A6 EA         [17] 1765         call    brk_exit
      00EB04 DB 41            [11] 1766         in      a,(UART_CONTROL)
      00EB06 CB 7F            [ 8] 1767         bit     7,a                                     
      00EB08 28 05            [12] 1768         jr      z,_m2f
      00EB0A                       1769 _m30:
      00EB0A CB 47            [ 8] 1770         bit     0,a                                     
      00EB0C 3E FF            [ 7] 1771         ld      a,#0xff                                 
      00EB0E C0               [11] 1772         ret     nz
      00EB0F                       1773 _m2f:
      00EB0F 3E 00            [ 7] 1774         ld      a,#0x00                                 
      00EB11 C9               [10] 1775         ret
      00EB12                       1776 com_rx_ready:
      00EB12 CD A6 EA         [17] 1777         call    brk_exit
      00EB15 DB 41            [11] 1778         in      a,(0x41)                                
      00EB17 CB 4F            [ 8] 1779         bit     1,a                                     
      00EB19 3E 00            [ 7] 1780         ld      a,#0x00                                 
      00EB1B C8               [11] 1781         ret     z
      00EB1C 3E FF            [ 7] 1782         ld      a,#0xff                                 
      00EB1E C9               [10] 1783         ret
      00EB1F                       1784 unreferenced_06:
      00EB1F 3E FE            [ 7] 1785         ld      a,#0xfe                                 
      00EB21 D3 41            [11] 1786         out     (UART_CONTROL),a
      00EB23 3E 37            [ 7] 1787         ld      a,#0x37                                 
      00EB25 D3 41            [11] 1788         out     (UART_CONTROL),a
      00EB27 3A 68 E4         [13] 1789         ld      a,(cfg10_settings)
      00EB2A CB 97            [ 8] 1790         res     2,a                                     ;CMT_RS232_SELECT=0
      00EB2C 18 0D            [12] 1791         jr      set_cfg10
      00EB2E                       1792 init_serial:
      00EB2E 3E EE            [ 7] 1793         ld      a,#0xee                                 
      00EB30 D3 41            [11] 1794         out     (UART_CONTROL),a
      00EB32 3E 37            [ 7] 1795         ld      a,#0x37                                 
      00EB34 D3 41            [11] 1796         out     (UART_CONTROL),a
      00EB36 3A 68 E4         [13] 1797         ld      a,(cfg10_settings)
      00EB39 CB D7            [ 8] 1798         set     2,a                                     ;CMT_RS232_SELECT=1
      00EB3B                       1799 set_cfg10:
      00EB3B D3 10            [11] 1800         out     (CFG10),a
      00EB3D 32 68 E4         [13] 1801         ld      (cfg10_settings),a
      00EB40 C9               [10] 1802         ret
      00EB41                       1803 unreferenced_07:
      00EB41 3A 68 E4         [13] 1804         ld      a,(cfg10_settings)
      00EB44 CB DF            [ 8] 1805         set     3,a                                     ;CMT_MOTOR_START=1
      00EB46                       1806 _ma:
      00EB46 D3 10            [11] 1807         out     (CFG10),a
      00EB48 32 68 E4         [13] 1808         ld      (cfg10_settings),a
      00EB4B C9               [10] 1809         ret
      00EB4C                       1810 unreferenced_08:
      00EB4C 3A 68 E4         [13] 1811         ld      a,(cfg10_settings)
      00EB4F CB 9F            [ 8] 1812         res     3,a                                     ;CMT_MOTOR_START=0
      00EB51 18 F3            [12] 1813         jr      _ma
      00EB53                       1814 map_esc_list:
      00EB53 09                    1815         .db     0x09                                    ;.
      00EB54 D3 EC                 1816         .dw     alternate_keyboard_table
      00EB56                       1817 map_ch_0c:
      00EB56 0C                    1818         .db     0x0c                                    ;.
      00EB57 15 EC                 1819         .dw     function_0c
      00EB59                       1820 map_ch_10:
      00EB59 10                    1821         .db     0x10                                    ;.
      00EB5A 15 EC                 1822         .dw     function_0c
      00EB5C                       1823 map_ch_11:
      00EB5C 11                    1824         .db     0x11                                    ;.
      00EB5D 03 EA                 1825         .dw     set_cursor_home
      00EB5F                       1826 map_ch_12:
      00EB5F 12                    1827         .db     0x12                                    ;.
      00EB60 93 EC                 1828         .dw     set_cursor_off
      00EB62                       1829 map_ch_13:
      00EB62 13                    1830         .db     0x13                                    ;.
      00EB63 8F EC                 1831         .dw     set_cursor_on
      00EB65                       1832 map_ch_16:
      00EB65 16                    1833         .db     0x16                                    ;.
      00EB66 15 EC                 1834         .dw     function_0c
      00EB68                       1835 map_ch_17:
      00EB68 17                    1836         .db     0x17                                    ;.
      00EB69 A8 EC                 1837         .dw     get_cursor_pos
      00EB6B                       1838 map_ch_18:
      00EB6B 18                    1839         .db     0x18                                    ;.
      00EB6C 6C ED                 1840         .dw     write_character
      00EB6E                       1841 map_ch_19:
      00EB6E 19                    1842         .db     0x19                                    ;.
      00EB6F 9B ED                 1843         .dw     erase_rest_of_line
      00EB71                       1844 map_ch_1a:
      00EB71 1A                    1845         .db     0x1a                                    ;.
      00EB72 52 EA                 1846         .dw     chr_cursor_right
      00EB74                       1847 map_ch_1c:
      00EB74 1C                    1848         .db     0x1c                                    ;.
      00EB75 8A ED                 1849         .dw     read_character
      00EB77                       1850 map_ch_1d:
      00EB77 1D                    1851         .db     0x1d                                    ;.
      00EB78 15 EC                 1852         .dw     function_0c
      00EB7A                       1853 map_ch_31:
      00EB7A 31                    1854         .db     0x31                                    ;1
      00EB7B 1A EC                 1855         .dw     graphic_mode_on
      00EB7D                       1856 map_ch_41:
      00EB7D 41                    1857         .db     0x41                                    ;A
      00EB7E 46 EA                 1858         .dw     chr_cursor_up
      00EB80                       1859 map_ch_42:
      00EB80 42                    1860         .db     0x42                                    ;B
      00EB81 61 EA                 1861         .dw     chr_cursor_down
      00EB83                       1862 map_ch_43:
      00EB83 43                    1863         .db     0x43                                    ;C
      00EB84 52 EA                 1864         .dw     chr_cursor_right
      00EB86                       1865 map_ch_44:
      00EB86 44                    1866         .db     0x44                                    ;D
      00EB87 37 EA                 1867         .dw     chr_cursor_left
      00EB89                       1868 map_ch_45:
      00EB89 45                    1869         .db     0x45                                    ;E
      00EB8A EC E9                 1870         .dw     chr_clear_screen
      00EB8C                       1871 map_ch_46:
      00EB8C 46                    1872         .db     0x46                                    ;F
      00EB8D D1 ED                 1873         .dw     erase_line
      00EB8F                       1874 map_ch_47:
      00EB8F 47                    1875         .db     0x47                                    ;G
      00EB90 15 EC                 1876         .dw     function_0c
      00EB92                       1877 map_ch_48:
      00EB92 48                    1878         .db     0x48                                    ;H
      00EB93 03 EA                 1879         .dw     set_cursor_home
      00EB95                       1880 map_ch_49:
      00EB95 49                    1881         .db     0x49                                    ;I
      00EB96 15 EC                 1882         .dw     function_0c
      00EB98                       1883 map_ch_4a:
      00EB98 4A                    1884         .db     0x4a                                    ;J
      00EB99 DF ED                 1885         .dw     erase_rest_of_screen
      00EB9B                       1886 map_ch_4b:
      00EB9B 4B                    1887         .db     0x4b                                    ;K
      00EB9C 9B ED                 1888         .dw     erase_rest_of_line
      00EB9E                       1889 map_ch_53:
      00EB9E 53                    1890         .db     0x53                                    ;S
      00EB9F 15 EC                 1891         .dw     function_0c
      00EBA1                       1892 map_ch_54:
      00EBA1 54                    1893         .db     0x54                                    ;T
      00EBA2 15 EC                 1894         .dw     function_0c
      00EBA4                       1895 map_ch_55:
      00EBA4 55                    1896         .db     0x55                                    ;U
      00EBA5 15 EC                 1897         .dw     function_0c
      00EBA7                       1898 map_ch_56:
      00EBA7 56                    1899         .db     0x56                                    ;V
      00EBA8 15 EC                 1900         .dw     function_0c
      00EBAA                       1901 map_ch_59:
      00EBAA 59                    1902         .db     0x59                                    ;Y
      00EBAB 15 EC                 1903         .dw     function_0c
      00EBAD                       1904 map_ch_end:
      00EBAD 00                    1905         .db     0x00                                    ;.
      00EBAE                       1906 map_more_codes:
      00EBAE 0C                    1907         .db     0x0c                                    ;.
      00EBAF E3 EC                 1908         .dw     ESC_0C_Initialize_Screen_driver
      00EBB1                       1909 map_ESC_10:
      00EBB1 10                    1910         .db     0x10                                    ;.
      00EBB2 2C EE                 1911         .dw     ESC_10_output_blanks
      00EBB4                       1912 map_ESC_16:
      00EBB4 16                    1913         .db     0x16                                    ;.
      00EBB5 37 ED                 1914         .dw     esc_16_set_cursor
      00EBB7                       1915 map_esc_1d:
      00EBB7 1D                    1916         .db     0x1d                                    ;.
      00EBB8 61 EE                 1917         .dw     esc_1d_outputs_characters
      00EBBA                       1918 map_esc_47:
      00EBBA 47                    1919         .db     0x47                                    ;G
      00EBBB E9 ED                 1920         .dw     esc_47_delecte_character_to_column
      00EBBD                       1921 map_esc_49:
      00EBBD 49                    1922         .db     0x49                                    ;I
      00EBBE FE ED                 1923         .dw     esc_49_insert_character
      00EBC0                       1924 map_esc_53:
      00EBC0 53                    1925         .db     0x53                                    ;S
      00EBC1 77 EE                 1926         .dw     esc_53_select_screen_width
      00EBC3                       1927 map_esc_54:
      00EBC3 54                    1928         .db     0x54                                    ;T
      00EBC4 36 EC                 1929         .dw     esc_set_color_attribute
      00EBC6                       1930 map_esc_55:
      00EBC6 55                    1931         .db     0x55                                    ;U
      00EBC7 36 EC                 1932         .dw     esc_set_color_attribute
      00EBC9                       1933 map_esc_56:
      00EBC9 56                    1934         .db     0x56                                    ;V
      00EBCA 6C EC                 1935         .dw     esc_set_screen_attribute
      00EBCC                       1936 map_esc_59:
      00EBCC 59                    1937         .db     0x59                                    ;Y
      00EBCD 1D ED                 1938         .dw     esc_position_cursor
      00EBCF                       1939 map_esc_96:
      00EBCF 96                    1940         .db     0x96                                    ;.
      00EBD0 67 ED                 1941         .dw     function_more_0c11
      00EBD2                       1942 map_esc_9d:
      00EBD2 9D                    1943         .db     0x9d                                    ;.
      00EBD3 6A EE                 1944         .dw     function_more_0c12
      00EBD5                       1945 map_esc_b1:
      00EBD5 B1                    1946         .db     0xb1                                    ;1
      00EBD6 EF EC                 1947         .dw     function_more_0c13
      00EBD8                       1948 map_esc_b2:
      00EBD8 B2                    1949         .db     0xb2                                    ;2
      00EBD9 10 ED                 1950         .dw     function_more_0c14
      00EBDB                       1951 map_esc_d4:
      00EBDB D4                    1952         .db     0xd4                                    ;T
      00EBDC 3F EC                 1953         .dw     function_more_0c15
      00EBDE                       1954 map_esc_d5:
      00EBDE D5                    1955         .db     0xd5                                    ;U
      00EBDF 3F EC                 1956         .dw     function_more_0c15
      00EBE1                       1957 map_esc_d9:
      00EBE1 D9                    1958         .db     0xd9                                    ;Y
      00EBE2 44 ED                 1959         .dw     function_more_0c17
      00EBE4                       1960 map_more_codes_end:
      00EBE4 00                    1961         .db     0x00                                    ;.
      00EBE5                       1962 _m2e:
      00EBE5 FE 01            [ 7] 1963         cp      #0x01                                   
      00EBE7 C2 05 EC         [10] 1964         jp      nz,_m2d
      00EBEA AF               [ 4] 1965         xor     a
      00EBEB 32 8C E4         [13] 1966         ld      (input_mode),a
      00EBEE 32 CB E4         [13] 1967         ld      (cursor_flag),a
      00EBF1 79               [ 4] 1968         ld      a,c
      00EBF2 FE 61            [ 7] 1969         cp      #0x61                                   
      00EBF4 38 07            [12] 1970         jr      c,_m6
      00EBF6 FE 7B            [ 7] 1971         cp      #0x7b                                   
      00EBF8 30 03            [12] 1972         jr      nc,_m6
      00EBFA E6 5F            [ 7] 1973         and     #0x5f                                   
      00EBFC 4F               [ 4] 1974         ld      c,a
      00EBFD                       1975 _m6:
      00EBFD 21 53 EB         [10] 1976         ld      hl,#map_esc_list
      00EC00 CD 21 EC         [17] 1977         call    map_C_to_PTR
      00EC03 C8               [11] 1978         ret     z
      00EC04 E9               [ 4] 1979         jp      (hl)
      00EC05                       1980 _m2d:
      00EC05 4F               [ 4] 1981         ld      c,a
      00EC06 AF               [ 4] 1982         xor     a
      00EC07 32 8C E4         [13] 1983         ld      (input_mode),a
      00EC0A 21 AE EB         [10] 1984         ld      hl,#map_more_codes
      00EC0D CD 21 EC         [17] 1985         call    map_C_to_PTR
      00EC10 C8               [11] 1986         ret     z
      00EC11 E9               [ 4] 1987         jp      (hl)
      00EC12                       1988 input_mode_clear:
      00EC12 AF               [ 4] 1989         xor     a
      00EC13 18 01            [12] 1990         jr      _m2
      00EC15                       1991 function_0c:
      00EC15 79               [ 4] 1992         ld      a,c
      00EC16                       1993 _m2:
      00EC16 32 8C E4         [13] 1994         ld      (input_mode),a
      00EC19 C9               [10] 1995         ret
      00EC1A                       1996 graphic_mode_on:
      00EC1A 79               [ 4] 1997         ld      a,c
      00EC1B F6 80            [ 7] 1998         or      #INPUT_MODE_GRAPH
      00EC1D 32 8C E4         [13] 1999         ld      (input_mode),a
      00EC20 C9               [10] 2000         ret
      00EC21                       2001 map_C_to_PTR:
      00EC21 7E               [ 7] 2002         ld      a,(hl)
      00EC22 B7               [ 4] 2003         or      a
      00EC23 C8               [11] 2004         ret     z
      00EC24 B9               [ 4] 2005         cp      c
      00EC25 28 05            [12] 2006         jr      z,key_found
      00EC27 23               [ 6] 2007         inc     hl
      00EC28 23               [ 6] 2008         inc     hl
      00EC29 23               [ 6] 2009         inc     hl
      00EC2A 18 F5            [12] 2010         jr      map_C_to_PTR
      00EC2C                       2011 key_found:
      00EC2C D5               [11] 2012         push    de
      00EC2D 23               [ 6] 2013         inc     hl
      00EC2E 5E               [ 7] 2014         ld      e,(hl)
      00EC2F 23               [ 6] 2015         inc     hl
      00EC30 56               [ 7] 2016         ld      d,(hl)
      00EC31 EB               [ 4] 2017         ex      de,hl
      00EC32 D1               [10] 2018         pop     de
      00EC33 79               [ 4] 2019         ld      a,c
      00EC34 B7               [ 4] 2020         or      a
      00EC35 C9               [10] 2021         ret
      00EC36                       2022 esc_set_color_attribute:
      00EC36 CD 85 EC         [17] 2023         call    _fetch_color_attribute
      00EC39 D8               [11] 2024         ret     c
      00EC3A 32 99 E4         [13] 2025         ld      (attrib_tmp),a
      00EC3D 18 DB            [12] 2026         jr      graphic_mode_on
      00EC3F                       2027 function_more_0c15:
      00EC3F CD 85 EC         [17] 2028         call    _fetch_color_attribute
      00EC42 D8               [11] 2029         ret     c
      00EC43 47               [ 4] 2030         ld      b,a
      00EC44 3A 6A E4         [13] 2031         ld      a,(screen_driver_settings)
      00EC47 CB 77            [ 8] 2032         bit     6,a                                     ;ESC_0C_FB_SAME_COLOR==0
      00EC49 3A 99 E4         [13] 2033         ld      a,(attrib_tmp)
      00EC4C 20 02            [12] 2034         jr      nz,_m1
      00EC4E B8               [ 4] 2035         cp      b
      00EC4F C8               [11] 2036         ret     z
      00EC50                       2037 _m1:
      00EC50 F5               [11] 2038         push    af
      00EC51 78               [ 4] 2039         ld      a,b
      00EC52 07               [ 4] 2040         rlca
      00EC53 07               [ 4] 2041         rlca
      00EC54 07               [ 4] 2042         rlca
      00EC55 47               [ 4] 2043         ld      b,a
      00EC56 F1               [10] 2044         pop     af
      00EC57 B0               [ 4] 2045         or      b
      00EC58 47               [ 4] 2046         ld      b,a
      00EC59 3A 67 E4         [13] 2047         ld      a,(attrib_color)
      00EC5C E6 C0            [ 7] 2048         and     #MASK_ATTR
      00EC5E B0               [ 4] 2049         or      b
      00EC5F 32 67 E4         [13] 2050         ld      (attrib_color),a
      00EC62 79               [ 4] 2051         ld      a,c
      00EC63 FE D4            [ 7] 2052         cp      #0xd4                                   
      00EC65 C0               [11] 2053         ret     nz
      00EC66 3A 67 E4         [13] 2054         ld      a,(attrib_color)
      00EC69 C3 F1 E9         [10] 2055         jp      clear_screen_width_color
      00EC6C                       2056 esc_set_screen_attribute:
      00EC6C 21 67 E4         [10] 2057         ld      hl,#attrib_color
      00EC6F 3A 66 E4         [13] 2058         ld      a,(buffer_put_char)
      00EC72 FE 30            [ 7] 2059         cp      #'0'
      00EC74 D8               [11] 2060         ret     c
      00EC75 FE 34            [ 7] 2061         cp      #'4'
      00EC77 D0               [11] 2062         ret     nc
      00EC78 CB 0F            [ 8] 2063         rrc     a
      00EC7A CB 0F            [ 8] 2064         rrc     a
      00EC7C E6 C0            [ 7] 2065         and     #MASK_ATTR
      00EC7E 47               [ 4] 2066         ld      b,a
      00EC7F 7E               [ 7] 2067         ld      a,(hl)
      00EC80 E6 3F            [ 7] 2068         and     #~MASK_ATTR
      00EC82 B0               [ 4] 2069         or      b
      00EC83 77               [ 7] 2070         ld      (hl),a
      00EC84 C9               [10] 2071         ret
      00EC85                       2072 _fetch_color_attribute:
      00EC85 3A 66 E4         [13] 2073         ld      a,(buffer_put_char)
      00EC88 D6 30            [ 7] 2074         sub     #0x30
      00EC8A D8               [11] 2075         ret     c
      00EC8B FE 08            [ 7] 2076         cp      #8
      00EC8D 3F               [ 4] 2077         ccf
      00EC8E C9               [10] 2078         ret
      00EC8F                       2079 set_cursor_on:
      00EC8F 06 40            [ 7] 2080         ld      b,#CURSOR_BLINK_SLOW
      00EC91 18 02            [12] 2081         jr      _crt_set_cursor_register
      00EC93                       2082 set_cursor_off:
      00EC93 06 20            [ 7] 2083         ld      b,#CURSOR_INVISIBLE
      00EC95                       2084 _crt_set_cursor_register:
      00EC95 3A 70 E4         [13] 2085         ld      a,(cursor_start)
      00EC98 E6 1F            [ 7] 2086         and     #MASK_CURSOR_LINE
      00EC9A B0               [ 4] 2087         or      b
      00EC9B 32 70 E4         [13] 2088         ld      (cursor_start),a
      00EC9E 06 0A            [ 7] 2089         ld      b,#REG_10_CURSOR_START
      00ECA0 0E 50            [ 7] 2090         ld      c,#CRT_REG
      00ECA2 ED 41            [12] 2091         out     (c),b
      00ECA4 0C               [ 4] 2092         inc     c
      00ECA5 ED 79            [12] 2093         out     (c),a
      00ECA7 C9               [10] 2094         ret
      00ECA8                       2095 get_cursor_pos:
      00ECA8 3E 01            [ 7] 2096         ld      a,#1
      00ECAA 32 CB E4         [13] 2097         ld      (cursor_flag),a
      00ECAD 0E 50            [ 7] 2098         ld      c,#CRT_REG
      00ECAF 3E 0E            [ 7] 2099         ld      a,#REG_14_CURSOR_H
      00ECB1 ED 79            [12] 2100         out     (c),a
      00ECB3 0C               [ 4] 2101         inc     c
      00ECB4 ED 60            [12] 2102         in      h,(c)
      00ECB6 3C               [ 4] 2103         inc     a
      00ECB7 0D               [ 4] 2104         dec     c
      00ECB8 ED 79            [12] 2105         out     (c),a
      00ECBA 0C               [ 4] 2106         inc     c
      00ECBB ED 68            [12] 2107         in      l,(c)
      00ECBD 3A 62 E4         [13] 2108         ld      a,(column_count)
      00ECC0 5F               [ 4] 2109         ld      e,a
      00ECC1 16 00            [ 7] 2110         ld      d,#HIGH_ZERO
      00ECC3 0E 00            [ 7] 2111         ld      c,#0
      00ECC5                       2112 _count_cursor_column:
      00ECC5 B7               [ 4] 2113         or      a
      00ECC6 ED 52            [15] 2114         sbc     hl,de
      00ECC8 38 03            [12] 2115         jr      c,_column_is_in_C
      00ECCA 0C               [ 4] 2116         inc     c
      00ECCB 18 F8            [12] 2117         jr      _count_cursor_column
      00ECCD                       2118 _column_is_in_C:
      00ECCD 19               [11] 2119         add     hl,de
      00ECCE 61               [ 4] 2120         ld      h,c
      00ECCF 22 CC E4         [16] 2121         ld      (cursor_row_column_rel),hl
      00ECD2 C9               [10] 2122         ret
      00ECD3                       2123 alternate_keyboard_table:
      00ECD3 21 DD E4         [10] 2124         ld      hl,#kbd_table_lookup
      00ECD6 0E C0            [ 7] 2125         ld      c,#kbd_table_lookup_size
      00ECD8                       2126 _exchange_table_entry:
      00ECD8 1A               [ 7] 2127         ld      a,(de)
      00ECD9 47               [ 4] 2128         ld      b,a
      00ECDA 7E               [ 7] 2129         ld      a,(hl)
      00ECDB 12               [ 7] 2130         ld      (de),a
      00ECDC 70               [ 7] 2131         ld      (hl),b
      00ECDD 13               [ 6] 2132         inc     de
      00ECDE 23               [ 6] 2133         inc     hl
      00ECDF 0D               [ 4] 2134         dec     c
      00ECE0 20 F6            [12] 2135         jr      nz,_exchange_table_entry
      00ECE2 C9               [10] 2136         ret
      00ECE3                       2137 ESC_0C_Initialize_Screen_driver:
      00ECE3 3A 66 E4         [13] 2138         ld      a,(buffer_put_char)
      00ECE6 32 6A E4         [13] 2139         ld      (screen_driver_settings),a
      00ECE9 CB 7F            [ 8] 2140         bit     7,a                                     ;ESC_0C_CLS==0
      00ECEB C0               [11] 2141         ret     nz
      00ECEC C3 EC E9         [10] 2142         jp      chr_clear_screen
      00ECEF                       2143 function_more_0c13:
      00ECEF 79               [ 4] 2144         ld      a,c
      00ECF0 32 8C E4         [13] 2145         ld      (input_mode),a
      00ECF3                       2146 _m20:
      00ECF3 3A 66 E4         [13] 2147         ld      a,(buffer_put_char)
      00ECF6 FE 1B            [ 7] 2148         cp      #0x1b                                   
      00ECF8 28 0F            [12] 2149         jr      z,_m3
      00ECFA FE 60            [ 7] 2150         cp      #0x60                                   
      00ECFC D0               [11] 2151         ret     nc
      00ECFD CD 28 E8         [17] 2152         call    map_char_to_graphic
      00ED00 DA 1E E8         [10] 2153         jp      c,m_e81e
      00ED03 32 66 E4         [13] 2154         ld      (buffer_put_char),a
      00ED06 C3 EC E8         [10] 2155         jp      crt_write_char_with_color
      00ED09                       2156 _m3:
      00ED09 3E 32            [ 7] 2157         ld      a,#INPUT_MODE_32
      00ED0B 32 8C E4         [13] 2158         ld      (input_mode),a
      00ED0E C9               [10] 2159         ret
                                   2160 ; unchecked data source
      00ED0F C9                    2161         .db     0xc9                                    ;I
      00ED10                       2162 function_more_0c14:
      00ED10 3A 66 E4         [13] 2163         ld      a,(buffer_put_char)
      00ED13 FE 32            [ 7] 2164         cp      #'2'
      00ED15 C8               [11] 2165         ret     z
      00ED16 3E B1            [ 7] 2166         ld      a,#INPUT_MODE_B1
      00ED18 32 8C E4         [13] 2167         ld      (input_mode),a
      00ED1B 18 D6            [12] 2168         jr      _m20
      00ED1D                       2169 esc_position_cursor:
      00ED1D 3A 66 E4         [13] 2170         ld      a,(buffer_put_char)
      00ED20 FE 20            [ 7] 2171         cp      #' '
      00ED22 38 0C            [12] 2172         jr      c,_invalid_cursor_parameter
      00ED24 FE 38            [ 7] 2173         cp      #' '+SCREEN_HEIGHT
      00ED26 30 0B            [12] 2174         jr      nc,_set_cursor_max
      00ED28 D6 20            [ 7] 2175         sub     #' '
      00ED2A                       2176 _set_cursor_tmp:
      00ED2A 32 96 E4         [13] 2177         ld      (cursor_tmp),a
      00ED2D C3 1A EC         [10] 2178         jp      graphic_mode_on
      00ED30                       2179 _invalid_cursor_parameter:
      00ED30 AF               [ 4] 2180         xor     a
      00ED31 18 F7            [12] 2181         jr      _set_cursor_tmp
      00ED33                       2182 _set_cursor_max:
      00ED33 3E 17            [ 7] 2183         ld      a,#SCREEN_HEIGHT-1
      00ED35 18 F3            [12] 2184         jr      _set_cursor_tmp
      00ED37                       2185 esc_16_set_cursor:
      00ED37 3A 66 E4         [13] 2186         ld      a,(buffer_put_char)
      00ED3A B7               [ 4] 2187         or      a
      00ED3B 28 ED            [12] 2188         jr      z,_set_cursor_tmp
      00ED3D FE 19            [ 7] 2189         cp      #SCREEN_HEIGHT+1
      00ED3F 30 F2            [12] 2190         jr      nc,_set_cursor_max
      00ED41 3D               [ 4] 2191         dec     a
      00ED42 18 E6            [12] 2192         jr      _set_cursor_tmp
      00ED44                       2193 function_more_0c17:
      00ED44 3A 66 E4         [13] 2194         ld      a,(buffer_put_char)
      00ED47 D6 20            [ 7] 2195         sub     #' '
      00ED49 38 15            [12] 2196         jr      c,_err1
      00ED4B                       2197 _set_cursor_parameter:
      00ED4B F5               [11] 2198         push    af
      00ED4C 3A 62 E4         [13] 2199         ld      a,(column_count)
      00ED4F 47               [ 4] 2200         ld      b,a
      00ED50 F1               [10] 2201         pop     af
      00ED51 B8               [ 4] 2202         cp      b
      00ED52 30 0F            [12] 2203         jr      nc,_m5
      00ED54                       2204 _m4:
      00ED54 32 6E E4         [13] 2205         ld      (cursor_column),a
      00ED57 3A 96 E4         [13] 2206         ld      a,(cursor_tmp)
      00ED5A 32 6D E4         [13] 2207         ld      (cursor_row),a
      00ED5D C3 31 E9         [10] 2208         jp      crt_set_cursor
      00ED60                       2209 _err1:
      00ED60 AF               [ 4] 2210         xor     a
      00ED61 18 F1            [12] 2211         jr      _m4
      00ED63                       2212 _m5:
      00ED63 78               [ 4] 2213         ld      a,b
      00ED64 3D               [ 4] 2214         dec     a
      00ED65 18 ED            [12] 2215         jr      _m4
      00ED67                       2216 function_more_0c11:
      00ED67 3A 66 E4         [13] 2217         ld      a,(buffer_put_char)
      00ED6A 18 DF            [12] 2218         jr      _set_cursor_parameter
      00ED6C                       2219 write_character:
      00ED6C D5               [11] 2220         push    de
      00ED6D CD BB E9         [17] 2221         call    set_cursor_abs
      00ED70 D1               [10] 2222         pop     de
      00ED71 CD 2C EA         [17] 2223         call    wait_flicker_free
      00ED74 73               [ 7] 2224         ld      (hl),e
      00ED75                       2225 _cursor_pos_increment:
      00ED75 3A 6D E4         [13] 2226         ld      a,(cursor_row)
      00ED78 FE 17            [ 7] 2227         cp      #SCREEN_HEIGHT-1
      00ED7A C2 FA E8         [10] 2228         jp      nz,cursor_move_right
      00ED7D 3A 62 E4         [13] 2229         ld      a,(column_count)
      00ED80 3D               [ 4] 2230         dec     a
      00ED81 47               [ 4] 2231         ld      b,a
      00ED82 3A 6E E4         [13] 2232         ld      a,(cursor_column)
      00ED85 B8               [ 4] 2233         cp      b
      00ED86 C2 FA E8         [10] 2234         jp      nz,cursor_move_right
      00ED89 C9               [10] 2235         ret
      00ED8A                       2236 read_character:
      00ED8A 3E 01            [ 7] 2237         ld      a,#1
      00ED8C 32 CB E4         [13] 2238         ld      (cursor_flag),a
      00ED8F CD BB E9         [17] 2239         call    set_cursor_abs
      00ED92 CD 2C EA         [17] 2240         call    wait_flicker_free
      00ED95 7E               [ 7] 2241         ld      a,(hl)
      00ED96 32 CC E4         [13] 2242         ld      (cursor_row_column_rel),a
      00ED99 18 DA            [12] 2243         jr      _cursor_pos_increment
      00ED9B                       2244 erase_rest_of_line:
      00ED9B 0E 01            [ 7] 2245         ld      c,#1
      00ED9D                       2246 _erase_screen_lines:
      00ED9D 3A 6E E4         [13] 2247         ld      a,(cursor_column)
      00EDA0                       2248 _erase_rest_of_line:
      00EDA0 F5               [11] 2249         push    af
      00EDA1 CD BB E9         [17] 2250         call    set_cursor_abs
      00EDA4 F1               [10] 2251         pop     af
      00EDA5                       2252 fill_bws_rows:
      00EDA5 F5               [11] 2253         push    af
      00EDA6 3A 62 E4         [13] 2254         ld      a,(column_count)
      00EDA9 3D               [ 4] 2255         dec     a
      00EDAA 47               [ 4] 2256         ld      b,a
      00EDAB 1E 20            [ 7] 2257         ld      e,#' '
      00EDAD F1               [10] 2258         pop     af
      00EDAE F5               [11] 2259         push    af
      00EDAF C5               [11] 2260         push    bc
      00EDB0 E5               [11] 2261         push    hl
      00EDB1 CD BC ED         [17] 2262         call    fill_cnt
      00EDB4 E1               [10] 2263         pop     hl
      00EDB5 11 00 08         [10] 2264         ld      de,#OFFSET_COLOR
      00EDB8 19               [11] 2265         add     hl,de
      00EDB9 5E               [ 7] 2266         ld      e,(hl)
      00EDBA C1               [10] 2267         pop     bc
      00EDBB F1               [10] 2268         pop     af
      00EDBC                       2269 fill_cnt:
      00EDBC F5               [11] 2270         push    af
      00EDBD C5               [11] 2271         push    bc
      00EDBE CD 2B EA         [17] 2272         call    wait_flicker_free_save_A
      00EDC1 C1               [10] 2273         pop     bc
      00EDC2 F1               [10] 2274         pop     af
      00EDC3 73               [ 7] 2275         ld      (hl),e
      00EDC4 B8               [ 4] 2276         cp      b
      00EDC5 28 04            [12] 2277         jr      z,_fill_next_line
      00EDC7 23               [ 6] 2278         inc     hl
      00EDC8 3C               [ 4] 2279         inc     a
      00EDC9 18 F1            [12] 2280         jr      fill_cnt
      00EDCB                       2281 _fill_next_line:
      00EDCB 0D               [ 4] 2282         dec     c
      00EDCC C8               [11] 2283         ret     z
      00EDCD AF               [ 4] 2284         xor     a
      00EDCE 23               [ 6] 2285         inc     hl
      00EDCF 18 EB            [12] 2286         jr      fill_cnt
      00EDD1                       2287 erase_line:
      00EDD1 3A 6E E4         [13] 2288         ld      a,(cursor_column)
      00EDD4 5F               [ 4] 2289         ld      e,a
      00EDD5 16 00            [ 7] 2290         ld      d,#HIGH_ZERO
      00EDD7 B7               [ 4] 2291         or      a
      00EDD8 ED 52            [15] 2292         sbc     hl,de
      00EDDA AF               [ 4] 2293         xor     a
      00EDDB 0E 01            [ 7] 2294         ld      c,#1
      00EDDD 18 C1            [12] 2295         jr      _erase_rest_of_line
      00EDDF                       2296 erase_rest_of_screen:
      00EDDF 3A 6D E4         [13] 2297         ld      a,(cursor_row)
      00EDE2 47               [ 4] 2298         ld      b,a
      00EDE3 3E 18            [ 7] 2299         ld      a,#SCREEN_HEIGHT
      00EDE5 90               [ 4] 2300         sub     b
      00EDE6 4F               [ 4] 2301         ld      c,a
      00EDE7 18 B4            [12] 2302         jr      _erase_screen_lines
      00EDE9                       2303 esc_47_delecte_character_to_column:
      00EDE9 CD 13 EE         [17] 2304         call    _m7
      00EDEC D8               [11] 2305         ret     c
      00EDED                       2306 _move_next_character:
      00EDED 23               [ 6] 2307         inc     hl
      00EDEE CD 2C EA         [17] 2308         call    wait_flicker_free
      00EDF1 7E               [ 7] 2309         ld      a,(hl)
      00EDF2 2B               [ 6] 2310         dec     hl
      00EDF3 77               [ 7] 2311         ld      (hl),a
      00EDF4 23               [ 6] 2312         inc     hl
      00EDF5 0D               [ 4] 2313         dec     c
      00EDF6 20 F5            [12] 2314         jr      nz,_move_next_character
      00EDF8                       2315 _m8:
      00EDF8 CD 2C EA         [17] 2316         call    wait_flicker_free
      00EDFB 36 20            [10] 2317         ld      (hl),#' '
      00EDFD C9               [10] 2318         ret
      00EDFE                       2319 esc_49_insert_character:
      00EDFE CD 13 EE         [17] 2320         call    _m7
      00EE01 D8               [11] 2321         ret     c
      00EE02 5F               [ 4] 2322         ld      e,a
      00EE03 16 00            [ 7] 2323         ld      d,#HIGH_ZERO
      00EE05 19               [11] 2324         add     hl,de
      00EE06                       2325 _insert_next_character:
      00EE06 2B               [ 6] 2326         dec     hl
      00EE07 CD 2C EA         [17] 2327         call    wait_flicker_free
      00EE0A 7E               [ 7] 2328         ld      a,(hl)
      00EE0B 23               [ 6] 2329         inc     hl
      00EE0C 77               [ 7] 2330         ld      (hl),a
      00EE0D 2B               [ 6] 2331         dec     hl
      00EE0E 0D               [ 4] 2332         dec     c
      00EE0F 20 F5            [12] 2333         jr      nz,_insert_next_character
      00EE11 18 E5            [12] 2334         jr      _m8
      00EE13                       2335 _m7:
      00EE13 CD BB E9         [17] 2336         call    set_cursor_abs
      00EE16 3A 6E E4         [13] 2337         ld      a,(cursor_column)
      00EE19 4F               [ 4] 2338         ld      c,a
      00EE1A 3A 62 E4         [13] 2339         ld      a,(column_count)
      00EE1D 47               [ 4] 2340         ld      b,a
      00EE1E 3A 66 E4         [13] 2341         ld      a,(buffer_put_char)
      00EE21 B8               [ 4] 2342         cp      b
      00EE22 30 06            [12] 2343         jr      nc,_err2
      00EE24 91               [ 4] 2344         sub     c
      00EE25 28 03            [12] 2345         jr      z,_err2
      00EE27 D8               [11] 2346         ret     c
      00EE28 4F               [ 4] 2347         ld      c,a
      00EE29 C9               [10] 2348         ret
      00EE2A                       2349 _err2:
      00EE2A 37               [ 4] 2350         scf
      00EE2B C9               [10] 2351         ret
      00EE2C                       2352 ESC_10_output_blanks:
      00EE2C CD BB E9         [17] 2353         call    set_cursor_abs
      00EE2F 1E 20            [ 7] 2354         ld      e,#' '
      00EE31 3A 66 E4         [13] 2355         ld      a,(buffer_put_char)
      00EE34                       2356 _output_chars:
      00EE34 B7               [ 4] 2357         or      a
      00EE35 C8               [11] 2358         ret     z
      00EE36 4F               [ 4] 2359         ld      c,a
      00EE37 3A 62 E4         [13] 2360         ld      a,(column_count)
      00EE3A 47               [ 4] 2361         ld      b,a
      00EE3B 3A 6E E4         [13] 2362         ld      a,(cursor_column)
      00EE3E                       2363 _m9:
      00EE3E CD 2C EA         [17] 2364         call    wait_flicker_free
      00EE41 73               [ 7] 2365         ld      (hl),e
      00EE42 23               [ 6] 2366         inc     hl
      00EE43 3C               [ 4] 2367         inc     a
      00EE44 B8               [ 4] 2368         cp      b
      00EE45 28 07            [12] 2369         jr      z,_m21
      00EE47                       2370 _m22:
      00EE47 0D               [ 4] 2371         dec     c
      00EE48 20 F4            [12] 2372         jr      nz,_m9
      00EE4A                       2373 _m23:
      00EE4A 32 6E E4         [13] 2374         ld      (cursor_column),a
      00EE4D C9               [10] 2375         ret
      00EE4E                       2376 _m21:
      00EE4E 16 18            [ 7] 2377         ld      d,#SCREEN_HEIGHT
      00EE50 3A 6D E4         [13] 2378         ld      a,(cursor_row)
      00EE53 3C               [ 4] 2379         inc     a
      00EE54 BA               [ 4] 2380         cp      d
      00EE55 28 06            [12] 2381         jr      z,_m24
      00EE57 32 6D E4         [13] 2382         ld      (cursor_row),a
      00EE5A AF               [ 4] 2383         xor     a
      00EE5B 18 EA            [12] 2384         jr      _m22
      00EE5D                       2385 _m24:
      00EE5D 78               [ 4] 2386         ld      a,b
      00EE5E 3D               [ 4] 2387         dec     a
      00EE5F 18 E9            [12] 2388         jr      _m23
      00EE61                       2389 esc_1d_outputs_characters:
      00EE61 3A 66 E4         [13] 2390         ld      a,(buffer_put_char)
      00EE64 32 CE E4         [13] 2391         ld      (char_tmp),a
      00EE67 C3 1A EC         [10] 2392         jp      graphic_mode_on
      00EE6A                       2393 function_more_0c12:
      00EE6A CD BB E9         [17] 2394         call    set_cursor_abs
      00EE6D 3A 66 E4         [13] 2395         ld      a,(buffer_put_char)
      00EE70 5F               [ 4] 2396         ld      e,a
      00EE71 3A CE E4         [13] 2397         ld      a,(char_tmp)
      00EE74 4F               [ 4] 2398         ld      c,a
      00EE75 18 BD            [12] 2399         jr      _output_chars
      00EE77                       2400 esc_53_select_screen_width:
      00EE77 CD 13 EA         [17] 2401         call    display_inhibit
      00EE7A                       2402 switch_crt_mode:
      00EE7A 21 68 E4         [10] 2403         ld      hl,#cfg10_settings
      00EE7D 3A 66 E4         [13] 2404         ld      a,(buffer_put_char)
      00EE80 FE 30            [ 7] 2405         cp      #ESC_53_CRT40
      00EE82 28 06            [12] 2406         jr      z,_switch_crt40
      00EE84 FE 31            [ 7] 2407         cp      #ESC_53_CRT80
      00EE86 28 0C            [12] 2408         jr      z,_switch_crt80
      00EE88 18 43            [12] 2409         jr      _handle_1b53xx_end
      00EE8A                       2410 _switch_crt40:
      00EE8A CB 86            [15] 2411         res     0,(hl)                                  ;_CRT80=0
      00EE8C CB EE            [15] 2412         set     5,(hl)                                  ;MUST_BE_ZERO=1
      00EE8E DD 21 D3 EE      [14] 2413         ld      ix,#crt_table40
      00EE92 18 06            [12] 2414         jr      set_video_mode
      00EE94                       2415 _switch_crt80:
      00EE94 CB C6            [15] 2416         set     0,(hl)                                  ;_CRT80=1
      00EE96 DD 21 E5 EE      [14] 2417         ld      ix,#crt_table80
      00EE9A                       2418 set_video_mode:
      00EE9A DD 7E 01         [19] 2419         ld      a,1(ix)
      00EE9D 32 62 E4         [13] 2420         ld      (column_count),a
      00EEA0 DD 7E 06         [19] 2421         ld      a,6(ix)
      00EEA3 32 61 E4         [13] 2422         ld      (0xe461),a                              
      00EEA6 32 60 E4         [13] 2423         ld      (0xe460),a                              
      00EEA9 32 64 E4         [13] 2424         ld      (0xe464),a                              
      00EEAC 32 65 E4         [13] 2425         ld      (0xe465),a                              
      00EEAF DD 7E 0A         [19] 2426         ld      a,10(ix)
      00EEB2 32 70 E4         [13] 2427         ld      (cursor_start),a
      00EEB5 06 10            [ 7] 2428         ld      b,#crt_table40_size
      00EEB7 0E 00            [ 7] 2429         ld      c,#REG_0
      00EEB9                       2430 crt_write_reg:
      00EEB9 79               [ 4] 2431         ld      a,c
      00EEBA D3 50            [11] 2432         out     (CRT_REG),a
      00EEBC DD 7E 00         [19] 2433         ld      a,0(ix)
      00EEBF D3 51            [11] 2434         out     (CRT_DATA),a
      00EEC1 0C               [ 4] 2435         inc     c
      00EEC2 DD 23            [10] 2436         inc     ix
      00EEC4 10 F3            [13] 2437         djnz    crt_write_reg
      00EEC6 AF               [ 4] 2438         xor     a
      00EEC7 32 63 E4         [13] 2439         ld      (0xe463),a                              
      00EECA CD EC E9         [17] 2440         call    chr_clear_screen
      00EECD                       2441 _handle_1b53xx_end:
      00EECD CD 20 EA         [17] 2442         call    display_enable
      00EED0 C3 12 EC         [10] 2443         jp      input_mode_clear
      00EED3                       2444 crt_table40:
      00EED3 38 28 2F 34 1B 04 18  2445         .db     0x38,0x28,0x2f,0x34,0x1b,0x04,0x18,0x19 ;8(/4....
             19
      00EEDB 00 0A 49 0A 00 00 00  2446         .db     0x00,0x0a,0x49,0x0a,0x00,0x00,0x00,0x00 ;..I.....
             00
                                   2447 ; unchecked data source
      00EEE3 00 00                 2448         .db     0x00,0x00                               ;..
      00EEE5                       2449 crt_table80:
      00EEE5 71 50 5C 38 1B 04 18  2450         .db     0x71,0x50,0x5c,0x38,0x1b,0x04,0x18,0x19 ;qP\8....
             19
      00EEED 00 0A 49 0A 00 00 00  2451         .db     0x00,0x0a,0x49,0x0a,0x00,0x00,0x00,0x00 ;..I.....
             00
                                   2452 ; unchecked data source
      00EEF5 00 00 20 00 00 00 00  2453         .db     0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00 ;.. .....
             00
      00EEFD 00 00 00 C9 66 00 00  2454         .db     0x00,0x00,0x00,0xc9,0x66,0x00,0x00,0xc9 ;...If..I
             C9
      00EF05 7A 00 00 C9 74 00 00  2455         .db     0x7a,0x00,0x00,0xc9,0x74,0x00,0x00,0xc9 ;z..It..I
             C9
      00EF0D 20 00 00 C9 20 00 00  2456         .db     0x20,0x00,0x00,0xc9,0x20,0x00,0x00,0xc9 ; ..I ..I
             C9
      00EF15 20 00 00 C9 6D 00 00  2457         .db     0x20,0x00,0x00,0xc9,0x6d,0x00,0x00,0xc9 ; ..Im..I
             C9
      00EF1D 6F 00 00              2458         .db     0x6f,0x00,0x00                          ;o..
      00EF20                       2459 bicom_clr_graphics:
      00EF20 3E 00            [ 7] 2460         ld      a,#0x00                                 
      00EF22 18 6C            [12] 2461         jr      bicom_scheduler
      00EF24                       2462 bicom_set_pixel:
      00EF24 3E 01            [ 7] 2463         ld      a,#0x01                                 
      00EF26 18 68            [12] 2464         jr      bicom_scheduler
      00EF28                       2465 bicom_get_pixel:
      00EF28 3E 02            [ 7] 2466         ld      a,#0x02                                 
      00EF2A 18 64            [12] 2467         jr      bicom_scheduler
      00EF2C                       2468 bicom_draw_line:
      00EF2C 3E 03            [ 7] 2469         ld      a,#0x03                                 
      00EF2E 18 60            [12] 2470         jr      bicom_scheduler
      00EF30                       2471 bicom_prt_line:
      00EF30 3E 04            [ 7] 2472         ld      a,#0x04                                 
      00EF32 18 5C            [12] 2473         jr      bicom_scheduler
      00EF34                       2474 bicom_undoc1:
      00EF34 3E 05            [ 7] 2475         ld      a,#0x05                                 
      00EF36 18 58            [12] 2476         jr      bicom_scheduler
                                   2477 ; unchecked data source
      00EF38 C9 00 00 00 C9 00 00  2478         .db     0xc9,0x00,0x00,0x00,0xc9,0x00,0x00,0x00 ;I...I...
             00
      00EF40                       2479 bicom_glp1_prt_gfx:
      00EF40 07 1B 41 05 1B 4B 40  2480         .db     0x07,0x1b,0x41,0x05,0x1b,0x4b,0x40,0x01 ;..A..K@.
             01
      00EF48 00 00 00 00 00 00 00  2481         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EF50                       2482 bicom_glp2_prt_2nd_line:
      00EF50 09 0D 0A 1B 41 06 1B  2483         .db     0x09,0x0d,0x0a,0x1b,0x41,0x06,0x1b,0x4b ;....A..K
             4B
      00EF58 40 01 00 00 00 00 00  2484         .db     0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x00 ;@.......
             00
      00EF60                       2485 bicom_glp3_prt_crlf:
      00EF60 02 0D 0A 42 00 00 00  2486         .db     0x02,0x0d,0x0a,0x42,0x00,0x00,0x00,0x00 ;...B....
             00
      00EF68 00 00 00 00 00 00 00  2487         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EF70                       2488 bicom_glp4_prt_ld:
      00EF70 01 0D 00 00 00 00 00  2489         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EF78 00 00 00 00 00 00 00  2490         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EF80                       2491 bicom_glp5_prt_ld:
      00EF80 05 0D 0A 1B 41 0C 00  2492         .db     0x05,0x0d,0x0a,0x1b,0x41,0x0c,0x00,0x00 ;....A...
             00
      00EF88 00 00 00 00 00 00 00  2493         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EF90                       2494 bicom_scheduler:
      00EF90 CD A3 EF         [17] 2495         call    rom_enable
      00EF93 CD 57 F1         [17] 2496         call    m_f157
      00EF96                       2497 monitor_inhibit:
      00EF96 F5               [11] 2498         push    af
      00EF97 3A 69 E4         [13] 2499         ld      a,(cfg20_settings)
      00EF9A CB DF            [ 8] 2500         set     3,a                                     ;MONINH=1
      00EF9C                       2501 m_ef9c:
      00EF9C 32 69 E4         [13] 2502         ld      (cfg20_settings),a
      00EF9F D3 20            [11] 2503         out     (CFG20),a
      00EFA1 F1               [10] 2504         pop     af
      00EFA2 C9               [10] 2505         ret
      00EFA3                       2506 rom_enable:
      00EFA3 F5               [11] 2507         push    af
      00EFA4 3A 69 E4         [13] 2508         ld      a,(cfg20_settings)
      00EFA7 CB 9F            [ 8] 2509         res     3,a                                     ;MONINH=0
      00EFA9 CB F7            [ 8] 2510         set     6,a                                     ;ROM_PACK_EN=1
      00EFAB 18 EF            [12] 2511         jr      m_ef9c
                                   2512 ; unchecked data source
      00EFAD 00 00 00 00 00 00 00  2513         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFB5 00 00 00 00 00 00 00  2514         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFBD 00 00 00 00 00 00 00  2515         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFC5 00 00                 2516         .db     0x00,0x00                               ;..
      00EFC7                       2517 wait_fdd_ready:
      00EFC7 DB F0            [11] 2518         in      a,(UPD765_STATE)
      00EFC9 CB 77            [ 8] 2519         bit     6,a                                     
      00EFCB 20 FA            [12] 2520         jr      nz,wait_fdd_ready
      00EFCD C9               [10] 2521         ret
      00EFCE                       2522 ENTRY:
      00EFCE 31 00 F0         [10] 2523         ld      sp,#stack_at_boot
      00EFD1 CD 13 EA         [17] 2524         call    display_inhibit
      00EFD4 CD A3 EF         [17] 2525         call    rom_enable
      00EFD7 CD 10 F0         [17] 2526         call    m_f010
      00EFDA C3 00 E0         [10] 2527         jp      boot_strap
                                   2528 ; unchecked data source
      00EFDD 00 00 00 00 00 00 00  2529         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFE5 00 00 00 00 00 00 00  2530         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00EFED 00 00 00              2531         .db     0x00,0x00,0x00                          ;...
      00EFF0                       2532 boot:
      00EFF0 11 00 E0         [10] 2533         ld      de,#boot_strap
      00EFF3 21 00 F0         [10] 2534         ld      hl,#boot_strap+0x1000
      00EFF6 01 FE 0F         [10] 2535         ld      bc,#boot_rom_ends-boot_strap
      00EFF9 ED B0            [21] 2536         ldir
      00EFFB C3 CE EF         [10] 2537         jp      ENTRY
      00EFFE                       2538 boot_rom_ends:
      00EFFE 00 00                 2539         .db     0x00,0x00                               ;..
      00F000                       2540 boot_rom_extensions:
                                   2541 ; unchecked data source
      00F000 00 00 00 00 00 00 00  2542         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F008 00 00 00 00 00 00 00  2543         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F010                       2544 m_f010:
      00F010 CD 81 F0         [17] 2545         call    init_pic
      00F013 CD 2E EB         [17] 2546         call    init_serial
      00F016 CD 20 F0         [17] 2547         call    patch_printer_ptr
      00F019 CD 2C F0         [17] 2548         call    init_kbd_table
      00F01C CD 6D F0         [17] 2549         call    init_crt_param
      00F01F C9               [10] 2550         ret
      00F020                       2551 patch_printer_ptr:
      00F020 DB 10            [11] 2552         in      a,(STATUS10)
      00F022 CB 6F            [ 8] 2553         bit     5,a                                     ;_PRT_SERIAL==0
      00F024 C8               [11] 2554         ret     z
      00F025 2A 37 E4         [16] 2555         ld      hl,(dev_serial_write_byte+1)
      00F028 22 3A E4         [16] 2556         ld      (dev_printer_write_byte+1),hl
      00F02B C9               [10] 2557         ret
      00F02C                       2558 init_kbd_table:
      00F02C DB 10            [11] 2559         in      a,(STATUS10)
      00F02E E6 1C            [ 7] 2560         and     #MASK_COUNTRY_SELECT
      00F030 C8               [11] 2561         ret     z
      00F031 1F               [ 4] 2562         rra
      00F032 1F               [ 4] 2563         rra
      00F033 E6 07            [ 7] 2564         and     #MASK_COUNTRY_BITS
      00F035 FE 01            [ 7] 2565         cp      #COUNTRY_DE
      00F037 CC 3D F1         [17] 2566         call    z,set_german_ascii_range
      00F03A FE 02            [ 7] 2567         cp      #COUNTRY_US
      00F03C CC 45 F1         [17] 2568         call    z,_patch_localization_us
      00F03F FE 03            [ 7] 2569         cp      #COUNTRY_FR
      00F041 CC 48 F1         [17] 2570         call    z,_patch_localization_fr
      00F044 FE 04            [ 7] 2571         cp      #COUNTRY_UK
      00F046 CC 4B F1         [17] 2572         call    z,_patch_localization_uk
      00F049 FE 05            [ 7] 2573         cp      #COUNTRY_IT
      00F04B CC 4E F1         [17] 2574         call    z,_patch_localization_it
      00F04E FE 06            [ 7] 2575         cp      #COUNTRY_ES
      00F050 CC 51 F1         [17] 2576         call    z,_patch_localization_es
      00F053 FE 07            [ 7] 2577         cp      #COUNTRY_07
      00F055 CC 54 F1         [17] 2578         call    z,_patch_localization_07
      00F058 11 C0 00         [10] 2579         ld      de,#kbd_table_lookup_size
      00F05B 21 00 F8         [10] 2580         ld      hl,#kbd_table_int
      00F05E                       2581 get_kbd_table_address:
      00F05E 3D               [ 4] 2582         dec     a
      00F05F 28 03            [12] 2583         jr      z,copy_kbd_table
      00F061 19               [11] 2584         add     hl,de
      00F062 18 FA            [12] 2585         jr      get_kbd_table_address
      00F064                       2586 copy_kbd_table:
      00F064 11 DD E4         [10] 2587         ld      de,#kbd_table_lookup
      00F067 01 C0 00         [10] 2588         ld      bc,#kbd_table_lookup_size
      00F06A ED B0            [21] 2589         ldir
      00F06C C9               [10] 2590         ret
      00F06D                       2591 init_crt_param:
      00F06D DB 10            [11] 2592         in      a,(STATUS10)
      00F06F CB 77            [ 8] 2593         bit     6,a                                     ;_CRT_NTSC==0
      00F071 C8               [11] 2594         ret     z
      00F072 CD 05 F5         [17] 2595         call    m_f505
      00F075 21 40 FD         [10] 2596         ld      hl,#crt_table_ntsc
      00F078 11 D3 EE         [10] 2597         ld      de,#crt_table40
      00F07B 01 24 00         [10] 2598         ld      bc,#crt_table_ntsc_size
      00F07E ED B0            [21] 2599         ldir
      00F080 C9               [10] 2600         ret
      00F081                       2601 init_pic:
      00F081 3E 16            [ 7] 2602         ld      a,#0x16                                 
      00F083 D3 70            [11] 2603         out     (PIC_ICW1),a
      00F085 3E EF            [ 7] 2604         ld      a,#0xef                                 
      00F087 D3 71            [11] 2605         out     (PIC_ICW2),a
      00F089 3E FF            [ 7] 2606         ld      a,#0xff                                 
      00F08B D3 71            [11] 2607         out     (0x71),a                                
      00F08D C9               [10] 2608         ret
      00F08E                       2609 fdc_cmd_init:
      00F08E 03 CF 1C 07 00        2610         .db     0x03,0xcf,0x1c,0x07,0x00                ;.O...
      00F093                       2611 fdc_cmd_read_boot:
      00F093 46 00 00 00 01 01 10  2612         .db     0x46,0x00,0x00,0x00,0x01,0x01,0x10,0x36 ;F......6
             36
      00F09B FF                    2613         .db     0xff                                    ;.
      00F09C                       2614 fdc_write_byte_ix:
      00F09C DD 7E 00         [19] 2615         ld      a,0(ix)
      00F09F DD 23            [10] 2616         inc     ix
      00F0A1                       2617 fdc_write_byte:
      00F0A1 F5               [11] 2618         push    af
      00F0A2                       2619 _m28:
      00F0A2 DB F9            [11] 2620         in      a,(UPD765_MAIN_STATUS)
      00F0A4 CB 7F            [ 8] 2621         bit     7,a                                     ;RQM_Request_for_master==0
      00F0A6 28 FA            [12] 2622         jr      z,_m28
      00F0A8 F1               [10] 2623         pop     af
      00F0A9 D3 F8            [11] 2624         out     (UPD765_DATA),a
      00F0AB C9               [10] 2625         ret
      00F0AC                       2626 fdc_read_byte:
      00F0AC DB F9            [11] 2627         in      a,(UPD765_MAIN_STATUS)
      00F0AE C6 40            [ 7] 2628         add     a,#0x40                                 
      00F0B0 30 FA            [12] 2629         jr      nc,fdc_read_byte
      00F0B2 DB F8            [11] 2630         in      a,(UPD765_DATA)
      00F0B4 C9               [10] 2631         ret
      00F0B5                       2632 fdc_read_boot_sector:
      00F0B5 AF               [ 4] 2633         xor     a
      00F0B6 D3 F0            [11] 2634         out     (FDC_UNIT),a
      00F0B8 11 00 C2         [10] 2635         ld      de,#boot_sector
      00F0BB 7B               [ 4] 2636         ld      a,e
      00F0BC D3 64            [11] 2637         out     (0x64),a                                
      00F0BE 7A               [ 4] 2638         ld      a,d
      00F0BF D3 64            [11] 2639         out     (0x64),a                                
      00F0C1 3E FF            [ 7] 2640         ld      a,#0xff                                 
      00F0C3 D3 F0            [11] 2641         out     (FDC_UNIT),a
      00F0C5 D3 F0            [11] 2642         out     (FDC_UNIT),a
      00F0C7 D3 65            [11] 2643         out     (0x65),a                                
      00F0C9 3E 40            [ 7] 2644         ld      a,#0x40                                 
      00F0CB D3 65            [11] 2645         out     (0x65),a                                
      00F0CD 21 40 9C         [10] 2646         ld      hl,#0x9c40                              
      00F0D0 CD 7B E6         [17] 2647         call    delay
      00F0D3 21 40 9C         [10] 2648         ld      hl,#0x9c40                              
      00F0D6 CD 7B E6         [17] 2649         call    delay
      00F0D9 0E 05            [ 7] 2650         ld      c,#fdc_cmd_init_size
      00F0DB DD 21 8E F0      [14] 2651         ld      ix,#fdc_cmd_init
      00F0DF                       2652 fdw_write_next_byte:
      00F0DF CD 9C F0         [17] 2653         call    fdc_write_byte_ix
      00F0E2 0D               [ 4] 2654         dec     c
      00F0E3 20 FA            [12] 2655         jr      nz,fdw_write_next_byte
      00F0E5 CD FD E3         [17] 2656         call    dev_fdd_wait_ready
      00F0E8                       2657 _m29:
      00F0E8 3E 08            [ 7] 2658         ld      a,#FDC_CMD_SENSE_INTERRUPT_STATE
      00F0EA CD A1 F0         [17] 2659         call    fdc_write_byte
      00F0ED CD AC F0         [17] 2660         call    fdc_read_byte
      00F0F0 FE 80            [ 7] 2661         cp      #0x80                                   
      00F0F2 28 F4            [12] 2662         jr      z,_m29
      00F0F4 CD AC F0         [17] 2663         call    fdc_read_byte
      00F0F7 3E 44            [ 7] 2664         ld      a,#0x44                                 
      00F0F9 D3 68            [11] 2665         out     (DMA_MODE_SET),a
      00F0FB 0E 09            [ 7] 2666         ld      c,#0x09                                 
      00F0FD                       2667 _m2a:
      00F0FD CD 9C F0         [17] 2668         call    fdc_write_byte_ix
      00F100 0D               [ 4] 2669         dec     c
      00F101 20 FA            [12] 2670         jr      nz,_m2a
      00F103 CD FD E3         [17] 2671         call    dev_fdd_wait_ready
      00F106 CD AC F0         [17] 2672         call    fdc_read_byte
      00F109 E6 C0            [ 7] 2673         and     #0xc0                                   
      00F10B 20 A8            [12] 2674         jr      nz,fdc_read_boot_sector
      00F10D 0E 06            [ 7] 2675         ld      c,#0x06                                 
      00F10F                       2676 _m2b:
      00F10F CD AC F0         [17] 2677         call    fdc_read_byte
      00F112 0D               [ 4] 2678         dec     c
      00F113 20 FA            [12] 2679         jr      nz,_m2b
      00F115 C3 44 E0         [10] 2680         jp      ram_boot
      00F118                       2681 kbd_adjust_keyboard_table:
      00F118 21 64 FD         [10] 2682         ld      hl,#kbc_cpm_control_keys
      00F11B 11 25 E5         [10] 2683         ld      de,#kbd_table_lookup+KBD_POSITION_LEFT-1
      00F11E 01 18 00         [10] 2684         ld      bc,#kbc_cpm_control_keys_size
      00F121 ED B0            [21] 2685         ldir
      00F123 11 85 E5         [10] 2686         ld      de,#kbd_table_lookup+0x60+KBD_POSITION_LEFT-1
      00F126 01 18 00         [10] 2687         ld      bc,#kbc_cpm_control_keys_shift_size
      00F129 ED B0            [21] 2688         ldir
      00F12B 21 94 FD         [10] 2689         ld      hl,#cpm_special_character_mods
      00F12E 11 67 E8         [10] 2690         ld      de,#asc_12
      00F131 0E 08            [ 7] 2691         ld      c,#cpm_special_character_mods_size
      00F133                       2692 _m2c:
      00F133 7E               [ 7] 2693         ld      a,(hl)
      00F134 12               [ 7] 2694         ld      (de),a
      00F135 23               [ 6] 2695         inc     hl
      00F136 13               [ 6] 2696         inc     de
      00F137 13               [ 6] 2697         inc     de
      00F138 13               [ 6] 2698         inc     de
      00F139 0D               [ 4] 2699         dec     c
      00F13A 20 F7            [12] 2700         jr      nz,_m2c
      00F13C C9               [10] 2701         ret
      00F13D                       2702 set_german_ascii_range:
      00F13D F5               [11] 2703         push    af
      00F13E 3E 7E            [ 7] 2704         ld      a,#GERMAN_MAX_ASCII_CODE
      00F140 32 50 E7         [13] 2705         ld      (opcode_compare+1),a
      00F143 F1               [10] 2706         pop     af
      00F144 C9               [10] 2707         ret
      00F145                       2708 _patch_localization_us:
      00F145 C9               [10] 2709         ret
                                   2710 ; unchecked data source
      00F146 00 00                 2711         .db     0x00,0x00                               ;..
      00F148                       2712 _patch_localization_fr:
      00F148 C9               [10] 2713         ret
                                   2714 ; unchecked data source
      00F149 00 00                 2715         .db     0x00,0x00                               ;..
      00F14B                       2716 _patch_localization_uk:
      00F14B C9               [10] 2717         ret
                                   2718 ; unchecked data source
      00F14C 00 00                 2719         .db     0x00,0x00                               ;..
      00F14E                       2720 _patch_localization_it:
      00F14E C9               [10] 2721         ret
                                   2722 ; unchecked data source
      00F14F 00 00                 2723         .db     0x00,0x00                               ;..
      00F151                       2724 _patch_localization_es:
      00F151 C9               [10] 2725         ret
                                   2726 ; unchecked data source
      00F152 00 00                 2727         .db     0x00,0x00                               ;..
      00F154                       2728 _patch_localization_07:
      00F154 C9               [10] 2729         ret
                                   2730 ; unchecked data source
      00F155 00 00                 2731         .db     0x00,0x00                               ;..
      00F157                       2732 m_f157:
      00F157 B7               [ 4] 2733         or      a
      00F158 CA 20 F2         [10] 2734         jp      z,bicom_int_clr
      00F15B FE 01            [ 7] 2735         cp      #0x01                                   
      00F15D 28 1E            [12] 2736         jr      z,bicom_int_set_pixel
      00F15F FE 02            [ 7] 2737         cp      #0x02                                   
      00F161 28 10            [12] 2738         jr      z,bicom_int_get_pixel
      00F163 FE 03            [ 7] 2739         cp      #0x03                                   
      00F165 CA 5E F2         [10] 2740         jp      z,bicom_int_draw_line
      00F168 FE 04            [ 7] 2741         cp      #0x04                                   
      00F16A CA EB F3         [10] 2742         jp      z,bicom_int_prt_line
      00F16D FE 05            [ 7] 2743         cp      #0x05                                   
      00F16F CA E0 F4         [10] 2744         jp      z,m_f4e0
      00F172 C9               [10] 2745         ret
      00F173                       2746 bicom_int_get_pixel:
      00F173 CD CC F1         [17] 2747         call    m_f1cc
      00F176 C5               [11] 2748         push    bc
      00F177 CD B0 F1         [17] 2749         call    m_f1b0
      00F17A E1               [10] 2750         pop     hl
      00F17B 77               [ 7] 2751         ld      (hl),a
      00F17C C9               [10] 2752         ret
      00F17D                       2753 bicom_int_set_pixel:
      00F17D CD CC F1         [17] 2754         call    m_f1cc
      00F180 22 B0 EF         [16] 2755         ld      (0xefb0),hl                             
      00F183 ED 53 B4 EF      [20] 2756         ld      (0xefb4),de                             
      00F187 0A               [ 7] 2757         ld      a,(bc)
      00F188 32 BA EF         [13] 2758         ld      (0xefba),a                              
      00F18B                       2759 m_f18b:
      00F18B CD F3 F1         [17] 2760         call    m_f1f3
      00F18E 30 0A            [12] 2761         jr      nc,m_f19a
      00F190 17               [ 4] 2762         rla
      00F191 17               [ 4] 2763         rla
      00F192 17               [ 4] 2764         rla
      00F193 17               [ 4] 2765         rla
      00F194 E6 70            [ 7] 2766         and     #0x70                                   
      00F196 06 07            [ 7] 2767         ld      b,#0x07                                 
      00F198 18 04            [12] 2768         jr      m_f19e
      00F19A                       2769 m_f19a:
      00F19A E6 07            [ 7] 2770         and     #0x07                                   
      00F19C 06 70            [ 7] 2771         ld      b,#0x70                                 
      00F19E                       2772 m_f19e:
      00F19E 4F               [ 4] 2773         ld      c,a
      00F19F                       2774 m_f19f:
      00F19F DB 10            [11] 2775         in      a,(0x10)                                
      00F1A1 17               [ 4] 2776         rla
      00F1A2 38 FB            [12] 2777         jr      c,m_f19f
      00F1A4                       2778 m_f1a4:
      00F1A4 DB 10            [11] 2779         in      a,(0x10)                                
      00F1A6 17               [ 4] 2780         rla
      00F1A7 30 FB            [12] 2781         jr      nc,m_f1a4
      00F1A9 DB 00            [11] 2782         in      a,(0x00)                                
      00F1AB A0               [ 4] 2783         and     b
      00F1AC B1               [ 4] 2784         or      c
      00F1AD D3 00            [11] 2785         out     (0x00),a                                
      00F1AF C9               [10] 2786         ret
      00F1B0                       2787 m_f1b0:
      00F1B0 CD F3 F1         [17] 2788         call    m_f1f3
      00F1B3 F5               [11] 2789         push    af
      00F1B4                       2790 m_f1b4:
      00F1B4 DB 10            [11] 2791         in      a,(0x10)                                
      00F1B6 17               [ 4] 2792         rla
      00F1B7 38 FB            [12] 2793         jr      c,m_f1b4
      00F1B9                       2794 m_f1b9:
      00F1B9 DB 10            [11] 2795         in      a,(0x10)                                
      00F1BB 17               [ 4] 2796         rla
      00F1BC 30 FB            [12] 2797         jr      nc,m_f1b9
      00F1BE DB 00            [11] 2798         in      a,(0x00)                                
      00F1C0 47               [ 4] 2799         ld      b,a
      00F1C1 F1               [10] 2800         pop     af
      00F1C2 78               [ 4] 2801         ld      a,b
      00F1C3 30 04            [12] 2802         jr      nc,m_f1c9
      00F1C5 1F               [ 4] 2803         rra
      00F1C6 1F               [ 4] 2804         rra
      00F1C7 1F               [ 4] 2805         rra
      00F1C8 1F               [ 4] 2806         rra
      00F1C9                       2807 m_f1c9:
      00F1C9 E6 07            [ 7] 2808         and     #0x07                                   
      00F1CB C9               [10] 2809         ret
      00F1CC                       2810 m_f1cc:
      00F1CC C5               [11] 2811         push    bc
      00F1CD D5               [11] 2812         push    de
      00F1CE 5E               [ 7] 2813         ld      e,(hl)
      00F1CF 23               [ 6] 2814         inc     hl
      00F1D0 56               [ 7] 2815         ld      d,(hl)
      00F1D1 E1               [10] 2816         pop     hl
      00F1D2 D5               [11] 2817         push    de
      00F1D3 5E               [ 7] 2818         ld      e,(hl)
      00F1D4 23               [ 6] 2819         inc     hl
      00F1D5 56               [ 7] 2820         ld      d,(hl)
      00F1D6 21 07 01         [10] 2821         ld      hl,#0x0107                              
      00F1D9 AF               [ 4] 2822         xor     a
      00F1DA ED 52            [15] 2823         sbc     hl,de
      00F1DC 30 03            [12] 2824         jr      nc,m_f1e1
      00F1DE 11 07 01         [10] 2825         ld      de,#0x0107                              
      00F1E1                       2826 m_f1e1:
      00F1E1 EB               [ 4] 2827         ex      de,hl
      00F1E2 D1               [10] 2828         pop     de
      00F1E3 E5               [11] 2829         push    hl
      00F1E4 21 3F 01         [10] 2830         ld      hl,#0x013f                              
      00F1E7 AF               [ 4] 2831         xor     a
      00F1E8 ED 52            [15] 2832         sbc     hl,de
      00F1EA 30 03            [12] 2833         jr      nc,m_f1ef
      00F1EC 11 3F 01         [10] 2834         ld      de,#0x013f                              
      00F1EF                       2835 m_f1ef:
      00F1EF EB               [ 4] 2836         ex      de,hl
      00F1F0 D1               [10] 2837         pop     de
      00F1F1 C1               [10] 2838         pop     bc
      00F1F2 C9               [10] 2839         ret
      00F1F3                       2840 m_f1f3:
      00F1F3 F5               [11] 2841         push    af
      00F1F4 E5               [11] 2842         push    hl
      00F1F5 EB               [ 4] 2843         ex      de,hl
      00F1F6 E5               [11] 2844         push    hl
      00F1F7 29               [11] 2845         add     hl,hl
      00F1F8 29               [11] 2846         add     hl,hl
      00F1F9 29               [11] 2847         add     hl,hl
      00F1FA E5               [11] 2848         push    hl
      00F1FB 29               [11] 2849         add     hl,hl
      00F1FC E5               [11] 2850         push    hl
      00F1FD 29               [11] 2851         add     hl,hl
      00F1FE D1               [10] 2852         pop     de
      00F1FF 19               [11] 2853         add     hl,de
      00F200 D1               [10] 2854         pop     de
      00F201 19               [11] 2855         add     hl,de
      00F202 D1               [10] 2856         pop     de
      00F203 19               [11] 2857         add     hl,de
      00F204 29               [11] 2858         add     hl,hl
      00F205 29               [11] 2859         add     hl,hl
      00F206 EB               [ 4] 2860         ex      de,hl
      00F207 C1               [10] 2861         pop     bc
      00F208 03               [ 6] 2862         inc     bc
      00F209 78               [ 4] 2863         ld      a,b
      00F20A 1F               [ 4] 2864         rra
      00F20B 79               [ 4] 2865         ld      a,c
      00F20C 1F               [ 4] 2866         rra
      00F20D F5               [11] 2867         push    af
      00F20E 26 00            [ 7] 2868         ld      h,#0x00                                 
      00F210 6F               [ 4] 2869         ld      l,a
      00F211 19               [11] 2870         add     hl,de
      00F212 11 92 1D         [10] 2871         ld      de,#0x1d92                              
      00F215 19               [11] 2872         add     hl,de
      00F216 7C               [ 4] 2873         ld      a,h
      00F217 D3 02            [11] 2874         out     (0x02),a                                
      00F219 7D               [ 4] 2875         ld      a,l
      00F21A D3 01            [11] 2876         out     (0x01),a                                
      00F21C F1               [10] 2877         pop     af
      00F21D C1               [10] 2878         pop     bc
      00F21E 78               [ 4] 2879         ld      a,b
      00F21F C9               [10] 2880         ret
      00F220                       2881 bicom_int_clr:
      00F220 AF               [ 4] 2882         xor     a
      00F221 D3 03            [11] 2883         out     (0x03),a                                
      00F223 7E               [ 7] 2884         ld      a,(hl)
      00F224 E6 07            [ 7] 2885         and     #0x07                                   
      00F226 47               [ 4] 2886         ld      b,a
      00F227 87               [ 4] 2887         add     a,a
      00F228 87               [ 4] 2888         add     a,a
      00F229 87               [ 4] 2889         add     a,a
      00F22A 87               [ 4] 2890         add     a,a
      00F22B 80               [ 4] 2891         add     a,b
      00F22C 57               [ 4] 2892         ld      d,a
      00F22D 21 92 1D         [10] 2893         ld      hl,#0x1d92                              
      00F230 01 08 01         [10] 2894         ld      bc,#BICOM_HEIGHT
      00F233                       2895 m_f233:
      00F233 1E A2            [ 7] 2896         ld      e,#0xa2                                 
      00F235                       2897 m_f235:
      00F235 7C               [ 4] 2898         ld      a,h
      00F236 D3 02            [11] 2899         out     (0x02),a                                
      00F238 7D               [ 4] 2900         ld      a,l
      00F239 D3 01            [11] 2901         out     (0x01),a                                
      00F23B 7A               [ 4] 2902         ld      a,d
      00F23C D3 00            [11] 2903         out     (0x00),a                                
      00F23E 23               [ 6] 2904         inc     hl
      00F23F 1D               [ 4] 2905         dec     e
      00F240 20 F3            [12] 2906         jr      nz,m_f235
      00F242 D5               [11] 2907         push    de
      00F243 11 42 00         [10] 2908         ld      de,#0x0042                              
      00F246 19               [11] 2909         add     hl,de
      00F247 D1               [10] 2910         pop     de
      00F248 0B               [ 6] 2911         dec     bc
      00F249 78               [ 4] 2912         ld      a,b
      00F24A B1               [ 4] 2913         or      c
      00F24B 20 E6            [12] 2914         jr      nz,m_f233
      00F24D                       2915 m_f24d:
      00F24D DB 30            [11] 2916         in      a,(STATUS30)
      00F24F CB 4F            [ 8] 2917         bit     1,a                                     
      00F251 20 FA            [12] 2918         jr      nz,m_f24d
      00F253                       2919 m_f253:
      00F253 DB 30            [11] 2920         in      a,(STATUS30)
      00F255 CB 4F            [ 8] 2921         bit     1,a                                     ;_CRT_VSYNC_PERIOD==0
      00F257 28 FA            [12] 2922         jr      z,m_f253
      00F259 3E 01            [ 7] 2923         ld      a,#0x01                                 
      00F25B D3 03            [11] 2924         out     (0x03),a                                
      00F25D C9               [10] 2925         ret
      00F25E                       2926 bicom_int_draw_line:
      00F25E 0A               [ 7] 2927         ld      a,(bc)
      00F25F E6 0F            [ 7] 2928         and     #0x0f                                   
      00F261 32 AD EF         [13] 2929         ld      (0xefad),a                              
      00F264 AF               [ 4] 2930         xor     a
      00F265 32 AE EF         [13] 2931         ld      (0xefae),a                              
      00F268 32 AF EF         [13] 2932         ld      (0xefaf),a                              
      00F26B CD CC F1         [17] 2933         call    m_f1cc
      00F26E 22 B6 EF         [16] 2934         ld      (0xefb6),hl                             
      00F271 EB               [ 4] 2935         ex      de,hl
      00F272 22 B8 EF         [16] 2936         ld      (0xefb8),hl                             
      00F275 E5               [11] 2937         push    hl
      00F276 2A B0 EF         [16] 2938         ld      hl,(0xefb0)                             
      00F279 CD 37 F3         [17] 2939         call    m_f337
      00F27C 32 BB EF         [13] 2940         ld      (0xefbb),a                              
      00F27F D1               [10] 2941         pop     de
      00F280 E5               [11] 2942         push    hl
      00F281 2A B4 EF         [16] 2943         ld      hl,(0xefb4)                             
      00F284 CD 37 F3         [17] 2944         call    m_f337
      00F287 32 BC EF         [13] 2945         ld      (0xefbc),a                              
      00F28A 22 BD EF         [16] 2946         ld      (0xefbd),hl                             
      00F28D D1               [10] 2947         pop     de
      00F28E 7A               [ 4] 2948         ld      a,d
      00F28F B3               [ 4] 2949         or      e
      00F290 CA E6 F2         [10] 2950         jp      z,m_f2e6
      00F293 CD A0 F3         [17] 2951         call    m_f3a0
      00F296 21 00 00         [10] 2952         ld      hl,#0x0000                              
      00F299 3A BC EF         [13] 2953         ld      a,(0xefbc)                              
      00F29C B7               [ 4] 2954         or      a
      00F29D 20 02            [12] 2955         jr      nz,m_f2a1
      00F29F 26 80            [ 7] 2956         ld      h,#0x80                                 
      00F2A1                       2957 m_f2a1:
      00F2A1 22 B2 EF         [16] 2958         ld      (0xefb2),hl                             
      00F2A4 2A B4 EF         [16] 2959         ld      hl,(0xefb4)                             
      00F2A7 22 BF EF         [16] 2960         ld      (0xefbf),hl                             
      00F2AA                       2961 m_f2aa:
      00F2AA CD 43 F3         [17] 2962         call    m_f343
      00F2AD 2A B4 EF         [16] 2963         ld      hl,(0xefb4)                             
      00F2B0 ED 5B BF EF      [20] 2964         ld      de,(0xefbf)                             
      00F2B4 22 BF EF         [16] 2965         ld      (0xefbf),hl                             
      00F2B7 AF               [ 4] 2966         xor     a
      00F2B8 ED 52            [15] 2967         sbc     hl,de
      00F2BA 28 07            [12] 2968         jr      z,m_f2c3
      00F2BC CD 7F F3         [17] 2969         call    m_f37f
      00F2BF ED 53 BF EF      [20] 2970         ld      (0xefbf),de                             
      00F2C3                       2971 m_f2c3:
      00F2C3 CD F2 F2         [17] 2972         call    m_f2f2
      00F2C6 AF               [ 4] 2973         xor     a
      00F2C7 2A B0 EF         [16] 2974         ld      hl,(0xefb0)                             
      00F2CA ED 5B B6 EF      [20] 2975         ld      de,(0xefb6)                             
      00F2CE ED 52            [15] 2976         sbc     hl,de
      00F2D0 C8               [11] 2977         ret     z
      00F2D1 2A B0 EF         [16] 2978         ld      hl,(0xefb0)                             
      00F2D4 3A BB EF         [13] 2979         ld      a,(0xefbb)                              
      00F2D7 B7               [ 4] 2980         or      a
      00F2D8 20 03            [12] 2981         jr      nz,m_f2dd
      00F2DA 2B               [ 6] 2982         dec     hl
      00F2DB 18 01            [12] 2983         jr      m_f2de
      00F2DD                       2984 m_f2dd:
      00F2DD 23               [ 6] 2985         inc     hl
      00F2DE                       2986 m_f2de:
      00F2DE 22 B0 EF         [16] 2987         ld      (0xefb0),hl                             
      00F2E1 CD 43 F3         [17] 2988         call    m_f343
      00F2E4 18 C4            [12] 2989         jr      m_f2aa
      00F2E6                       2990 m_f2e6:
      00F2E6 2A B4 EF         [16] 2991         ld      hl,(0xefb4)                             
      00F2E9 22 BF EF         [16] 2992         ld      (0xefbf),hl                             
      00F2EC 2A B8 EF         [16] 2993         ld      hl,(0xefb8)                             
      00F2EF 22 B4 EF         [16] 2994         ld      (0xefb4),hl                             
      00F2F2                       2995 m_f2f2:
      00F2F2 3A AD EF         [13] 2996         ld      a,(0xefad)                              
      00F2F5 B7               [ 4] 2997         or      a
      00F2F6 28 1E            [12] 2998         jr      z,m_f316
      00F2F8 47               [ 4] 2999         ld      b,a
      00F2F9 3A AE EF         [13] 3000         ld      a,(0xefae)                              
      00F2FC B8               [ 4] 3001         cp      b
      00F2FD 20 0D            [12] 3002         jr      nz,m_f30c
      00F2FF 3A AF EF         [13] 3003         ld      a,(0xefaf)                              
      00F302 2F               [ 4] 3004         cpl
      00F303 32 AF EF         [13] 3005         ld      (0xefaf),a                              
      00F306 AF               [ 4] 3006         xor     a
      00F307 32 AE EF         [13] 3007         ld      (0xefae),a                              
      00F30A 18 E6            [12] 3008         jr      m_f2f2
      00F30C                       3009 m_f30c:
      00F30C 3C               [ 4] 3010         inc     a
      00F30D 32 AE EF         [13] 3011         ld      (0xefae),a                              
      00F310 3A AF EF         [13] 3012         ld      a,(0xefaf)                              
      00F313 B7               [ 4] 3013         or      a
      00F314 20 0D            [12] 3014         jr      nz,m_f323
      00F316                       3015 m_f316:
      00F316 2A B0 EF         [16] 3016         ld      hl,(0xefb0)                             
      00F319 ED 5B BF EF      [20] 3017         ld      de,(0xefbf)                             
      00F31D 3A BA EF         [13] 3018         ld      a,(0xefba)                              
      00F320 CD 8B F1         [17] 3019         call    m_f18b
      00F323                       3020 m_f323:
      00F323 AF               [ 4] 3021         xor     a
      00F324 ED 5B BF EF      [20] 3022         ld      de,(0xefbf)                             
      00F328 2A B4 EF         [16] 3023         ld      hl,(0xefb4)                             
      00F32B ED 52            [15] 3024         sbc     hl,de
      00F32D C8               [11] 3025         ret     z
      00F32E CD 7F F3         [17] 3026         call    m_f37f
      00F331 ED 53 BF EF      [20] 3027         ld      (0xefbf),de                             
      00F335 18 BB            [12] 3028         jr      m_f2f2
      00F337                       3029 m_f337:
      00F337 AF               [ 4] 3030         xor     a
      00F338 ED 52            [15] 3031         sbc     hl,de
      00F33A D0               [11] 3032         ret     nc
      00F33B 11 01 00         [10] 3033         ld      de,#0x0001                              
      00F33E EB               [ 4] 3034         ex      de,hl
      00F33F ED 52            [15] 3035         sbc     hl,de
      00F341 3D               [ 4] 3036         dec     a
      00F342 C9               [10] 3037         ret
      00F343                       3038 m_f343:
      00F343 2A B2 EF         [16] 3039         ld      hl,(0xefb2)                             
      00F346 3A BC EF         [13] 3040         ld      a,(0xefbc)                              
      00F349 B7               [ 4] 3041         or      a
      00F34A 20 19            [12] 3042         jr      nz,m_f365
      00F34C AF               [ 4] 3043         xor     a
      00F34D ED 5B C1 EF      [20] 3044         ld      de,(0xefc1)                             
      00F351 ED 52            [15] 3045         sbc     hl,de
      00F353 22 B2 EF         [16] 3046         ld      (0xefb2),hl                             
      00F356 2A B4 EF         [16] 3047         ld      hl,(0xefb4)                             
      00F359 ED 5B C3 EF      [20] 3048         ld      de,(0xefc3)                             
      00F35D ED 52            [15] 3049         sbc     hl,de
      00F35F EB               [ 4] 3050         ex      de,hl
      00F360 CD 86 F3         [17] 3051         call    m_f386
      00F363 18 15            [12] 3052         jr      m_f37a
      00F365                       3053 m_f365:
      00F365 ED 5B C1 EF      [20] 3054         ld      de,(0xefc1)                             
      00F369 19               [11] 3055         add     hl,de
      00F36A 22 B2 EF         [16] 3056         ld      (0xefb2),hl                             
      00F36D 2A B4 EF         [16] 3057         ld      hl,(0xefb4)                             
      00F370 ED 5B C3 EF      [20] 3058         ld      de,(0xefc3)                             
      00F374 ED 5A            [15] 3059         adc     hl,de
      00F376 EB               [ 4] 3060         ex      de,hl
      00F377 CD 94 F3         [17] 3061         call    m_f394
      00F37A                       3062 m_f37a:
      00F37A ED 53 B4 EF      [20] 3063         ld      (0xefb4),de                             
      00F37E C9               [10] 3064         ret
      00F37F                       3065 m_f37f:
      00F37F 3A BC EF         [13] 3066         ld      a,(0xefbc)                              
      00F382 B7               [ 4] 3067         or      a
      00F383 20 0E            [12] 3068         jr      nz,m_f393
      00F385 1B               [ 6] 3069         dec     de
      00F386                       3070 m_f386:
      00F386 CB 7A            [ 8] 3071         bit     7,d                                     
      00F388 20 11            [12] 3072         jr      nz,m_f39b
      00F38A AF               [ 4] 3073         xor     a
      00F38B 2A B8 EF         [16] 3074         ld      hl,(0xefb8)                             
      00F38E ED 52            [15] 3075         sbc     hl,de
      00F390 D8               [11] 3076         ret     c
      00F391 18 08            [12] 3077         jr      m_f39b
      00F393                       3078 m_f393:
      00F393 13               [ 6] 3079         inc     de
      00F394                       3080 m_f394:
      00F394 AF               [ 4] 3081         xor     a
      00F395 2A B8 EF         [16] 3082         ld      hl,(0xefb8)                             
      00F398 ED 52            [15] 3083         sbc     hl,de
      00F39A D0               [11] 3084         ret     nc
      00F39B                       3085 m_f39b:
      00F39B ED 5B B8 EF      [20] 3086         ld      de,(0xefb8)                             
      00F39F C9               [10] 3087         ret
      00F3A0                       3088 m_f3a0:
      00F3A0 21 00 00         [10] 3089         ld      hl,#0x0000                              
      00F3A3 22 BF EF         [16] 3090         ld      (0xefbf),hl                             
      00F3A6 22 C1 EF         [16] 3091         ld      (0xefc1),hl                             
      00F3A9 22 C3 EF         [16] 3092         ld      (0xefc3),hl                             
      00F3AC 0E 20            [ 7] 3093         ld      c,#0x20                                 
      00F3AE                       3094 m_f3ae:
      00F3AE B7               [ 4] 3095         or      a
      00F3AF 2A BF EF         [16] 3096         ld      hl,(0xefbf)                             
      00F3B2 ED 52            [15] 3097         sbc     hl,de
      00F3B4 30 2D            [12] 3098         jr      nc,m_f3e3
      00F3B6 D5               [11] 3099         push    de
      00F3B7 06 00            [ 7] 3100         ld      b,#0x00                                 
      00F3B9                       3101 m_f3b9:
      00F3B9 2A C1 EF         [16] 3102         ld      hl,(0xefc1)                             
      00F3BC 29               [11] 3103         add     hl,hl
      00F3BD 22 C1 EF         [16] 3104         ld      (0xefc1),hl                             
      00F3C0 2A C3 EF         [16] 3105         ld      hl,(0xefc3)                             
      00F3C3 ED 6A            [15] 3106         adc     hl,hl
      00F3C5 22 C3 EF         [16] 3107         ld      (0xefc3),hl                             
      00F3C8 3A C1 EF         [13] 3108         ld      a,(0xefc1)                              
      00F3CB B0               [ 4] 3109         or      b
      00F3CC 32 C1 EF         [13] 3110         ld      (0xefc1),a                              
      00F3CF 2A BD EF         [16] 3111         ld      hl,(0xefbd)                             
      00F3D2 29               [11] 3112         add     hl,hl
      00F3D3 22 BD EF         [16] 3113         ld      (0xefbd),hl                             
      00F3D6 2A BF EF         [16] 3114         ld      hl,(0xefbf)                             
      00F3D9 ED 6A            [15] 3115         adc     hl,hl
      00F3DB 22 BF EF         [16] 3116         ld      (0xefbf),hl                             
      00F3DE D1               [10] 3117         pop     de
      00F3DF 0D               [ 4] 3118         dec     c
      00F3E0 20 CC            [12] 3119         jr      nz,m_f3ae
      00F3E2 C9               [10] 3120         ret
      00F3E3                       3121 m_f3e3:
      00F3E3 22 BF EF         [16] 3122         ld      (0xefbf),hl                             
      00F3E6 D5               [11] 3123         push    de
      00F3E7 06 01            [ 7] 3124         ld      b,#0x01                                 
      00F3E9 18 CE            [12] 3125         jr      m_f3b9
      00F3EB                       3126 bicom_int_prt_line:
      00F3EB 7E               [ 7] 3127         ld      a,(hl)
      00F3EC FE 18            [ 7] 3128         cp      #0x18                                   
      00F3EE 38 02            [12] 3129         jr      c,m_f3f2
      00F3F0 3E 17            [ 7] 3130         ld      a,#0x17                                 
      00F3F2                       3131 m_f3f2:
      00F3F2 32 BD EF         [13] 3132         ld      (0xefbd),a                              
      00F3F5 47               [ 4] 3133         ld      b,a
      00F3F6 3E 19            [ 7] 3134         ld      a,#0x19                                 
      00F3F8 90               [ 4] 3135         sub     b
      00F3F9 47               [ 4] 3136         ld      b,a
      00F3FA 1A               [ 7] 3137         ld      a,(de)
      00F3FB B7               [ 4] 3138         or      a
      00F3FC 21 80 EF         [10] 3139         ld      hl,#0xef80                              
      00F3FF CA D1 F4         [10] 3140         jp      z,m_f4d1
      00F402 B8               [ 4] 3141         cp      b
      00F403 38 02            [12] 3142         jr      c,m_f407
      00F405 78               [ 4] 3143         ld      a,b
      00F406 3D               [ 4] 3144         dec     a
      00F407                       3145 m_f407:
      00F407 32 BE EF         [13] 3146         ld      (0xefbe),a                              
      00F40A                       3147 m_f40a:
      00F40A 21 40 EF         [10] 3148         ld      hl,#0xef40                              
      00F40D CD D1 F4         [17] 3149         call    m_f4d1
      00F410 3A BD EF         [13] 3150         ld      a,(0xefbd)                              
      00F413 6F               [ 4] 3151         ld      l,a
      00F414 26 00            [ 7] 3152         ld      h,#0x00                                 
      00F416 E5               [11] 3153         push    hl
      00F417 29               [11] 3154         add     hl,hl
      00F418 E5               [11] 3155         push    hl
      00F419 29               [11] 3156         add     hl,hl
      00F41A 29               [11] 3157         add     hl,hl
      00F41B D1               [10] 3158         pop     de
      00F41C DB 10            [11] 3159         in      a,(0x10)                                
      00F41E CB 77            [ 8] 3160         bit     6,a                                     
      00F420 20 01            [12] 3161         jr      nz,m_f423
      00F422 19               [11] 3162         add     hl,de
      00F423                       3163 m_f423:
      00F423 D1               [10] 3164         pop     de
      00F424 19               [11] 3165         add     hl,de
      00F425 EB               [ 4] 3166         ex      de,hl
      00F426 21 00 00         [10] 3167         ld      hl,#0x0000                              
      00F429                       3168 m_f429:
      00F429 D5               [11] 3169         push    de
      00F42A DB 10            [11] 3170         in      a,(0x10)                                
      00F42C CB 77            [ 8] 3171         bit     6,a                                     
      00F42E 0E 04            [ 7] 3172         ld      c,#0x04                                 
      00F430 20 02            [12] 3173         jr      nz,m_f434
      00F432 0E 06            [ 7] 3174         ld      c,#0x06                                 
      00F434                       3175 m_f434:
      00F434 CD 8F F4         [17] 3176         call    m_f48f
      00F437 11 3F 01         [10] 3177         ld      de,#0x013f                              
      00F43A EB               [ 4] 3178         ex      de,hl
      00F43B AF               [ 4] 3179         xor     a
      00F43C ED 52            [15] 3180         sbc     hl,de
      00F43E 28 05            [12] 3181         jr      z,m_f445
      00F440 EB               [ 4] 3182         ex      de,hl
      00F441 23               [ 6] 3183         inc     hl
      00F442 D1               [10] 3184         pop     de
      00F443 18 E4            [12] 3185         jr      m_f429
      00F445                       3186 m_f445:
      00F445 21 50 EF         [10] 3187         ld      hl,#0xef50                              
      00F448 CD D1 F4         [17] 3188         call    m_f4d1
      00F44B D1               [10] 3189         pop     de
      00F44C DB 10            [11] 3190         in      a,(0x10)                                
      00F44E CB 77            [ 8] 3191         bit     6,a                                     
      00F450 21 04 00         [10] 3192         ld      hl,#0x0004                              
      00F453 20 02            [12] 3193         jr      nz,m_f457
      00F455 2E 06            [ 7] 3194         ld      l,#0x06                                 
      00F457                       3195 m_f457:
      00F457 19               [11] 3196         add     hl,de
      00F458 EB               [ 4] 3197         ex      de,hl
      00F459 21 00 00         [10] 3198         ld      hl,#0x0000                              
      00F45C                       3199 m_f45c:
      00F45C D5               [11] 3200         push    de
      00F45D 0E 05            [ 7] 3201         ld      c,#0x05                                 
      00F45F CD 8F F4         [17] 3202         call    m_f48f
      00F462 11 3F 01         [10] 3203         ld      de,#0x013f                              
      00F465 EB               [ 4] 3204         ex      de,hl
      00F466 AF               [ 4] 3205         xor     a
      00F467 ED 52            [15] 3206         sbc     hl,de
      00F469 28 05            [12] 3207         jr      z,m_f470
      00F46B EB               [ 4] 3208         ex      de,hl
      00F46C 23               [ 6] 3209         inc     hl
      00F46D D1               [10] 3210         pop     de
      00F46E 18 EC            [12] 3211         jr      m_f45c
      00F470                       3212 m_f470:
      00F470 D1               [10] 3213         pop     de
      00F471 3A BE EF         [13] 3214         ld      a,(0xefbe)                              
      00F474 3D               [ 4] 3215         dec     a
      00F475 28 12            [12] 3216         jr      z,m_f489
      00F477 32 BE EF         [13] 3217         ld      (0xefbe),a                              
      00F47A 21 60 EF         [10] 3218         ld      hl,#0xef60                              
      00F47D CD D1 F4         [17] 3219         call    m_f4d1
      00F480 3A BD EF         [13] 3220         ld      a,(0xefbd)                              
      00F483 3C               [ 4] 3221         inc     a
      00F484 32 BD EF         [13] 3222         ld      (0xefbd),a                              
      00F487 18 81            [12] 3223         jr      m_f40a
      00F489                       3224 m_f489:
      00F489 21 70 EF         [10] 3225         ld      hl,#0xef70                              
      00F48C C3 D1 F4         [10] 3226         jp      m_f4d1
      00F48F                       3227 m_f48f:
      00F48F AF               [ 4] 3228         xor     a
      00F490                       3229 m_f490:
      00F490 32 BF EF         [13] 3230         ld      (0xefbf),a                              
      00F493 E5               [11] 3231         push    hl
      00F494 D5               [11] 3232         push    de
      00F495 C5               [11] 3233         push    bc
      00F496 CD B0 F1         [17] 3234         call    m_f1b0
      00F499 06 00            [ 7] 3235         ld      b,#0x00                                 
      00F49B B7               [ 4] 3236         or      a
      00F49C 28 01            [12] 3237         jr      z,m_f49f
      00F49E 04               [ 4] 3238         inc     b
      00F49F                       3239 m_f49f:
      00F49F 3A BF EF         [13] 3240         ld      a,(0xefbf)                              
      00F4A2 87               [ 4] 3241         add     a,a
      00F4A3 80               [ 4] 3242         add     a,b
      00F4A4 C1               [10] 3243         pop     bc
      00F4A5 D1               [10] 3244         pop     de
      00F4A6 E1               [10] 3245         pop     hl
      00F4A7 13               [ 6] 3246         inc     de
      00F4A8 0D               [ 4] 3247         dec     c
      00F4A9 20 E5            [12] 3248         jr      nz,m_f490
      00F4AB 4F               [ 4] 3249         ld      c,a
      00F4AC 3A C5 EF         [13] 3250         ld      a,(0xefc5)                              
      00F4AF B7               [ 4] 3251         or      a
      00F4B0 28 0E            [12] 3252         jr      z,m_f4c0
      00F4B2 79               [ 4] 3253         ld      a,c
      00F4B3 06 08            [ 7] 3254         ld      b,#0x08                                 
      00F4B5 0E 00            [ 7] 3255         ld      c,#0x00                                 
      00F4B7                       3256 m_f4b7:
      00F4B7 1F               [ 4] 3257         rra
      00F4B8 57               [ 4] 3258         ld      d,a
      00F4B9 79               [ 4] 3259         ld      a,c
      00F4BA 17               [ 4] 3260         rla
      00F4BB 4F               [ 4] 3261         ld      c,a
      00F4BC 7A               [ 4] 3262         ld      a,d
      00F4BD 05               [ 4] 3263         dec     b
      00F4BE 20 F7            [12] 3264         jr      nz,m_f4b7
      00F4C0                       3265 m_f4c0:
      00F4C0 E5               [11] 3266         push    hl
      00F4C1 CD 39 E4         [17] 3267         call    dev_printer_write_byte
      00F4C4 3A C6 EF         [13] 3268         ld      a,(0xefc6)                              
      00F4C7 B7               [ 4] 3269         or      a
      00F4C8 28 05            [12] 3270         jr      z,m_f4cf
      00F4CA 0E 00            [ 7] 3271         ld      c,#0x00                                 
      00F4CC CD 39 E4         [17] 3272         call    dev_printer_write_byte
      00F4CF                       3273 m_f4cf:
      00F4CF E1               [10] 3274         pop     hl
      00F4D0 C9               [10] 3275         ret
      00F4D1                       3276 m_f4d1:
      00F4D1 7E               [ 7] 3277         ld      a,(hl)
      00F4D2                       3278 m_f4d2:
      00F4D2 B7               [ 4] 3279         or      a
      00F4D3 C8               [11] 3280         ret     z
      00F4D4 23               [ 6] 3281         inc     hl
      00F4D5 4E               [ 7] 3282         ld      c,(hl)
      00F4D6 E5               [11] 3283         push    hl
      00F4D7 F5               [11] 3284         push    af
      00F4D8 CD 39 E4         [17] 3285         call    dev_printer_write_byte
      00F4DB F1               [10] 3286         pop     af
      00F4DC E1               [10] 3287         pop     hl
      00F4DD 3D               [ 4] 3288         dec     a
      00F4DE 18 F2            [12] 3289         jr      m_f4d2
      00F4E0                       3290 m_f4e0:
      00F4E0 7E               [ 7] 3291         ld      a,(hl)
      00F4E1 B7               [ 4] 3292         or      a
      00F4E2 28 15            [12] 3293         jr      z,m_f4f9
      00F4E4 FE 01            [ 7] 3294         cp      #0x01                                   
      00F4E6 28 16            [12] 3295         jr      z,m_f4fe
      00F4E8 FE 02            [ 7] 3296         cp      #0x02                                   
      00F4EA 28 19            [12] 3297         jr      z,m_f505
      00F4EC FE 03            [ 7] 3298         cp      #0x03                                   
      00F4EE 28 1C            [12] 3299         jr      z,m_f50c
      00F4F0 FE 04            [ 7] 3300         cp      #0x04                                   
      00F4F2 28 20            [12] 3301         jr      z,m_f514
      00F4F4 FE 05            [ 7] 3302         cp      #0x05                                   
      00F4F6 28 25            [12] 3303         jr      z,m_f51d
      00F4F8 C9               [10] 3304         ret
      00F4F9                       3305 m_f4f9:
      00F4F9 2A 37 E4         [16] 3306         ld      hl,(0xe437)                             
      00F4FC 18 03            [12] 3307         jr      m_f501
      00F4FE                       3308 m_f4fe:
      00F4FE 2A 3D E4         [16] 3309         ld      hl,(0xe43d)                             
      00F501                       3310 m_f501:
      00F501 22 3A E4         [16] 3311         ld      (0xe43a),hl                             
      00F504 C9               [10] 3312         ret
      00F505                       3313 m_f505:
      00F505 AF               [ 4] 3314         xor     a
      00F506 47               [ 4] 3315         ld      b,a
      00F507 21 3A F5         [10] 3316         ld      hl,#0xf53a                              
      00F50A 18 17            [12] 3317         jr      m_f523
      00F50C                       3318 m_f50c:
      00F50C AF               [ 4] 3319         xor     a
      00F50D 06 FF            [ 7] 3320         ld      b,#0xff                                 
      00F50F 21 DA F5         [10] 3321         ld      hl,#0xf5da                              
      00F512 18 0F            [12] 3322         jr      m_f523
      00F514                       3323 m_f514:
      00F514 3E FF            [ 7] 3324         ld      a,#0xff                                 
      00F516 06 00            [ 7] 3325         ld      b,#0x00                                 
      00F518 21 DA F5         [10] 3326         ld      hl,#0xf5da                              
      00F51B 18 06            [12] 3327         jr      m_f523
      00F51D                       3328 m_f51d:
      00F51D 3E FF            [ 7] 3329         ld      a,#0xff                                 
      00F51F 47               [ 4] 3330         ld      b,a
      00F520 21 7A F6         [10] 3331         ld      hl,#0xf67a                              
      00F523                       3332 m_f523:
      00F523 32 C5 EF         [13] 3333         ld      (0xefc5),a                              
      00F526 78               [ 4] 3334         ld      a,b
      00F527 32 C6 EF         [13] 3335         ld      (0xefc6),a                              
      00F52A 11 40 EF         [10] 3336         ld      de,#0xef40                              
      00F52D 01 50 00         [10] 3337         ld      bc,#0x0050                              
      00F530 DB 10            [11] 3338         in      a,(STATUS10)
      00F532 CB 77            [ 8] 3339         bit     6,a                                     
      00F534 28 01            [12] 3340         jr      z,m_f537
      00F536 09               [11] 3341         add     hl,bc
      00F537                       3342 m_f537:
      00F537 ED B0            [21] 3343         ldir
      00F539 C9               [10] 3344         ret
                                   3345 ; unchecked data source
      00F53A 07 1B 41 05 1B 4B 40  3346         .db     0x07,0x1b,0x41,0x05,0x1b,0x4b,0x40,0x01 ;..A..K@.
             01
      00F542 00 00 00 00 00 00 00  3347         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F54A 09 0D 0A 1B 41 06 1B  3348         .db     0x09,0x0d,0x0a,0x1b,0x41,0x06,0x1b,0x4b ;....A..K
             4B
      00F552 40 01 00 00 00 00 00  3349         .db     0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x00 ;@.......
             00
      00F55A 02 0D 0A 00 00 00 00  3350         .db     0x02,0x0d,0x0a,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F562 00 00 00 00 00 00 00  3351         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F56A 01 0D 00 00 00 00 00  3352         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F572 00 00 00 00 00 00 00  3353         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F57A 05 0D 0A 1B 41 0C 00  3354         .db     0x05,0x0d,0x0a,0x1b,0x41,0x0c,0x00,0x00 ;....A...
             00
      00F582 00 00 00 00 00 00 00  3355         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F58A 07 1B 41 05 1B 4B 40  3356         .db     0x07,0x1b,0x41,0x05,0x1b,0x4b,0x40,0x01 ;..A..K@.
             01
      00F592 00 00 00 00 00 00 00  3357         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F59A 09 0D 0A 1B 41 04 1B  3358         .db     0x09,0x0d,0x0a,0x1b,0x41,0x04,0x1b,0x4b ;....A..K
             4B
      00F5A2 40 01 00 00 00 00 00  3359         .db     0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x00 ;@.......
             00
      00F5AA 02 0D 0A 00 00 00 00  3360         .db     0x02,0x0d,0x0a,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5B2 00 00 00 00 00 00 00  3361         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5BA 01 0D 00 00 00 00 00  3362         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5C2 00 00 00 00 00 00 00  3363         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5CA 05 0D 0A 1B 41 0C 00  3364         .db     0x05,0x0d,0x0a,0x1b,0x41,0x0c,0x00,0x00 ;....A...
             00
      00F5D2 00 00 00 00 00 00 00  3365         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F5DA 0A 1B 54 31 30 1B 53  3366         .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
             30
      00F5E2 33 32 30 00 00 00 00  3367         .db     0x33,0x32,0x30,0x00,0x00,0x00,0x00,0x00 ;320.....
             00
      00F5EA 0C 0D 0A 1B 54 31 32  3368         .db     0x0c,0x0d,0x0a,0x1b,0x54,0x31,0x32,0x1b ;....T12.
             1B
      00F5F2 53 30 33 32 30 00 00  3369         .db     0x53,0x30,0x33,0x32,0x30,0x00,0x00,0x00 ;S0320...
             00
      00F5FA 02 0D 0A 00 00 00 00  3370         .db     0x02,0x0d,0x0a,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F602 00 00 00 00 00 00 00  3371         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F60A 01 0D 00 00 00 00 00  3372         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F612 00 00 00 00 00 00 00  3373         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F61A 06 0D 0A 1B 54 32 34  3374         .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x00 ;....T24.
             00
      00F622 00 00 00 00 00 00 00  3375         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F62A 0A 1B 54 31 30 1B 53  3376         .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
             30
      00F632 33 32 30 00 00 00 00  3377         .db     0x33,0x32,0x30,0x00,0x00,0x00,0x00,0x00 ;320.....
             00
      00F63A 0C 0D 0A 1B 54 30 38  3378         .db     0x0c,0x0d,0x0a,0x1b,0x54,0x30,0x38,0x1b ;....T08.
             1B
      00F642 53 30 33 32 30 00 00  3379         .db     0x53,0x30,0x33,0x32,0x30,0x00,0x00,0x00 ;S0320...
             00
      00F64A 02 0D 0A 09 00 00 00  3380         .db     0x02,0x0d,0x0a,0x09,0x00,0x00,0x00,0x00 ;........
             00
      00F652 00 00 00 00 00 00 00  3381         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F65A 01 0D 00 00 00 00 00  3382         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F662 00 00 00 00 00 00 00  3383         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F66A 06 0D 0A 1B 54 32 34  3384         .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x20 ;....T24 
             20
      00F672 00 00 00 00 00 00 00  3385         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F67A 0A 1B 54 31 30 1B 53  3386         .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
             30
      00F682 36 34 30 09 00 00 00  3387         .db     0x36,0x34,0x30,0x09,0x00,0x00,0x00,0x00 ;640.....
             00
      00F68A 0C 0D 0A 1B 54 31 32  3388         .db     0x0c,0x0d,0x0a,0x1b,0x54,0x31,0x32,0x1b ;....T12.
             1B
      00F692 53 30 36 34 30 0A 00  3389         .db     0x53,0x30,0x36,0x34,0x30,0x0a,0x00,0x00 ;S0640...
             00
      00F69A 02 0D 0A 30 00 00 00  3390         .db     0x02,0x0d,0x0a,0x30,0x00,0x00,0x00,0x00 ;...0....
             00
      00F6A2 00 00 00 00 00 00 00  3391         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6AA 01 0D 00 00 00 00 00  3392         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6B2 00 00 00 00 00 00 00  3393         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6BA 06 0D 0A 1B 54 32 34  3394         .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x37 ;....T247
             37
      00F6C2 00 00 00 00 00 00 00  3395         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6CA 0A 1B 54 31 30 1B 53  3396         .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
             30
      00F6D2 36 34 30 20 00 00 00  3397         .db     0x36,0x34,0x30,0x20,0x00,0x00,0x00,0x00 ;640 ....
             00
      00F6DA 0C 0D 0A 1B 54 30 38  3398         .db     0x0c,0x0d,0x0a,0x1b,0x54,0x30,0x38,0x1b ;....T08.
             1B
      00F6E2 53 30 36 34 30 20 00  3399         .db     0x53,0x30,0x36,0x34,0x30,0x20,0x00,0x00 ;S0640 ..
             00
      00F6EA 02 0D 0A 20 00 00 00  3400         .db     0x02,0x0d,0x0a,0x20,0x00,0x00,0x00,0x00 ;... ....
             00
      00F6F2 00 00 00 00 00 00 00  3401         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F6FA 01 0D 00 00 00 00 00  3402         .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F702 00 00 00 00 00 00 00  3403         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F70A 06 0D 0A 1B 54 32 34  3404         .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x20 ;....T24 
             20
      00F712 00 00 00 00 00 00 00  3405         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F71A 00 00 00 00 00 00 00  3406         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F722 00 00 00 00 00 00 00  3407         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F72A 00 00 00 00 00 00 00  3408         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F732 00 00 00 00 00 00 00  3409         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F73A 00 00 00 00 00 00 00  3410         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F742 00 00 00 00 00 00 00  3411         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F74A 00 00 00 00 00 00 00  3412         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F752 00 00 00 00 00 00 00  3413         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F75A 00 00 00 00 00 00 00  3414         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F762 00 00 00 00 00 00 00  3415         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F76A 00 00 00 00 00 00 00  3416         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F772 00 00 00 00 00 00 00  3417         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F77A 00 00 00 00 00 00 00  3418         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F782 00 00 00 00 00 00 00  3419         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F78A 00 00 00 00 00 00 00  3420         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F792 00 00 00 00 00 00 00  3421         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F79A 00 00 00 00 00 00 00  3422         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7A2 00 00 00 00 00 00 00  3423         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7AA 00 00 00 00 00 00 00  3424         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7B2 00 00 00 00 00 00 00  3425         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7BA 00 00 00 00 00 00 00  3426         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7C2 00 00 00 00 00 00 00  3427         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7CA 00 00 00 00 00 00 00  3428         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7D2 00 00 00 00 00 00 00  3429         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7DA 00 00 00 00 00 00 00  3430         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7E2 00 00 00 00 00 00 00  3431         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7EA 00 00 00 00 00 00 00  3432         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7F2 00 00 00 00 00 00 00  3433         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00F7FA 00 00 00 00 00 00     3434         .db     0x00,0x00,0x00,0x00,0x00,0x00           ;......
      00F800                       3435 kbd_table_int:
      00F800 30 31 32 33 34 35 36  3436         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F808 38 39 2E FF 2B 2D 3D  3437         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00F810 FF 61 62 63 64 65 66  3438         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00F818 68 69 6A 6B 6C 6D 6E  3439         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00F820 70 71 72 73 74 75 76  3440         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00F828 78 7A 79 FF FF FF FF  3441         .db     0x78,0x7a,0x79,0xff,0xff,0xff,0xff,0xff ;xzy.....
             FF
      00F830 30 31 32 33 34 35 36  3442         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F838 38 39 7E 27 7D 2B 23  3443         .db     0x38,0x39,0x7e,0x27,0x7d,0x2b,0x23,0x7b ;89~'}+#{
             7B
      00F840 FF FF 20 3C 2C 2E 2D  3444         .db     0xff,0xff,0x20,0x3c,0x2c,0x2e,0x2d,0x7c ;.. <,.-|
             7C
      00F848 1F 1C 1D 1E 9B FF 7F  3445         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00F850 FF 7F FF 09 0D DF 0B  3446         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00F858 FF FF 86 85 84 83 82  3447         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00F860                       3448 kbd_table_int_sh:
      00F860 E4 E2 EB E3 E8 E6 E9  3449         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00F868 EA E1 E5 FF 2A 2F E7  3450         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00F870 FF 41 42 43 44 45 46  3451         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00F878 48 49 4A 4B 4C 4D 4E  3452         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00F880 50 51 52 53 54 55 56  3453         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00F888 58 5A 59 FF FF FF FF  3454         .db     0x58,0x5a,0x59,0xff,0xff,0xff,0xff,0xff ;XZY.....
             FF
      00F890 3D 21 22 40 24 25 26  3455         .db     0x3d,0x21,0x22,0x40,0x24,0x25,0x26,0x2f ;=!"@$%&/
             2F
      00F898 28 29 3F 60 5D 2A 5E  3456         .db     0x28,0x29,0x3f,0x60,0x5d,0x2a,0x5e,0x5b ;()?`]*^[
             5B
      00F8A0 FF FF 20 3E 3B 3A 5F  3457         .db     0xff,0xff,0x20,0x3e,0x3b,0x3a,0x5f,0x5c ;.. >;:_\
             5C
      00F8A8 EC EF EE ED 9B FF 7F  3458         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00F8B0 FF 12 FF 09 0D DF 0C  3459         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00F8B8 FF FF 8C 8B 8A 89 88  3460         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00F8C0                       3461 kbd_table_de:
      00F8C0 30 31 32 33 34 35 36  3462         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F8C8 38 39 2E FF 2B 2D 3D  3463         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00F8D0 FF 61 62 63 64 65 66  3464         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00F8D8 68 69 6A 6B 6C 6D 6E  3465         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00F8E0 70 71 72 73 74 75 76  3466         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00F8E8 58 59 5A FF FF FF FF  3467         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00F8F0 30 31 32 33 34 35 36  3468         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F8F8 38 39 2D 5E 40 5B 5D  3469         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00F900 FF FF 20 5C 2C 2E 2F  3470         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00F908 1F 1C 1D 1E 9B FF 7F  3471         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00F910 FF 7F FF 09 0D DF 0B  3472         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00F918 FF FF 86 85 84 83 82  3473         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00F920 E4 E2 EB E3 E8 E6 E9  3474         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00F928 EA E1 E5 FF 2A 2F E7  3475         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00F930 FF 41 42 43 44 45 46  3476         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00F938 48 49 4A 4B 4C 4D 4E  3477         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00F940 50 51 52 53 54 55 56  3478         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00F948 58 59 5A FF FF FF FF  3479         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00F950 5F 21 22 23 24 25 26  3480         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00F958 28 29 3D 7E 60 7B 7D  3481         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00F960 FF FF 20 7C 3C 3E 3F  3482         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00F968 EC EF EE ED 9B FF 7F  3483         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00F970 FF 12 FF 09 0D DF 0C  3484         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00F978 FF FF 8C 8B 8A 89 88  3485         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00F980                       3486 kbd_table_us:
      00F980 30 31 32 33 34 35 36  3487         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F988 38 39 2E FF 2B 2D 3D  3488         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00F990 FF 71 62 63 64 65 66  3489         .db     0xff,0x71,0x62,0x63,0x64,0x65,0x66,0x67 ;.qbcdefg
             67
      00F998 68 69 6A 6B 6C 2C 6E  3490         .db     0x68,0x69,0x6a,0x6b,0x6c,0x2c,0x6e,0x6f ;hijkl,no
             6F
      00F9A0 70 61 72 73 74 75 76  3491         .db     0x70,0x61,0x72,0x73,0x74,0x75,0x76,0x7a ;parstuvz
             7A
      00F9A8 78 79 77 FF FF FF FF  3492         .db     0x78,0x79,0x77,0xff,0xff,0xff,0xff,0xff ;xyw.....
             FF
      00F9B0 30 31 32 33 34 35 36  3493         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00F9B8 38 39 24 21 5E 26 23  3494         .db     0x38,0x39,0x24,0x21,0x5e,0x26,0x23,0x7c ;89$!^&#|
             7C
      00F9C0 FF FF 20 3C 2E 2F 3D  3495         .db     0xff,0xff,0x20,0x3c,0x2e,0x2f,0x3d,0x6d ;.. <./=m
             6D
      00F9C8 1F 1C 1D 1E 9B FF 7F  3496         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00F9D0 FF 7F FF 09 0D DF 0B  3497         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00F9D8 FF FF 86 85 84 83 82  3498         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00F9E0 E4 E2 EB E3 E8 E6 E9  3499         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00F9E8 EA E1 E5 FF 2A 2F E7  3500         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00F9F0 FF 51 42 43 44 45 46  3501         .db     0xff,0x51,0x42,0x43,0x44,0x45,0x46,0x47 ;.QBCDEFG
             47
      00F9F8 48 49 4A 4B 4C 3B 4E  3502         .db     0x48,0x49,0x4a,0x4b,0x4c,0x3b,0x4e,0x4f ;HIJKL;NO
             4F
      00FA00 50 41 52 53 54 55 56  3503         .db     0x50,0x41,0x52,0x53,0x54,0x55,0x56,0x5a ;PARSTUVZ
             5A
      00FA08 58 59 57 FF FF FF FF  3504         .db     0x58,0x59,0x57,0xff,0xff,0xff,0xff,0xff ;XYW.....
             FF
      00FA10 40 2A 7B 22 27 28 2D  3505         .db     0x40,0x2a,0x7b,0x22,0x27,0x28,0x2d,0x7d ;@*{"'(-}
             7D
      00FA18 5F 5C 29 5D 7E 60 2B  3506         .db     0x5f,0x5c,0x29,0x5d,0x7e,0x60,0x2b,0x25 ;_\)]~`+%
             25
      00FA20 FF FF 20 3E 3A 3F 5B  3507         .db     0xff,0xff,0x20,0x3e,0x3a,0x3f,0x5b,0x4d ;.. >:?[M
             4D
      00FA28 EC EF EE ED 9B FF 7F  3508         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FA30 FF 12 FF 09 0D DF 0C  3509         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FA38 FF FF 8C 8B 8A 89 88  3510         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FA40                       3511 kbd_table_fr:
      00FA40 30 31 32 33 34 35 36  3512         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FA48 38 39 2E FF 2B 2D 3D  3513         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FA50 FF 61 62 63 64 65 66  3514         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FA58 68 69 6A 6B 6C 6D 6E  3515         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00FA60 70 71 72 73 74 75 76  3516         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00FA68 78 79 7A FF FF FF FF  3517         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00FA70 30 31 32 33 34 35 36  3518         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FA78 38 39 2D 5E 40 5B 5D  3519         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00FA80 FF FF 20 3C 2C 2E 2F  3520         .db     0xff,0xff,0x20,0x3c,0x2c,0x2e,0x2f,0x3b ;.. <,./;
             3B
      00FA88 1F 1C 1D 1E 9B FF 7F  3521         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FA90 FF 7F FF 09 0D DF 0B  3522         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FA98 FF FF 86 85 84 83 82  3523         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FAA0 E4 E2 EB E3 E8 E6 E9  3524         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FAA8 EA E1 E5 FF 2A 2F E7  3525         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FAB0 FF 41 42 43 44 45 46  3526         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FAB8 48 49 4A 4B 4C 4D 4E  3527         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00FAC0 50 51 52 53 54 55 56  3528         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00FAC8 58 59 5A FF FF FF FF  3529         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00FAD0 3D 21 22 23 24 25 26  3530         .db     0x3d,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;=!"#$%&'
             27
      00FAD8 28 29 5F 7E 60 7B 7D  3531         .db     0x28,0x29,0x5f,0x7e,0x60,0x7b,0x7d,0x2a ;()_~`{}*
             2A
      00FAE0 FF FF 20 3E 5C 7C 3F  3532         .db     0xff,0xff,0x20,0x3e,0x5c,0x7c,0x3f,0x2b ;.. >\|?+
             2B
      00FAE8 EC EF EE ED 9B FF 7F  3533         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FAF0 FF 12 FF 09 0D DF 0C  3534         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FAF8 FF FF 8C 8B 8A 89 88  3535         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FB00                       3536 kbd_table_uk:
      00FB00 30 31 32 33 34 35 36  3537         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FB08 38 39 2E FF 2B 2D 3D  3538         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FB10 FF 61 62 63 64 65 66  3539         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FB18 68 69 6A 6B 6C 2C 6E  3540         .db     0x68,0x69,0x6a,0x6b,0x6c,0x2c,0x6e,0x6f ;hijkl,no
             6F
      00FB20 70 71 72 73 74 75 76  3541         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x7a ;pqrstuvz
             7A
      00FB28 78 79 77 FF FF FF FF  3542         .db     0x78,0x79,0x77,0xff,0xff,0xff,0xff,0xff ;xyw.....
             FF
      00FB30 30 31 32 33 34 35 36  3543         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FB38 38 39 24 5E 7E 26 23  3544         .db     0x38,0x39,0x24,0x5e,0x7e,0x26,0x23,0x7c ;89$^~&#|
             7C
      00FB40 FF FF 20 3C 2E 2F 5B  3545         .db     0xff,0xff,0x20,0x3c,0x2e,0x2f,0x5b,0x6d ;.. <./[m
             6D
      00FB48 1F 1C 1D 1E 9B FF 7F  3546         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FB50 FF 7F FF 09 0D DF 0B  3547         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FB58 FF FF 86 85 84 83 82  3548         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FB60 E4 E2 EB E3 E8 E6 E9  3549         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FB68 EA E1 E5 FF 2A 2F E7  3550         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FB70 FF 41 42 43 44 45 46  3551         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FB78 48 49 4A 4B 4C 3B 4E  3552         .db     0x48,0x49,0x4a,0x4b,0x4c,0x3b,0x4e,0x4f ;HIJKL;NO
             4F
      00FB80 50 51 52 53 54 55 56  3553         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x5a ;PQRSTUVZ
             5A
      00FB88 58 59 57 FF FF FF FF  3554         .db     0x58,0x59,0x57,0xff,0xff,0xff,0xff,0xff ;XYW.....
             FF
      00FB90 40 2A 7B 22 27 28 2D  3555         .db     0x40,0x2a,0x7b,0x22,0x27,0x28,0x2d,0x7d ;@*{"'(-}
             7D
      00FB98 5F 5C 29 5D 3D 60 2B  3556         .db     0x5f,0x5c,0x29,0x5d,0x3d,0x60,0x2b,0x25 ;_\)]=`+%
             25
      00FBA0 FF FF 20 3E 3A 3F 21  3557         .db     0xff,0xff,0x20,0x3e,0x3a,0x3f,0x21,0x4d ;.. >:?!M
             4D
      00FBA8 EC EF EE ED 9B FF 7F  3558         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FBB0 FF 12 FF 09 0D DF 0C  3559         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FBB8 FF FF 8C 8B 8A 89 88  3560         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FBC0                       3561 kbd_table_it:
      00FBC0 30 31 32 33 34 35 36  3562         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FBC8 38 39 2E FF 2B 2D 3D  3563         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FBD0 FF 61 62 63 64 65 66  3564         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FBD8 68 69 6A 6B 6C 6D 6E  3565         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00FBE0 70 71 72 73 74 75 76  3566         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00FBE8 78 79 7A FF FF FF FF  3567         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00FBF0 30 31 32 33 34 35 36  3568         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FBF8 38 39 2D 5E 40 5B 5D  3569         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00FC00 FF FF 20 5C 2C 2E 2F  3570         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00FC08 1F 1C 1D 1E 9B FF 7F  3571         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FC10 FF 7F FF 09 0D DF 0B  3572         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FC18 FF FF 86 85 84 83 82  3573         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FC20 E4 E2 EB E3 E8 E6 E9  3574         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FC28 EA E1 E5 FF 2A 2F E7  3575         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FC30 FF 41 42 43 44 45 46  3576         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FC38 48 49 4A 4B 4C 4D 4E  3577         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00FC40 50 51 52 53 54 55 56  3578         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00FC48 58 59 5A FF FF FF FF  3579         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00FC50 5F 21 22 23 24 25 26  3580         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00FC58 28 29 3D 7E 60 7B 7D  3581         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00FC60 FF FF 20 7C 3C 3E 3F  3582         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00FC68 EC EF EE ED 9B FF 7F  3583         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FC70 FF 12 FF 09 0D DF 0C  3584         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FC78 FF FF 8C 8B 8A 89 88  3585         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FC80                       3586 kbd_table_es:
      00FC80 30 31 32 33 34 35 36  3587         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FC88 38 39 2E FF 2B 2D 3D  3588         .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
             FF
      00FC90 FF 61 62 63 64 65 66  3589         .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
             67
      00FC98 68 69 6A 6B 6C 6D 6E  3590         .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
             6F
      00FCA0 70 71 72 73 74 75 76  3591         .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
             77
      00FCA8 78 79 7A FF FF FF FF  3592         .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
             FF
      00FCB0 30 31 32 33 34 35 36  3593         .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
             37
      00FCB8 38 39 2D 5E 40 5B 5D  3594         .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
             3A
      00FCC0 FF FF 20 5C 2C 2E 2F  3595         .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
             3B
      00FCC8 1F 1C 1D 1E 9B FF 7F  3596         .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
             1B
      00FCD0 FF 7F FF 09 0D DF 0B  3597         .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
             03
      00FCD8 FF FF 86 85 84 83 82  3598         .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
             81
      00FCE0 E4 E2 EB E3 E8 E6 E9  3599         .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
             E0
      00FCE8 EA E1 E5 FF 2A 2F E7  3600         .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
             FF
      00FCF0 FF 41 42 43 44 45 46  3601         .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
             47
      00FCF8 48 49 4A 4B 4C 4D 4E  3602         .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
             4F
      00FD00 50 51 52 53 54 55 56  3603         .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
             57
      00FD08 58 59 5A FF FF FF FF  3604         .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
             FF
      00FD10 5F 21 22 23 24 25 26  3605         .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
             27
      00FD18 28 29 3D 7E 60 7B 7D  3606         .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
             2A
      00FD20 FF FF 20 7C 3C 3E 3F  3607         .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
             2B
      00FD28 EC EF EE ED 9B FF 7F  3608         .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
             1B
      00FD30 FF 12 FF 09 0D DF 0C  3609         .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FD38 FF FF 8C 8B 8A 89 88  3610         .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
             87
      00FD40                       3611 crt_table_ntsc:
      00FD40 38 28 2F 34 1C 01 18  3612         .db     0x38,0x28,0x2f,0x34,0x1c,0x01,0x18,0x19 ;8(/4....
             19
      00FD48 00 08 48 09 00 00 00  3613         .db     0x00,0x08,0x48,0x09,0x00,0x00,0x00,0x00 ;..H.....
             00
      00FD50 00 00 71 50 5C 38 1C  3614         .db     0x00,0x00,0x71,0x50,0x5c,0x38,0x1c,0x01 ;..qP\8..
             01
      00FD58 18 19 00 08 48 09 00  3615         .db     0x18,0x19,0x00,0x08,0x48,0x09,0x00,0x00 ;....H...
             00
      00FD60 00 00 00 00           3616         .db     0x00,0x00,0x00,0x00                     ;....
      00FD64                       3617 kbc_cpm_control_keys:
      00FD64 8B 82 08 89 84 FF 7F  3618         .db     0x8b,0x82,0x08,0x89,0x84,0xff,0x7f,0x1b ;........
             1B
      00FD6C FF 96 FF 09 0D DF 8F  3619         .db     0xff,0x96,0xff,0x09,0x0d,0xdf,0x8f,0x03 ;....._..
             03
      00FD74 FF FF 8C 8A 88 87 86  3620         .db     0xff,0xff,0x8c,0x8a,0x88,0x87,0x86,0x85 ;........
             85
      00FD7C                       3621 kbc_cpm_control_keys_shift:
      00FD7C EC EF EE ED 84 FF 7F  3622         .db     0xec,0xef,0xee,0xed,0x84,0xff,0x7f,0x1b ;lonm....
             1B
      00FD84 FF 95 FF 09 0D DF 0C  3623         .db     0xff,0x95,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
             03
      00FD8C FF FF 80 94 93 92 91  3624         .db     0xff,0xff,0x80,0x94,0x93,0x92,0x91,0x90 ;........
             90
      00FD94                       3625 cpm_special_character_mods:
      00FD94 95 82 08 89 8B 96 1C  3626         .db     0x95,0x82,0x08,0x89,0x8b,0x96,0x1c,0x12 ;........
             12
      00FD9C                       3627 patch_table_1:
      00FD9C 46                    3628         .db     0x46                                    ;F
      00FD9D 16 E9                 3629         .db     0x16,0xe9                               ;.i
      00FD9F 40                    3630         .db     0x40                                    ;@
      00FDA0 1C E9                 3631         .db     0x1c,0xe9                               ;.i
      00FDA2 C2                    3632         .db     0xc2                                    ;B
      00FDA3 62 E9                 3633         .db     0x62,0xe9                               ;bi
      00FDA5 00                    3634         .db     0x00                                    ;.
      00FDA6                       3635 patch_table_2:
      00FDA6 33                    3636         .db     0x33                                    ;3
      00FDA7 16 E9                 3637         .db     0x16,0xe9                               ;.i
      00FDA9 46                    3638         .db     0x46                                    ;F
      00FDAA 1C E9                 3639         .db     0x1c,0xe9                               ;.i
      00FDAC BF                    3640         .db     0xbf                                    ;?
      00FDAD 62 E9                 3641         .db     0x62,0xe9                               ;bi
      00FDAF 00                    3642         .db     0x00                                    ;.
      00FDB0                       3643 patch_rom_code:
      00FDB0 7E               [ 7] 3644         ld      a,(hl)
      00FDB1 B7               [ 4] 3645         or      a
      00FDB2 C8               [11] 3646         ret     z
      00FDB3 23               [ 6] 3647         inc     hl
      00FDB4 5E               [ 7] 3648         ld      e,(hl)
      00FDB5 23               [ 6] 3649         inc     hl
      00FDB6 56               [ 7] 3650         ld      d,(hl)
      00FDB7 12               [ 7] 3651         ld      (de),a
      00FDB8 23               [ 6] 3652         inc     hl
      00FDB9 18 F5            [12] 3653         jr      patch_rom_code
                                   3654 ; unchecked data source
      00FDBB 48 00 00 00 00 00 00  3655         .db     0x48,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;H.......
             00
      00FDC3 00 00 00 00 00 00 00  3656         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDCB 00 00 00 00 00 00 00  3657         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDD3 00 00 00 00 00 00 00  3658         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDDB 00 00 00 00 00 00 00  3659         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDE3 00 00 00 00 00 00 00  3660         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDEB 00 00 00 00 00 00 00  3661         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDF3 00 00 00 00 00 00 00  3662         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FDFB 00 00 00 00 00 00 00  3663         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE03 00 00 00 00 00 00 00  3664         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE0B 00 00 00 00 00 00 00  3665         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE13 00 00 00 00 00 00 00  3666         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE1B 00 00 00 00 00 00 00  3667         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE23 00 00 00 00 00 00 00  3668         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE2B 00 00 00 00 00 00 00  3669         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE33 00 00 00 00 00 00 00  3670         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE3B 00 00 00 00 00 00 00  3671         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE43 00 00 00 00 00 00 00  3672         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE4B 00 00 00 00 00 00 00  3673         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE53 00 00 00 00 00 00 00  3674         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE5B 00 00 00 00 00 00 00  3675         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE63 00 00 00 00 00 00 00  3676         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE6B 00 00 00 00 00 00 00  3677         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE73 00 00 00 00 00 00 00  3678         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE7B 00 00 00 00 00 00 00  3679         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE83 00 00 00 00 00 00 00  3680         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE8B 00 00 00 00 00 00 00  3681         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE93 00 00 00 00 00 00 00  3682         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FE9B 00 00 00 00 00 00 00  3683         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEA3 00 00 00 00 00 00 00  3684         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEAB 00 00 00 00 00 00 00  3685         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEB3 00 00 00 00 00 00 00  3686         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEBB 00 00 00 00 00 00 00  3687         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEC3 00 00 00 00 00 00 00  3688         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FECB 00 00 00 00 00 00 00  3689         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FED3 00 00 00 00 00 00 00  3690         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEDB 00 00 00 00 00 00 00  3691         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEE3 00 00 00 00 00 00 00  3692         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEEB 00 00 00 00 00 00 00  3693         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEF3 00 00 00 00 00 00 00  3694         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FEFB 00 00 00 00 00 00 00  3695         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF03 00 00 00 00 00 00 00  3696         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF0B 00 00 00 00 00 00 00  3697         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF13 00 00 00 00 00 00 00  3698         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF1B 00 00 00 00 00 00 00  3699         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF23 00 00 00 00 00 00 00  3700         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF2B 00 00 00 00 00 00 00  3701         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF33 00 00 00 00 00 00 00  3702         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF3B 00 00 00 00 00 00 00  3703         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF43 00 00 00 00 00 00 00  3704         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF4B 00 00 00 00 00 00 00  3705         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF53 00 00 00 00 00 00 00  3706         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF5B 00 00 00 00 00 00 00  3707         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF63 00 00 00 00 00 00 00  3708         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF6B 00 00 00 00 00 00 00  3709         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF73 00 00 00 00 00 00 00  3710         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF7B 00 00 00 00 00 00 00  3711         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF83 00 00 00 00 00 00 00  3712         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF8B 00 00 00 00 00 00 00  3713         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF93 00 00 00 00 00 00 00  3714         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FF9B 00 00 00 00 00 00 00  3715         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFA3 00 00 00 00 00 00 00  3716         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFAB 00 00 00 00 00 00 00  3717         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFB3 00 00 00 00 00 00 00  3718         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFBB 00 00 00 00 00 00 00  3719         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFC3 00 00 00 00 00 00 00  3720         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFCB 00 00 00 00 00 00 00  3721         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFD3 00 00 00 00 00 00 00  3722         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFDB 00 00 00 00 00 00 00  3723         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFE3 00 00 00 00 00 00 00  3724         .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
             00
      00FFEB 00 00 00 00 00        3725         .db     0x00,0x00,0x00,0x00,0x00                ;.....
      00FFF0                       3726 version:
      00FFF0 30 37 2E 30 39 2E 38  3727         .db     0x30,0x37,0x2e,0x30,0x39,0x2e,0x38,0x35 ;07.09.85
             35
      00FFF8 54 41 50 43 47 56 32  3728         .db     0x54,0x41,0x50,0x43,0x47,0x56,0x32,0x00 ;TAPCGV2.
             00
                                   3729 ; end of source
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 1.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.                                                    =  002710 GL
    .__.ABS.                                                    =  000000 G
    .__.CPU.                                                    =  000000 GL
    .__.H$L.                                                    =  000000 GL
    ATTR_BLINK                                                  =  000006 G
    ATTR_INVERS                                                 =  000007 G
    BG_BLACK                                                    =  000000 G
    BICOM_GFX                                                   =  000003 G
    BICOM_HEIGHT                                                =  000108 G
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
    CURSOR_BLINK_SLOW                                           =  000040 G
    CURSOR_INVISIBLE                                            =  000020 G
    DELAY_11MS                                                  =  0005DC G
    DELAY_22MS                                                  =  000BB8 G
    DELAY_7MS                                                   =  0003E8 G
    DIO_Data_input_output                                       =  000006 G
    DMA                                                         =  000060 G
    DMA_MODE_SET                                                =  000068 G
  0 ENTRY                                                          000FCE GR
    ESC_0C_CLS                                                  =  000007 G
    ESC_0C_COMMAND_KEY                                          =  000003 G
    ESC_0C_CTRL_INTERNAL                                        =  000002 G
    ESC_0C_FB_SAME_COLOR                                        =  000006 G
  0 ESC_0C_Initialize_Screen_driver                                000CE3 GR
    ESC_0C_SCROLL_MODE                                          =  000000 G
  0 ESC_10_output_blanks                                           000E2C GR
    ESC_53_CRT40                                                =  000030 G
    ESC_53_CRT80                                                =  000031 G
    FDC_CMD_SENSE_INTERRUPT_STATE                               =  000008 G
    FDC_UNIT                                                    =  0000F0 G
    FG_WHITE                                                    =  000007 G
    GERMAN_MAX_ASCII_CODE                                       =  00007E G
    GLED                                                        =  000004 G
    HIGH_ZERO                                                   =  000000 G
    ID_IS_BASIC                                                 =  00007E G
    ID_IS_BOOT                                                  =  000016 G
    ID_JMP                                                      =  0000C3 G
    INPUT_MODE_32                                               =  000032 G
    INPUT_MODE_B1                                               =  0000B1 G
    INPUT_MODE_GRAPH                                            =  000080 G
    KBD_BREAK                                                   =  000007 G
    KBD_COLUMNS                                                 =  00000C G
    KBD_MOD_CTRL                                                =  000002 G
    KBD_MOD_SHIFT                                               =  000000 G
    KBD_POSITION_COMMAND                                        =  00004D G
    KBD_POSITION_CTRL                                           =  00004F G
    KBD_POSITION_GRAPH                                          =  000056 G
    KBD_POSITION_LEFT                                           =  000049 G
    KBD_POSITION_SHIFT                                          =  000053 G
    KBD_POSITION_SHIFT_LOCK                                     =  00004E G
    MASK_ATTR                                                   =  0000C0 G
    MASK_CAPITALIZE                                             =  00005F G
    MASK_COUNTRY_BITS                                           =  000007 G
    MASK_COUNTRY_SELECT                                         =  00001C G
    MASK_CURSOR_LINE                                            =  00001F G
    MASK_ESC_0C_SCROLL_MODE                                     =  000001 G
    MASK_WIDTH_40_80                                            =  000018 G
    MAX_ADDRESS                                                 =  00FFFF G
    MODIFIER_SHIFT                                              =  000001 G
    MONINH                                                      =  000003 G
    MUST_BE_ZERO                                                =  000005 G
    OFF                                                         =  000000 G
    OFFSET_COLOR                                                =  000800 G
    ON                                                          =  000001 G
    PIC_ICW1                                                    =  000070 G
    PIC_ICW2                                                    =  000071 G
    PIC_OCW1                                                    =  000071 G
    REG_0                                                       =  000000 G
    REG_10_CURSOR_START                                         =  00000A G
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
    UART_CONTROL                                                =  000041 G
    UPD765_DATA                                                 =  0000F8 G
    UPD765_MAIN_STATUS                                          =  0000F9 G
    UPD765_STATE                                                =  0000F0 G
    UPPER_MONITOR_SEL                                           =  000006 G
    VK_DEL                                                      =  00007F G
    VK_DOWN                                                     =  00001F G
    VK_ENTER                                                    =  00000D G
    VK_ESC                                                      =  00001B G
    VK_LEFT                                                     =  00001D G
    VK_NL                                                       =  00000A G
    VK_RIGHT                                                    =  00001C G
    VK_UP                                                       =  00001E G
    _BUZZER_ON                                                  =  000004 G
    _CEN_ACKNOWLEDGE                                            =  000002 G
    _CEN_BUSY                                                   =  000003 G
    _CRT80                                                      =  000000 G
    _CRT_DISPLAY                                                =  000007 G
    _CRT_NTSC                                                   =  000006 G
    _CRT_VSYNC_PERIOD                                           =  000001 G
    _DISPLAY_INHIBIT                                            =  000001 G
    _FDD_PRESENT                                                =  000000 G
    _GFX_AVAILABLE                                              =  000001 G
    _PRT_SERIAL                                                 =  000005 G
    _SIOC                                                       =  000000 G
  0 _buz_off                                                       000A91 GR
  0 _column_is_in_C                                                000CCD GR
  0 _continue_ldir                                                 00012E GR
  0 _correct_hex_digit                                             00035B GR
  0 _count_cursor_column                                           000CC5 GR
  0 _crt_set_cursor_register                                       000C95 GR
  0 _cursor_pos_increment                                          000D75 GR
  0 _display_byte                                                  00016C GR
  0 _display_line                                                  00015F GR
  0 _erase_rest_of_line                                            000DA0 GR
  0 _erase_screen_lines                                            000D9D GR
  0 _err1                                                          000D60 GR
  0 _err2                                                          000E2A GR
  0 _err3                                                          0000C0 GR
  0 _err4                                                          0005E1 GR
  0 _err_area_overlap                                              000137 GR
  0 _exchange_table_entry                                          000CD8 GR
  0 _fetch_color_attribute                                         000C85 GR
  0 _fill_next_line                                                000DCB GR
  0 _handle_1b53xx_end                                             000ECD GR
  0 _insert_next_character                                         000E06 GR
  0 _invalid_cursor_parameter                                      000D30 GR
  0 _m1                                                            000C50 GR
  0 _m10                                                           0000B8 GR
  0 _m11                                                           0000AD GR
  0 _m12                                                           000218 GR
  0 _m13                                                           000227 GR
  0 _m14                                                           00029F GR
  0 _m15                                                           000280 GR
  0 _m16                                                           000271 GR
  0 _m17                                                           000263 GR
  0 _m18                                                           000357 GR
  0 _m19                                                           0003B1 GR
  0 _m1a                                                           0003B5 GR
  0 _m1b                                                           0003AF GR
  0 _m1c                                                           0003C2 GR
  0 _m1d                                                           0003CF GR
  0 _m1e                                                           0005CA GR
  0 _m2                                                            000C16 GR
  0 _m20                                                           000CF3 GR
  0 _m21                                                           000E4E GR
  0 _m22                                                           000E47 GR
  0 _m23                                                           000E4A GR
  0 _m24                                                           000E5D GR
  0 _m25                                                           000ADF GR
  0 _m26                                                           000AD8 GR
  0 _m27                                                           000AF4 GR
  0 _m28                                                           0010A2 GR
  0 _m29                                                           0010E8 GR
  0 _m2a                                                           0010FD GR
  0 _m2b                                                           00110F GR
  0 _m2c                                                           001133 GR
  0 _m2d                                                           000C05 GR
  0 _m2e                                                           000BE5 GR
  0 _m2f                                                           000B0F GR
  0 _m3                                                            000D09 GR
  0 _m30                                                           000B0A GR
  0 _m31                                                           000B01 GR
  0 _m32                                                           00098A GR
  0 _m4                                                            000D54 GR
  0 _m5                                                            000D63 GR
  0 _m6                                                            000BFD GR
  0 _m7                                                            000E13 GR
  0 _m8                                                            000DF8 GR
  0 _m9                                                            000E3E GR
  0 _ma                                                            000B46 GR
  0 _mb                                                            000A31 GR
  0 _mc                                                            000A93 GR
  0 _md                                                            0003DE GR
  0 _me                                                            000356 GR
  0 _mf                                                            000039 GR
  0 _move_next_character                                           000DED GR
  0 _output_chars                                                  000E34 GR
  0 _patch_localization_07                                         001154 GR
  0 _patch_localization_es                                         001151 GR
  0 _patch_localization_fr                                         001148 GR
  0 _patch_localization_it                                         00114E GR
  0 _patch_localization_uk                                         00114B GR
  0 _patch_localization_us                                         001145 GR
  0 _print_next_char                                               00036C GR
  0 _print_on                                                      00022E GR
  0 _print_reg8                                                    0001EE GR
  0 _printable_char                                                00028D GR
  0 _set_cursor                                                    000A6E GR
  0 _set_cursor_max                                                000D33 GR
  0 _set_cursor_parameter                                          000D4B GR
  0 _set_cursor_tmp                                                000D2A GR
  0 _sprintf_clean                                                 00029A GR
  0 _switch_crt40                                                  000E8A GR
  0 _switch_crt80                                                  000E94 GR
  0 add_column_size                                                0009E7 GR
  0 alternate_keyboard_table                                       000CD3 GR
  0 api_call_23                                                    00043F GR
  0 api_call_24                                                    000442 GR
  0 api_call_26                                                    000448 GR
  0 api_call_27                                                    00044B GR
  0 api_call_28                                                    00044E GR
  0 api_call_29                                                    000451 GR
  0 api_call_30                                                    000454 GR
  0 api_call_31                                                    000457 GR
  0 api_call_32                                                    00045A GR
  0 api_call_33                                                    00045D GR
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
  0 attrib_tmp                                                     000499 GR
    basic_start                                                 =  00003B G
  0 beep_delay                                                     0004D2 GR
  0 bicom_clr_graphics                                             000F20 GR
  0 bicom_draw_line                                                000F2C GR
  0 bicom_get_pixel                                                000F28 GR
  0 bicom_glp1_prt_gfx                                             000F40 GR
    bicom_glp1_prt_gfx_size                                     =  000010 G
  0 bicom_glp2_prt_2nd_line                                        000F50 GR
    bicom_glp2_prt_2nd_line_size                                =  000010 G
  0 bicom_glp3_prt_crlf                                            000F60 GR
    bicom_glp3_prt_crlf_size                                    =  000010 G
  0 bicom_glp4_prt_ld                                              000F70 GR
    bicom_glp4_prt_ld_size                                      =  000010 G
  0 bicom_glp5_prt_ld                                              000F80 GR
    bicom_glp5_prt_ld_size                                      =  000010 G
  0 bicom_int_clr                                                  001220 GR
  0 bicom_int_draw_line                                            00125E GR
  0 bicom_int_get_pixel                                            001173 GR
  0 bicom_int_prt_line                                             0013EB GR
  0 bicom_int_set_pixel                                            00117D GR
  0 bicom_prt_line                                                 000F30 GR
  0 bicom_scheduler                                                000F90 GR
  0 bicom_set_pixel                                                000F24 GR
  0 bicom_undoc1                                                   000F34 GR
  0 boot                                                           000FF0 GR
  0 boot_rom_ends                                                  000FFE GR
  0 boot_rom_extensions                                            001000 GR
    boot_sector                                                 =  00C200 G
  0 boot_strap                                                     000000 GR
  0 brk_exit                                                       000AA6 GR
  0 brk_handler                                                    0001AA GR
  0 buffer_put_char                                                000466 GR
  0 buzzer_off                                                     000AA0 GR
  0 buzzer_on                                                      000A98 GR
  0 byte_change                                                    0000AA GR
  0 calc_column_offset                                             0009E2 GR
  0 cfg10_settings                                                 000468 GR
  0 cfg20_settings                                                 000469 GR
  0 char_tmp                                                       0004CE GR
  0 chr_03                                                         000891 GR
  0 chr_12                                                         000894 GR
  0 chr_7f                                                         000897 GR
  0 chr_backspace                                                  000A76 GR
  0 chr_beep                                                       000A80 GR
  0 chr_carrige_return                                             000909 GR
  0 chr_carrige_returnX                                            000947 GR
  0 chr_clear_screen                                               0009EC GR
  0 chr_cursor_down                                                000A61 GR
  0 chr_cursor_left                                                000A37 GR
  0 chr_cursor_right                                               000A52 GR
  0 chr_cursor_up                                                  000A46 GR
  0 chr_inverse_off                                                00089A GR
  0 chr_inverse_on                                                 0008A0 GR
  0 chr_line_feed                                                  000886 GR
  0 clear_kbd_modifiers                                            00064B GR
  0 clear_screen_width_color                                       0009F1 GR
  0 cmp_kbd_entry                                                  0005FE GR
    cold_start                                                  =  000000 G
  0 column_count                                                   000462 GR
  0 column_offset_tmp                                              000494 GR
  0 com_read_byte                                                  000AF8 GR
  0 com_rx_ready                                                   000B12 GR
  0 com_tx_ready                                                   000AE5 GR
  0 com_write_byte                                                 000AEE GR
  0 copy_kbd_table                                                 001064 GR
  0 cpm_special_character_mods                                     001D94 GR
    cpm_special_character_mods_size                             =  000008 G
  0 crt_is_vsync                                                   0004D7 GR
  0 crt_set_cursor                                                 000931 GR
  0 crt_set_cursor_at_row_start                                    00097D GR
  0 crt_table40                                                    000ED3 GR
    crt_table40_size                                            =  000010 G
  0 crt_table80                                                    000EE5 GR
    crt_table80_size                                            =  000010 G
  0 crt_table_ntsc                                                 001D40 GR
    crt_table_ntsc_size                                         =  000024 G
  0 crt_wait_flicker_free_save_A                                   0004DA GR
  0 crt_wait_vsync                                                 0004D4 GR
  0 crt_write_char_with_color                                      0008EC GR
  0 crt_write_reg                                                  000EB9 GR
  0 cursor_abs                                                     000490 GR
  0 cursor_abs_color                                               000492 GR
  0 cursor_column                                                  00046E GR
  0 cursor_flag                                                    0004CB GR
  0 cursor_move_right                                              0008FA GR
  0 cursor_row                                                     00046D GR
  0 cursor_row_adjusted                                            000A6B GR
  0 cursor_row_column_rel                                          0004CC GR
  0 cursor_start                                                   000470 GR
  0 cursor_store_column                                            000A71 GR
  0 cursor_tmp                                                     000496 GR
  0 decrement_kbd_debounce_cnt                                     000641 GR
  0 delay                                                          00067B GR
  0 dev_fdd_wait_ready                                             0003FD GR
  0 dev_kbd_inch                                                   00040F GR
  0 dev_kbd_status                                                 00040C GR
  0 dev_monitor                                                    000400 GR
  0 dev_printer_busy                                               000445 GR
  0 dev_printer_write_byte                                         000439 GR
  0 dev_serial_read_byte                                           000406 GR
  0 dev_serial_ready                                               000403 GR
  0 dev_serial_tx_ready                                            000433 GR
  0 dev_serial_write_byte                                          000436 GR
  0 display_ascii_dump                                             00024C GR
  0 display_enable                                                 000A20 GR
  0 display_inhibit                                                000A13 GR
  0 display_status_set                                             000A25 GR
  0 enable_protocol_printer                                        00021C GR
  0 erase_line                                                     000DD1 GR
  0 erase_rest_of_line                                             000D9B GR
  0 erase_rest_of_screen                                           000DDF GR
  0 esc_16_set_cursor                                              000D37 GR
  0 esc_1d_outputs_characters                                      000E61 GR
  0 esc_47_delecte_character_to_column                             000DE9 GR
  0 esc_49_insert_character                                        000DFE GR
  0 esc_53_select_screen_width                                     000E77 GR
  0 esc_position_cursor                                            000D1D GR
  0 esc_set_color_attribute                                        000C36 GR
  0 esc_set_screen_attribute                                       000C6C GR
  0 fdc_cmd_init                                                   00108E GR
    fdc_cmd_init_size                                           =  000005 G
  0 fdc_cmd_read_boot                                              001093 GR
    fdc_cmd_read_boot_size                                      =  000009 G
  0 fdc_read_boot_sector                                           0010B5 GR
  0 fdc_read_byte                                                  0010AC GR
  0 fdc_write_byte                                                 0010A1 GR
  0 fdc_write_byte_ix                                              00109C GR
  0 fdw_write_next_byte                                            0010DF GR
  0 fill_bws_rows                                                  000DA5 GR
  0 fill_cnt                                                       000DBC GR
  0 function_0c                                                    000C15 GR
  0 function_more_0c11                                             000D67 GR
  0 function_more_0c12                                             000E6A GR
  0 function_more_0c13                                             000CEF GR
  0 function_more_0c14                                             000D10 GR
  0 function_more_0c15                                             000C3F GR
  0 function_more_0c17                                             000D44 GR
  0 get_char_echoed                                                00038E GR
  0 get_cursor_abs                                                 0009D0 GR
  0 get_cursor_pos                                                 000CA8 GR
  0 get_hex_digit                                                  000398 GR
  0 get_hex_number                                                 0003BA GR
  0 get_hex_number_sp                                              0003B7 GR
  0 get_kbd_table_address                                          00105E GR
  0 go_monitor                                                     000060 GR
  0 graphic_mode_on                                                000C1A GR
  0 handle_kbd_command                                             0006F6 GR
  0 handle_kbd_graph                                               0006FF GR
  0 handle_kbd_shift                                               0006E2 GR
  0 handle_kbd_shift_lock                                          0006EC GR
    id_basic                                                    =  000008 G
  0 init_crt_param                                                 00106D GR
  0 init_kbd_table                                                 00102C GR
  0 init_pic                                                       001081 GR
  0 init_serial                                                    000B2E GR
  0 input_hex_byte                                                 00037C GR
  0 input_mode                                                     00048C GR
  0 input_mode_clear                                               000C12 GR
  0 is_vsync                                                       000A1A GR
  0 just_go_back                                                   00023D GR
  0 kbc_cpm_control_keys                                           001D64 GR
  0 kbc_cpm_control_keys_shift                                     001D7C GR
    kbc_cpm_control_keys_shift_size                             =  000018 G
    kbc_cpm_control_keys_size                                   =  000018 G
  0 kbd_adjust_keyboard_table                                      001118 GR
  0 kbd_ascii                                                      00048F GR
  0 kbd_buffer_check_colum                                         00068C GR
  0 kbd_buffer_clear                                               0005A3 GR
  0 kbd_buffer_clear_beep                                          00059D GR
  0 kbd_command_mode                                               00048A GR
  0 kbd_debounce_cnt                                               000471 GR
  0 kbd_exit                                                       00066A GR
  0 kbd_fetch_from_io                                              00066E GR
  0 kbd_handle_ctrl                                                0006D4 GR
  0 kbd_inch                                                       000762 GR
  0 kbd_matrix_buffer                                              000472 GR
  0 kbd_matrix_buffer2                                             00047E GR
    kbd_matrix_buffer2_size                                     =  00000C G
    kbd_matrix_buffer_size                                      =  00000C G
  0 kbd_matrix_read                                                0005B1 GR
  0 kbd_modifiers                                                  00048B GR
  0 kbd_no_key                                                     00064F GR
  0 kbd_not_pressed                                                000647 GR
  0 kbd_position                                                   00048E GR
  0 kbd_pressed2                                                   0005D5 GR
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
  0 kbd_toggle_gled                                                0008A6 GR
  0 kbd_update_gled                                                0008AB GR
  0 key_code                                                       000498 GR
  0 key_found                                                      000C2C GR
  0 led_status                                                     00046F GR
  0 lpt_busy                                                       000AB7 GR
  0 lpt_write_byte                                                 000AC4 GR
  0 m_e5e3                                                         0005E3 GR
  0 m_e5e7                                                         0005E7 GR
  0 m_e682                                                         000682 GR
  0 m_e696                                                         000696 GR
  0 m_e69d                                                         00069D GR
  0 m_e6a0                                                         0006A0 GR
  0 m_e6a8                                                         0006A8 GR
  0 m_e6ae                                                         0006AE GR
  0 m_e6c3                                                         0006C3 GR
  0 m_e70f                                                         00070F GR
  0 m_e729                                                         000729 GR
  0 m_e72c                                                         00072C GR
  0 m_e739                                                         000739 GR
  0 m_e765                                                         000765 GR
  0 m_e77a                                                         00077A GR
  0 m_e794                                                         000794 GR
  0 m_e799                                                         000799 GR
  0 m_e7a2                                                         0007A2 GR
  0 m_e7a8                                                         0007A8 GR
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
  0 m_e835                                                         000835 GR
  0 m_e83c                                                         00083C GR
  0 m_e83f                                                         00083F GR
  0 m_e84c                                                         00084C GR
  0 m_e8b7                                                         0008B7 GR
  0 m_e8bb                                                         0008BB GR
  0 m_e8bf                                                         0008BF GR
  0 m_e8d2                                                         0008D2 GR
  0 m_e8d6                                                         0008D6 GR
  0 m_e8e5                                                         0008E5 GR
  0 m_e8e8                                                         0008E8 GR
  0 m_e922                                                         000922 GR
  0 m_e925                                                         000925 GR
  0 m_e92e                                                         00092E GR
  0 m_e94a                                                         00094A GR
  0 m_e95d                                                         00095D GR
  0 m_e963                                                         000963 GR
  0 m_e99e                                                         00099E GR
  0 m_e9aa                                                         0009AA GR
  0 m_ef9c                                                         000F9C GR
  0 m_f010                                                         001010 GR
  0 m_f157                                                         001157 GR
  0 m_f18b                                                         00118B GR
  0 m_f19a                                                         00119A GR
  0 m_f19e                                                         00119E GR
  0 m_f19f                                                         00119F GR
  0 m_f1a4                                                         0011A4 GR
  0 m_f1b0                                                         0011B0 GR
  0 m_f1b4                                                         0011B4 GR
  0 m_f1b9                                                         0011B9 GR
  0 m_f1c9                                                         0011C9 GR
  0 m_f1cc                                                         0011CC GR
  0 m_f1e1                                                         0011E1 GR
  0 m_f1ef                                                         0011EF GR
  0 m_f1f3                                                         0011F3 GR
  0 m_f233                                                         001233 GR
  0 m_f235                                                         001235 GR
  0 m_f24d                                                         00124D GR
  0 m_f253                                                         001253 GR
  0 m_f2a1                                                         0012A1 GR
  0 m_f2aa                                                         0012AA GR
  0 m_f2c3                                                         0012C3 GR
  0 m_f2dd                                                         0012DD GR
  0 m_f2de                                                         0012DE GR
  0 m_f2e6                                                         0012E6 GR
  0 m_f2f2                                                         0012F2 GR
  0 m_f30c                                                         00130C GR
  0 m_f316                                                         001316 GR
  0 m_f323                                                         001323 GR
  0 m_f337                                                         001337 GR
  0 m_f343                                                         001343 GR
  0 m_f365                                                         001365 GR
  0 m_f37a                                                         00137A GR
  0 m_f37f                                                         00137F GR
  0 m_f386                                                         001386 GR
  0 m_f393                                                         001393 GR
  0 m_f394                                                         001394 GR
  0 m_f39b                                                         00139B GR
  0 m_f3a0                                                         0013A0 GR
  0 m_f3ae                                                         0013AE GR
  0 m_f3b9                                                         0013B9 GR
  0 m_f3e3                                                         0013E3 GR
  0 m_f3f2                                                         0013F2 GR
  0 m_f407                                                         001407 GR
  0 m_f40a                                                         00140A GR
  0 m_f423                                                         001423 GR
  0 m_f429                                                         001429 GR
  0 m_f434                                                         001434 GR
  0 m_f445                                                         001445 GR
  0 m_f457                                                         001457 GR
  0 m_f45c                                                         00145C GR
  0 m_f470                                                         001470 GR
  0 m_f489                                                         001489 GR
  0 m_f48f                                                         00148F GR
  0 m_f490                                                         001490 GR
  0 m_f49f                                                         00149F GR
  0 m_f4b7                                                         0014B7 GR
  0 m_f4c0                                                         0014C0 GR
  0 m_f4cf                                                         0014CF GR
  0 m_f4d1                                                         0014D1 GR
  0 m_f4d2                                                         0014D2 GR
  0 m_f4e0                                                         0014E0 GR
  0 m_f4f9                                                         0014F9 GR
  0 m_f4fe                                                         0014FE GR
  0 m_f501                                                         001501 GR
  0 m_f505                                                         001505 GR
  0 m_f50c                                                         00150C GR
  0 m_f514                                                         001514 GR
  0 m_f51d                                                         00151D GR
  0 m_f523                                                         001523 GR
  0 m_f537                                                         001537 GR
  0 map_C_to_PTR                                                   000C21 GR
  0 map_ESC_10                                                     000BB1 GR
  0 map_ESC_16                                                     000BB4 GR
  0 map_ch_0c                                                      000B56 GR
  0 map_ch_10                                                      000B59 GR
  0 map_ch_11                                                      000B5C GR
  0 map_ch_12                                                      000B5F GR
  0 map_ch_13                                                      000B62 GR
  0 map_ch_16                                                      000B65 GR
  0 map_ch_17                                                      000B68 GR
  0 map_ch_18                                                      000B6B GR
  0 map_ch_19                                                      000B6E GR
  0 map_ch_1a                                                      000B71 GR
  0 map_ch_1c                                                      000B74 GR
  0 map_ch_1d                                                      000B77 GR
  0 map_ch_31                                                      000B7A GR
  0 map_ch_41                                                      000B7D GR
  0 map_ch_42                                                      000B80 GR
  0 map_ch_43                                                      000B83 GR
  0 map_ch_44                                                      000B86 GR
  0 map_ch_45                                                      000B89 GR
  0 map_ch_46                                                      000B8C GR
  0 map_ch_47                                                      000B8F GR
  0 map_ch_48                                                      000B92 GR
  0 map_ch_49                                                      000B95 GR
  0 map_ch_4a                                                      000B98 GR
  0 map_ch_4b                                                      000B9B GR
  0 map_ch_53                                                      000B9E GR
  0 map_ch_54                                                      000BA1 GR
  0 map_ch_55                                                      000BA4 GR
  0 map_ch_56                                                      000BA7 GR
  0 map_ch_59                                                      000BAA GR
  0 map_ch_end                                                     000BAD GR
  0 map_char_to_graphic                                            000828 GR
  0 map_esc_1d                                                     000BB7 GR
  0 map_esc_47                                                     000BBA GR
  0 map_esc_49                                                     000BBD GR
  0 map_esc_53                                                     000BC0 GR
  0 map_esc_54                                                     000BC3 GR
  0 map_esc_55                                                     000BC6 GR
  0 map_esc_56                                                     000BC9 GR
  0 map_esc_59                                                     000BCC GR
  0 map_esc_96                                                     000BCF GR
  0 map_esc_9d                                                     000BD2 GR
  0 map_esc_b1                                                     000BD5 GR
  0 map_esc_b2                                                     000BD8 GR
  0 map_esc_d4                                                     000BDB GR
  0 map_esc_d5                                                     000BDE GR
  0 map_esc_d9                                                     000BE1 GR
  0 map_esc_list                                                   000B53 GR
  0 map_more_codes                                                 000BAE GR
  0 map_more_codes_end                                             000BE4 GR
  0 modify_if_graphic_B                                            00071A GR
  0 monitor_cmd_display                                            00013E GR
  0 monitor_cmd_go                                                 00018C GR
  0 monitor_cmd_loop                                               000070 GR
  0 monitor_cmd_mem_move                                           0000CF GR
  0 monitor_cmd_reg                                                0001DD GR
  0 monitor_inhibit                                                000F96 GR
  0 non_char_printable                                             00028B GR
  0 op_return                                                      0001A6 GR
  0 opcode_compare                                                 00074F GR
  0 os_patch                                                       0004D0 GR
  0 out_sphx8_minus                                                000347 GR
  0 outhx16                                                        000333 GR
  0 outhx4                                                         00034E GR
  0 outhx8                                                         000338 GR
  0 outsphx8                                                       00032D GR
  0 param_1                                                        00049E GR
  0 param_2                                                        0004A0 GR
  0 param_3                                                        0004A2 GR
  0 param_word                                                     00049C GR
  0 patch_os_functions                                             0003D1 GR
  0 patch_printer_ptr                                              001020 GR
  0 patch_rom_code                                                 001DB0 GR
  0 patch_table_1                                                  001D9C GR
  0 patch_table_2                                                  001DA6 GR
  0 prepare_basic                                                  000242 GR
  0 print_new_line                                                 00035F GR
  0 print_nl_hx16                                                  000215 GR
  0 print_space                                                    000369 GR
  0 printer_protocol_flag                                          0004B6 GR
  0 put_char                                                       000371 GR
  0 put_char_crt                                                   0007AC GR
  0 puts                                                           000124 GR
  0 ram_boot                                                       000044 GR
  0 read_character                                                 000D8A GR
  0 ready_msg_after_ldir                                           000121 GR
  0 reg_af                                                         0004BF GR
  0 reg_bc                                                         0004B9 GR
  0 reg_de                                                         0004BB GR
  0 reg_hl                                                         0004BD GR
  0 reg_i                                                          0004C1 GR
  0 reg_ix                                                         0004C2 GR
  0 reg_iy                                                         0004C4 GR
  0 restore_os_functions                                           0003E7 GR
  0 ret_pc                                                         0004B7 GR
  0 return_to_basic                                                000235 GR
  0 rom_disable                                                    000055 GR
  0 rom_enable                                                     000FA3 GR
  0 row_start                                                      000463 GR
  0 rst38_vec                                                      0001A7 GR
    rst_38                                                      =  000038 G
  0 save_stack                                                     0004C6 GR
  0 scan_is_stable                                                 000609 GR
  0 scans_different                                                000656 GR
  0 screen_driver_settings                                         00046A GR
  0 set_cfg10                                                      000B3B GR
  0 set_cursor_abs                                                 0009BB GR
  0 set_cursor_home                                                000A03 GR
  0 set_cursor_off                                                 000C93 GR
  0 set_cursor_on                                                  000C8F GR
  0 set_german_ascii_range                                         00113D GR
  0 set_kbd_debounce_cnt                                           00065F GR
  0 set_kbd_modifiers                                              0006E7 GR
  0 set_video_mode                                                 000E9A GR
  0 special_characters                                             000855 GR
  0 sprintf_buffer                                                 0004A6 GR
    sprintf_buffer_size                                         =  000010 G
    stack_at_boot                                               =  00F000 G
  0 str_break_at                                                   0002F3 GR
    str_break_at_size                                           =  00000D G
  0 str_error                                                      0002CE GR
    str_error_size                                              =  00000A G
  0 str_monitor                                                    0002AC GR
    str_monitor_size                                            =  000018 G
  0 str_print_off                                                  0002D8 GR
    str_print_off_size                                          =  00000E G
  0 str_print_on                                                   0002E6 GR
    str_print_on_size                                           =  00000D G
  0 str_ready                                                      0002C4 GR
    str_ready_size                                              =  00000A G
  0 str_reg                                                        000300 GR
    str_reg_size                                                =  00002D G
  0 switch_crt_mode                                                000E7A GR
  0 terminal_row1                                                  000460 GR
  0 terminal_row2                                                  000461 GR
  0 terminal_row3                                                  000464 GR
  0 terminal_row4                                                  000465 GR
  0 test_decrement_key                                             0000C9 GR
  0 unreferenced_02                                                0002A6 GR
  0 unreferenced_06                                                000B1F GR
  0 unreferenced_07                                                000B41 GR
  0 unreferenced_08                                                000B4C GR
  0 unreferenced_09                                                000758 GR
  0 update_key_code                                                000664 GR
  0 version                                                        001FF0 GR
    version_size                                                =  000010 G
  0 wait_fdd_ready                                                 000FC7 GR
  0 wait_flicker_free                                              000A2C GR
  0 wait_flicker_free_save_A                                       000A2B GR
  0 wait_vsync                                                     000A0D GR
  0 write_character                                                000D6C GR


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80), page 2.
Hexadecimal [24-Bits]

Area Table

   0 _CODE                                      size   2000   flags    0


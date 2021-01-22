; source : 0_b4-6_ic1038.bin
; created: 2021-01-22 10:47:42
; by     : Andreas Ziermann
; 
; constant
; 
HIGH_ZERO                        = 0x00
ON                               = 0x01
TOGGLE_SLED                      = 0x01
STATUS_SLED                      = 0x00
TOGGLE_GLED                      = 0x04
STATUS_GLED                      = 0x02
OFF                              = 0x00
REG_0                            = 0x00
REG_14_CURSOR_H                  = 0x0e
REG_14_CURSOR_L                  = 0x0f
CFG10                            = 0x10
ROM_ACCESS_EN                    = 0x07
ROM_PACK_EN                      = 0x06
_BUZZER_ON                       = 0x04
CMT_MOTOR_START                  = 0x03
CMT_RS232_SELECT                 = 0x02
_DISPLAY_INHIBIT                 = 0x01
_CRT80                           = 0x01
STATUS10                         = 0x10
_CRT_DISPLAY                     = 0x07
_CRT_NTSC                        = 0x06
_PRT_SERIAL                      = 0x05
_GFX_AVAILABLE                   = 0x01
_FDD_PRESENT                     = 0x00
MASK_COUNTRY_SELECT              = 0x1c
MASK_COUNTRY_BITS                = 0x07
COUNTRY_INTERNATIONAL            = 0x00
COUNTRY_DE                       = 0x01
COUNTRY_US                       = 0x02
COUNTRY_FR                       = 0x03
COUNTRY_UK                       = 0x04
COUNTRY_IT                       = 0x05
COUNTRY_ES                       = 0x06
COUNTRY_07                       = 0x07
CFG20                            = 0x20
CRT_RESET                        = 0x00
CEN_RESET                        = 0x01
CEN_STROBE                       = 0x02
MONINH                           = 0x03
GLED                             = 0x04
SLED                             = 0x05
UPPER_MONITOR_SEL                = 0x06
STATUS_KBD                       = 0x20
KBD_COLUMNS                      = 0x0c
KBD_POSITION_CTRL                = 0x4f
KBD_POSITION_SHIFT               = 0x53
KBD_POSITION_SHIFT_LOCK          = 0x4e
KBD_POSITION_COMMAND             = 0x4d
KBD_POSITION_GRAPH               = 0x56
KBD_BREAK                        = 0x07
MODIFIER_SHIFT                   = 0x01
STATUS30                         = 0x30
CEN_DATA                         = 0x30
_SIOC                            = 0x00
_CRT_VSYNC_PERIOD                = 0x01
_CEN_ACKNOWLEDGE                 = 0x02
_CEN_BUSY                        = 0x03
CRT_REG                          = 0x50
CRT_DATA                         = 0x51
DMA                              = 0x60
DMA_MODE_SET                     = 0x68
PIC_ICW1                         = 0x70
PIC_ICW2                         = 0x71
PIC_OCW1                         = 0x71
FDC_CMD_SENSE_INTERRUPT_STATE    = 0x08
FDC_UNIT                         = 0xf0
UPD765_STATE                     = 0xf0
UPD765_DATA                      = 0xf8
UPD765_MAIN_STATUS               = 0xf9
RQM_Request_for_master           = 0x07
DIO_Data_input_output            = 0x06
ID_JMP                           = 0xc3
ID_IS_BASIC                      = 0x7e
SCREEN_HEIGHT                    = 0x18
VK_ENTER                         = 0x0d
VK_ESC                           = 0x1b
VK_LEFT                          = 0x1d
VK_RIGHT                         = 0x1c
VK_UP                            = 0x1e
VK_DOWN                          = 0x1f
VK_DEL                           = 0x7f
GERMAN_MAX_ASCII_CODE            = 0x7e
MASK_CAPITALIZE                  = 0x5f

boot_sector                      = 0xc200
cold_start                       = 0x0000
id_basic                         = 0x0008
rst_38                           = 0x0038
basic_start                      = 0x003b
BWS                              = 0xf000
stack_at_boot                    = 0xf000
OFFSET_COLOR                     = 0x0800
ROM_PACK_16K                     = 0xa000
ROM_PACK_8K                      = 0xc000
MAX_ADDRESS                      = 0xffff
str_monitor_size                 = 0x0023
str_memory_size                  = 0x000e
str_completed_size               = 0x000e
str_area_over_size               = 0x0010
str_print_off_size               = 0x000e
str_print_on_size                = 0x000d
str_break_at_size                = 0x000d
str_reg_size                     = 0x002d
kbd_matrix_buffer_size           = 0x000c
kbd_matrix_buffer2_size          = 0x000c
kbd_table_lookup_size            = 0x00c0
crt_table40_size                 = 0x0010
crt_table80_size                 = 0x0010
fdc_cmd_init_size                = 0x0005
fdc_cmd_read_boot_size           = 0x0009
kbd_table_int_size               = 0x0060
kbd_table_int_sh_size            = 0x0060
kbd_table_de_size                = 0x00c0
kbd_table_us_size                = 0x00c0
kbd_table_fr_size                = 0x00c0
kbd_table_uk_size                = 0x00c0
kbd_table_it_size                = 0x00c0
kbd_table_es_size                = 0x00c0
crt_table_ntsc_size              = 0x0024
;
;
;
m_e000:
        ld      hl,#cfg20_settings
        set     3,(hl)                                  ;MONINH
        ld      a,(hl)
        out     (CFG20),a
        call    kbd_buffer_clear_beep
        ld      hl,#cfg10_settings
        set     6,(hl)                                  ;ROM_PACK_EN
        ld      a,(hl)
        out     (CFG10),a
        ld      a,(ROM_PACK_16K)
        cp      #ID_JMP
        jp      z,ROM_PACK_16K
        ld      a,(ROM_PACK_8K)
        cp      #ID_JMP
        jp      z,ROM_PACK_8K
        ld      hl,#cfg10_settings
        res     6,(hl)                                  ;ROM_PACK_EN
        ld      a,(hl)
        out     (CFG10),a
        in      a,(STATUS10)
        bit     0,a                                     ;_FDD_PRESENT
        jp      nz,fdd_available
        ld      a,(id_basic)
        cp      #ID_IS_BASIC
        jr      z,go_basic
        ld      hl,#cfg10_settings
        set     7,(hl)                                  ;ROM_ACCESS_EN
        ld      a,(hl)
        ld      (hl),a
        out     (CFG10),a
        jp      go_monitor
go_basic:
        call    patch_os_functions
        jp      basic_start
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00                ;.....
go_monitor:
        ld      (save_stack),sp
        ld      sp,#stack_at_boot
        call    restore_os_functions
        ld      hl,#str_monitor
m_e06d:
        call    puts
        call    get_hex_number
        cp      #VK_ENTER
        jr      z,m_e07f
        call    print_new_line
        ld      hl,#str_memory
        jr      m_e06d
m_e07f:
        ld      hl,(param_word)
        ld      a,h
        or      l
        jr      nz,m_e089
        ld      hl,#MAX_ADDRESS
m_e089:
        ld      (0xe4a4),hl                             ;commentReference(0xe089, "nix");
monitor_cmd_loop:
        ld      hl,#monitor_cmd_loop
        push    hl
        call    print_new_line
        ld      c,#'*'
        call    put_char
        call    get_char_echoed
        cp      #VK_ESC
        ret     z
        and     #MASK_CAPITALIZE
        cp      #'E'
        jp      z,return_to_basic
        cp      #'P'
        jp      z,enable_protocol_printer
        cp      #'M'
        jp      z,monitor_cmd_mem_move
        cp      #'D'
        jp      z,m_e178
        cp      #'G'
        jp      z,m_e1c9
        cp      #'R'
        jp      z,m_e21d
        cp      #'C'
        ret     nz
        call    print_space
        call    get_hex_number
        cp      #VK_ENTER
        ret     nz
        ld      hl,(param_word)
m_e0cd:
        call    m_e2dc
m_e0d0:
        push    hl
        call    m_e3ab
        call    m_e3e0
        pop     hl
        jr      c,m_e0e3
        ld      (hl),a
m_e0db:
        inc     hl
        ld      a,l
        and     #0x07                                   ;commentReference(0xe0dd, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master|(id_basic|FDC_CMD_SENSE_INTERRUPT_STATE)-1");
        jr      nz,m_e0d0
        jr      m_e0cd
m_e0e3:
        cp      #0x20                                   ;commentReference(0xe0e3, "' '|CFG20|STATUS_KBD");
        jr      nz,m_e0ec
        call    print_space
        jr      m_e0db
m_e0ec:
        cp      #0x2d                                   ;commentReference(0xe0ec, "'-'|str_reg_size");
        ret     nz
        dec     hl
        jr      m_e0cd
monitor_cmd_mem_move:
        call    print_space
        call    get_hex_number
        cp      #','
        ret     nz
        ld      hl,(param_word)
        ld      (param_1),hl
        call    get_hex_number
        cp      #','
        ret     nz
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(param_word)
        ld      (param_2),hl
        or      a
        sbc     hl,de
        ret     c
        inc     hl
        ld      (param_3),hl
        call    get_hex_number
        cp      #VK_ENTER
        ret     nz
        ld      hl,(param_3)
        dec     hl
        ex      de,hl
        ld      hl,(param_word)
        or      a
        adc     hl,de
        jr      c,m_e16c
        ex      de,hl
        ld      hl,(0xe4a4)                             ;commentReference(0xe12d, "nix");
        sbc     hl,de
        jr      c,m_e16c
        push    de
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(param_word)
        or      a
        sbc     hl,de
        jr      c,m_e15e
        pop     de
        ld      a,h
        or      l
        jr      z,m_e157
        ld      hl,(param_3)
        push    hl
        pop     bc
        ld      hl,(param_2)
m_e14e:
        ld      a,(hl)
        ld      (de),a
        dec     hl
        dec     de
        dec     bc
        ld      a,b
        or      c
        jr      nz,m_e14e
m_e157:
        ld      hl,#str_completed
        call    puts
        ret
m_e15e:
        ld      hl,(param_3)
        push    hl
        pop     bc
        ld      hl,(0xe49c)                             ;commentReference(0xe163, "param_word");
        ex      de,hl
        ldir
        pop     de
        jr      m_e157
m_e16c:
        ld      hl,#str_area_over
        call    puts
        ld      hl,#str_memory
        jp      m_e06d
m_e178:
        call    print_space
        call    get_hex_number
        cp      #0x2c                                   ;commentReference(0xe17e, "','|(str_reg_size)-1");
        ret     nz
        ld      hl,(0xe49c)                             ;commentReference(0xe181, "param_word");
        ld      (param_1),hl
        call    get_hex_number
        cp      #0x0d                                   ;commentReference(0xe18a, "str_print_on_size|str_break_at_size|VK_ENTER|(str_memory_size|str_completed_size|str_print_off_size|REG_14_CURSOR_H)-1");
        ret     nz
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(0xe49c)                             ;commentReference(0xe191, "param_word");
        or      a
        sbc     hl,de
        ret     c
        inc     hl
        push    hl
        ex      de,hl
        pop     bc
m_e19c:
        push    bc
        push    hl
        call    m_e2dc
        call    m_e2d0
        pop     hl
        pop     bc
        ld      de,#0xe4a6                              ;commentReference(0xe1a6, "nix");
m_e1a9:
        call    m_e38d
        ld      a,(hl)
        ld      (de),a
        dec     bc
        ld      a,b
        or      c
        inc     hl
        inc     de
        jp      z,m_e282
        ld      a,(0xe462)                              ;commentReference(0xe1b6, "column_count");
        xor     #0x0f                                   ;commentReference(0xe1b9, "REG_14_CURSOR_L|(str_area_over_size|crt_table40_size|crt_table80_size|CFG10|STATUS10)-1");
        and     #0x0f                                   ;commentReference(0xe1bb, "REG_14_CURSOR_L|(str_area_over_size|crt_table40_size|crt_table80_size|CFG10|STATUS10)-1");
        push    bc
        ld      b,a
        ld      a,l
        and     b
        pop     bc
        jr      nz,m_e1a9
        call    m_e282
        jr      m_e19c
m_e1c9:
        call    print_space
        call    get_hex_number
        cp      #VK_ENTER
        ret     nz
        ld      hl,#rst_38
        ex      de,hl
        ld      hl,#rst38_vec
        ld      bc,#3
        ldir
        ld      hl,#op_return
        push    hl
        ld      hl,(param_word)
        jp      (hl)
op_return:
        ret
rst38_vec:
        jp      m_e1ea
m_e1ea:
        ld      (0xe4bd),hl                             ;commentReference(0xe1ea, "nix");
        pop     hl
        ld      (0xe4b7),hl                             ;commentReference(0xe1ee, "nix");
        push    af
        pop     hl
        ld      (0xe4bf),hl                             ;commentReference(0xe1f3, "nix");
        ld      (0xe4b9),bc                             ;commentReference(0xe1f6, "nix");
        ld      (0xe4bb),de                             ;commentReference(0xe1fa, "nix");
        ld      a,i
        ld      (0xe4c1),a                              ;commentReference(0xe200, "nix");
        ld      (0xe4c2),ix                             ;commentReference(0xe203, "nix");
        ld      (0xe4c4),iy                             ;commentReference(0xe207, "nix");
        ld      hl,#str_break_at
        call    puts
        ld      hl,(0xe4b7)                             ;commentReference(0xe211, "nix");
        call    m_e393
        ld      sp,#stack_at_boot
        jp      monitor_cmd_loop
m_e21d:
        ld      hl,#str_reg
        call    puts
        ld      hl,(0xe4b7)                             ;commentReference(0xe223, "nix");
        call    m_e393
        ld      hl,#0xe4b9                              ;commentReference(0xe229, "nix");
        ld      c,#0x04                                 ;commentReference(0xe22c, "TOGGLE_GLED|_BUZZER_ON|COUNTRY_UK|GLED|(fdc_cmd_init_size|_PRT_SERIAL|COUNTRY_IT|SLED)-1");
m_e22e:
        push    bc
        inc     hl
        push    hl
        call    m_e38d
        pop     hl
        dec     hl
        push    hl
        call    m_e38d
        pop     hl
        inc     hl
        inc     hl
        pop     bc
        dec     c
        jr      nz,m_e22e
        call    m_e38d
        call    print_space
        ld      hl,(0xe4c2)                             ;commentReference(0xe247, "nix");
        call    m_e393
        call    print_space
        ld      hl,(0xe4c4)                             ;commentReference(0xe250, "nix");
        call    m_e393
        ret
enable_protocol_printer:
        ld      a,(printer_protocol_flag)
        or      a
        jr      z,m_e269
        ld      a,#OFF
        ld      hl,#str_print_off
m_e262:
        ld      (printer_protocol_flag),a
        call    puts
        ret
m_e269:
        ld      a,#ON
        ld      hl,#str_print_on
        jr      m_e262
return_to_basic:
        ld      a,(id_basic)
        cp      #ID_IS_BASIC
        jr      nz,just_go_back
        call    patch_os_functions
        ld      a,#0x0c                                 ;commentReference(0xe27a, "kbd_matrix_buffer_size|kbd_matrix_buffer2_size|KBD_COLUMNS|(str_print_on_size|str_break_at_size|VK_ENTER)-1");
        rst     0x18
just_go_back:
        ld      sp,(save_stack)
        ret
m_e282:
        push    hl
        push    bc
        ld      a,(0xe462)                              ;commentReference(0xe284, "column_count");
        and     #0x18                                   ;commentReference(0xe287, "SCREEN_HEIGHT");
        ld      c,a
        ld      b,#0x00                                 ;commentReference(0xe28a, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        ld      hl,#0xe4a6                              ;commentReference(0xe28c, "nix");
        or      a
        adc     hl,bc
        or      a
        sbc     hl,de
        ld      a,l
        or      a
        jr      z,m_e2a7
m_e299:
        push    hl
        call    print_space
        call    print_space
        call    print_space
        pop     hl
        dec     l
        jr      nz,m_e299
m_e2a7:
        call    print_space
        call    print_space
        ld      a,(0xe462)                              ;commentReference(0xe2ad, "column_count");
        and     #0x18                                   ;commentReference(0xe2b0, "SCREEN_HEIGHT");
        ld      b,a
        ld      hl,#0xe4a6                              ;commentReference(0xe2b3, "nix");
m_e2b6:
        push    hl
        push    bc
        ld      a,(hl)
        cp      #' '
        jr      c,non_char_printable
        cp      #VK_DEL
        jr      c,m_e2c3
non_char_printable:
        ld      a,#'.'
m_e2c3:
        ld      c,a
        call    put_char
        pop     bc
        pop     hl
        inc     hl
        dec     b
        jr      nz,m_e2b6
        pop     bc
        pop     hl
        ret
m_e2d0:
        ld      hl,#0xe4a6                              ;commentReference(0xe2d0, "nix");
        ld      b,#0x10                                 ;commentReference(0xe2d3, "str_area_over_size|crt_table40_size|crt_table80_size|CFG10|STATUS10");
m_e2d5:
        ld      (hl),#0x00                              ;commentReference(0xe2d5, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        inc     hl
        dec     b
        jr      nz,m_e2d5
        ret
m_e2dc:
        call    print_new_line
        call    m_e393
        ret
unreferenced_02:
        call    get_char_echoed
        cp      #','
        ret
str_monitor:
        .db     0x0c,0x2a,0x20,0x4d,0x4f,0x4e,0x49,0x54 ;.* MONIT
        .db     0x4f,0x52,0x20,0x2a,0x20,0x28,0x56,0x2e ;OR * (V.
        .db     0x20,0x31,0x2e,0x32,0x29,0x20,0x4a,0x75 ; 1.2) Ju
        .db     0x6e,0x65,0x20,0x31,0x39,0x38,0x33,0x0d ;ne 1983.
        .db     0x0a,0x0d,0x0a                          ;...
str_memory:
        .db     0x4d,0x65,0x6d,0x6f,0x72,0x79,0x20,0x41 ;Memory A
        .db     0x72,0x65,0x61,0x20,0x3f,0x00           ;rea ?.
str_completed:
        .db     0x0d,0x0a,0x43,0x6f,0x6d,0x70,0x6c,0x65 ;..Comple
        .db     0x74,0x65,0x64,0x0d,0x0a,0x00           ;ted...
str_area_over:
        .db     0x0d,0x0a,0x41,0x72,0x65,0x61,0x20,0x4f ;..Area O
        .db     0x76,0x65,0x72,0x20,0x21,0x0d,0x0a,0x00 ;ver !...
str_print_off:
        .db     0x0d,0x0a,0x50,0x72,0x69,0x6e,0x74,0x20 ;..Print 
        .db     0x4f,0x46,0x46,0x0d,0x0a,0x00           ;OFF...
str_print_on:
        .db     0x0d,0x0a,0x50,0x72,0x69,0x6e,0x74,0x20 ;..Print 
        .db     0x4f,0x4e,0x0d,0x0a,0x00                ;ON...
str_break_at:
        .db     0x0d,0x0a,0x42,0x72,0x65,0x61,0x6b,0x20 ;..Break 
        .db     0x61,0x74,0x20,0x23,0x00                ;at #.
str_reg:
        .db     0x0d,0x0a,0x20,0x50,0x43,0x20,0x20,0x20 ;.. PC   
        .db     0x42,0x20,0x20,0x43,0x20,0x20,0x44,0x20 ;B  C  D 
        .db     0x20,0x45,0x20,0x20,0x48,0x20,0x20,0x4c ; E  H  L
        .db     0x20,0x20,0x41,0x20,0x20,0x46,0x20,0x20 ;  A  F  
        .db     0x49,0x20,0x20,0x49,0x58,0x20,0x20,0x20 ;I  IX   
        .db     0x49,0x59,0x0d,0x0a,0x00                ;IY...
m_e38d:
        call    print_space
        ld      a,(hl)
        jr      m_e398
m_e393:
        ld      a,h
        call    m_e39c
        ld      a,l
m_e398:
        call    m_e39c
        ret
m_e39c:
        push    bc
        push    af
        rrca
        rrca
        rrca
        rrca
        call    m_e3b2
        pop     af
        call    m_e3b2
        pop     bc
        ret
m_e3ab:
        call    m_e38d
        ld      c,#'-'
        jr      m_e3bb
m_e3b2:
        and     #0x0f                                   ;commentReference(0xe3b2, "REG_14_CURSOR_L|(str_area_over_size|crt_table40_size|crt_table80_size|CFG10|STATUS10)-1");
        cp      #0x0a                                   ;commentReference(0xe3b4, "");
        jr      nc,m_e3bf
        add     a,#0x30                                 ;commentReference(0xe3b8, "'0'|STATUS30|CEN_DATA");
m_e3ba:
        ld      c,a
m_e3bb:
        call    put_char
        ret
m_e3bf:
        add     a,#0x37                                 ;commentReference(0xe3bf, "'7'|(rst_38)-1");
        jr      m_e3ba
print_new_line:
        push    bc
        ld      c,#VK_ENTER
        call    put_char
        ld      c,#0x0a                                 ;commentReference(0xe3c9, "");
        jr      m_e3d0
print_space:
        push    bc
        ld      c,#0x20                                 ;commentReference(0xe3ce, "' '|CFG20|STATUS_KBD");
m_e3d0:
        call    put_char
        pop     bc
        ret
put_char:
        call    m_e7ac
        ld      a,(printer_protocol_flag)
        or      a
        call    nz,dev_printer_write_byte
        ret
m_e3e0:
        call    get_hex_digit
        ret     c
        rlca
        rlca
        rlca
        rlca
        ld      b,a
        call    get_hex_digit
        ret     c
        add     a,b
        ld      (param_word),a
        ret
get_char_echoed:
        call    m_e762
        push    af
        ld      c,a
        call    put_char
        pop     af
        ret
; unchecked data source
        .db     0x00                                    ;.
dev_fdd_wait_ready:
        jp      wait_fdd_ready
dev_monitor:
        jp      go_monitor
dev_serial_ready:
        jp      com_rx_ready
dev_serial_read_byte:
        jp      com_read_byte
        jp      com_write_byte
dev_kbd_status:
        jp      m_e5b1
dev_kbd_inkey:
        jp      m_e762
        jp      m_e7ac
        jp      m_e5b1
        jp      m_e762
        jp      m_e7ac
        jp      m_e5b1
        jp      m_e762
        jp      m_e7ac
        jp      m_e762
        jp      com_read_byte
        jp      com_read_byte
        jp      m_e7ac
dev_serial_tx_ready:
        jp      com_tx_ready
dev_serial_write_byte:
        jp      com_write_byte
dev_printer_write_byte:
        jp      lpt_write_byte
; unchecked data source
        .db     0xc3,0xc2,0xea,0x3e,0xff,0xc9,0x00,0xaf ;CBj>.I./
        .db     0xc9                                    ;I
m_e445:
        jp      lpt_busy
        nop
        xor     a
        ret
        jp      kbd_buffer_clear_beep
        jp      kbd_buffer_clear
        jp      delay
        jp      m_ea9e
        jp      buzzer_on
        jp      m_e1ea
        jp      m_f115
; unchecked data source
        .db     0x18,0x18                               ;..
column_count:
        .db     0x50                                    ;P
; unchecked data source
        .db     0x00,0x18,0x18,0x30                     ;...0
attrib_color:
        .db     0x07                                    ;.
cfg10_settings:
        .db     0x00                                    ;.
cfg20_settings:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x05,0x00,0xd5                          ;..U
cursor_row:
        .db     0x00                                    ;.
cursor_column:
        .db     0x00                                    ;.
led_status:
        .db     0x00                                    ;.
cursor_start:
        .db     0x00                                    ;.
kbd_debounce_cnt:
        .db     0x00                                    ;.
kbd_matrix_buffer:
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00                     ;....
kbd_matrix_buffer2:
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00                     ;....
; unchecked data source
        .db     0x00                                    ;.
kbd_modifiers:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00,0x00                               ;..
kbd_position:
        .db     0x00                                    ;.
kbd_ascii:
        .db     0x00                                    ;.
cursor_abs:
        .db     0x00,0x00                               ;..
cursor_abs_color:
        .db     0x00,0x00                               ;..
; unchecked data source
        .db     0x00,0x00,0x00,0x00                     ;....
key_code:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00,0x00,0x00                          ;...
param_word:
        .db     0x00,0x00                               ;..
param_1:
        .db     0x00,0x00                               ;..
param_2:
        .db     0x00,0x00                               ;..
param_3:
        .db     0x00,0x00                               ;..
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00                               ;..
printer_protocol_flag:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00      ;.......
save_stack:
        .db     0x00,0x00                               ;..
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
os_patch:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00                                    ;.
beep_delay:
        .db     0x00,0x80                               ;..
unreferenced_03:
        jp      wait_vsync
unreferenced_04:
        jp      is_vsync
unreferenced_05:
        jp      wait_flicker_free_save_A
kbd_table_lookup:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
        .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
        .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
        .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
        .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
        .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
        .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_buffer_clear_beep:
        call    chr_beep
        call    m_ee78
kbd_buffer_clear:
        ld      hl,#kbd_debounce_cnt
        ld      de,#kbd_matrix_buffer
        ld      bc,#kbd_table_int_size
        ld      (hl),#0
        ldir
        ret
m_e5b1:
        push    hl
        push    de
        push    bc
        ld      a,(0xe48a)                              ;commentReference(0xe5b4, "nix");
        cp      #0x80                                   ;commentReference(0xe5b7, "");
        jr      z,m_e5e1
        cp      #0x88                                   ;commentReference(0xe5bb, "");
        jr      z,m_e5e1
        ld      hl,#0xe47e                              ;commentReference(0xe5bf, "kbd_matrix_buffer2");
        call    kbd_copy_state
        ld      hl,#0xe47e                              ;commentReference(0xe5c5, "kbd_matrix_buffer2");
        ld      b,#0x0c                                 ;commentReference(0xe5c8, "kbd_matrix_buffer_size|kbd_matrix_buffer2_size|KBD_COLUMNS|(str_print_on_size|str_break_at_size|VK_ENTER)-1");
m_e5ca:
        ld      a,(hl)
        or      a
        jr      nz,m_e5d5
        dec     b
        jp      z,m_e647
        inc     hl
        jr      m_e5ca
m_e5d5:
        call    m_e5e7
        ld      a,(0xe48a)                              ;commentReference(0xe5d8, "nix");
        cp      #0x80                                   ;commentReference(0xe5db, "");
        ld      a,#0x00                                 ;commentReference(0xe5dd, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        jr      nz,m_e5e3
m_e5e1:
        ld      a,#0xff                                 ;commentReference(0xe5e1, "");
m_e5e3:
        pop     bc
        pop     de
        pop     hl
        ret
m_e5e7:
        push    hl
        push    de
        push    bc
        ld      hl,#0x05dc                              ;commentReference(0xe5ea, "nix");
        call    delay
        ld      hl,#kbd_matrix_buffer
        call    kbd_copy_state
        ld      hl,#kbd_matrix_buffer
        ld      de,#kbd_matrix_buffer2
        ld      b,#kbd_matrix_buffer_size
cmp_kbd_entry:
        ld      a,(de)
        cp      (hl)
        jr      nz,m_e656
        dec     b
        jr      z,scan_is_stable
        inc     hl
        inc     de
        jr      cmp_kbd_entry
scan_is_stable:
        call    m_e682
        ld      a,(0xe48a)                              ;commentReference(0xe60c, "nix");
        cp      #0x80                                   ;commentReference(0xe60f, "");
        jr      nz,clear_kbd_modifiers
        call    m_e72c
        ld      a,(led_status)
        bit     7,a                                     ;commentReference(0xe619, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        jr      nz,m_e64f
        ld      a,(kbd_ascii)
        cp      #0xff                                   ;commentReference(0xe620, "");
        jr      z,m_e64f
        or      a
        jr      z,m_e64f
        call    modify_if_graphic_B
        ld      a,(key_code)
        cp      b
        jr      nz,set_kbd_debounce_cnt
        ld      a,(kbd_debounce_cnt)
        or      a
        jr      nz,decrement_kbd_debounce_cnt
        ld      hl,#0x0bb8                              ;commentReference(0xe636, "nix");
        call    delay
        jr      m_e664
; unchecked data source
        .db     0xaf,0x18,0x12                          ;/..
decrement_kbd_debounce_cnt:
        dec     a
        ld      (kbd_debounce_cnt),a
        jr      m_e656
m_e647:
        xor     a
        ld      (0xe4c9),a                              ;commentReference(0xe648, "nix");
clear_kbd_modifiers:
        xor     a
        ld      (kbd_modifiers),a
m_e64f:
        xor     a
        ld      (key_code),a
        ld      (kbd_debounce_cnt),a
m_e656:
        xor     a
        ld      (0xe48a),a                              ;commentReference(0xe657, "nix");
        ld      (kbd_ascii),a
        jr      m_e66a
set_kbd_debounce_cnt:
        ld      a,#32
        ld      (kbd_debounce_cnt),a
m_e664:
        ld      a,(kbd_ascii)
        ld      (key_code),a
m_e66a:
        pop     bc
        pop     de
        pop     hl
        ret
kbd_copy_state:
        ld      c,#STATUS_KBD
        ld      b,#KBD_COLUMNS
kbd_scan_columns:
        in      a,(c)
        ld      (hl),a
        inc     hl
        inc     c
        dec     b
        jr      nz,kbd_scan_columns
        ret
delay:
        nop
        dec     hl
        ld      a,h
        or      l
        jr      nz,delay
        ret
m_e682:
        ld      ix,#kbd_matrix_buffer2
        xor     a
        ld      c,a
        ld      e,a
        ld      (0xe48a),a                              ;commentReference(0xe689, "nix");
kbd_buffer_check_colum:
        ld      a,0(ix)
        or      a
        jr      nz,m_e69d
        ld      a,c
        add     a,#0x08                                 ;commentReference(0xe693, "id_basic|FDC_CMD_SENSE_INTERRUPT_STATE|(fdc_cmd_read_boot_size)-1");
        ld      c,a
m_e696:
        cp      #kbd_table_int_size
        ret     z
        inc     ix
        jr      kbd_buffer_check_colum
m_e69d:
        ld      d,#0x08                                 ;commentReference(0xe69d, "id_basic|FDC_CMD_SENSE_INTERRUPT_STATE|(fdc_cmd_read_boot_size)-1");
        ld      h,a
m_e6a0:
        inc     c
        ld      a,h
        or      a
        srl     a
        ld      h,a
        jr      c,m_e6ae
m_e6a8:
        dec     d
        jr      nz,m_e6a0
        ld      a,c
        jr      m_e696
m_e6ae:
        ld      a,c
        cp      #KBD_POSITION_CTRL
        jr      z,m_e6d4
        cp      #KBD_POSITION_SHIFT
        jr      z,set_kbd_shift_lock
        cp      #KBD_POSITION_SHIFT_LOCK
        jr      z,m_e6ec
        cp      #KBD_POSITION_COMMAND
        jr      z,m_e6f6
        cp      #KBD_POSITION_GRAPH
        jr      z,m_e6ff
m_e6c3:
        ld      a,e
        or      a
        jr      nz,m_e6a8
        ld      e,#0x01                                 ;commentReference(0xe6c7, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      a,c
        ld      (kbd_position),a
        ld      a,#0x80                                 ;commentReference(0xe6cd, "");
        ld      (0xe48a),a                              ;commentReference(0xe6cf, "nix");
        jr      m_e6a8
m_e6d4:
        ld      a,(0xe46a)                              ;commentReference(0xe6d4, "nix");
        bit     2,a                                     ;commentReference(0xe6d7, "STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE");
        jr      z,m_e6c3
        ld      a,(kbd_modifiers)
        set     2,a                                     ;STATUS_GLED
        jr      set_kbd_modifiers
set_kbd_shift_lock:
        ld      a,(kbd_modifiers)
        set     0,a                                     ;STATUS_SLED
set_kbd_modifiers:
        ld      (kbd_modifiers),a
        jr      m_e6a8
m_e6ec:
        call    m_e70f
        jr      nz,m_e6a8
        call    m_e8bf
        jr      m_e6a8
m_e6f6:
        ld      a,(0xe46a)                              ;commentReference(0xe6f6, "nix");
        bit     3,a                                     ;commentReference(0xe6f9, "CMT_MOTOR_START|COUNTRY_FR|MONINH|_CEN_BUSY");
        jr      nz,m_e6c3
        jr      m_e6a8
m_e6ff:
        call    m_e70f
        jr      nz,m_e6a8
        call    m_e8a6
        ld      a,(os_patch)
        or      a
        jr      z,m_e6c3
        jr      m_e6a8
m_e70f:
        ld      a,(0xe4c9)                              ;commentReference(0xe70f, "nix");
        or      a
        ret     nz
        ld      a,#0x01                                 ;commentReference(0xe714, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (0xe4c9),a                              ;commentReference(0xe716, "nix");
        ret
modify_if_graphic_B:
        ld      a,(kbd_modifiers)
        bit     2,a                                     ;STATUS_GLED
        push    hl
        ld      hl,#kbd_ascii
        jr      z,m_e729
        res     6,(hl)                                  ;commentReference(0xe725, "ROM_PACK_EN|_CRT_NTSC|COUNTRY_ES|UPPER_MONITOR_SEL|DIO_Data_input_output");
        res     5,(hl)                                  ;commentReference(0xe727, "fdc_cmd_init_size|_PRT_SERIAL|COUNTRY_IT|SLED");
m_e729:
        ld      b,(hl)
        pop     hl
        ret
m_e72c:
        ld      a,(kbd_modifiers)
        and     #MODIFIER_SHIFT
        ld      hl,#kbd_table_lookup
        jr      z,m_e739
        ld      hl,#kbd_table_lookup+0x60
m_e739:
        ld      d,#HIGH_ZERO
        ld      a,(kbd_position)
        ld      e,a
        add     hl,de
        dec     hl
        ld      a,(hl)
        ld      (kbd_ascii),a
        ld      a,(led_status)
        bit     0,a                                     ;STATUS_SLED
        ret     z
        ld      a,(hl)
        cp      #0x61                                   ;commentReference(0xe74c, "'a'");
        ret     c
opcode_compare:
        cp      #0x7b                                   ;commentReference(0xe74f, "'{'");
        ret     nc
        and     #0x5f                                   ;commentReference(0xe752, "'_'|MASK_CAPITALIZE|(kbd_table_int_size|kbd_table_int_sh_size|DMA)-1");
        ld      (kbd_ascii),a
        ret
unreferenced:
        push    hl
        ld      hl,#led_status
        res     7,(hl)                                  ;commentReference(0xe75c, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        pop     hl
        jp      m_ea9e
m_e762:
        push    hl
        push    de
        push    bc
m_e765:
        ld      a,(0xe48a)                              ;commentReference(0xe765, "nix");
        cp      #0x80                                   ;commentReference(0xe768, "");
        jr      z,m_e77a
        cp      #0x88                                   ;commentReference(0xe76c, "");
        ld      a,#0x00                                 ;commentReference(0xe76e, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        ld      (0xe48a),a                              ;commentReference(0xe770, "nix");
        jr      z,m_e7a2
        call    m_e5b1
        jr      m_e765
m_e77a:
        xor     a
        ld      (0xe48a),a                              ;commentReference(0xe77b, "nix");
        ld      a,(kbd_ascii)
        and     #0x7f                                   ;commentReference(0xe781, "VK_DEL");
        cp      #0x20                                   ;commentReference(0xe783, "' '|CFG20|STATUS_KBD");
        jr      c,m_e794
        ld      a,(os_patch)
        or      a
        jr      z,m_e794
        ld      a,(led_status)
        bit     2,a                                     ;STATUS_GLED
        jr      nz,m_e799
m_e794:
        ld      a,(kbd_ascii)
        jr      m_e7a8
m_e799:
        ld      a,#0x88                                 ;commentReference(0xe799, "");
        ld      (0xe48a),a                              ;commentReference(0xe79b, "nix");
        ld      a,#0xdf                                 ;commentReference(0xe79e, "");
        jr      m_e7a8
m_e7a2:
        ld      a,(kbd_ascii)
        call    m_e828
m_e7a8:
        pop     bc
        pop     de
        pop     hl
        ret
m_e7ac:
        push    hl
        push    de
        push    bc
        ld      a,c
        ld      (0xe466),a                              ;commentReference(0xe7b0, "nix");
        ld      a,(0xe48c)                              ;commentReference(0xe7b3, "nix");
        or      a
        jr      nz,m_e823
        ld      a,(os_patch)
        or      a
        jr      z,m_e7ef
        ld      a,(0xe4c8)                              ;commentReference(0xe7bf, "nix");
        or      a
        ld      a,(0xe466)                              ;commentReference(0xe7c3, "nix");
        jr      nz,m_e7d8
        cp      #0xdf                                   ;commentReference(0xe7c8, "");
        jr      z,m_e817
m_e7cc:
        and     #0x7f                                   ;commentReference(0xe7cc, "VK_DEL");
        jr      z,m_e7df
        cp      #0x7f                                   ;commentReference(0xe7d0, "VK_DEL");
        jr      z,m_e81e
        cp      #0x20                                   ;commentReference(0xe7d4, "' '|CFG20|STATUS_KBD");
        jr      c,m_e81e
m_e7d8:
        xor     a
        ld      (0xe4c8),a                              ;commentReference(0xe7d9, "nix");
m_e7dc:
        call    m_e8ec
m_e7df:
        pop     bc
        pop     de
        ld      a,(0xe4cb)                              ;commentReference(0xe7e1, "nix");
        or      a
        jr      nz,m_e80d
m_e7e7:
        ld      a,(0xe466)                              ;commentReference(0xe7e7, "nix");
        ld      (0xe46c),a                              ;commentReference(0xe7ea, "nix");
        pop     hl
        ret
m_e7ef:
        ld      a,(0xe466)                              ;commentReference(0xe7ef, "nix");
        ld      b,a
        cp      #0xdf                                   ;commentReference(0xe7f3, "");
        jr      z,m_e808
        ld      a,(0xe4c8)                              ;commentReference(0xe7f7, "nix");
        or      a
        ld      a,b
        jr      z,m_e7cc
        call    m_e828
        ld      (0xe466),a                              ;commentReference(0xe801, "nix");
        jr      c,m_e81e
        jr      m_e7dc
m_e808:
        call    m_e8d6
        jr      m_e7df
m_e80d:
        ld      hl,(0xe4cc)                             ;commentReference(0xe80d, "nix");
        ex      de,hl
        xor     a
        ld      (0xe4cb),a                              ;commentReference(0xe812, "nix");
        jr      m_e7e7
m_e817:
        ld      a,#0x01                                 ;commentReference(0xe817, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (0xe4c8),a                              ;commentReference(0xe819, "nix");
        jr      m_e7df
m_e81e:
        call    m_e83f
        jr      m_e7df
m_e823:
        call    m_ebe3
        jr      m_e7df
m_e828:
        cp      #0x20                                   ;commentReference(0xe828, "' '|CFG20|STATUS_KBD");
        ret     c
        cp      #0x60                                   ;commentReference(0xe82b, "'`'|kbd_table_int_size|kbd_table_int_sh_size|DMA");
        jr      c,m_e835
        cp      #0x80                                   ;commentReference(0xe82f, "");
        ret     nc
        or      #0x80                                   ;commentReference(0xe832, "");
        ret
m_e835:
        cp      #0x40                                   ;commentReference(0xe835, "'@'");
        jr      c,m_e83c
        xor     #0xc0                                   ;commentReference(0xe839, "kbd_table_lookup_size|kbd_table_de_size|kbd_table_us_size|kbd_table_fr_size|kbd_table_uk_size|kbd_table_it_size|kbd_table_es_size");
        ret
m_e83c:
        xor     #0x20                                   ;commentReference(0xe83c, "' '|CFG20|STATUS_KBD");
        ret
m_e83f:
        ld      a,(0xe466)                              ;commentReference(0xe83f, "nix");
        cp      #VK_ESC
        jr      nz,m_e84c
        ld      a,#0x01                                 ;commentReference(0xe846, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (0xe48c),a                              ;commentReference(0xe848, "nix");
        ret
m_e84c:
        ld      c,a
        ld      hl,#special_characters
        call    map_C_to_PTR
        ret     z
        jp      (hl)
special_characters:
        .db     0x03                                    ;.
        .dw     chr_03
asc_07:
        .db     0x07                                    ;.
        .dw     chr_beep
asc_08:
        .db     0x08                                    ;.
        .dw     chr_backspace
asc_0a:
        .db     0x0a                                    ;.
        .dw     chr_line_feed
asc_0c:
        .db     0x0c                                    ;.
        .dw     chr_clear_screen
asc_0d:
        .db     0x0d                                    ;.
        .dw     chr_carrige_return
asc_12:
        .db     0x12                                    ;.
        .dw     chr_12
asc_1c:
        .db     0x1c                                    ;.
        .dw     chr_cursor_right
asc_1d:
        .db     0x1d                                    ;.
        .dw     chr_cursor_left
asc_1e:
        .db     0x1e                                    ;.
        .dw     chr_cursor_up
asc_1f:
        .db     0x1f                                    ;.
        .dw     chr_cursor_down
asc_7f:
        .db     0x7f                                    ;.
        .dw     chr_7f
asc_99:
        .db     0x99                                    ;.
        .dw     chr_inverse_on
asc_9a:
        .db     0x9a                                    ;.
        .dw     chr_inverse_off
; unchecked data source
        .db     0x00                                    ;.
chr_line_feed:
        ld      a,(0xe46c)                              ;commentReference(0xe880, "nix");
        cp      #VK_ENTER
        ret     z
        ld      a,(cursor_column)
        or      #0x80                                   ;commentReference(0xe889, "");
        ld      (0xe4ca),a                              ;commentReference(0xe88b, "nix");
        jp      chr_carrige_return
chr_03:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
chr_12:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
chr_7f:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
chr_inverse_off:
        ld      hl,#attrib_color
        res     7,(hl)                                  ;commentReference(0xe89d, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        ret
chr_inverse_on:
        ld      hl,#attrib_color
        set     7,(hl)                                  ;commentReference(0xe8a3, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        ret
m_e8a6:
        ld      a,(led_status)
        xor     #TOGGLE_GLED
m_e8ab:
        ld      (led_status),a
        bit     2,a                                     ;STATUS_GLED
        ld      hl,#cfg20_settings
        jr      z,m_e8bb
        set     4,(hl)                                  ;GLED
m_e8b7:
        ld      a,(hl)
        out     (CFG20),a
        ret
m_e8bb:
        res     4,(hl)                                  ;GLED
        jr      m_e8b7
m_e8bf:
        ld      a,(led_status)
        xor     #TOGGLE_SLED
        ld      (led_status),a
        bit     0,a                                     ;STATUS_SLED
        ld      hl,#cfg20_settings
        jr      z,m_e8d2
        set     5,(hl)                                  ;SLED
        jr      m_e8b7
m_e8d2:
        res     5,(hl)                                  ;SLED
        jr      m_e8b7
m_e8d6:
        ld      a,(0xe4c8)                              ;commentReference(0xe8d6, "nix");
        xor     #0x01                                   ;commentReference(0xe8d9, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (0xe4c8),a                              ;commentReference(0xe8db, "nix");
        ld      a,(led_status)
        jr      z,m_e8e8
        set     2,a                                     ;STATUS_GLED
m_e8e5:
        jp      m_e8ab
m_e8e8:
        res     2,a                                     ;STATUS_GLED
        jr      m_e8e5
m_e8ec:
        call    set_cursor_abs
        ld      a,(0xe466)                              ;commentReference(0xe8ef, "nix");
        call    wait_flicker_free_save_A
        ld      (hl),b
        ld      a,(attrib_color)
        ld      (de),a
m_e8fa:
        ld      a,(cursor_column)
        inc     a
        ld      (cursor_column),a
        ld      b,a
        ld      a,(column_count)
        dec     a
        cp      b
        jr      nc,crt_set_cursor
chr_carrige_return:
        ld      a,(cursor_row)
        inc     a
        ld      (cursor_row),a
        ld      b,a
        ld      a,(0xe465)                              ;commentReference(0xe911, "nix");
        cp      b
        jr      z,m_e94a
        ld      a,(0xe460)                              ;commentReference(0xe917, "nix");
        cp      b
        jr      z,m_e963
        call    c,set_cursor_home
        jr      m_e925
m_e922:
        call    erase_line
m_e925:
        ld      a,(0xe4ca)                              ;commentReference(0xe925, "nix");
        bit     7,a                                     ;commentReference(0xe928, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        jr      z,m_e947
        and     #0x0f                                   ;commentReference(0xe92c, "REG_14_CURSOR_L|(str_area_over_size|crt_table40_size|crt_table80_size|CFG10|STATUS10)-1");
m_e92e:
        ld      (cursor_column),a
crt_set_cursor:
        call    get_cursor_abs
        ld      a,#REG_14_CURSOR_H
        out     (CRT_REG),a
        ld      a,h
        out     (CRT_DATA),a
        ld      a,#REG_14_CURSOR_L
        out     (CRT_REG),a
        ld      a,l
        out     (CRT_DATA),a
        xor     a
        ld      (0xe4ca),a                              ;commentReference(0xe943, "nix");
        ret
m_e947:
        xor     a
        jr      m_e92e
m_e94a:
        ld      a,(0xe463)                              ;commentReference(0xe94a, "nix");
        call    crt_set_cursor_at_row_start
        jr      z,m_e925
        ld      a,(0xe464)                              ;commentReference(0xe952, "nix");
        cp      #0x01                                   ;commentReference(0xe955, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        call    nz,m_e999
        ld      a,(0xe465)                              ;commentReference(0xe95a, "nix");
m_e95d:
        dec     a
        ld      (cursor_row),a
        jr      m_e922
m_e963:
        ld      a,(0xe465)                              ;commentReference(0xe963, "nix");
        call    crt_set_cursor_at_row_start
        jr      z,m_e925
        ld      a,(0xe465)                              ;commentReference(0xe96b, "nix");
        ld      b,a
        ld      a,(0xe460)                              ;commentReference(0xe96f, "nix");
        sub     b
        cp      #0x01                                   ;commentReference(0xe973, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        call    nz,m_e999
        ld      a,(0xe460)                              ;commentReference(0xe978, "nix");
        jr      m_e95d
m_e97d:
        ex      de,hl
        ld      a,(column_count)
        ld      l,a
        ld      h,#0x00                                 ;commentReference(0xe982, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        add     hl,de
        ld      bc,(0xe494)                             ;commentReference(0xe985, "nix");
        ldir
        ret
crt_set_cursor_at_row_start:
        ld      (cursor_row),a
        xor     a
        ld      (cursor_column),a
        ld      a,(0xe46a)                              ;commentReference(0xe993, "nix");
        and     #0x01                                   ;commentReference(0xe996, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ret
m_e999:
        dec     a
        ld      hl,#0
        ld      d,#HIGH_ZERO
        call    calc_column_offset
        ld      (0xe494),hl                             ;commentReference(0xe9a2, "nix");
        call    set_cursor_abs
        push    de
        call    wait_vsync
        call    m_e97d
        pop     hl
        call    m_e97d
        call    is_vsync
        ret
set_cursor_abs:
        call    get_cursor_abs
        ld      de,#BWS
        add     hl,de
        ld      (cursor_abs),hl
        push    hl
        ld      de,#OFFSET_COLOR
        add     hl,de
        ld      (cursor_abs_color),hl
        ex      de,hl
        pop     hl
        ret
get_cursor_abs:
        ld      hl,#0
        ld      d,#HIGH_ZERO
        ld      a,(cursor_row)
        or      a
        call    nz,calc_column_offset
        ld      a,(cursor_column)
        ld      e,a
        add     hl,de
        ret
calc_column_offset:
        ld      b,a
        ld      a,(column_count)
        ld      e,a
add_column_size:
        add     hl,de
        dec     b
        jr      nz,add_column_size
        ret
chr_clear_screen:
        ld      a,#0x07                                 ;commentReference(0xe9e8, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master|(id_basic|FDC_CMD_SENSE_INTERRUPT_STATE)-1");
        ld      (attrib_color),a
m_e9ed:
        ld      (BWS+OFFSET_COLOR),a
        ld      hl,#BWS
        ld      c,#0x19                                 ;commentReference(0xe9f3, "");
        call    wait_vsync
        xor     a
        call    m_eda3
        call    is_vsync
set_cursor_home:
        xor     a
        ld      (cursor_row),a
        ld      (cursor_column),a
        jp      crt_set_cursor
wait_vsync:
        in      a,(STATUS30)
        bit     1,a                                     ;_CRT_VSYNC_PERIOD
        jr      z,wait_vsync
display_inhibit:
        ld      a,(cfg10_settings)
        set     1,a                                     ;_DISPLAY_INHIBIT
        jr      display_status_set
is_vsync:
        in      a,(STATUS30)
        bit     1,a                                     ;_CRT_VSYNC_PERIOD
        jr      z,is_vsync
m_ea1c:
        ld      a,(cfg10_settings)
        res     1,a                                     ;_DISPLAY_INHIBIT
display_status_set:
        ld      (cfg10_settings),a
        out     (CFG10),a
        ret
wait_flicker_free_save_A:
        ld      b,a
wait_flicker_free:
        in      a,(STATUS10)
        bit     7,a                                     ;_CRT_DISPLAY
        jr      nz,wait_flicker_free
m_ea2e:
        in      a,(STATUS10)
        bit     7,a                                     ;_CRT_DISPLAY
        jr      z,m_ea2e
        ret
chr_cursor_left:
        ld      a,(cursor_column)
        dec     a
        cp      #-1
        jr      nz,m_ea6f
        ld      a,(column_count)
        dec     a
        ld      (cursor_column),a
chr_cursor_up:
        ld      a,(cursor_row)
        dec     a
        cp      #-1
        jr      nz,cursor_row_adjusted
        ld      a,#SCREEN_HEIGHT-1
        jr      cursor_row_adjusted
chr_cursor_right:
        ld      a,(column_count)
        ld      b,a
        ld      a,(cursor_column)
        inc     a
        cp      b
        jr      c,m_ea6f
        xor     a
        ld      (cursor_column),a
chr_cursor_down:
        ld      b,#SCREEN_HEIGHT
        ld      a,(cursor_row)
        inc     a
        cp      b
        jr      c,cursor_row_adjusted
        xor     a
cursor_row_adjusted:
        ld      (cursor_row),a
m_ea6c:
        jp      crt_set_cursor
m_ea6f:
        ld      (cursor_column),a
        jr      m_ea6c
chr_backspace:
        call    set_cursor_abs
        call    wait_flicker_free
        ld      (hl),#' '
        jr      chr_cursor_left
chr_beep:
        push    hl
        ld      hl,#cfg10_settings
        set     4,(hl)                                  ;_BUZZER_ON
        ld      a,(hl)
        out     (CFG10),a
        push    hl
        ld      hl,(beep_delay)
        call    delay
        pop     hl
m_ea8f:
        res     4,(hl)                                  ;_BUZZER_ON
m_ea91:
        ld      a,(hl)
        out     (CFG10),a
        pop     hl
        ret
buzzer_on:
        push    hl
        ld      hl,#cfg10_settings
        set     4,(hl)                                  ;_BUZZER_ON
        jr      m_ea91
m_ea9e:
        push    hl
        ld      hl,#cfg10_settings
        jr      m_ea8f
m_eaa4:
        in      a,(STATUS_KBD+10)
        or      a
        bit     7,a                                     ;KBD_BREAK
        ret     z
        ld      a,(os_patch)
        or      a
        jp      z,cold_start
        ld      e,#0x18                                 ;commentReference(0xeab1, "SCREEN_HEIGHT");
        scf
        ret
lpt_busy:
        call    m_eaa4
        in      a,(STATUS30)
        bit     3,a                                     ;_CEN_BUSY
        ld      a,#0x00                                 ;commentReference(0xeabc, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        ret     z
        ld      a,#0xff                                 ;commentReference(0xeabf, "");
        ret
lpt_write_byte:
        call    m_e445
        ret     c
        jr      nz,lpt_write_byte
        ld      a,c
        out     (CEN_DATA),a
        ld      a,(cfg20_settings)
        set     2,a                                     ;CEN_STROBE
        out     (CFG20),a
        res     2,a                                     ;CEN_STROBE
        out     (CFG20),a
m_ead6:
        in      a,(STATUS30)
        bit     2,a                                     ;_CEN_ACKNOWLEDGE
        jr      nz,m_eadd
        ret
m_eadd:
        call    m_eaa4
        ret     c
        jr      m_ead6
com_tx_ready:
        in      a,(0x41)                                ;commentReference(0xeae3, "'A'");
        call    m_eb08
        jr      z,com_tx_ready
        jr      m_eaf2
com_write_byte:
        call    m_eaff
        ret     c
        jr      z,com_write_byte
m_eaf2:
        ld      a,c
        out     (0x40),a                                ;commentReference(0xeaf3, "'@'");
        ret
com_read_byte:
        call    com_rx_ready
        ret     c
        jr      z,com_read_byte
        in      a,(0x40)                                ;commentReference(0xeafc, "'@'");
        ret
m_eaff:
        call    m_eaa4
        in      a,(0x41)                                ;commentReference(0xeb02, "'A'");
        bit     7,a                                     ;commentReference(0xeb04, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        jr      z,m_eb0d
m_eb08:
        bit     0,a                                     ;commentReference(0xeb08, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC");
        ld      a,#0xff                                 ;commentReference(0xeb0a, "");
        ret     nz
m_eb0d:
        ld      a,#0x00                                 ;commentReference(0xeb0d, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        ret
com_rx_ready:
        call    m_eaa4
        in      a,(0x41)                                ;commentReference(0xeb13, "'A'");
        bit     1,a                                     ;commentReference(0xeb15, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD");
        ld      a,#0x00                                 ;commentReference(0xeb17, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        ret     z
        ld      a,#0xff                                 ;commentReference(0xeb1a, "");
        ret
unreferenced_06:
        ld      a,#0xfe                                 ;commentReference(0xeb1d, "");
        out     (0x41),a                                ;commentReference(0xeb1f, "'A'");
        ld      a,#0x37                                 ;commentReference(0xeb21, "'7'|(rst_38)-1");
        out     (0x41),a                                ;commentReference(0xeb23, "'A'");
        ld      a,(cfg10_settings)
        res     2,a                                     ;CMT_RS232_SELECT
        jr      set_cfg10
init_serial:
        ld      a,#0xfa                                 ;commentReference(0xeb2c, "");
        out     (0x41),a                                ;commentReference(0xeb2e, "'A'");
        ld      a,#0x37                                 ;commentReference(0xeb30, "'7'|(rst_38)-1");
        out     (0x41),a                                ;commentReference(0xeb32, "'A'");
        ld      a,(cfg10_settings)
        set     2,a                                     ;CMT_RS232_SELECT
set_cfg10:
        out     (CFG10),a
        ld      (cfg10_settings),a
        ret
unreferenced_07:
        ld      a,(0xe468)                              ;commentReference(0xeb3f, "cfg10_settings");
        set     3,a                                     ;commentReference(0xeb42, "CMT_MOTOR_START|COUNTRY_FR|MONINH|_CEN_BUSY");
m_eb44:
        out     (0x10),a                                ;commentReference(0xeb44, "str_area_over_size|crt_table40_size|crt_table80_size|CFG10|STATUS10");
        ld      (0xe468),a                              ;commentReference(0xeb46, "cfg10_settings");
        ret
unreferenced_08:
        ld      a,(0xe468)                              ;commentReference(0xeb4a, "cfg10_settings");
        res     3,a                                     ;commentReference(0xeb4d, "CMT_MOTOR_START|COUNTRY_FR|MONINH|_CEN_BUSY");
        jr      m_eb44
map_esc_list:
        .db     0x09                                    ;.
        .dw     alternate_keyboard_table
map_ch_0c:
        .db     0x0c                                    ;.
        .dw     function_0c
map_ch_10:
        .db     0x10                                    ;.
        .dw     function_0c
map_ch_11:
        .db     0x11                                    ;.
        .dw     set_cursor_home
map_ch_12:
        .db     0x12                                    ;.
        .dw     set_cursor_off
map_ch_13:
        .db     0x13                                    ;.
        .dw     set_cursor_on
map_ch_16:
        .db     0x16                                    ;.
        .dw     function_0c
map_ch_17:
        .db     0x17                                    ;.
        .dw     get_cursor_pos
map_ch_18:
        .db     0x18                                    ;.
        .dw     write_character
map_ch_19:
        .db     0x19                                    ;.
        .dw     erase_rest_of_line
map_ch_1a:
        .db     0x1a                                    ;.
        .dw     chr_cursor_right
map_ch_1c:
        .db     0x1c                                    ;.
        .dw     read_character
map_ch_1d:
        .db     0x1d                                    ;.
        .dw     function_0c
map_ch_31:
        .db     0x31                                    ;1
        .dw     graphic_mode_on
map_ch_41:
        .db     0x41                                    ;A
        .dw     chr_cursor_up
map_ch_42:
        .db     0x42                                    ;B
        .dw     chr_cursor_down
map_ch_43:
        .db     0x43                                    ;C
        .dw     chr_cursor_right
map_ch_44:
        .db     0x44                                    ;D
        .dw     chr_cursor_left
map_ch_45:
        .db     0x45                                    ;E
        .dw     chr_clear_screen
map_ch_46:
        .db     0x46                                    ;F
        .dw     erase_line
map_ch_47:
        .db     0x47                                    ;G
        .dw     function_0c
map_ch_48:
        .db     0x48                                    ;H
        .dw     set_cursor_home
map_ch_49:
        .db     0x49                                    ;I
        .dw     function_0c
map_ch_4a:
        .db     0x4a                                    ;J
        .dw     function_4a
map_ch_4b:
        .db     0x4b                                    ;K
        .dw     erase_rest_of_line
map_ch_53:
        .db     0x53                                    ;S
        .dw     function_0c
map_ch_54:
        .db     0x54                                    ;T
        .dw     function_0c
map_ch_55:
        .db     0x55                                    ;U
        .dw     function_0c
map_ch_56:
        .db     0x56                                    ;V
        .dw     function_0c
map_ch_59:
        .db     0x59                                    ;Y
        .dw     function_0c
map_ch_end:
        .db     0x00                                    ;.
map_more_codes:
        .db     0x0c                                    ;.
        .dw     function_more_0c0
map_ch_more1:
        .db     0x10                                    ;.
        .dw     function_more_0c1
map_ch_more2:
        .db     0x16                                    ;.
        .dw     function_more_0c2
map_ch_more3:
        .db     0x1d                                    ;.
        .dw     function_more_0c3
map_ch_more4:
        .db     0x47                                    ;G
        .dw     function_more_0c4
map_ch_more5:
        .db     0x49                                    ;I
        .dw     function_more_0c5
map_ch_more6:
        .db     0x53                                    ;S
        .dw     function_more_0c6
map_ch_more7:
        .db     0x54                                    ;T
        .dw     function_more_0c7
map_ch_more8:
        .db     0x55                                    ;U
        .dw     function_more_0c7
map_ch_more9:
        .db     0x56                                    ;V
        .dw     function_more_0c9
map_ch_more10:
        .db     0x59                                    ;Y
        .dw     function_more_0c10
map_ch_more11:
        .db     0x96                                    ;.
        .dw     function_more_0c11
map_ch_more12:
        .db     0x9d                                    ;.
        .dw     function_more_0c12
map_ch_more13:
        .db     0xb1                                    ;1
        .dw     function_more_0c13
map_ch_more14:
        .db     0xb2                                    ;2
        .dw     function_more_0c14
map_ch_more15:
        .db     0xd4                                    ;T
        .dw     function_more_0c15
map_ch_more16:
        .db     0xd5                                    ;U
        .dw     function_more_0c15
map_ch_more17:
        .db     0xd9                                    ;Y
        .dw     function_more_0c17
map_more_codes_end:
        .db     0x00                                    ;.
m_ebe3:
        cp      #0x01                                   ;commentReference(0xebe3, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        jp      nz,m_ec03
        xor     a
        ld      (0xe48c),a                              ;commentReference(0xebe9, "nix");
        ld      (0xe4cb),a                              ;commentReference(0xebec, "nix");
        ld      a,c
        cp      #0x61                                   ;commentReference(0xebf0, "'a'");
        jr      c,m_ebfb
        cp      #0x7b                                   ;commentReference(0xebf4, "'{'");
        jr      nc,m_ebfb
        and     #0x5f                                   ;commentReference(0xebf8, "'_'|MASK_CAPITALIZE|(kbd_table_int_size|kbd_table_int_sh_size|DMA)-1");
        ld      c,a
m_ebfb:
        ld      hl,#map_esc_list
        call    map_C_to_PTR
        ret     z
        jp      (hl)
m_ec03:
        ld      c,a
        xor     a
        ld      (0xe48c),a                              ;commentReference(0xec05, "nix");
        ld      hl,#0xebac                              ;commentReference(0xec08, "map_more_codes");
        call    map_C_to_PTR
        ret     z
        jp      (hl)
m_ec10:
        xor     a
        jr      m_ec14
function_0c:
        ld      a,c
m_ec14:
        ld      (0xe48c),a                              ;commentReference(0xec14, "nix");
        ret
graphic_mode_on:
        ld      a,c
        or      #0x80                                   ;commentReference(0xec19, "");
        ld      (0xe48c),a                              ;commentReference(0xec1b, "nix");
        ret
map_C_to_PTR:
        ld      a,(hl)
        or      a
        ret     z
        cp      c
        jr      z,key_found
        inc     hl
        inc     hl
        inc     hl
        jr      map_C_to_PTR
key_found:
        push    de
        inc     hl
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        ex      de,hl
        pop     de
        ld      a,c
        or      a
        ret
function_more_0c7:
        call    m_ec83
        ret     c
        ld      (0xe499),a                              ;commentReference(0xec38, "nix");
        jr      graphic_mode_on
function_more_0c15:
        call    m_ec83
        ret     c
        ld      b,a
        ld      a,(0xe46a)                              ;commentReference(0xec42, "nix");
        bit     6,a                                     ;commentReference(0xec45, "ROM_PACK_EN|_CRT_NTSC|COUNTRY_ES|UPPER_MONITOR_SEL|DIO_Data_input_output");
        ld      a,(0xe499)                              ;commentReference(0xec47, "nix");
        jr      nz,m_ec4e
        cp      b
        ret     z
m_ec4e:
        push    af
        ld      a,b
        rlca
        rlca
        rlca
        ld      b,a
        pop     af
        or      b
        ld      b,a
        ld      a,(0xe467)                              ;commentReference(0xec57, "attrib_color");
        and     #0xc0                                   ;commentReference(0xec5a, "kbd_table_lookup_size|kbd_table_de_size|kbd_table_us_size|kbd_table_fr_size|kbd_table_uk_size|kbd_table_it_size|kbd_table_es_size");
        or      b
        ld      (0xe467),a                              ;commentReference(0xec5d, "attrib_color");
        ld      a,c
        cp      #0xd4                                   ;commentReference(0xec61, "");
        ret     nz
        ld      a,(0xe467)                              ;commentReference(0xec64, "attrib_color");
        jp      m_e9ed
function_more_0c9:
        ld      hl,#0xe467                              ;commentReference(0xec6a, "attrib_color");
        ld      a,(0xe466)                              ;commentReference(0xec6d, "nix");
        cp      #0x30                                   ;commentReference(0xec70, "'0'|STATUS30|CEN_DATA");
        ret     c
        cp      #0x34                                   ;commentReference(0xec73, "'4'");
        ret     nc
        rrc     a
        rrc     a
        and     #0xc0                                   ;commentReference(0xec7a, "kbd_table_lookup_size|kbd_table_de_size|kbd_table_us_size|kbd_table_fr_size|kbd_table_uk_size|kbd_table_it_size|kbd_table_es_size");
        ld      b,a
        ld      a,(hl)
        and     #0x3f                                   ;commentReference(0xec7e, "'?'");
        or      b
        ld      (hl),a
        ret
m_ec83:
        ld      a,(0xe466)                              ;commentReference(0xec83, "nix");
        sub     #0x30                                   ;commentReference(0xec86, "'0'|STATUS30|CEN_DATA");
        ret     c
        cp      #0x08                                   ;commentReference(0xec89, "id_basic|FDC_CMD_SENSE_INTERRUPT_STATE|(fdc_cmd_read_boot_size)-1");
        ccf
        ret
set_cursor_on:
        ld      b,#0x40                                 ;commentReference(0xec8d, "'@'");
        jr      m_ec93
set_cursor_off:
        ld      b,#0x20                                 ;commentReference(0xec91, "' '|CFG20|STATUS_KBD");
m_ec93:
        ld      a,(0xe470)                              ;commentReference(0xec93, "cursor_start");
        and     #0x1f                                   ;commentReference(0xec96, "VK_DOWN|(CFG20|STATUS_KBD)-1");
        or      b
        ld      (0xe470),a                              ;commentReference(0xec99, "cursor_start");
        ld      b,#0x0a                                 ;commentReference(0xec9c, "");
        ld      c,#0x50                                 ;commentReference(0xec9e, "'P'|CRT_REG|(CRT_DATA)-1");
        out     (c),b
        inc     c
        out     (c),a
        ret
get_cursor_pos:
        ld      a,#0x01                                 ;commentReference(0xeca6, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (0xe4cb),a                              ;commentReference(0xeca8, "nix");
        ld      c,#0x50                                 ;commentReference(0xecab, "'P'|CRT_REG|(CRT_DATA)-1");
        ld      a,#0x0e                                 ;commentReference(0xecad, "str_memory_size|str_completed_size|str_print_off_size|REG_14_CURSOR_H|(REG_14_CURSOR_L)-1");
        out     (c),a
        inc     c
        in      h,(c)
        inc     a
        dec     c
        out     (c),a
        inc     c
        in      l,(c)
        ld      a,(0xe462)                              ;commentReference(0xecbb, "column_count");
        ld      e,a
        ld      d,#0x00                                 ;commentReference(0xecbf, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        ld      c,#0x00                                 ;commentReference(0xecc1, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
m_ecc3:
        or      a
        sbc     hl,de
        jr      c,m_eccb
        inc     c
        jr      m_ecc3
m_eccb:
        add     hl,de
        ld      h,c
        ld      (0xe4cc),hl                             ;commentReference(0xeccd, "nix");
        ret
alternate_keyboard_table:
        ld      hl,#0xe4dd                              ;commentReference(0xecd1, "kbd_table_lookup");
        ld      c,#0xc0                                 ;commentReference(0xecd4, "kbd_table_lookup_size|kbd_table_de_size|kbd_table_us_size|kbd_table_fr_size|kbd_table_uk_size|kbd_table_it_size|kbd_table_es_size");
m_ecd6:
        ld      a,(de)
        ld      b,a
        ld      a,(hl)
        ld      (de),a
        ld      (hl),b
        inc     de
        inc     hl
        dec     c
        jr      nz,m_ecd6
        ret
function_more_0c0:
        ld      a,(0xe466)                              ;commentReference(0xece1, "nix");
        ld      (0xe46a),a                              ;commentReference(0xece4, "nix");
        bit     7,a                                     ;commentReference(0xece7, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        ret     nz
        jp      chr_clear_screen
function_more_0c13:
        ld      a,c
        ld      (0xe48c),a                              ;commentReference(0xecee, "nix");
m_ecf1:
        ld      a,(0xe466)                              ;commentReference(0xecf1, "nix");
        cp      #0x1b                                   ;commentReference(0xecf4, "VK_ESC|(MASK_COUNTRY_SELECT|VK_RIGHT)-1");
        jr      z,m_ed07
        cp      #0x60                                   ;commentReference(0xecf8, "'`'|kbd_table_int_size|kbd_table_int_sh_size|DMA");
        ret     nc
        call    m_e828
        jp      c,m_e81e
        ld      (0xe466),a                              ;commentReference(0xed01, "nix");
        jp      m_e8ec
m_ed07:
        ld      a,#0x32                                 ;commentReference(0xed07, "'2'");
        ld      (0xe48c),a                              ;commentReference(0xed09, "nix");
        ret
; unchecked data source
        .db     0xc9                                    ;I
function_more_0c14:
        ld      a,(0xe466)                              ;commentReference(0xed0e, "nix");
        cp      #0x32                                   ;commentReference(0xed11, "'2'");
        ret     z
        ld      a,#0xb1                                 ;commentReference(0xed14, "");
        ld      (0xe48c),a                              ;commentReference(0xed16, "nix");
        jr      m_ecf1
function_more_0c10:
        ld      a,(0xe466)                              ;commentReference(0xed1b, "nix");
        cp      #0x20                                   ;commentReference(0xed1e, "' '|CFG20|STATUS_KBD");
        jr      c,m_ed2e
        cp      #0x38                                   ;commentReference(0xed22, "'8'|rst_38");
        jr      nc,m_ed31
        sub     #0x20                                   ;commentReference(0xed26, "' '|CFG20|STATUS_KBD");
m_ed28:
        ld      (0xe496),a                              ;commentReference(0xed28, "nix");
        jp      graphic_mode_on
m_ed2e:
        xor     a
        jr      m_ed28
m_ed31:
        ld      a,#0x17                                 ;commentReference(0xed31, "(SCREEN_HEIGHT)-1");
        jr      m_ed28
function_more_0c2:
        ld      a,(0xe466)                              ;commentReference(0xed35, "nix");
        or      a
        jr      z,m_ed28
        cp      #0x19                                   ;commentReference(0xed3b, "");
        jr      nc,m_ed31
        dec     a
        jr      m_ed28
function_more_0c17:
        ld      a,(0xe466)                              ;commentReference(0xed42, "nix");
        sub     #0x20                                   ;commentReference(0xed45, "' '|CFG20|STATUS_KBD");
        jr      c,m_ed5e
m_ed49:
        push    af
        ld      a,(0xe462)                              ;commentReference(0xed4a, "column_count");
        ld      b,a
        pop     af
        cp      b
        jr      nc,m_ed61
m_ed52:
        ld      (0xe46e),a                              ;commentReference(0xed52, "cursor_column");
        ld      a,(0xe496)                              ;commentReference(0xed55, "nix");
        ld      (0xe46d),a                              ;commentReference(0xed58, "cursor_row");
        jp      crt_set_cursor
m_ed5e:
        xor     a
        jr      m_ed52
m_ed61:
        ld      a,b
        dec     a
        jr      m_ed52
function_more_0c11:
        ld      a,(0xe466)                              ;commentReference(0xed65, "nix");
        jr      m_ed49
write_character:
        push    de
        call    set_cursor_abs
        pop     de
        call    wait_flicker_free
        ld      (hl),e
m_ed73:
        ld      a,(0xe46d)                              ;commentReference(0xed73, "cursor_row");
        cp      #0x17                                   ;commentReference(0xed76, "(SCREEN_HEIGHT)-1");
        jp      nz,m_e8fa
        ld      a,(0xe462)                              ;commentReference(0xed7b, "column_count");
        dec     a
        ld      b,a
        ld      a,(0xe46e)                              ;commentReference(0xed80, "cursor_column");
        cp      b
        jp      nz,m_e8fa
        ret
read_character:
        ld      a,#0x01                                 ;commentReference(0xed88, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (0xe4cb),a                              ;commentReference(0xed8a, "nix");
        call    set_cursor_abs
        call    wait_flicker_free
        ld      a,(hl)
        ld      (0xe4cc),a                              ;commentReference(0xed94, "nix");
        jr      m_ed73
erase_rest_of_line:
        ld      c,#0x01                                 ;commentReference(0xed99, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
m_ed9b:
        ld      a,(0xe46e)                              ;commentReference(0xed9b, "cursor_column");
m_ed9e:
        push    af
        call    set_cursor_abs
        pop     af
m_eda3:
        push    af
        ld      a,(0xe462)                              ;commentReference(0xeda4, "column_count");
        dec     a
        ld      b,a
        ld      e,#' '
        pop     af
        push    af
        push    bc
        push    hl
        call    fill_cnt
        pop     hl
        ld      de,#0x0800                              ;commentReference(0xedb3, "OFFSET_COLOR");
        add     hl,de
        ld      e,(hl)
        pop     bc
        pop     af
fill_cnt:
        push    af
        push    bc
        call    wait_flicker_free_save_A
        pop     bc
        pop     af
        ld      (hl),e
        cp      b
        jr      z,m_edc9
        inc     hl
        inc     a
        jr      fill_cnt
m_edc9:
        dec     c
        ret     z
        xor     a
        inc     hl
        jr      fill_cnt
erase_line:
        ld      a,(0xe46e)                              ;commentReference(0xedcf, "cursor_column");
        ld      e,a
        ld      d,#0x00                                 ;commentReference(0xedd3, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        or      a
        sbc     hl,de
        xor     a
        ld      c,#0x01                                 ;commentReference(0xedd9, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        jr      m_ed9e
function_4a:
        ld      a,(0xe46d)                              ;commentReference(0xeddd, "cursor_row");
        ld      b,a
        ld      a,#0x18                                 ;commentReference(0xede1, "SCREEN_HEIGHT");
        sub     b
        ld      c,a
        jr      m_ed9b
function_more_0c4:
        call    m_ee11
        ret     c
m_edeb:
        inc     hl
        call    wait_flicker_free
        ld      a,(hl)
        dec     hl
        ld      (hl),a
        inc     hl
        dec     c
        jr      nz,m_edeb
m_edf6:
        call    wait_flicker_free
        ld      (hl),#' '
        ret
function_more_0c5:
        call    m_ee11
        ret     c
        ld      e,a
        ld      d,#0x00                                 ;commentReference(0xee01, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC|(ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD)-1");
        add     hl,de
m_ee04:
        dec     hl
        call    wait_flicker_free
        ld      a,(hl)
        inc     hl
        ld      (hl),a
        dec     hl
        dec     c
        jr      nz,m_ee04
        jr      m_edf6
m_ee11:
        call    set_cursor_abs
        ld      a,(0xe46e)                              ;commentReference(0xee14, "cursor_column");
        ld      c,a
        ld      a,(0xe462)                              ;commentReference(0xee18, "column_count");
        ld      b,a
        ld      a,(0xe466)                              ;commentReference(0xee1c, "nix");
        cp      b
        jr      nc,m_ee28
        sub     c
        jr      z,m_ee28
        ret     c
        ld      c,a
        ret
m_ee28:
        scf
        ret
function_more_0c1:
        call    set_cursor_abs
        ld      e,#0x20                                 ;commentReference(0xee2d, "' '|CFG20|STATUS_KBD");
        ld      a,(0xe466)                              ;commentReference(0xee2f, "nix");
m_ee32:
        or      a
        ret     z
        ld      c,a
        ld      a,(0xe462)                              ;commentReference(0xee35, "column_count");
        ld      b,a
        ld      a,(0xe46e)                              ;commentReference(0xee39, "cursor_column");
m_ee3c:
        call    wait_flicker_free
        ld      (hl),e
        inc     hl
        inc     a
        cp      b
        jr      z,m_ee4c
m_ee45:
        dec     c
        jr      nz,m_ee3c
m_ee48:
        ld      (0xe46e),a                              ;commentReference(0xee48, "cursor_column");
        ret
m_ee4c:
        ld      d,#0x18                                 ;commentReference(0xee4c, "SCREEN_HEIGHT");
        ld      a,(0xe46d)                              ;commentReference(0xee4e, "cursor_row");
        inc     a
        cp      d
        jr      z,m_ee5b
        ld      (0xe46d),a                              ;commentReference(0xee55, "cursor_row");
        xor     a
        jr      m_ee45
m_ee5b:
        ld      a,b
        dec     a
        jr      m_ee48
function_more_0c3:
        ld      a,(0xe466)                              ;commentReference(0xee5f, "nix");
        ld      (0xe4ce),a                              ;commentReference(0xee62, "nix");
        jp      graphic_mode_on
function_more_0c12:
        call    set_cursor_abs
        ld      a,(0xe466)                              ;commentReference(0xee6b, "nix");
        ld      e,a
        ld      a,(0xe4ce)                              ;commentReference(0xee6f, "nix");
        ld      c,a
        jr      m_ee32
function_more_0c6:
        call    display_inhibit
m_ee78:
        ld      hl,#cfg10_settings
        ld      a,(0xe466)                              ;commentReference(0xee7b, "nix");
        cp      #0x30                                   ;commentReference(0xee7e, "'0'|STATUS30|CEN_DATA");
        jr      z,m_ee88
        cp      #0x31                                   ;commentReference(0xee82, "'1'");
        jr      z,m_ee90
        jr      m_eec9
m_ee88:
        res     0,(hl)                                  ;commentReference(0xee88, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC");
        ld      ix,#crt_table40
        jr      m_ee96
m_ee90:
        set     0,(hl)                                  ;commentReference(0xee90, "m_0000|cold_start|HIGH_ZERO|STATUS_SLED|OFF|REG_0|_FDD_PRESENT|COUNTRY_INTERNATIONAL|CRT_RESET|_SIOC");
        ld      ix,#crt_table80
m_ee96:
        ld      a,1(ix)
        ld      (column_count),a
        ld      a,6(ix)
        ld      (0xe461),a                              ;commentReference(0xee9f, "nix");
        ld      (0xe460),a                              ;commentReference(0xeea2, "nix");
        ld      (0xe464),a                              ;commentReference(0xeea5, "nix");
        ld      (0xe465),a                              ;commentReference(0xeea8, "nix");
        ld      a,10(ix)
        ld      (cursor_start),a
        ld      b,#crt_table40_size
        ld      c,#REG_0
crt_write_reg:
        ld      a,c
        out     (CRT_REG),a
        ld      a,0(ix)
        out     (CRT_DATA),a
        inc     c
        inc     ix
        djnz    crt_write_reg
        xor     a
        ld      (0xe463),a                              ;commentReference(0xeec3, "nix");
        call    chr_clear_screen
m_eec9:
        call    m_ea1c
        jp      m_ec10
crt_table40:
        .db     0x46,0x28,0x34,0x56,0x1e,0x02,0x18,0x1b ;F(4V....
        .db     0x00,0x09,0x49,0x09,0x00,0x00,0x00,0x00 ;..I.....
; unchecked data source
        .db     0x00,0x00                               ;..
crt_table80:
        .db     0x7e,0x50,0x5f,0x5c,0x1e,0x04,0x18,0x1b ;~P_\....
        .db     0x00,0x09,0x49,0x09,0x00,0x00,0x00,0x00 ;..I.....
; unchecked data source
        .db     0x00,0x00,0xe6,0x00,0x00,0x00,0x00,0x00 ;..f.....
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xc9 ;.......I
        .db     0xeb,0x00,0x00,0xc9,0xd1,0x00,0x00,0xc9 ;k..IQ..I
        .db     0xe1,0x00,0x00,0xc9,0x23,0x00,0x00,0xc9 ;a..I#..I
        .db     0xc4,0x00,0x00,0xc9,0xd1,0x00,0x00,0xc9 ;D..IQ..I
        .db     0xd6,0x00,0x00,0xc9,0x3b,0x00,0x00      ;V..I;..
patch_table_1:
        .db     0x46                                    ;F
        .db     0x16,0xe9                               ;.i
        .db     0x40                                    ;@
        .db     0x1c,0xe9                               ;.i
        .db     0xc2                                    ;B
        .db     0x62,0xe9                               ;bi
        .db     0x00                                    ;.
patch_table_2:
        .db     0x33                                    ;3
        .db     0x16,0xe9                               ;.i
        .db     0x46                                    ;F
        .db     0x1c,0xe9                               ;.i
        .db     0xbf                                    ;?
        .db     0x62,0xe9                               ;bi
        .db     0x00                                    ;.
get_hex_digit:
        call    get_char_echoed
        cp      #'0'
        jr      c,m_ef51
        cp      #'9'+1
        jr      c,m_ef4d
        and     #MASK_CAPITALIZE
        cp      #'A'
        jr      c,m_ef51
        cp      #'F'+1
        jr      nc,m_ef51
        sub     #0x37                                   ;commentReference(0xef49, "'7'|(rst_38)-1");
m_ef4b:
        and     a
        ret
m_ef4d:
        sub     #0x30                                   ;commentReference(0xef4d, "'0'|STATUS30|CEN_DATA");
        jr      m_ef4b
m_ef51:
        scf
        ret
get_hex_number:
        push    hl
        ld      hl,#param_word+1
        xor     a
        ld      (hl),a
        dec     hl
        ld      (hl),a
m_ef5b:
        call    get_hex_digit
        jr      c,m_ef68
        rld
        inc     hl
        rld
        dec     hl
        jr      m_ef5b
m_ef68:
        pop     hl
        ret
puts:
        ld      a,(hl)
        or      a
        ret     z
        ld      c,a
        call    put_char
        inc     hl
        jr      puts
patch_os_functions:
        ld      a,#0x01                                 ;commentReference(0xef74, "ON|TOGGLE_SLED|_DISPLAY_INHIBIT|_CRT80|_GFX_AVAILABLE|COUNTRY_DE|CEN_RESET|MODIFIER_SHIFT|_CRT_VSYNC_PERIOD|(STATUS_GLED|CMT_RS232_SELECT|COUNTRY_US|CEN_STROBE|_CEN_ACKNOWLEDGE)-1");
        ld      (os_patch),a
        ld      a,(os_patch)
        or      a
        ret     z
        ld      hl,#patch_table_1
patch_rom_code:
        ld      a,(hl)
        or      a
        ret     z
        inc     hl
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        ld      (de),a
        inc     hl
        jr      patch_rom_code
restore_os_functions:
        ld      hl,#0xef2a                              ;commentReference(0xef8c, "BWS+20*SCREEN_WIDTH+10|patch_table_2");
        jr      patch_rom_code
wait_fdd_ready:
        in      a,(UPD765_STATE)
        bit     6,a                                     ;commentReference(0xef93, "ROM_PACK_EN|_CRT_NTSC|COUNTRY_ES|UPPER_MONITOR_SEL|DIO_Data_input_output");
        jr      nz,wait_fdd_ready
        ret
fdd_available:
        call    display_inhibit
        ld      hl,#cfg20_settings
        res     3,(hl)                                  ;commentReference(0xef9e, "CMT_MOTOR_START|COUNTRY_FR|MONINH|_CEN_BUSY");
        ld      a,(hl)
        out     (CFG20),a
        jp      m_f0b2
m_efa6:
        ld      hl,#cfg20_settings
        set     3,(hl)                                  ;commentReference(0xefa9, "CMT_MOTOR_START|COUNTRY_FR|MONINH|_CEN_BUSY");
        ld      a,(hl)
        out     (CFG20),a
        ld      hl,#cfg10_settings
        set     7,(hl)                                  ;commentReference(0xefb1, "ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master");
        ld      a,(hl)
        out     (CFG10),a
        ld      a,(boot_sector)
        cp      #0x16                                   ;commentReference(0xefb9, "");
        call    z,patch_os_functions
        jp      boot_sector
ENTRY:
        ld      sp,#stack_at_boot
        call    display_inhibit
        ld      hl,#cfg20_settings
        set     6,(hl)                                  ;commentReference(0xefca, "ROM_PACK_EN|_CRT_NTSC|COUNTRY_ES|UPPER_MONITOR_SEL|DIO_Data_input_output");
        ld      a,(hl)
        out     (CFG20),a
        call    m_f010
        jp      m_e000
; unchecked data source
        .db     0x74,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;t.......
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00                          ;...
boot::
        ld      de,#0xe000                              ;commentReference(0xeff0, "m_e000");
        ld      hl,#0xf000                              ;commentReference(0xeff3, "BWS+25*SCREEN_WIDTH+24|BWS|stack_at_boot");
        ld      bc,#0x0ffe                              ;commentReference(0xeff6, "nix");
        ldir
        jp      ENTRY
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00                               ;..
m_f010:
        call    init_pic
        call    init_serial
        call    patch_printer_ptr
        call    init_kbd_table
        call    init_crt_param
        ret
patch_printer_ptr:
        in      a,(STATUS10)
        bit     5,a                                     ;commentReference(0xf022, "fdc_cmd_init_size|_PRT_SERIAL|COUNTRY_IT|SLED");
        ret     z
        ld      hl,(dev_serial_write_byte+1)
        ld      (dev_printer_write_byte+1),hl
        ret
init_kbd_table:
        in      a,(STATUS10)
        and     #MASK_COUNTRY_SELECT
        ret     z
        rra
        rra
        and     #MASK_COUNTRY_BITS
        cp      #COUNTRY_DE
        call    z,set_german_ascii_range
        cp      #COUNTRY_US
        call    z,m_f142
        cp      #COUNTRY_FR
        call    z,m_f145
        cp      #COUNTRY_UK
        call    z,m_f148
        cp      #COUNTRY_IT
        call    z,m_f14b
        cp      #COUNTRY_ES
        call    z,m_f14e
        cp      #COUNTRY_07
        call    z,m_f151
        ld      de,#kbd_table_de_size
        ld      hl,#kbd_table_int
get_kbd_table_address:
        dec     a
        jr      z,copy_kbd_table
        add     hl,de
        jr      get_kbd_table_address
copy_kbd_table:
        ld      de,#kbd_table_lookup
        ld      bc,#kbd_table_de_size
        ldir
        ret
init_crt_param:
        in      a,(STATUS10)
        bit     6,a                                     ;commentReference(0xf06f, "ROM_PACK_EN|_CRT_NTSC|COUNTRY_ES|UPPER_MONITOR_SEL|DIO_Data_input_output");
        ret     z
        ld      hl,#crt_table_ntsc
        ld      de,#crt_table40
        ld      bc,#crt_table_ntsc_size
        ldir
        ret
init_pic:
        ld      a,#0x16                                 ;commentReference(0xf07e, "");
        out     (PIC_ICW1),a
        ld      a,#0xef                                 ;commentReference(0xf082, "(FDC_UNIT|UPD765_STATE)-1");
        out     (PIC_ICW2),a
        ld      a,#0xff                                 ;commentReference(0xf086, "");
        out     (0x71),a                                ;commentReference(0xf088, "'q'|PIC_ICW2|PIC_OCW1");
        ret
fdc_cmd_init:
        .db     0x03,0xcf,0x1c,0x07,0x00                ;.O...
fdc_cmd_read_boot:
        .db     0x46,0x00,0x00,0x00,0x01,0x01,0x10,0x36 ;F......6
        .db     0xff                                    ;.
fdc_write_byte_ix:
        ld      a,0(ix)
        inc     ix
fdc_write_byte:
        push    af
m_f09f:
        in      a,(UPD765_MAIN_STATUS)
        bit     7,a                                     ;RQM_Request_for_master
        jr      z,m_f09f
        pop     af
        out     (UPD765_DATA),a
        ret
fdc_read_byte:
        in      a,(UPD765_MAIN_STATUS)
        add     a,#0x40                                 ;commentReference(0xf0ab, "'@'");
        jr      nc,fdc_read_byte
        in      a,(UPD765_DATA)
        ret
m_f0b2:
        xor     a
        out     (FDC_UNIT),a
        ld      de,#boot_sector
        ld      a,e
        out     (0x64),a                                ;commentReference(0xf0b9, "'d'");
        ld      a,d
        out     (0x64),a                                ;commentReference(0xf0bc, "'d'");
        ld      a,#0xff                                 ;commentReference(0xf0be, "");
        out     (FDC_UNIT),a
        out     (FDC_UNIT),a
        out     (0x65),a                                ;commentReference(0xf0c4, "'e'");
        ld      a,#0x40                                 ;commentReference(0xf0c6, "'@'");
        out     (0x65),a                                ;commentReference(0xf0c8, "'e'");
        ld      hl,#0x9c40                              ;commentReference(0xf0ca, "nix");
        call    delay
        ld      hl,#0x9c40                              ;commentReference(0xf0d0, "nix");
        call    delay
        ld      c,#fdc_cmd_init_size
        ld      ix,#fdc_cmd_init
fdw_write_next_byte:
        call    fdc_write_byte_ix
        dec     c
        jr      nz,fdw_write_next_byte
        call    dev_fdd_wait_ready
m_f0e5:
        ld      a,#FDC_CMD_SENSE_INTERRUPT_STATE
        call    fdc_write_byte
        call    fdc_read_byte
        cp      #0x80                                   ;commentReference(0xf0ed, "");
        jr      z,m_f0e5
        call    fdc_read_byte
        ld      a,#0x44                                 ;commentReference(0xf0f4, "'D'");
        out     (DMA_MODE_SET),a
        ld      c,#0x09                                 ;commentReference(0xf0f8, "fdc_cmd_read_boot_size");
m_f0fa:
        call    fdc_write_byte_ix
        dec     c
        jr      nz,m_f0fa
        call    dev_fdd_wait_ready
        call    fdc_read_byte
        and     #0xc0                                   ;commentReference(0xf106, "kbd_table_lookup_size|kbd_table_de_size|kbd_table_us_size|kbd_table_fr_size|kbd_table_uk_size|kbd_table_it_size|kbd_table_es_size");
        jr      nz,m_f0b2
        ld      c,#0x06                                 ;commentReference(0xf10a, "ROM_PACK_EN|_CRT_NTSC|COUNTRY_ES|UPPER_MONITOR_SEL|DIO_Data_input_output|(ROM_ACCESS_EN|_CRT_DISPLAY|MASK_COUNTRY_BITS|COUNTRY_07|KBD_BREAK|RQM_Request_for_master)-1");
m_f10c:
        call    fdc_read_byte
        dec     c
        jr      nz,m_f10c
        jp      m_efa6
m_f115:
        ld      hl,#0xfd64                              ;commentReference(0xf115, "BWS+111*SCREEN_WIDTH+12|nix");
        ld      de,#0xe525                              ;commentReference(0xf118, "nix");
        ld      bc,#0x0018                              ;commentReference(0xf11b, "SCREEN_HEIGHT");
        ldir
        ld      de,#0xe585                              ;commentReference(0xf120, "nix");
        ld      bc,#0x0018                              ;commentReference(0xf123, "SCREEN_HEIGHT");
        ldir
        ld      hl,#0xfd94                              ;commentReference(0xf128, "BWS+112*SCREEN_WIDTH+20|nix");
        ld      de,#0xe867                              ;commentReference(0xf12b, "asc_12");
        ld      c,#0x08                                 ;commentReference(0xf12e, "id_basic|FDC_CMD_SENSE_INTERRUPT_STATE|(fdc_cmd_read_boot_size)-1");
m_f130:
        ld      a,(hl)
        ld      (de),a
        inc     hl
        inc     de
        inc     de
        inc     de
        dec     c
        jr      nz,m_f130
        ret
set_german_ascii_range:
        push    af
        ld      a,#GERMAN_MAX_ASCII_CODE
        ld      (opcode_compare+1),a
        pop     af
        ret
m_f142:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
m_f145:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
m_f148:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
m_f14b:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
m_f14e:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
m_f151:
        ret
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00           ;......
kbd_table_int:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
        .db     0x78,0x7a,0x79,0xff,0xff,0xff,0xff,0xff ;xzy.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x7e,0x27,0x7d,0x2b,0x23,0x7b ;89~'}+#{
        .db     0xff,0xff,0x20,0x3c,0x2c,0x2e,0x2d,0x7c ;.. <,.-|
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
kbd_table_int_sh:
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
        .db     0x58,0x5a,0x59,0xff,0xff,0xff,0xff,0xff ;XZY.....
        .db     0x3d,0x21,0x22,0x40,0x24,0x25,0x26,0x2f ;=!"@$%&/
        .db     0x28,0x29,0x3f,0x60,0x5d,0x2a,0x5e,0x5b ;()?`]*^[
        .db     0xff,0xff,0x20,0x3e,0x3b,0x3a,0x5f,0x5c ;.. >;:_\
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_table_de:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
        .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
        .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
        .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
        .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
        .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
        .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_table_us:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x71,0x62,0x63,0x64,0x65,0x66,0x67 ;.qbcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x2c,0x6e,0x6f ;hijkl,no
        .db     0x70,0x61,0x72,0x73,0x74,0x75,0x76,0x7a ;parstuvz
        .db     0x78,0x79,0x77,0xff,0xff,0xff,0xff,0xff ;xyw.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x24,0x21,0x5e,0x26,0x23,0x7c ;89$!^&#|
        .db     0xff,0xff,0x20,0x3c,0x2e,0x2f,0x3d,0x6d ;.. <./=m
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x51,0x42,0x43,0x44,0x45,0x46,0x47 ;.QBCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x3b,0x4e,0x4f ;HIJKL;NO
        .db     0x50,0x41,0x52,0x53,0x54,0x55,0x56,0x5a ;PARSTUVZ
        .db     0x58,0x59,0x57,0xff,0xff,0xff,0xff,0xff ;XYW.....
        .db     0x40,0x2a,0x7b,0x22,0x27,0x28,0x2d,0x7d ;@*{"'(-}
        .db     0x5f,0x5c,0x29,0x5d,0x7e,0x60,0x2b,0x25 ;_\)]~`+%
        .db     0xff,0xff,0x20,0x3e,0x3a,0x3f,0x5b,0x4d ;.. >:?[M
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_table_fr:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
        .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
        .db     0xff,0xff,0x20,0x3c,0x2c,0x2e,0x2f,0x3b ;.. <,./;
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
        .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
        .db     0x3d,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;=!"#$%&'
        .db     0x28,0x29,0x5f,0x7e,0x60,0x7b,0x7d,0x2a ;()_~`{}*
        .db     0xff,0xff,0x20,0x3e,0x5c,0x7c,0x3f,0x2b ;.. >\|?+
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_table_uk:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x2c,0x6e,0x6f ;hijkl,no
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x7a ;pqrstuvz
        .db     0x78,0x79,0x77,0xff,0xff,0xff,0xff,0xff ;xyw.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x24,0x5e,0x7e,0x26,0x23,0x7c ;89$^~&#|
        .db     0xff,0xff,0x20,0x3c,0x2e,0x2f,0x5b,0x6d ;.. <./[m
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x3b,0x4e,0x4f ;HIJKL;NO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x5a ;PQRSTUVZ
        .db     0x58,0x59,0x57,0xff,0xff,0xff,0xff,0xff ;XYW.....
        .db     0x40,0x2a,0x7b,0x22,0x27,0x28,0x2d,0x7d ;@*{"'(-}
        .db     0x5f,0x5c,0x29,0x5d,0x3d,0x60,0x2b,0x25 ;_\)]=`+%
        .db     0xff,0xff,0x20,0x3e,0x3a,0x3f,0x21,0x4d ;.. >:?!M
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_table_it:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
        .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
        .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
        .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
        .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
        .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
        .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
kbd_table_es:
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2e,0xff,0x2b,0x2d,0x3d,0xff ;89..+-=.
        .db     0xff,0x61,0x62,0x63,0x64,0x65,0x66,0x67 ;.abcdefg
        .db     0x68,0x69,0x6a,0x6b,0x6c,0x6d,0x6e,0x6f ;hijklmno
        .db     0x70,0x71,0x72,0x73,0x74,0x75,0x76,0x77 ;pqrstuvw
        .db     0x78,0x79,0x7a,0xff,0xff,0xff,0xff,0xff ;xyz.....
        .db     0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37 ;01234567
        .db     0x38,0x39,0x2d,0x5e,0x40,0x5b,0x5d,0x3a ;89-^@[]:
        .db     0xff,0xff,0x20,0x5c,0x2c,0x2e,0x2f,0x3b ;.. \,./;
        .db     0x1f,0x1c,0x1d,0x1e,0x9b,0xff,0x7f,0x1b ;........
        .db     0xff,0x7f,0xff,0x09,0x0d,0xdf,0x0b,0x03 ;....._..
        .db     0xff,0xff,0x86,0x85,0x84,0x83,0x82,0x81 ;........
        .db     0xe4,0xe2,0xeb,0xe3,0xe8,0xe6,0xe9,0xe0 ;dbkchfi`
        .db     0xea,0xe1,0xe5,0xff,0x2a,0x2f,0xe7,0xff ;jae.*/g.
        .db     0xff,0x41,0x42,0x43,0x44,0x45,0x46,0x47 ;.ABCDEFG
        .db     0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f ;HIJKLMNO
        .db     0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57 ;PQRSTUVW
        .db     0x58,0x59,0x5a,0xff,0xff,0xff,0xff,0xff ;XYZ.....
        .db     0x5f,0x21,0x22,0x23,0x24,0x25,0x26,0x27 ;_!"#$%&'
        .db     0x28,0x29,0x3d,0x7e,0x60,0x7b,0x7d,0x2a ;()=~`{}*
        .db     0xff,0xff,0x20,0x7c,0x3c,0x3e,0x3f,0x2b ;.. |<>?+
        .db     0xec,0xef,0xee,0xed,0x9b,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x12,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8b,0x8a,0x89,0x88,0x87 ;........
crt_table_ntsc:
        .db     0x38,0x28,0x2e,0x55,0x20,0x06,0x18,0x1c ;8(.U ...
        .db     0x00,0x07,0x47,0x07,0x00,0x00,0x00,0x00 ;..G.....
        .db     0x00,0x00,0x7e,0x50,0x5f,0x5c,0x1d,0x01 ;..~P_\..
        .db     0x18,0x1a,0x00,0x08,0x48,0x08,0x00,0x00 ;....H...
        .db     0x00,0x00,0x00,0x00                     ;....
; unchecked data source
        .db     0x8b,0x82,0x08,0x89,0x84,0xff,0x7f,0x1b ;........
        .db     0xff,0x96,0xff,0x09,0x0d,0xdf,0x8f,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8a,0x88,0x87,0x86,0x85 ;........
        .db     0xec,0xef,0xee,0xed,0x84,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x95,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x80,0x94,0x93,0x92,0x91,0x90 ;........
        .db     0x95,0x82,0x08,0x89,0x8b,0x96,0x1c,0x12 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00                     ;....
; end of source

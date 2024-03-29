; source : 0_b4-6_ic1038.bin
; created: 2022-09-06 21:08:16
; by     : jayne
; md5    : 1f8bedb609bba5b511182a4509fa345b
; 
; constant
; 
HIGH_ZERO                        = 0x00
NO                               = 0x00
YES                              = 0xff
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
_CRT80                           = 0x00
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
UART_DATA                        = 0x40
UART_CMD                         = 0x41
UART_STATUS                      = 0x41
_TxRDY                           = 0x00
_RxRDY                           = 0x01
_DSR                             = 0x07
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
VK_NL                            = 0x0a
VK_ENTER                         = 0x0d
VK_ESC                           = 0x1b
VK_LEFT                          = 0x1d
VK_RIGHT                         = 0x1c
VK_UP                            = 0x1e
VK_DOWN                          = 0x1f
VK_DEL                           = 0x7f
GERMAN_MAX_ASCII_CODE            = 0x7e
MASK_CAPITALIZE                  = 0x5f
ATTR0_NONE                       = 0x30
ATTR3_BLINK_INVERSE              = 0x33
VRAM_ATTR_MASK                   = 0xc0
VRAM_ATTR_INVERS                 = 0x80
_VRAM_ATTR_INVERS                = 0x07
_DRV_CTRL_INTERNAL               = 0x02
_DRV_CTRL_84                     = 0x03
_DRV_FG_BG_SAME_COLOR            = 0x06
_DRV_NO_CLS                      = 0x07
COLOR0_BLACK                     = 0x30
COLOR7_WHITE                     = 0x37
COLOR0_BLACK                     = 0x30
COLOR_COUNT                      = 0x08
ATTR_WIDTH40                     = 0x30
ATTR_WIDTH80                     = 0x31

boot_sector                      = 0xc200
cold_start                       = 0x0000
id_basic                         = 0x0008
rst_38                           = 0x0038
basic_start                      = 0x003b
BWS                              = 0xf000
stack_at_boot                    = 0xf000
bios_rom                         = 0xf000
SIZE4K                           = 0x1000
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
init_bios:
        ld      hl,#cfg20_settings
        set     3,(hl)                                  ;MONINH=1
        ld      a,(hl)
        out     (CFG20),a
        call    kbd_buffer_clear_beep
        ld      hl,#cfg10_settings
        set     6,(hl)                                  ;ROM_PACK_EN=1
        ld      a,(hl)
        out     (CFG10),a
        ld      a,(ROM_PACK_16K)
        cp      a,#ID_JMP
        jp      z,ROM_PACK_16K
        ld      a,(ROM_PACK_8K)
        cp      a,#ID_JMP
        jp      z,ROM_PACK_8K
        ld      hl,#cfg10_settings
        res     6,(hl)                                  ;ROM_PACK_EN=0
        ld      a,(hl)
        out     (CFG10),a
        in      a,(STATUS10)
        bit     0,a                                     ;_FDD_PRESENT==0
        jp      nz,fdd_available
        ld      a,(id_basic)
        cp      a,#ID_IS_BASIC
        jr      z,go_basic
        ld      hl,#cfg10_settings
        set     7,(hl)                                  ;ROM_ACCESS_EN=1
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
        cp      a,#VK_ENTER
        jr      z,m_e07f
        call    print_new_line
        ld      hl,#str_memory
        jr      m_e06d
m_e07f:
        ld      hl,(param_word)
        ld      a,h
        or      a,l
        jr      nz,m_e089
        ld      hl,#MAX_ADDRESS
m_e089:
        ld      (max_address),hl
monitor_cmd_loop:
        ld      hl,#monitor_cmd_loop
        push    hl
        call    print_new_line
        ld      c,#'*'
        call    put_char
        call    get_char_echoed
        cp      a,#VK_ESC
        ret     z
        and     a,#MASK_CAPITALIZE
        cp      a,#'E'
        jp      z,return_to_basic
        cp      a,#'P'
        jp      z,enable_protocol_printer
        cp      a,#'M'
        jp      z,monitor_cmd_mem_move
        cp      a,#'D'
        jp      z,m_e178
        cp      a,#'G'
        jp      z,m_e1c9
        cp      a,#'R'
        jp      z,m_e21d
        cp      a,#'C'
        ret     nz
        call    print_space
        call    get_hex_number
        cp      a,#VK_ENTER
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
        and     a,#0x07
        jr      nz,m_e0d0
        jr      m_e0cd
m_e0e3:
        cp      a,#0x20
        jr      nz,m_e0ec
        call    print_space
        jr      m_e0db
m_e0ec:
        cp      a,#0x2d
        ret     nz
        dec     hl
        jr      m_e0cd
monitor_cmd_mem_move:
        call    print_space
        call    get_hex_number
        cp      a,#','
        ret     nz
        ld      hl,(param_word)
        ld      (param_1),hl
        call    get_hex_number
        cp      a,#','
        ret     nz
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(param_word)
        ld      (param_2),hl
        or      a,a
        sbc     hl,de
        ret     c
        inc     hl
        ld      (param_3),hl
        call    get_hex_number
        cp      a,#VK_ENTER
        ret     nz
        ld      hl,(param_3)
        dec     hl
        ex      de,hl
        ld      hl,(param_word)
        or      a,a
        adc     hl,de
        jr      c,m_e16c
        ex      de,hl
        ld      hl,(max_address)
        sbc     hl,de
        jr      c,m_e16c
        push    de
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(param_word)
        or      a,a
        sbc     hl,de
        jr      c,m_e15e
        pop     de
        ld      a,h
        or      a,l
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
        or      a,c
        jr      nz,m_e14e
m_e157:
        ld      hl,#str_completed
        call    puts
        ret
m_e15e:
        ld      hl,(param_3)
        push    hl
        pop     bc
        ld      hl,(0xe49c)
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
        cp      a,#0x2c
        ret     nz
        ld      hl,(0xe49c)
        ld      (param_1),hl
        call    get_hex_number
        cp      a,#0x0d
        ret     nz
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(0xe49c)
        or      a,a
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
        ld      de,#0xe4a6
m_e1a9:
        call    m_e38d
        ld      a,(hl)
        ld      (de),a
        dec     bc
        ld      a,b
        or      a,c
        inc     hl
        inc     de
        jp      z,m_e282
        ld      a,(column_count)
        xor     a,#0x0f
        and     a,#0x0f
        push    bc
        ld      b,a
        ld      a,l
        and     a,b
        pop     bc
        jr      nz,m_e1a9
        call    m_e282
        jr      m_e19c
m_e1c9:
        call    print_space
        call    get_hex_number
        cp      a,#VK_ENTER
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
        ld      (0xe4bd),hl
        pop     hl
        ld      (0xe4b7),hl
        push    af
        pop     hl
        ld      (0xe4bf),hl
        ld      (0xe4b9),bc
        ld      (0xe4bb),de
        ld      a,i
        ld      (0xe4c1),a
        ld      (0xe4c2),ix
        ld      (0xe4c4),iy
        ld      hl,#str_break_at
        call    puts
        ld      hl,(0xe4b7)
        call    m_e393
        ld      sp,#stack_at_boot
        jp      monitor_cmd_loop
m_e21d:
        ld      hl,#str_reg
        call    puts
        ld      hl,(0xe4b7)
        call    m_e393
        ld      hl,#0xe4b9
        ld      c,#0x04
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
        ld      hl,(0xe4c2)
        call    m_e393
        call    print_space
        ld      hl,(0xe4c4)
        call    m_e393
        ret
enable_protocol_printer:
        ld      a,(printer_protocol_flag)
        or      a,a
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
        cp      a,#ID_IS_BASIC
        jr      nz,just_go_back
        call    patch_os_functions
        ld      a,#0x0c
        rst     0x18
just_go_back:
        ld      sp,(save_stack)
        ret
m_e282:
        push    hl
        push    bc
        ld      a,(column_count)
        and     a,#0x18
        ld      c,a
        ld      b,#0x00
        ld      hl,#0xe4a6
        or      a,a
        adc     hl,bc
        or      a,a
        sbc     hl,de
        ld      a,l
        or      a,a
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
        ld      a,(column_count)
        and     a,#0x18
        ld      b,a
        ld      hl,#0xe4a6
m_e2b6:
        push    hl
        push    bc
        ld      a,(hl)
        cp      a,#' '
        jr      c,non_char_printable
        cp      a,#VK_DEL
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
        ld      hl,#0xe4a6
        ld      b,#0x10
m_e2d5:
        ld      (hl),#0x00
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
        cp      a,#','
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
        and     a,#0x0f
        cp      a,#0x0a
        jr      nc,m_e3bf
        add     a,#0x30
m_e3ba:
        ld      c,a
m_e3bb:
        call    put_char
        ret
m_e3bf:
        add     a,#0x37
        jr      m_e3ba
print_new_line:
        push    bc
        ld      c,#VK_ENTER
        call    put_char
        ld      c,#VK_NL
        jr      put_char_with_pop
print_space:
        push    bc
        ld      c,#' '
put_char_with_pop:
        call    put_char
        pop     bc
        ret
put_char:
        call    putch_internal
        ld      a,(printer_protocol_flag)
        or      a,a
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
        call    get_char
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
        jp      kbd_status_internal
dev_kbd_inkey:
        jp      get_char
CRTOUT:
        jp      putch_internal
        jp      kbd_status_internal
        jp      get_char
        jp      putch_internal
        jp      kbd_status_internal
        jp      get_char
        jp      putch_internal
        jp      get_char
        jp      com_read_byte
        jp      com_read_byte
        jp      putch_internal
dev_serial_tx_ready:
        jp      com_tx_ready
dev_serial_write_byte:
        jp      com_write_byte
dev_printer_write_byte:
        jp      lpt_write_byte
unreferenced_09:
        jp      lpt_write_byte
unreferenced_10:
        ld      a,#0xff
        ret
unreferenced_11:
        nop
        xor     a,a
        ret
m_e445:
        jp      lpt_busy
        nop
        xor     a,a
        ret
        jp      kbd_buffer_clear_beep
        jp      kbd_buffer_clear
        jp      delay
        jp      buzzer_off
        jp      buzzer_on
        jp      m_e1ea
        jp      m_f115
vertical_display0:
        .db     0x18                                    ;.
vertical_display1:
        .db     0x18                                    ;.
column_count:
        .db     0x50                                    ;P
; unchecked data source
        .db     0x00                                    ;.
vertical_display2:
        .db     0x18                                    ;.
vertical_display3:
        .db     0x18                                    ;.
printed_char:
        .db     0x30                                    ;0
attrib_color:
        .db     0x07                                    ;.
cfg10_settings:
        .db     0x00                                    ;.
cfg20_settings:
        .db     0x00                                    ;.
cfg_esc_screen_drv:
        .db     0x05                                    ;.
; unchecked data source
        .db     0x00,0xd5                               ;.U
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
rows_buffer:
        .db     0x00,0x00                               ;..
; unchecked data source
        .db     0x00,0x00                               ;..
key_code:
        .db     0x00                                    ;.
color_attribute:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00,0x00                               ;..
param_word:
        .db     0x00,0x00                               ;..
param_1:
        .db     0x00,0x00                               ;..
param_2:
        .db     0x00,0x00                               ;..
param_3:
        .db     0x00,0x00                               ;..
max_address:
        .db     0x00,0x00                               ;..
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
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
kbd_status_internal:
        push    hl
        push    de
        push    bc
        ld      a,(0xe48a)
        cp      a,#0x80
        jr      z,m_e5e1
        cp      a,#0x88
        jr      z,m_e5e1
        ld      hl,#kbd_matrix_buffer2
        call    kbd_copy_state_hl
        ld      hl,#kbd_matrix_buffer2
        ld      b,#KBD_COLUMNS
loop_find_first_key:
        ld      a,(hl)
        or      a,a
        jr      nz,kbd_key_found
        dec     b
        jp      z,m_e647
        inc     hl
        jr      loop_find_first_key
kbd_key_found:
        call    m_e5e7
        ld      a,(0xe48a)
        cp      a,#0x80
        ld      a,#0x00
        jr      nz,m_e5e3
m_e5e1:
        ld      a,#0xff
m_e5e3:
        pop     bc
        pop     de
        pop     hl
        ret
m_e5e7:
        push    hl
        push    de
        push    bc
        ld      hl,#0x05dc
        call    delay
        ld      hl,#kbd_matrix_buffer
        call    kbd_copy_state_hl
        ld      hl,#kbd_matrix_buffer
        ld      de,#kbd_matrix_buffer2
        ld      b,#kbd_matrix_buffer_size
cmp_kbd_entry:
        ld      a,(de)
        cp      a,(hl)
        jr      nz,m_e656
        dec     b
        jr      z,scan_is_stable
        inc     hl
        inc     de
        jr      cmp_kbd_entry
scan_is_stable:
        call    m_e682
        ld      a,(0xe48a)
        cp      a,#0x80
        jr      nz,clear_kbd_modifiers
        call    m_e72c
        ld      a,(led_status)
        bit     7,a
        jr      nz,m_e64f
        ld      a,(kbd_ascii)
        cp      a,#0xff
        jr      z,m_e64f
        or      a,a
        jr      z,m_e64f
        call    modify_if_graphic_B
        ld      a,(key_code)
        cp      a,b
        jr      nz,set_kbd_debounce_cnt
        ld      a,(kbd_debounce_cnt)
        or      a,a
        jr      nz,decrement_kbd_debounce_cnt
        ld      hl,#0x0bb8
        call    delay
        jr      m_e664
; unchecked data source
        .db     0xaf,0x18,0x12                          ;/..
decrement_kbd_debounce_cnt:
        dec     a
        ld      (kbd_debounce_cnt),a
        jr      m_e656
m_e647:
        xor     a,a
        ld      (0xe4c9),a
clear_kbd_modifiers:
        xor     a,a
        ld      (kbd_modifiers),a
m_e64f:
        xor     a,a
        ld      (key_code),a
        ld      (kbd_debounce_cnt),a
m_e656:
        xor     a,a
        ld      (0xe48a),a
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
kbd_copy_state_hl:
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
        or      a,l
        jr      nz,delay
        ret
m_e682:
        ld      ix,#kbd_matrix_buffer2
        xor     a,a
        ld      c,a
        ld      e,a
        ld      (0xe48a),a
kbd_buffer_check_colum:
        ld      a,0(ix)
        or      a,a
        jr      nz,m_e69d
        ld      a,c
        add     a,#0x08
        ld      c,a
m_e696:
        cp      a,#kbd_table_int_size
        ret     z
        inc     ix
        jr      kbd_buffer_check_colum
m_e69d:
        ld      d,#0x08
        ld      h,a
m_e6a0:
        inc     c
        ld      a,h
        or      a,a
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
        cp      a,#KBD_POSITION_CTRL
        jr      z,m_e6d4
        cp      a,#KBD_POSITION_SHIFT
        jr      z,set_kbd_shift_lock
        cp      a,#KBD_POSITION_SHIFT_LOCK
        jr      z,m_e6ec
        cp      a,#KBD_POSITION_COMMAND
        jr      z,m_e6f6
        cp      a,#KBD_POSITION_GRAPH
        jr      z,m_e6ff
m_e6c3:
        ld      a,e
        or      a,a
        jr      nz,m_e6a8
        ld      e,#0x01
        ld      a,c
        ld      (kbd_position),a
        ld      a,#0x80
        ld      (0xe48a),a
        jr      m_e6a8
m_e6d4:
        ld      a,(cfg_esc_screen_drv)
        bit     2,a                                     ;_DRV_CTRL_INTERNAL==0
        jr      z,m_e6c3
        ld      a,(kbd_modifiers)
        set     2,a                                     ;STATUS_GLED=1
        jr      set_kbd_modifiers
set_kbd_shift_lock:
        ld      a,(kbd_modifiers)
        set     0,a                                     ;STATUS_SLED=1
set_kbd_modifiers:
        ld      (kbd_modifiers),a
        jr      m_e6a8
m_e6ec:
        call    m_e70f
        jr      nz,m_e6a8
        call    m_e8bf
        jr      m_e6a8
m_e6f6:
        ld      a,(cfg_esc_screen_drv)
        bit     3,a
        jr      nz,m_e6c3
        jr      m_e6a8
m_e6ff:
        call    m_e70f
        jr      nz,m_e6a8
        call    toggle_gled
        ld      a,(os_patch)
        or      a,a
        jr      z,m_e6c3
        jr      m_e6a8
m_e70f:
        ld      a,(0xe4c9)
        or      a,a
        ret     nz
        ld      a,#0x01
        ld      (0xe4c9),a
        ret
modify_if_graphic_B:
        ld      a,(kbd_modifiers)
        bit     2,a                                     ;STATUS_GLED==0
        push    hl
        ld      hl,#kbd_ascii
        jr      z,m_e729
        res     6,(hl)
        res     5,(hl)
m_e729:
        ld      b,(hl)
        pop     hl
        ret
m_e72c:
        ld      a,(kbd_modifiers)
        and     a,#MODIFIER_SHIFT
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
        bit     0,a                                     ;STATUS_SLED==0
        ret     z
        ld      a,(hl)
        cp      a,#0x61
        ret     c
opcode_compare:
        cp      a,#0x7b
        ret     nc
        and     a,#0x5f
        ld      (kbd_ascii),a
        ret
unreferenced:
        push    hl
        ld      hl,#led_status
        res     7,(hl)
        pop     hl
        jp      buzzer_off
get_char:
        push    hl
        push    de
        push    bc
m_e765:
        ld      a,(0xe48a)
        cp      a,#0x80
        jr      z,m_e77a
        cp      a,#0x88
        ld      a,#0x00
        ld      (0xe48a),a
        jr      z,m_e7a2
        call    kbd_status_internal
        jr      m_e765
m_e77a:
        xor     a,a
        ld      (0xe48a),a
        ld      a,(kbd_ascii)
        and     a,#0x7f
        cp      a,#0x20
        jr      c,m_e794
        ld      a,(os_patch)
        or      a,a
        jr      z,m_e794
        ld      a,(led_status)
        bit     2,a                                     ;STATUS_GLED==0
        jr      nz,m_e799
m_e794:
        ld      a,(kbd_ascii)
        jr      m_e7a8
m_e799:
        ld      a,#0x88
        ld      (0xe48a),a
        ld      a,#0xdf
        jr      m_e7a8
m_e7a2:
        ld      a,(kbd_ascii)
        call    m_e828
m_e7a8:
        pop     bc
        pop     de
        pop     hl
        ret
putch_internal:
        push    hl
        push    de
        push    bc
        ld      a,c
        ld      (printed_char),a
        ld      a,(0xe48c)
        or      a,a
        jr      nz,m_e823
        ld      a,(os_patch)
        or      a,a
        jr      z,m_e7ef
        ld      a,(0xe4c8)
        or      a,a
        ld      a,(printed_char)
        jr      nz,m_e7d8
        cp      a,#0xdf
        jr      z,m_e817
m_e7cc:
        and     a,#0x7f
        jr      z,m_e7df
        cp      a,#0x7f
        jr      z,m_e81e
        cp      a,#0x20
        jr      c,m_e81e
m_e7d8:
        xor     a,a
        ld      (0xe4c8),a
m_e7dc:
        call    m_e8ec
m_e7df:
        pop     bc
        pop     de
        ld      a,(0xe4cb)
        or      a,a
        jr      nz,m_e80d
m_e7e7:
        ld      a,(printed_char)
        ld      (0xe46c),a
        pop     hl
        ret
m_e7ef:
        ld      a,(printed_char)
        ld      b,a
        cp      a,#0xdf
        jr      z,m_e808
        ld      a,(0xe4c8)
        or      a,a
        ld      a,b
        jr      z,m_e7cc
        call    m_e828
        ld      (printed_char),a
        jr      c,m_e81e
        jr      m_e7dc
m_e808:
        call    m_e8d6
        jr      m_e7df
m_e80d:
        ld      hl,(0xe4cc)
        ex      de,hl
        xor     a,a
        ld      (0xe4cb),a
        jr      m_e7e7
m_e817:
        ld      a,#0x01
        ld      (0xe4c8),a
        jr      m_e7df
m_e81e:
        call    m_e83f
        jr      m_e7df
m_e823:
        call    m_ebe3
        jr      m_e7df
m_e828:
        cp      a,#' '
        ret     c
        cp      a,#0x60
        jr      c,m_e835
        cp      a,#0x80
        ret     nc
        or      a,#0x80
        ret
m_e835:
        cp      a,#0x40
        jr      c,m_e83c
        xor     a,#0xc0
        ret
m_e83c:
        xor     a,#0x20
        ret
m_e83f:
        ld      a,(0xe466)
        cp      a,#VK_ESC
        jr      nz,m_e84c
        ld      a,#0x01
        ld      (0xe48c),a
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
special_characters_end:
        .db     0x00                                    ;.
chr_line_feed:
        ld      a,(0xe46c)
        cp      a,#VK_ENTER
        ret     z
        ld      a,(cursor_column)
        or      a,#0x80
        ld      (0xe4ca),a
        jp      chr_carrige_return
chr_03:
        ret
chr_03_fill:
        .db     0x00,0x00                               ;..
chr_12:
        ret
chr_12_fill:
        .db     0x00,0x00                               ;..
chr_7f:
        ret
chr_7f_fill:
        .db     0x00,0x00                               ;..
chr_inverse_off:
        ld      hl,#attrib_color
        res     7,(hl)                                  ;_VRAM_ATTR_INVERS=0
        ret
chr_inverse_on:
        ld      hl,#attrib_color
        set     7,(hl)                                  ;_VRAM_ATTR_INVERS=1
        ret
toggle_gled:
        ld      a,(led_status)
        xor     a,#TOGGLE_GLED
set_gled:
        ld      (led_status),a
        bit     2,a                                     ;STATUS_GLED==0
        ld      hl,#cfg20_settings
        jr      z,res_gled
        set     4,(hl)                                  ;GLED=1
set_cfg20:
        ld      a,(hl)
        out     (CFG20),a
        ret
res_gled:
        res     4,(hl)                                  ;GLED=0
        jr      set_cfg20
m_e8bf:
        ld      a,(led_status)
        xor     a,#TOGGLE_SLED
        ld      (led_status),a
        bit     0,a                                     ;STATUS_SLED==0
        ld      hl,#cfg20_settings
        jr      z,res_sled
        set     5,(hl)                                  ;SLED=1
        jr      set_cfg20
res_sled:
        res     5,(hl)                                  ;SLED=0
        jr      set_cfg20
m_e8d6:
        ld      a,(0xe4c8)
        xor     a,#0x01
        ld      (0xe4c8),a
        ld      a,(led_status)
        jr      z,m_e8e8
        set     2,a                                     ;STATUS_GLED=1
tramp_set_gled:
        jp      set_gled
m_e8e8:
        res     2,a                                     ;STATUS_GLED=0
        jr      tramp_set_gled
m_e8ec:
        call    set_cursor_abs
        ld      a,(printed_char)
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
        cp      a,b
        jr      nc,crt_set_cursor
chr_carrige_return:
        ld      a,(cursor_row)
        inc     a
        ld      (cursor_row),a
        ld      b,a
        ld      a,(0xe465)
        cp      a,b
        jr      z,m_e94a
        ld      a,(0xe460)
        cp      a,b
        jr      z,m_e963
        call    c,set_cursor_home
        jr      m_e925
m_e922:
        call    erase_line
m_e925:
        ld      a,(0xe4ca)
        bit     7,a
        jr      z,m_e947
        and     a,#0x0f
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
        xor     a,a
        ld      (0xe4ca),a
        ret
m_e947:
        xor     a,a
        jr      m_e92e
m_e94a:
        ld      a,(0xe463)
        call    crt_set_cursor_at_row_start
        jr      z,m_e925
        ld      a,(0xe464)
        cp      a,#0x01
        call    nz,m_e999
        ld      a,(0xe465)
m_e95d:
        dec     a
        ld      (cursor_row),a
        jr      m_e922
m_e963:
        ld      a,(0xe465)
        call    crt_set_cursor_at_row_start
        jr      z,m_e925
        ld      a,(0xe465)
        ld      b,a
        ld      a,(0xe460)
        sub     a,b
        cp      a,#0x01
        call    nz,m_e999
        ld      a,(0xe460)
        jr      m_e95d
m_e97d:
        ex      de,hl
        ld      a,(column_count)
        ld      l,a
        ld      h,#0x00
        add     hl,de
        ld      bc,(rows_buffer)
        ldir
        ret
crt_set_cursor_at_row_start:
        ld      (cursor_row),a
        xor     a,a
        ld      (cursor_column),a
        ld      a,(cfg_esc_screen_drv)
        and     a,#0x01
        ret
m_e999:
        dec     a
        ld      hl,#0
        ld      d,#HIGH_ZERO
        call    calc_column_offset
        ld      (rows_buffer),hl
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
        or      a,a
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
        ld      a,#0x07
        ld      (attrib_color),a
m_e9ed:
        ld      (BWS+OFFSET_COLOR),a
        ld      hl,#BWS
        ld      c,#0x19
        call    wait_vsync
        xor     a,a
        call    m_eda3
        call    is_vsync
set_cursor_home:
        xor     a,a
        ld      (cursor_row),a
        ld      (cursor_column),a
        jp      crt_set_cursor
wait_vsync:
        in      a,(STATUS30)
        bit     1,a                                     ;_CRT_VSYNC_PERIOD==0
        jr      z,wait_vsync
display_inhibit:
        ld      a,(cfg10_settings)
        set     1,a                                     ;_DISPLAY_INHIBIT=1
        jr      display_status_set
is_vsync:
        in      a,(STATUS30)
        bit     1,a                                     ;_CRT_VSYNC_PERIOD==0
        jr      z,is_vsync
m_ea1c:
        ld      a,(cfg10_settings)
        res     1,a                                     ;_DISPLAY_INHIBIT=0
display_status_set:
        ld      (cfg10_settings),a
        out     (CFG10),a
        ret
wait_flicker_free_save_A:
        ld      b,a
wait_flicker_free:
        in      a,(STATUS10)
        bit     7,a                                     ;_CRT_DISPLAY==0
        jr      nz,wait_flicker_free
m_ea2e:
        in      a,(STATUS10)
        bit     7,a                                     ;_CRT_DISPLAY==0
        jr      z,m_ea2e
        ret
chr_cursor_left:
        ld      a,(cursor_column)
        dec     a
        cp      a,#-1
        jr      nz,m_ea6f
        ld      a,(column_count)
        dec     a
        ld      (cursor_column),a
chr_cursor_up:
        ld      a,(cursor_row)
        dec     a
        cp      a,#-1
        jr      nz,cursor_row_adjusted
        ld      a,#SCREEN_HEIGHT-1
        jr      cursor_row_adjusted
chr_cursor_right:
        ld      a,(column_count)
        ld      b,a
        ld      a,(cursor_column)
        inc     a
        cp      a,b
        jr      c,m_ea6f
        xor     a,a
        ld      (cursor_column),a
chr_cursor_down:
        ld      b,#SCREEN_HEIGHT
        ld      a,(cursor_row)
        inc     a
        cp      a,b
        jr      c,cursor_row_adjusted
        xor     a,a
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
        set     4,(hl)                                  ;_BUZZER_ON=1
        ld      a,(hl)
        out     (CFG10),a
        push    hl
        ld      hl,(beep_delay)
        call    delay
        pop     hl
res_buzzer:
        res     4,(hl)                                  ;_BUZZER_ON=0
out10_hl:
        ld      a,(hl)
        out     (CFG10),a
        pop     hl
        ret
buzzer_on:
        push    hl
        ld      hl,#cfg10_settings
        set     4,(hl)                                  ;_BUZZER_ON=1
        jr      out10_hl
buzzer_off:
        push    hl
        ld      hl,#cfg10_settings
        jr      res_buzzer
chk_break:
        in      a,(STATUS_KBD+10)
        or      a,a
        bit     7,a                                     ;KBD_BREAK==0
        ret     z
        ld      a,(os_patch)
        or      a,a
        jp      z,cold_start
        ld      e,#0x18
        scf
        ret
lpt_busy:
        call    chk_break
        in      a,(STATUS30)
        bit     3,a                                     ;_CEN_BUSY==0
        ld      a,#0x00
        ret     z
        ld      a,#0xff
        ret
lpt_write_byte:
        call    m_e445
        ret     c
        jr      nz,lpt_write_byte
        ld      a,c
        out     (CEN_DATA),a
        ld      a,(cfg20_settings)
        set     2,a                                     ;CEN_STROBE=1
        out     (CFG20),a
        res     2,a                                     ;CEN_STROBE=0
        out     (CFG20),a
m_ead6:
        in      a,(STATUS30)
        bit     2,a                                     ;_CEN_ACKNOWLEDGE==0
        jr      nz,m_eadd
        ret
m_eadd:
        call    chk_break
        ret     c
        jr      m_ead6
com_tx_ready:
        in      a,(UART_STATUS)
        call    chk_tx_rdy
        jr      z,com_tx_ready
        jr      uart_send_tx
com_write_byte:
        call    chk_ready
        ret     c
        jr      z,com_write_byte
uart_send_tx:
        ld      a,c
        out     (UART_DATA),a
        ret
com_read_byte:
        call    com_rx_ready
        ret     c
        jr      z,com_read_byte
        in      a,(UART_DATA)
        ret
chk_ready:
        call    chk_break
        in      a,(UART_STATUS)
        bit     7,a                                     ;_DSR==0
        jr      z,m_eb0d
chk_tx_rdy:
        bit     0,a                                     ;_TxRDY==0
        ld      a,#0xff
        ret     nz
m_eb0d:
        ld      a,#0x00
        ret
com_rx_ready:
        call    chk_break
        in      a,(UART_STATUS)
        bit     1,a                                     ;_RxRDY==0
        ld      a,#NO
        ret     z
        ld      a,#YES
        ret
unreferenced_06:
        ld      a,#0xfe
        out     (UART_CMD),a
        ld      a,#0x37
        out     (UART_CMD),a
        ld      a,(cfg10_settings)
        res     2,a                                     ;CMT_RS232_SELECT=0
        jr      set_cfg10
init_serial:
        ld      a,#0xfa
        out     (UART_CMD),a
        ld      a,#0x37
        out     (UART_CMD),a
        ld      a,(cfg10_settings)
        set     2,a                                     ;CMT_RS232_SELECT=1
set_cfg10:
        out     (CFG10),a
        ld      (cfg10_settings),a
        ret
unreferenced_07:
        ld      a,(cfg10_settings)
        set     3,a                                     ;CMT_MOTOR_START=1
write_cfg10:
        out     (CFG10),a
        ld      (cfg10_settings),a
        ret
unreferenced_08:
        ld      a,(cfg10_settings)
        res     3,a                                     ;CMT_MOTOR_START=0
        jr      write_cfg10
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
        .dw     Esc0C_initialize_screen_driver
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
        .dw     Esc53_screen_width_set
map_ch_more7:
        .db     0x54                                    ;T
        .dw     Esc55_color_attribute_set
map_ch_more8:
        .db     0x55                                    ;U
        .dw     Esc55_color_attribute_set
map_ch_more9:
        .db     0x56                                    ;V
        .dw     Esc56_screen_attribute_set
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
        cp      a,#0x01
        jp      nz,m_ec03
        xor     a,a
        ld      (0xe48c),a
        ld      (0xe4cb),a
        ld      a,c
        cp      a,#0x61
        jr      c,m_ebfb
        cp      a,#0x7b
        jr      nc,m_ebfb
        and     a,#0x5f
        ld      c,a
m_ebfb:
        ld      hl,#map_esc_list
        call    map_C_to_PTR
        ret     z
        jp      (hl)
m_ec03:
        ld      c,a
        xor     a,a
        ld      (0xe48c),a
        ld      hl,#map_more_codes
        call    map_C_to_PTR
        ret     z
        jp      (hl)
m_ec10:
        xor     a,a
        jr      m_ec14
function_0c:
        ld      a,c
m_ec14:
        ld      (0xe48c),a
        ret
graphic_mode_on:
        ld      a,c
        or      a,#0x80
        ld      (0xe48c),a
        ret
map_C_to_PTR:
        ld      a,(hl)
        or      a,a
        ret     z
        cp      a,c
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
        or      a,a
        ret
Esc55_color_attribute_set:
        call    chk_color_range
        ret     c
        ld      (color_attribute),a
        jr      graphic_mode_on
function_more_0c15:
        call    chk_color_range
        ret     c
        ld      b,a
        ld      a,(cfg_esc_screen_drv)
        bit     6,a                                     ;_DRV_FG_BG_SAME_COLOR==0
        ld      a,(color_attribute)
        jr      nz,set_fgbg_color
        cp      a,b
        ret     z
set_fgbg_color:
        push    af
        ld      a,b
        rlca
        rlca
        rlca
        ld      b,a
        pop     af
        or      a,b
        ld      b,a
        ld      a,(attrib_color)
        and     a,#VRAM_ATTR_MASK
        or      a,b
        ld      (attrib_color),a
        ld      a,c
        cp      a,#0xd4
        ret     nz
        ld      a,(attrib_color)
        jp      m_e9ed
Esc56_screen_attribute_set:
        ld      hl,#attrib_color
        ld      a,(printed_char)
        cp      a,#ATTR0_NONE
        ret     c
        cp      a,#ATTR3_BLINK_INVERSE+1
        ret     nc
        rrc     a
        rrc     a
        and     a,#VRAM_ATTR_MASK
        ld      b,a
        ld      a,(hl)
        and     a,#~VRAM_ATTR_MASK
        or      a,b
        ld      (hl),a
        ret
chk_color_range:
        ld      a,(printed_char)
        sub     a,#COLOR0_BLACK
        ret     c
        cp      a,#COLOR_COUNT
        ccf
        ret
set_cursor_on:
        ld      b,#0x40
        jr      m_ec93
set_cursor_off:
        ld      b,#0x20
m_ec93:
        ld      a,(0xe470)
        and     a,#0x1f
        or      a,b
        ld      (0xe470),a
        ld      b,#0x0a
        ld      c,#0x50
        out     (c),b
        inc     c
        out     (c),a
        ret
get_cursor_pos:
        ld      a,#0x01
        ld      (0xe4cb),a
        ld      c,#0x50
        ld      a,#0x0e
        out     (c),a
        inc     c
        in      h,(c)
        inc     a
        dec     c
        out     (c),a
        inc     c
        in      l,(c)
        ld      a,(column_count)
        ld      e,a
        ld      d,#0x00
        ld      c,#0x00
m_ecc3:
        or      a,a
        sbc     hl,de
        jr      c,m_eccb
        inc     c
        jr      m_ecc3
m_eccb:
        add     hl,de
        ld      h,c
        ld      (0xe4cc),hl
        ret
alternate_keyboard_table:
        ld      hl,#kbd_table_lookup
        ld      c,#kbd_table_lookup_size
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
Esc0C_initialize_screen_driver:
        ld      a,(printed_char)
        ld      (cfg_esc_screen_drv),a
        bit     7,a                                     ;_DRV_NO_CLS==0
        ret     nz
        jp      chr_clear_screen
function_more_0c13:
        ld      a,c
        ld      (0xe48c),a
m_ecf1:
        ld      a,(printed_char)
        cp      a,#VK_ESC
        jr      z,m_ed07
        cp      a,#0x60
        ret     nc
        call    m_e828
        jp      c,m_e81e
        ld      (0xe466),a
        jp      m_e8ec
m_ed07:
        ld      a,#0x32
        ld      (0xe48c),a
        ret
; unchecked data source
        .db     0xc9                                    ;I
function_more_0c14:
        ld      a,(printed_char)
        cp      a,#0x32
        ret     z
        ld      a,#0xb1
        ld      (0xe48c),a
        jr      m_ecf1
function_more_0c10:
        ld      a,(printed_char)
        cp      a,#0x20
        jr      c,m_ed2e
        cp      a,#0x38
        jr      nc,m_ed31
        sub     a,#0x20
m_ed28:
        ld      (0xe496),a
        jp      graphic_mode_on
m_ed2e:
        xor     a,a
        jr      m_ed28
m_ed31:
        ld      a,#SCREEN_HEIGHT-1
        jr      m_ed28
function_more_0c2:
        ld      a,(printed_char)
        or      a,a
        jr      z,m_ed28
        cp      a,#SCREEN_HEIGHT+1
        jr      nc,m_ed31
        dec     a
        jr      m_ed28
function_more_0c17:
        ld      a,(0xe466)
        sub     a,#0x20
        jr      c,m_ed5e
m_ed49:
        push    af
        ld      a,(column_count)
        ld      b,a
        pop     af
        cp      a,b
        jr      nc,m_ed61
m_ed52:
        ld      (cursor_column),a
        ld      a,(0xe496)
        ld      (0xe46d),a
        jp      crt_set_cursor
m_ed5e:
        xor     a,a
        jr      m_ed52
m_ed61:
        ld      a,b
        dec     a
        jr      m_ed52
function_more_0c11:
        ld      a,(0xe466)
        jr      m_ed49
write_character:
        push    de
        call    set_cursor_abs
        pop     de
        call    wait_flicker_free
        ld      (hl),e
m_ed73:
        ld      a,(0xe46d)
        cp      a,#0x17
        jp      nz,m_e8fa
        ld      a,(column_count)
        dec     a
        ld      b,a
        ld      a,(cursor_column)
        cp      a,b
        jp      nz,m_e8fa
        ret
read_character:
        ld      a,#0x01
        ld      (0xe4cb),a
        call    set_cursor_abs
        call    wait_flicker_free
        ld      a,(hl)
        ld      (0xe4cc),a
        jr      m_ed73
erase_rest_of_line:
        ld      c,#0x01
m_ed9b:
        ld      a,(cursor_column)
m_ed9e:
        push    af
        call    set_cursor_abs
        pop     af
m_eda3:
        push    af
        ld      a,(column_count)
        dec     a
        ld      b,a
        ld      e,#' '
        pop     af
        push    af
        push    bc
        push    hl
        call    fill_cnt
        pop     hl
        ld      de,#0x0800
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
        cp      a,b
        jr      z,m_edc9
        inc     hl
        inc     a
        jr      fill_cnt
m_edc9:
        dec     c
        ret     z
        xor     a,a
        inc     hl
        jr      fill_cnt
erase_line:
        ld      a,(cursor_column)
        ld      e,a
        ld      d,#0x00
        or      a,a
        sbc     hl,de
        xor     a,a
        ld      c,#0x01
        jr      m_ed9e
function_4a:
        ld      a,(0xe46d)
        ld      b,a
        ld      a,#0x18
        sub     a,b
        ld      c,a
        jr      m_ed9b
function_more_0c4:
        call    check_cursor_range
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
        call    check_cursor_range
        ret     c
        ld      e,a
        ld      d,#0x00
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
check_cursor_range:
        call    set_cursor_abs
        ld      a,(cursor_column)
        ld      c,a
        ld      a,(column_count)
        ld      b,a
        ld      a,(printed_char)
        cp      a,b
        jr      nc,check_cursor_range_fail
        sub     a,c
        jr      z,check_cursor_range_fail
        ret     c
        ld      c,a
        ret
check_cursor_range_fail:
        scf
        ret
function_more_0c1:
        call    set_cursor_abs
        ld      e,#0x20
        ld      a,(0xe466)
m_ee32:
        or      a,a
        ret     z
        ld      c,a
        ld      a,(column_count)
        ld      b,a
        ld      a,(cursor_column)
m_ee3c:
        call    wait_flicker_free
        ld      (hl),e
        inc     hl
        inc     a
        cp      a,b
        jr      z,m_ee4c
m_ee45:
        dec     c
        jr      nz,m_ee3c
m_ee48:
        ld      (cursor_column),a
        ret
m_ee4c:
        ld      d,#0x18
        ld      a,(0xe46d)
        inc     a
        cp      a,d
        jr      z,m_ee5b
        ld      (0xe46d),a
        xor     a,a
        jr      m_ee45
m_ee5b:
        ld      a,b
        dec     a
        jr      m_ee48
function_more_0c3:
        ld      a,(0xe466)
        ld      (0xe4ce),a
        jp      graphic_mode_on
function_more_0c12:
        call    set_cursor_abs
        ld      a,(printed_char)
        ld      e,a
        ld      a,(0xe4ce)
        ld      c,a
        jr      m_ee32
Esc53_screen_width_set:
        call    display_inhibit
m_ee78:
        ld      hl,#cfg10_settings
        ld      a,(printed_char)
        cp      a,#ATTR_WIDTH40
        jr      z,switch_crt40
        cp      a,#ATTR_WIDTH80
        jr      z,switch_crt80
        jr      m_eec9
switch_crt40:
        res     0,(hl)                                  ;_CRT80=0
        ld      ix,#crt_table40
        jr      m_ee96
switch_crt80:
        set     0,(hl)                                  ;_CRT80=1
        ld      ix,#crt_table80
m_ee96:
        ld      a,1(ix)
        ld      (column_count),a
        ld      a,6(ix)
        ld      (0xe461),a
        ld      (0xe460),a
        ld      (0xe464),a
        ld      (0xe465),a
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
        xor     a,a
        ld      (0xe463),a
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
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00      ;.......
int0_timer:
        ret
; unchecked data source
        .db     0xeb,0x00,0x00                          ;k..
int1_rx_rdy:
        ret
; unchecked data source
        .db     0xd1,0x00,0x00                          ;Q..
int2_tx_rdy:
        ret
; unchecked data source
        .db     0xe1,0x00,0x00                          ;a..
int3_extint2:
        ret
; unchecked data source
        .db     0x23,0x00,0x00                          ;#..
int4_extint1:
        ret
; unchecked data source
        .db     0xc4,0x00,0x00                          ;D..
int5_unused:
        ret
; unchecked data source
        .db     0xd1,0x00,0x00                          ;Q..
int6_unused:
        ret
; unchecked data source
        .db     0xd6,0x00,0x00                          ;V..
int7_vint:
        ret
; unchecked data source
        .db     0x3b,0x00,0x00                          ;;..
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
        cp      a,#'0'
        jr      c,m_ef51
        cp      a,#'9'+1
        jr      c,m_ef4d
        and     a,#MASK_CAPITALIZE
        cp      a,#'A'
        jr      c,m_ef51
        cp      a,#'F'+1
        jr      nc,m_ef51
        sub     a,#0x37
m_ef4b:
        and     a,a
        ret
m_ef4d:
        sub     a,#0x30
        jr      m_ef4b
m_ef51:
        scf
        ret
get_hex_number:
        push    hl
        ld      hl,#param_word+1
        xor     a,a
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
        or      a,a
        ret     z
        ld      c,a
        call    put_char
        inc     hl
        jr      puts
patch_os_functions:
        ld      a,#0x01
        ld      (os_patch),a
        ld      a,(os_patch)
        or      a,a
        ret     z
        ld      hl,#patch_table_1
patch_rom_code:
        ld      a,(hl)
        or      a,a
        ret     z
        inc     hl
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        ld      (de),a
        inc     hl
        jr      patch_rom_code
restore_os_functions:
        ld      hl,#0xef2a
        jr      patch_rom_code
wait_fdd_ready:
        in      a,(UPD765_STATE)
        bit     6,a
        jr      nz,wait_fdd_ready
        ret
fdd_available:
        call    display_inhibit
        ld      hl,#cfg20_settings
        res     3,(hl)
        ld      a,(hl)
        out     (CFG20),a
        jp      m_f0b2
m_efa6:
        ld      hl,#cfg20_settings
        set     3,(hl)
        ld      a,(hl)
        out     (CFG20),a
        ld      hl,#cfg10_settings
        set     7,(hl)
        ld      a,(hl)
        out     (CFG10),a
        ld      a,(boot_sector)
        cp      a,#0x16
        call    z,patch_os_functions
        jp      boot_sector
ENTRY:
        ld      sp,#stack_at_boot
        call    display_inhibit
        ld      hl,#cfg20_settings
        set     6,(hl)                                  ;UPPER_MONITOR_SEL=1
        ld      a,(hl)
        out     (CFG20),a
        call    init_system
        jp      init_bios
; unchecked data source
        .db     0x74,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;t.......
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00                          ;...
boot::
        ld      de,#init_bios
        ld      hl,#bios_rom
        ld      bc,#SIZE4K-2
        ldir
        jp      ENTRY
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00                               ;..
init_system:
        call    init_pic
        call    init_serial
        call    patch_printer_ptr
        call    init_kbd_table
        call    init_crt_param
        ret
patch_printer_ptr:
        in      a,(STATUS10)
        bit     5,a                                     ;_PRT_SERIAL==0
        ret     z
        ld      hl,(dev_serial_write_byte+1)
        ld      (dev_printer_write_byte+1),hl
        ret
init_kbd_table:
        in      a,(STATUS10)
        and     a,#MASK_COUNTRY_SELECT
        ret     z
        rra
        rra
        and     a,#MASK_COUNTRY_BITS
        cp      a,#COUNTRY_DE
        call    z,set_german_ascii_range
        cp      a,#COUNTRY_US
        call    z,m_f142
        cp      a,#COUNTRY_FR
        call    z,m_f145
        cp      a,#COUNTRY_UK
        call    z,m_f148
        cp      a,#COUNTRY_IT
        call    z,m_f14b
        cp      a,#COUNTRY_ES
        call    z,m_f14e
        cp      a,#COUNTRY_07
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
        bit     6,a
        ret     z
        ld      hl,#crt_table_ntsc
        ld      de,#crt_table40
        ld      bc,#crt_table_ntsc_size
        ldir
        ret
init_pic:
        ld      a,#0x16
        out     (PIC_ICW1),a
        ld      a,#>int0_timer
        out     (PIC_ICW2),a
        ld      a,#0xff
        out     (0x71),a
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
        bit     7,a                                     ;RQM_Request_for_master==0
        jr      z,m_f09f
        pop     af
        out     (UPD765_DATA),a
        ret
fdc_read_byte:
        in      a,(UPD765_MAIN_STATUS)
        add     a,#0x40
        jr      nc,fdc_read_byte
        in      a,(UPD765_DATA)
        ret
m_f0b2:
        xor     a,a
        out     (FDC_UNIT),a
        ld      de,#boot_sector
        ld      a,e
        out     (0x64),a
        ld      a,d
        out     (0x64),a
        ld      a,#0xff
        out     (FDC_UNIT),a
        out     (FDC_UNIT),a
        out     (0x65),a
        ld      a,#0x40
        out     (0x65),a
        ld      hl,#0x9c40
        call    delay
        ld      hl,#0x9c40
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
        cp      a,#0x80
        jr      z,m_f0e5
        call    fdc_read_byte
        ld      a,#0x44
        out     (DMA_MODE_SET),a
        ld      c,#0x09
m_f0fa:
        call    fdc_write_byte_ix
        dec     c
        jr      nz,m_f0fa
        call    dev_fdd_wait_ready
        call    fdc_read_byte
        and     a,#0xc0
        jr      nz,m_f0b2
        ld      c,#0x06
m_f10c:
        call    fdc_read_byte
        dec     c
        jr      nz,m_f10c
        jp      m_efa6
m_f115:
        ld      hl,#0xfd64
        ld      de,#0xe525
        ld      bc,#0x0018
        ldir
        ld      de,#0xe585
        ld      bc,#0x0018
        ldir
        ld      hl,#0xfd94
        ld      de,#0xe867
        ld      c,#0x08
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

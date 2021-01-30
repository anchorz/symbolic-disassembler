; source : tapcgv2_ic1038.bicom.bin
; created: 2021-01-30 13:27:36
; by     : Jayne
; md5    : 1f8bedb609bba5b511182a4509fa345b
; 
; constant
; 
FG_WHITE                         = 0x07
BG_BLACK                         = 0x00
ATTR_INVERS                      = 0x07
ATTR_BLINK                       = 0x06
MASK_ATTR                        = 0xc0
ESC_53_CRT40                     = 0x30
ESC_53_CRT80                     = 0x31
ESC_0C_CLS                       = 0x07
ESC_0C_FB_SAME_COLOR             = 0x06
ESC_0C_CTRL_INTERNAL             = 0x02
ESC_0C_COMMAND_KEY               = 0x03
ESC_0C_SCROLL_MODE               = 0x00
MASK_ESC_0C_SCROLL_MODE          = 0x01
HIGH_ZERO                        = 0x00
ON                               = 0x01
TOGGLE_SLED                      = 0x01
STATUS_SLED                      = 0x00
TOGGLE_GLED                      = 0x04
INPUT_MODE_GRAPH                 = 0x80
INPUT_MODE_B1                    = 0xb1
INPUT_MODE_32                    = 0x32
STATUS_GLED                      = 0x02
OFF                              = 0x00
REG_0                            = 0x00
REG_10_CURSOR_START              = 0x0a
CURSOR_INVISIBLE                 = 0x20
CURSOR_BLINK_SLOW                = 0x40
MASK_CURSOR_LINE                 = 0x1f
REG_14_CURSOR_H                  = 0x0e
REG_14_CURSOR_L                  = 0x0f
BICOM_GFX                        = 0x03
CFG10                            = 0x10
ROM_ACCESS_EN                    = 0x07
ROM_PACK_EN                      = 0x06
MUST_BE_ZERO                     = 0x05
_BUZZER_ON                       = 0x04
CMT_MOTOR_START                  = 0x03
CMT_RS232_SELECT                 = 0x02
_DISPLAY_INHIBIT                 = 0x01
_CRT80                           = 0x00
MASK_WIDTH_40_80                 = 0x18
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
KBD_POSITION_LEFT                = 0x49
KBD_POSITION_CTRL                = 0x4f
KBD_POSITION_SHIFT               = 0x53
KBD_POSITION_SHIFT_LOCK          = 0x4e
KBD_POSITION_COMMAND             = 0x4d
KBD_POSITION_GRAPH               = 0x56
KBD_BREAK                        = 0x07
MODIFIER_SHIFT                   = 0x01
KBD_MOD_SHIFT                    = 0x00
KBD_MOD_CTRL                     = 0x02
STATUS30                         = 0x30
CEN_DATA                         = 0x30
_SIOC                            = 0x00
_CRT_VSYNC_PERIOD                = 0x01
_CEN_ACKNOWLEDGE                 = 0x02
_CEN_BUSY                        = 0x03
UART_CONTROL                     = 0x41
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
ID_IS_BOOT                       = 0x16
SCREEN_HEIGHT                    = 0x18
VK_ENTER                         = 0x0d
VK_NL                            = 0x0a
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
BICOM_HEIGHT                     = 0x0108
DELAY_7MS                        = 0x03e8
DELAY_11MS                       = 0x05dc
DELAY_22MS                       = 0x0bb8
sprintf_buffer_size              = 0x0010
str_monitor_size                 = 0x0018
str_ready_size                   = 0x000a
str_error_size                   = 0x000a
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
version_size                     = 0x0010
crt_table_ntsc_size              = 0x0024
kbc_cpm_control_keys_size        = 0x0018
kbc_cpm_control_keys_shift_size  = 0x0018
cpm_special_character_mods_size  = 0x0008
bicom_glp1_prt_gfx_size          = 0x0010
bicom_glp2_prt_2nd_line_size     = 0x0010
bicom_glp3_prt_crlf_size         = 0x0010
bicom_glp4_prt_ld_size           = 0x0010
bicom_glp5_prt_ld_size           = 0x0010
;
;
;
boot_strap:
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
        cp      #ID_JMP
        jp      z,ROM_PACK_16K
        ld      a,(ROM_PACK_8K)
        cp      #ID_JMP
        jp      z,ROM_PACK_8K
        ld      hl,#cfg10_settings
        res     6,(hl)                                  ;ROM_PACK_EN=0
        ld      a,(hl)
        out     (CFG10),a
        in      a,(STATUS10)
        rra
        jr      nc,_mf
        call    display_inhibit
        call    rom_enable
        jp      fdc_read_boot_sector
_mf:
        call    prepare_basic
        jp      z,basic_start
        call    rom_disable
        jr      go_monitor
ram_boot:
        call    monitor_inhibit
        call    rom_disable
        ld      a,(boot_sector)
        cp      #ID_IS_BOOT
        call    z,patch_os_functions
        jp      boot_sector
rom_disable:
        ld      hl,#cfg10_settings
        set     7,(hl)                                  ;ROM_ACCESS_EN=1
        ld      a,(hl)
        out     (CFG10),a
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
go_monitor:
        ld      (save_stack),sp
        ld      sp,#stack_at_boot
        call    restore_os_functions
        ld      hl,#str_monitor
        call    puts
monitor_cmd_loop:
        ld      hl,#monitor_cmd_loop
        push    hl
        call    print_new_line
        ld      c,#'*'
        call    put_char
        call    get_char_echoed
        and     #MASK_CAPITALIZE
        cp      #'E'
        jp      z,return_to_basic
        cp      #'P'
        jp      z,enable_protocol_printer
        cp      #'M'
        jr      z,monitor_cmd_mem_move
        cp      #'D'
        jp      z,monitor_cmd_display
        cp      #'G'
        jp      z,monitor_cmd_go
        cp      #'R'
        jp      z,monitor_cmd_reg
        cp      #'C'
        ret     nz
        call    get_hex_number_sp
        cp      #VK_ENTER
        ret     nz
        ld      hl,(param_word)
byte_change:
        call    print_nl_hx16
_m11:
        push    hl
        call    out_sphx8_minus
        call    input_hex_byte
        pop     hl
        jr      c,_err3
        ld      (hl),a
_m10:
        inc     hl
        ld      a,l
        and     #0x07
        jr      nz,_m11
        jr      byte_change
_err3:
        cp      #' '
        jr      nz,test_decrement_key
        call    print_space
        jr      _m10
test_decrement_key:
        cp      #'-'
        ret     nz
        dec     hl
        jr      byte_change
monitor_cmd_mem_move:
        call    get_hex_number_sp
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
        jr      c,_err_area_overlap
        push    hl
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(param_word)
        or      a
        sbc     hl,de
        ld      bc,(param_3)
        jr      c,_continue_ldir
        pop     de
        ld      a,h
        or      l
        jr      z,ready_msg_after_ldir
        ld      hl,(param_2)
        lddr
ready_msg_after_ldir:
        ld      hl,#str_ready
puts:
        ld      a,(hl)
        or      a
        ret     z
        ld      c,a
        call    put_char
        inc     hl
        jr      puts
_continue_ldir:
        ld      hl,(param_word)
        ex      de,hl
        ldir
        pop     de
        jr      ready_msg_after_ldir
_err_area_overlap:
        ld      hl,#str_error
        call    puts
        ret
monitor_cmd_display:
        call    get_hex_number_sp
        cp      #','
        ret     nz
        ld      hl,(param_word)
        ld      (param_1),hl
        call    get_hex_number
        cp      #VK_ENTER
        ret     nz
        ld      hl,(param_1)
        ex      de,hl
        ld      hl,(param_word)
        or      a
        sbc     hl,de
        ret     c
        inc     hl
        push    hl
        ex      de,hl
        pop     bc
_display_line:
        push    bc
        push    hl
        call    print_nl_hx16
        call    _sprintf_clean
        pop     hl
        pop     bc
        ld      de,#sprintf_buffer
_display_byte:
        call    outsphx8
        ld      a,(hl)
        ld      (de),a
        dec     bc
        ld      a,b
        or      c
        inc     hl
        inc     de
        jp      z,display_ascii_dump
        ld      a,(column_count)
        xor     #0x0f
        and     #0x0f
        push    bc
        ld      b,a
        ld      a,l
        and     b
        pop     bc
        jr      nz,_display_byte
        call    display_ascii_dump
        jr      _display_line
monitor_cmd_go:
        call    get_hex_number_sp
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
        jp      brk_handler
brk_handler:
        ld      (reg_hl),hl
        pop     hl
        ld      (ret_pc),hl
        push    af
        pop     hl
        ld      (reg_af),hl
        ld      (reg_bc),bc
        ld      (reg_de),de
        ld      a,i
        ld      (reg_i),a
        ld      (reg_ix),ix
        ld      (reg_iy),iy
        ld      hl,#str_break_at
        call    puts
        ld      hl,(ret_pc)
        call    outhx16
        ld      sp,#stack_at_boot
        jp      monitor_cmd_loop
monitor_cmd_reg:
        ld      hl,#str_reg
        call    puts
        ld      hl,(ret_pc)
        call    outhx16
        ld      hl,#reg_bc
        ld      c,#4
_print_reg8:
        push    bc
        inc     hl
        push    hl
        call    outsphx8
        pop     hl
        dec     hl
        push    hl
        call    outsphx8
        pop     hl
        inc     hl
        inc     hl
        pop     bc
        dec     c
        jr      nz,_print_reg8
        call    outsphx8
        call    print_space
        ld      hl,(reg_ix)
        call    outhx16
        call    print_space
        ld      hl,(reg_iy)
        jr      _m12
print_nl_hx16:
        call    print_new_line
_m12:
        call    outhx16
        ret
enable_protocol_printer:
        ld      a,(printer_protocol_flag)
        or      a
        jr      z,_print_on
        ld      a,#OFF
        ld      hl,#str_print_off
_m13:
        ld      (printer_protocol_flag),a
        call    puts
        ret
_print_on:
        ld      a,#ON
        ld      hl,#str_print_on
        jr      _m13
return_to_basic:
        call    prepare_basic
        jr      nz,just_go_back
        ld      a,#0x0c
        rst     0x18
just_go_back:
        ld      sp,(save_stack)
        ret
prepare_basic:
        ld      a,(id_basic)
        cp      #ID_IS_BASIC
        ret     nz
        call    patch_os_functions
        ret
display_ascii_dump:
        push    hl
        push    bc
        ld      a,(column_count)
        and     #MASK_WIDTH_40_80
        ld      c,a
        ld      b,#0
        ld      hl,#sprintf_buffer
        or      a
        adc     hl,bc
        or      a
        sbc     hl,de
        ld      a,l
        or      a
        jr      z,_m16
_m17:
        push    hl
        call    print_space
        call    print_space
        call    print_space
        pop     hl
        dec     l
        jr      nz,_m17
_m16:
        call    print_space
        call    print_space
        ld      a,(column_count)
        and     #MASK_WIDTH_40_80
        ld      b,a
        ld      hl,#sprintf_buffer
_m15:
        push    hl
        push    bc
        ld      a,(hl)
        cp      #' '
        jr      c,non_char_printable
        cp      #VK_DEL
        jr      c,_printable_char
non_char_printable:
        ld      a,#'.'
_printable_char:
        ld      c,a
        call    put_char
        pop     bc
        pop     hl
        inc     hl
        dec     b
        jr      nz,_m15
        pop     bc
        pop     hl
        ret
_sprintf_clean:
        ld      hl,#sprintf_buffer
        ld      b,#sprintf_buffer_size
_m14:
        ld      (hl),#0
        inc     hl
        dec     b
        jr      nz,_m14
        ret
unreferenced_02:
        call    get_char_echoed
        cp      #','
        ret
str_monitor:
        .db     0x0c,0x4d,0x6f,0x6e,0x69,0x74,0x6f,0x72 ;.Monitor
        .db     0x20,0x56,0x65,0x72,0x73,0x2e,0x20,0x31 ; Vers. 1
        .db     0x2e,0x32,0x20,0x47,0x0d,0x0a,0x0a,0x00 ;.2 G....
str_ready:
        .db     0x0d,0x0a,0x52,0x65,0x61,0x64,0x79,0x0d ;..Ready.
        .db     0x0a,0x00                               ;..
str_error:
        .db     0x0d,0x0a,0x45,0x72,0x72,0x6f,0x72,0x0d ;..Error.
        .db     0x0a,0x00                               ;..
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
outsphx8:
        call    print_space
        ld      a,(hl)
        jr      outhx8
outhx16:
        ld      a,h
        call    outhx8
        ld      a,l
outhx8:
        push    bc
        push    af
        rrca
        rrca
        rrca
        rrca
        call    outhx4
        pop     af
        call    outhx4
        pop     bc
        ret
out_sphx8_minus:
        call    outsphx8
        ld      c,#'-'
        jr      _m18
outhx4:
        and     #0x0f
        cp      #10
        jr      nc,_correct_hex_digit
        add     a,#'0'
_me:
        ld      c,a
_m18:
        call    put_char
        ret
_correct_hex_digit:
        add     a,#'A'-10
        jr      _me
print_new_line:
        push    bc
        ld      c,#VK_ENTER
        call    put_char
        ld      c,#VK_NL
        jr      _print_next_char
print_space:
        push    bc
        ld      c,#' '
_print_next_char:
        call    put_char
        pop     bc
        ret
put_char:
        call    put_char_crt
        ld      a,(printer_protocol_flag)
        or      a
        call    nz,dev_printer_write_byte
        ret
input_hex_byte:
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
        call    kbd_inch
        push    af
        ld      c,a
        call    put_char
        pop     af
        ret
get_hex_digit:
        call    get_char_echoed
        cp      #'0'
        jr      c,_m1a
        cp      #'9'+1
        jr      c,_m19
        and     #MASK_CAPITALIZE
        cp      #'A'
        jr      c,_m1a
        cp      #'F'+1
        jr      nc,_m1a
        sub     #'A'-10
_m1b:
        and     a
        ret
_m19:
        sub     #'0'
        jr      _m1b
_m1a:
        scf
        ret
get_hex_number_sp:
        call    print_space
get_hex_number:
        push    hl
        ld      hl,#param_word+1
        xor     a
        ld      (hl),a
        dec     hl
        ld      (hl),a
_m1c:
        call    get_hex_digit
        jr      c,_m1d
        rld
        inc     hl
        rld
        dec     hl
        jr      _m1c
_m1d:
        pop     hl
        ret
patch_os_functions:
        ld      a,#ON
        ld      (os_patch),a
        ld      a,(os_patch)
        or      a
        ret     z
        ld      hl,#patch_table_1
_md:
        call    rom_enable
        call    patch_rom_code
        jp      monitor_inhibit
restore_os_functions:
        ld      hl,#patch_table_2
        jr      _md
; unchecked data source
        .db     0xeb,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;k.......
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
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
        jp      kbd_matrix_read
dev_kbd_inch:
        jp      kbd_inch
        jp      put_char_crt
        jp      kbd_matrix_read
        jp      kbd_inch
        jp      put_char_crt
        jp      kbd_matrix_read
        jp      kbd_inch
        jp      put_char_crt
        jp      kbd_inch
        jp      com_read_byte
        jp      com_read_byte
        jp      put_char_crt
dev_serial_tx_ready:
        jp      com_tx_ready
dev_serial_write_byte:
        jp      com_write_byte
dev_printer_write_byte:
        jp      lpt_write_byte
        jp      lpt_write_byte
api_call_23:
        ld      a,#-1
        ret
api_call_24:
        nop
        xor     a
        ret
dev_printer_busy:
        jp      lpt_busy
api_call_26:
        nop
        xor     a
        ret
api_call_27:
        jp      kbd_buffer_clear_beep
api_call_28:
        jp      kbd_buffer_clear
api_call_29:
        jp      delay
api_call_30:
        jp      buzzer_off
api_call_31:
        jp      buzzer_on
api_call_32:
        jp      brk_handler
api_call_33:
        jp      kbd_adjust_keyboard_table
terminal_row1:
        .db     0x18                                    ;.
terminal_row2:
        .db     0x18                                    ;.
column_count:
        .db     0x50                                    ;P
row_start:
        .db     0x00                                    ;.
terminal_row3:
        .db     0x18                                    ;.
terminal_row4:
        .db     0x18                                    ;.
buffer_put_char:
        .db     0x30                                    ;0
attrib_color:
        .db     0x07                                    ;.
cfg10_settings:
        .db     0x00                                    ;.
cfg20_settings:
        .db     0x00                                    ;.
screen_driver_settings:
        .db     0x05                                    ;.
; unchecked data source
        .db     0x00,0xca                               ;.J
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
kbd_command_mode:
        .db     0x00                                    ;.
kbd_modifiers:
        .db     0x00                                    ;.
input_mode:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00                                    ;.
kbd_position:
        .db     0x00                                    ;.
kbd_ascii:
        .db     0x00                                    ;.
cursor_abs:
        .db     0x00,0x00                               ;..
cursor_abs_color:
        .db     0x00,0x00                               ;..
column_offset_tmp:
        .db     0x00,0x00                               ;..
cursor_tmp:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00                                    ;.
key_code:
        .db     0x00                                    ;.
attrib_tmp:
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
; unchecked data source
        .db     0x00,0x00                               ;..
sprintf_buffer:
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
printer_protocol_flag:
        .db     0x00                                    ;.
ret_pc:
        .db     0x00,0x00                               ;..
reg_bc:
        .db     0x00,0x00                               ;..
reg_de:
        .db     0x00,0x00                               ;..
reg_hl:
        .db     0x00,0x00                               ;..
reg_af:
        .db     0x00,0x00                               ;..
reg_i:
        .db     0x00                                    ;.
reg_ix:
        .db     0x00,0x00                               ;..
reg_iy:
        .db     0x00,0x00                               ;..
save_stack:
        .db     0x00,0x00                               ;..
; unchecked data source
        .db     0x00,0x00,0x00                          ;...
cursor_flag:
        .db     0x00                                    ;.
cursor_row_column_rel:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00                                    ;.
char_tmp:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00                                    ;.
os_patch:
        .db     0x00                                    ;.
; unchecked data source
        .db     0x00                                    ;.
beep_delay:
        .db     0x00,0x80                               ;..
crt_wait_vsync:
        jp      wait_vsync
crt_is_vsync:
        jp      is_vsync
crt_wait_flicker_free_save_A:
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
        call    switch_crt_mode
kbd_buffer_clear:
        ld      hl,#kbd_debounce_cnt
        ld      de,#kbd_matrix_buffer
        ld      bc,#kbd_table_int_size
        ld      (hl),#0
        ldir
        ret
kbd_matrix_read:
        push    hl
        push    de
        push    bc
        ld      a,(kbd_command_mode)
        cp      #0x80                                   
        jr      z,_err4
        cp      #0x88                                   
        jr      z,_err4
        ld      hl,#kbd_matrix_buffer2
        call    kbd_fetch_from_io
        ld      hl,#kbd_matrix_buffer2
        ld      b,#kbd_matrix_buffer_size
_m1e:
        ld      a,(hl)
        or      a
        jr      nz,kbd_pressed2
        dec     b
        jp      z,kbd_not_pressed
        inc     hl
        jr      _m1e
kbd_pressed2:
        call    m_e5e7
        ld      a,(kbd_command_mode)
        cp      #0x80                                   
        ld      a,#0x00                                 
        jr      nz,m_e5e3
_err4:
        ld      a,#-1
m_e5e3:
        pop     bc
        pop     de
        pop     hl
        ret
m_e5e7:
        push    hl
        push    de
        push    bc
        ld      hl,#DELAY_7MS
        call    delay
        ld      hl,#kbd_matrix_buffer
        call    kbd_fetch_from_io
        ld      hl,#kbd_matrix_buffer
        ld      de,#kbd_matrix_buffer2
        ld      b,#kbd_matrix_buffer_size
cmp_kbd_entry:
        ld      a,(de)
        cp      (hl)
        jr      nz,scans_different
        dec     b
        jr      z,scan_is_stable
        inc     hl
        inc     de
        jr      cmp_kbd_entry
scan_is_stable:
        call    m_e682
        ld      a,(kbd_command_mode)
        cp      #0x80                                   
        jr      nz,clear_kbd_modifiers
        call    m_e72c
        ld      a,(led_status)
        bit     7,a                                     
        jr      nz,kbd_no_key
        ld      a,(kbd_ascii)
        cp      #0xff                                   
        jr      z,kbd_no_key
        or      a
        jr      z,kbd_no_key
        call    modify_if_graphic_B
        ld      a,(key_code)
        cp      b
        jr      nz,set_kbd_debounce_cnt
        ld      a,(kbd_debounce_cnt)
        or      a
        jr      nz,decrement_kbd_debounce_cnt
        ld      hl,#DELAY_22MS
        call    delay
        jr      update_key_code
; unchecked data source
        .db     0xaf,0x18,0x12                          ;/..
decrement_kbd_debounce_cnt:
        dec     a
        ld      (kbd_debounce_cnt),a
        jr      scans_different
kbd_not_pressed:
        xor     a
        ld      (0xe4c9),a                              
clear_kbd_modifiers:
        xor     a
        ld      (kbd_modifiers),a
kbd_no_key:
        xor     a
        ld      (key_code),a
        ld      (kbd_debounce_cnt),a
scans_different:
        xor     a
        ld      (kbd_command_mode),a
        ld      (kbd_ascii),a
        jr      kbd_exit
set_kbd_debounce_cnt:
        ld      a,#32
        ld      (kbd_debounce_cnt),a
update_key_code:
        ld      a,(kbd_ascii)
        ld      (key_code),a
kbd_exit:
        pop     bc
        pop     de
        pop     hl
        ret
kbd_fetch_from_io:
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
        ld      (kbd_command_mode),a
kbd_buffer_check_colum:
        ld      a,0(ix)
        or      a
        jr      nz,m_e69d
        ld      a,c
        add     a,#0x08                                 
        ld      c,a
m_e696:
        cp      #kbd_table_int_size
        ret     z
        inc     ix
        jr      kbd_buffer_check_colum
m_e69d:
        ld      d,#8
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
        jr      z,kbd_handle_ctrl
        cp      #KBD_POSITION_SHIFT
        jr      z,handle_kbd_shift
        cp      #KBD_POSITION_SHIFT_LOCK
        jr      z,handle_kbd_shift_lock
        cp      #KBD_POSITION_COMMAND
        jr      z,handle_kbd_command
        cp      #KBD_POSITION_GRAPH
        jr      z,handle_kbd_graph
m_e6c3:
        ld      a,e
        or      a
        jr      nz,m_e6a8
        ld      e,#0x01                                 
        ld      a,c
        ld      (kbd_position),a
        ld      a,#0x80                                 
        ld      (kbd_command_mode),a
        jr      m_e6a8
kbd_handle_ctrl:
        ld      a,(screen_driver_settings)
        bit     2,a                                     ;ESC_0C_CTRL_INTERNAL==0
        jr      z,m_e6c3
        ld      a,(kbd_modifiers)
        set     2,a                                     ;KBD_MOD_CTRL=1
        jr      set_kbd_modifiers
handle_kbd_shift:
        ld      a,(kbd_modifiers)
        set     0,a                                     ;KBD_MOD_SHIFT=1
set_kbd_modifiers:
        ld      (kbd_modifiers),a
        jr      m_e6a8
handle_kbd_shift_lock:
        call    m_e70f
        jr      nz,m_e6a8
        call    m_e8bf
        jr      m_e6a8
handle_kbd_command:
        ld      a,(screen_driver_settings)
        bit     3,a                                     ;ESC_0C_COMMAND_KEY==0
        jr      nz,m_e6c3
        jr      m_e6a8
handle_kbd_graph:
        call    m_e70f
        jr      nz,m_e6a8
        call    kbd_toggle_gled
        ld      a,(os_patch)
        or      a
        jr      z,m_e6c3
        jr      m_e6a8
m_e70f:
        ld      a,(0xe4c9)                              
        or      a
        ret     nz
        ld      a,#0x01                                 
        ld      (0xe4c9),a                              
        ret
modify_if_graphic_B:
        ld      a,(kbd_modifiers)
        bit     2,a                                     ;KBD_MOD_CTRL==0
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
        bit     0,a                                     ;STATUS_SLED==0
        ret     z
        ld      a,(hl)
        cp      #0x61                                   
        ret     c
opcode_compare:
        cp      #0x7b                                   
        ret     nc
        and     #0x5f                                   
        ld      (kbd_ascii),a
        ret
unreferenced_09:
        push    hl
        ld      hl,#led_status
        res     7,(hl)                                  ;unknown_status_flag=0
        pop     hl
        jp      buzzer_off
kbd_inch:
        push    hl
        push    de
        push    bc
m_e765:
        ld      a,(kbd_command_mode)
        cp      #0x80                                   
        jr      z,m_e77a
        cp      #0x88                                   
        ld      a,#0x00                                 
        ld      (kbd_command_mode),a
        jr      z,m_e7a2
        call    kbd_matrix_read
        jr      m_e765
m_e77a:
        xor     a
        ld      (kbd_command_mode),a
        ld      a,(kbd_ascii)
        and     #0x7f                                   
        cp      #0x20                                   
        jr      c,m_e794
        ld      a,(os_patch)
        or      a
        jr      z,m_e794
        ld      a,(led_status)
        bit     2,a                                     ;STATUS_GLED==0
        jr      nz,m_e799
m_e794:
        ld      a,(kbd_ascii)
        jr      m_e7a8
m_e799:
        ld      a,#0x88                                 
        ld      (kbd_command_mode),a
        ld      a,#0xdf                                 
        jr      m_e7a8
m_e7a2:
        ld      a,(kbd_ascii)
        call    map_char_to_graphic
m_e7a8:
        pop     bc
        pop     de
        pop     hl
        ret
put_char_crt:
        push    hl
        push    de
        push    bc
        ld      a,c
        ld      (buffer_put_char),a
        ld      a,(input_mode)
        or      a
        jr      nz,m_e823
        ld      a,(os_patch)
        or      a
        jr      z,m_e7ef
        ld      a,(0xe4c8)                              
        or      a
        ld      a,(buffer_put_char)
        jr      nz,m_e7d8
        cp      #0xdf                                   
        jr      z,m_e817
m_e7cc:
        and     #0x7f                                   
        jr      z,m_e7df
        cp      #0x7f                                   
        jr      z,m_e81e
        cp      #0x20                                   
        jr      c,m_e81e
m_e7d8:
        xor     a
        ld      (0xe4c8),a                              
m_e7dc:
        call    crt_write_char_with_color
m_e7df:
        pop     bc
        pop     de
        ld      a,(cursor_flag)
        or      a
        jr      nz,m_e80d
m_e7e7:
        ld      a,(buffer_put_char)
        ld      (0xe46c),a                              
        pop     hl
        ret
m_e7ef:
        ld      a,(buffer_put_char)
        ld      b,a
        cp      #0xdf                                   
        jr      z,m_e808
        ld      a,(0xe4c8)                              
        or      a
        ld      a,b
        jr      z,m_e7cc
        call    map_char_to_graphic
        ld      (buffer_put_char),a
        jr      c,m_e81e
        jr      m_e7dc
m_e808:
        call    m_e8d6
        jr      m_e7df
m_e80d:
        ld      hl,(cursor_row_column_rel)
        ex      de,hl
        xor     a
        ld      (cursor_flag),a
        jr      m_e7e7
m_e817:
        ld      a,#0x01                                 
        ld      (0xe4c8),a                              
        jr      m_e7df
m_e81e:
        call    m_e83f
        jr      m_e7df
m_e823:
        call    _m2e
        jr      m_e7df
map_char_to_graphic:
        cp      #0x20                                   
        ret     c
        cp      #0x60                                   
        jr      c,m_e835
        cp      #0x80                                   
        ret     nc
        or      #0x80                                   
        ret
m_e835:
        cp      #0x40                                   
        jr      c,m_e83c
        xor     #0xc0                                   
        ret
m_e83c:
        xor     #0x20                                   
        ret
m_e83f:
        ld      a,(buffer_put_char)
        cp      #VK_ESC
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
        .dw     chr_carrige_returnX
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
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00      ;.......
chr_line_feed:
        ld      a,(cursor_column)
        or      #0x80                                   
        ld      (0xe4ca),a                              
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
        res     7,(hl)                                  ;ATTR_INVERS=0
        ret
chr_inverse_on:
        ld      hl,#attrib_color
        set     7,(hl)                                  ;ATTR_INVERS=1
        ret
kbd_toggle_gled:
        ld      a,(led_status)
        xor     #TOGGLE_GLED
kbd_update_gled:
        ld      (led_status),a
        bit     2,a                                     ;STATUS_GLED==0
        ld      hl,#cfg20_settings
        jr      z,m_e8bb
        set     4,(hl)                                  ;GLED=1
m_e8b7:
        ld      a,(hl)
        out     (CFG20),a
        ret
m_e8bb:
        res     4,(hl)                                  ;GLED=0
        jr      m_e8b7
m_e8bf:
        ld      a,(led_status)
        xor     #TOGGLE_SLED
        ld      (led_status),a
        bit     0,a                                     ;STATUS_SLED==0
        ld      hl,#cfg20_settings
        jr      z,m_e8d2
        set     5,(hl)                                  ;SLED=1
        jr      m_e8b7
m_e8d2:
        res     5,(hl)                                  ;SLED=0
        jr      m_e8b7
m_e8d6:
        ld      a,(0xe4c8)                              
        xor     #0x01                                   
        ld      (0xe4c8),a                              
        ld      a,(led_status)
        jr      z,m_e8e8
        set     2,a                                     ;STATUS_GLED=1
m_e8e5:
        jp      kbd_update_gled
m_e8e8:
        res     2,a                                     ;STATUS_GLED=0
        jr      m_e8e5
crt_write_char_with_color:
        call    set_cursor_abs
        ld      a,(buffer_put_char)
        call    wait_flicker_free_save_A
        ld      (hl),b
        ld      a,(attrib_color)
        ld      (de),a
cursor_move_right:
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
        ld      a,(0xe465)                              
        cp      b
        jr      z,m_e94a
        ld      a,(0xe460)                              
        cp      b
        jr      z,m_e963
        call    c,set_cursor_home
        jr      m_e925
m_e922:
        call    erase_line
m_e925:
        ld      a,(0xe4ca)                              
        bit     7,a                                     
        jr      z,chr_carrige_returnX
        and     #0x7f                                   
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
        ld      (0xe4ca),a                              
        ret
chr_carrige_returnX:
        xor     a
        jr      m_e92e
m_e94a:
        ld      a,(0xe463)                              
        call    crt_set_cursor_at_row_start
        jr      z,m_e925
        ld      a,(0xe464)                              
        cp      #0x01                                   
        call    nz,_m32
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
        sub     b
        cp      #0x01                                   
        call    nz,_m32
        ld      a,(0xe460)                              
        jr      m_e95d
crt_set_cursor_at_row_start:
        ld      (cursor_row),a
        xor     a
        ld      (cursor_column),a
        ld      a,(screen_driver_settings)
        and     #MASK_ESC_0C_SCROLL_MODE
        ret
_m32:
        dec     a
        ld      hl,#0
        ld      d,#HIGH_ZERO
        call    calc_column_offset
        ld      (column_offset_tmp),hl
        call    set_cursor_abs
        push    de
        call    m_e99e
        pop     hl
m_e99e:
        ex      de,hl
        ld      a,(column_count)
        ld      l,a
        ld      h,#HIGH_ZERO
        add     hl,de
        ld      bc,(column_offset_tmp)
m_e9aa:
        in      a,(STATUS10)
        rla
        jr      nc,m_e9aa
        ldi
        ldi
        nop
        nop
        nop
        nop
        jp      pe,m_e9aa
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
        ld      a,#FG_WHITE|BG_BLACK
        ld      (attrib_color),a
clear_screen_width_color:
        ld      (BWS+OFFSET_COLOR),a
        ld      hl,#BWS
        ld      c,#SCREEN_HEIGHT+1
        call    wait_vsync
        xor     a
        call    fill_bws_rows
        call    is_vsync
set_cursor_home:
        xor     a
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
display_enable:
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
        rla
        jr      c,wait_flicker_free
_mb:
        in      a,(STATUS10)
        rla
        jr      nc,_mb
        ret
chr_cursor_left:
        ld      a,(cursor_column)
        dec     a
        cp      #-1
        jr      nz,cursor_store_column
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
        jr      c,cursor_store_column
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
_set_cursor:
        jp      crt_set_cursor
cursor_store_column:
        ld      (cursor_column),a
        jr      _set_cursor
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
_buz_off:
        res     4,(hl)                                  ;_BUZZER_ON=0
_mc:
        ld      a,(hl)
        out     (CFG10),a
        pop     hl
        ret
buzzer_on:
        push    hl
        ld      hl,#cfg10_settings
        set     4,(hl)                                  ;_BUZZER_ON=1
        jr      _mc
buzzer_off:
        push    hl
        ld      hl,#cfg10_settings
        jr      _buz_off
brk_exit:
        in      a,(STATUS_KBD+10)
        or      a
        bit     7,a                                     ;KBD_BREAK==0
        ret     z
        ld      a,(os_patch)
        or      a
        jp      z,cold_start
        ld      e,#0x18                                 
        scf
        ret
lpt_busy:
        call    brk_exit
        in      a,(STATUS30)
        bit     3,a                                     ;_CEN_BUSY==0
        ld      a,#0
        ret     z
        ld      a,#-1
        ret
lpt_write_byte:
        call    dev_printer_busy
        ret     c
        jr      nz,lpt_write_byte
        ld      a,c
        out     (CEN_DATA),a
        ld      a,(cfg20_settings)
        set     2,a                                     ;CEN_STROBE=1
        out     (CFG20),a
        res     2,a                                     ;CEN_STROBE=0
        out     (CFG20),a
_m26:
        in      a,(STATUS30)
        bit     2,a                                     ;_CEN_ACKNOWLEDGE==0
        jr      nz,_m25
        ret
_m25:
        call    brk_exit
        ret     c
        jr      _m26
com_tx_ready:
        in      a,(0x41)                                
        call    _m30
        jr      z,com_tx_ready
        jr      _m27
com_write_byte:
        call    _m31
        ret     c
        jr      z,com_write_byte
_m27:
        ld      a,c
        out     (0x40),a                                
        ret
com_read_byte:
        call    com_rx_ready
        ret     c
        jr      z,com_read_byte
        in      a,(0x40)                                
        ret
_m31:
        call    brk_exit
        in      a,(UART_CONTROL)
        bit     7,a                                     
        jr      z,_m2f
_m30:
        bit     0,a                                     
        ld      a,#0xff                                 
        ret     nz
_m2f:
        ld      a,#0x00                                 
        ret
com_rx_ready:
        call    brk_exit
        in      a,(0x41)                                
        bit     1,a                                     
        ld      a,#0x00                                 
        ret     z
        ld      a,#0xff                                 
        ret
unreferenced_06:
        ld      a,#0xfe                                 
        out     (UART_CONTROL),a
        ld      a,#0x37                                 
        out     (UART_CONTROL),a
        ld      a,(cfg10_settings)
        res     2,a                                     ;CMT_RS232_SELECT=0
        jr      set_cfg10
init_serial:
        ld      a,#0xee                                 
        out     (UART_CONTROL),a
        ld      a,#0x37                                 
        out     (UART_CONTROL),a
        ld      a,(cfg10_settings)
        set     2,a                                     ;CMT_RS232_SELECT=1
set_cfg10:
        out     (CFG10),a
        ld      (cfg10_settings),a
        ret
unreferenced_07:
        ld      a,(cfg10_settings)
        set     3,a                                     ;CMT_MOTOR_START=1
_ma:
        out     (CFG10),a
        ld      (cfg10_settings),a
        ret
unreferenced_08:
        ld      a,(cfg10_settings)
        res     3,a                                     ;CMT_MOTOR_START=0
        jr      _ma
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
        .dw     erase_rest_of_screen
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
        .dw     ESC_0C_Initialize_Screen_driver
map_ESC_10:
        .db     0x10                                    ;.
        .dw     ESC_10_output_blanks
map_ESC_16:
        .db     0x16                                    ;.
        .dw     esc_16_set_cursor
map_esc_1d:
        .db     0x1d                                    ;.
        .dw     esc_1d_outputs_characters
map_esc_47:
        .db     0x47                                    ;G
        .dw     esc_47_delecte_character_to_column
map_esc_49:
        .db     0x49                                    ;I
        .dw     esc_49_insert_character
map_esc_53:
        .db     0x53                                    ;S
        .dw     esc_53_select_screen_width
map_esc_54:
        .db     0x54                                    ;T
        .dw     esc_set_color_attribute
map_esc_55:
        .db     0x55                                    ;U
        .dw     esc_set_color_attribute
map_esc_56:
        .db     0x56                                    ;V
        .dw     esc_set_screen_attribute
map_esc_59:
        .db     0x59                                    ;Y
        .dw     esc_position_cursor
map_esc_96:
        .db     0x96                                    ;.
        .dw     function_more_0c11
map_esc_9d:
        .db     0x9d                                    ;.
        .dw     function_more_0c12
map_esc_b1:
        .db     0xb1                                    ;1
        .dw     function_more_0c13
map_esc_b2:
        .db     0xb2                                    ;2
        .dw     function_more_0c14
map_esc_d4:
        .db     0xd4                                    ;T
        .dw     function_more_0c15
map_esc_d5:
        .db     0xd5                                    ;U
        .dw     function_more_0c15
map_esc_d9:
        .db     0xd9                                    ;Y
        .dw     function_more_0c17
map_more_codes_end:
        .db     0x00                                    ;.
_m2e:
        cp      #0x01                                   
        jp      nz,_m2d
        xor     a
        ld      (input_mode),a
        ld      (cursor_flag),a
        ld      a,c
        cp      #0x61                                   
        jr      c,_m6
        cp      #0x7b                                   
        jr      nc,_m6
        and     #0x5f                                   
        ld      c,a
_m6:
        ld      hl,#map_esc_list
        call    map_C_to_PTR
        ret     z
        jp      (hl)
_m2d:
        ld      c,a
        xor     a
        ld      (input_mode),a
        ld      hl,#map_more_codes
        call    map_C_to_PTR
        ret     z
        jp      (hl)
input_mode_clear:
        xor     a
        jr      _m2
function_0c:
        ld      a,c
_m2:
        ld      (input_mode),a
        ret
graphic_mode_on:
        ld      a,c
        or      #INPUT_MODE_GRAPH
        ld      (input_mode),a
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
esc_set_color_attribute:
        call    _fetch_color_attribute
        ret     c
        ld      (attrib_tmp),a
        jr      graphic_mode_on
function_more_0c15:
        call    _fetch_color_attribute
        ret     c
        ld      b,a
        ld      a,(screen_driver_settings)
        bit     6,a                                     ;ESC_0C_FB_SAME_COLOR==0
        ld      a,(attrib_tmp)
        jr      nz,_m1
        cp      b
        ret     z
_m1:
        push    af
        ld      a,b
        rlca
        rlca
        rlca
        ld      b,a
        pop     af
        or      b
        ld      b,a
        ld      a,(attrib_color)
        and     #MASK_ATTR
        or      b
        ld      (attrib_color),a
        ld      a,c
        cp      #0xd4                                   
        ret     nz
        ld      a,(attrib_color)
        jp      clear_screen_width_color
esc_set_screen_attribute:
        ld      hl,#attrib_color
        ld      a,(buffer_put_char)
        cp      #'0'
        ret     c
        cp      #'4'
        ret     nc
        rrc     a
        rrc     a
        and     #MASK_ATTR
        ld      b,a
        ld      a,(hl)
        and     #~MASK_ATTR
        or      b
        ld      (hl),a
        ret
_fetch_color_attribute:
        ld      a,(buffer_put_char)
        sub     #0x30
        ret     c
        cp      #8
        ccf
        ret
set_cursor_on:
        ld      b,#CURSOR_BLINK_SLOW
        jr      _crt_set_cursor_register
set_cursor_off:
        ld      b,#CURSOR_INVISIBLE
_crt_set_cursor_register:
        ld      a,(cursor_start)
        and     #MASK_CURSOR_LINE
        or      b
        ld      (cursor_start),a
        ld      b,#REG_10_CURSOR_START
        ld      c,#CRT_REG
        out     (c),b
        inc     c
        out     (c),a
        ret
get_cursor_pos:
        ld      a,#1
        ld      (cursor_flag),a
        ld      c,#CRT_REG
        ld      a,#REG_14_CURSOR_H
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
        ld      d,#HIGH_ZERO
        ld      c,#0
_count_cursor_column:
        or      a
        sbc     hl,de
        jr      c,_column_is_in_C
        inc     c
        jr      _count_cursor_column
_column_is_in_C:
        add     hl,de
        ld      h,c
        ld      (cursor_row_column_rel),hl
        ret
alternate_keyboard_table:
        ld      hl,#kbd_table_lookup
        ld      c,#kbd_table_lookup_size
_exchange_table_entry:
        ld      a,(de)
        ld      b,a
        ld      a,(hl)
        ld      (de),a
        ld      (hl),b
        inc     de
        inc     hl
        dec     c
        jr      nz,_exchange_table_entry
        ret
ESC_0C_Initialize_Screen_driver:
        ld      a,(buffer_put_char)
        ld      (screen_driver_settings),a
        bit     7,a                                     ;ESC_0C_CLS==0
        ret     nz
        jp      chr_clear_screen
function_more_0c13:
        ld      a,c
        ld      (input_mode),a
_m20:
        ld      a,(buffer_put_char)
        cp      #0x1b                                   
        jr      z,_m3
        cp      #0x60                                   
        ret     nc
        call    map_char_to_graphic
        jp      c,m_e81e
        ld      (buffer_put_char),a
        jp      crt_write_char_with_color
_m3:
        ld      a,#INPUT_MODE_32
        ld      (input_mode),a
        ret
; unchecked data source
        .db     0xc9                                    ;I
function_more_0c14:
        ld      a,(buffer_put_char)
        cp      #'2'
        ret     z
        ld      a,#INPUT_MODE_B1
        ld      (input_mode),a
        jr      _m20
esc_position_cursor:
        ld      a,(buffer_put_char)
        cp      #' '
        jr      c,_invalid_cursor_parameter
        cp      #' '+SCREEN_HEIGHT
        jr      nc,_set_cursor_max
        sub     #' '
_set_cursor_tmp:
        ld      (cursor_tmp),a
        jp      graphic_mode_on
_invalid_cursor_parameter:
        xor     a
        jr      _set_cursor_tmp
_set_cursor_max:
        ld      a,#SCREEN_HEIGHT-1
        jr      _set_cursor_tmp
esc_16_set_cursor:
        ld      a,(buffer_put_char)
        or      a
        jr      z,_set_cursor_tmp
        cp      #SCREEN_HEIGHT+1
        jr      nc,_set_cursor_max
        dec     a
        jr      _set_cursor_tmp
function_more_0c17:
        ld      a,(buffer_put_char)
        sub     #' '
        jr      c,_err1
_set_cursor_parameter:
        push    af
        ld      a,(column_count)
        ld      b,a
        pop     af
        cp      b
        jr      nc,_m5
_m4:
        ld      (cursor_column),a
        ld      a,(cursor_tmp)
        ld      (cursor_row),a
        jp      crt_set_cursor
_err1:
        xor     a
        jr      _m4
_m5:
        ld      a,b
        dec     a
        jr      _m4
function_more_0c11:
        ld      a,(buffer_put_char)
        jr      _set_cursor_parameter
write_character:
        push    de
        call    set_cursor_abs
        pop     de
        call    wait_flicker_free
        ld      (hl),e
_cursor_pos_increment:
        ld      a,(cursor_row)
        cp      #SCREEN_HEIGHT-1
        jp      nz,cursor_move_right
        ld      a,(column_count)
        dec     a
        ld      b,a
        ld      a,(cursor_column)
        cp      b
        jp      nz,cursor_move_right
        ret
read_character:
        ld      a,#1
        ld      (cursor_flag),a
        call    set_cursor_abs
        call    wait_flicker_free
        ld      a,(hl)
        ld      (cursor_row_column_rel),a
        jr      _cursor_pos_increment
erase_rest_of_line:
        ld      c,#1
_erase_screen_lines:
        ld      a,(cursor_column)
_erase_rest_of_line:
        push    af
        call    set_cursor_abs
        pop     af
fill_bws_rows:
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
        ld      de,#OFFSET_COLOR
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
        jr      z,_fill_next_line
        inc     hl
        inc     a
        jr      fill_cnt
_fill_next_line:
        dec     c
        ret     z
        xor     a
        inc     hl
        jr      fill_cnt
erase_line:
        ld      a,(cursor_column)
        ld      e,a
        ld      d,#HIGH_ZERO
        or      a
        sbc     hl,de
        xor     a
        ld      c,#1
        jr      _erase_rest_of_line
erase_rest_of_screen:
        ld      a,(cursor_row)
        ld      b,a
        ld      a,#SCREEN_HEIGHT
        sub     b
        ld      c,a
        jr      _erase_screen_lines
esc_47_delecte_character_to_column:
        call    _m7
        ret     c
_move_next_character:
        inc     hl
        call    wait_flicker_free
        ld      a,(hl)
        dec     hl
        ld      (hl),a
        inc     hl
        dec     c
        jr      nz,_move_next_character
_m8:
        call    wait_flicker_free
        ld      (hl),#' '
        ret
esc_49_insert_character:
        call    _m7
        ret     c
        ld      e,a
        ld      d,#HIGH_ZERO
        add     hl,de
_insert_next_character:
        dec     hl
        call    wait_flicker_free
        ld      a,(hl)
        inc     hl
        ld      (hl),a
        dec     hl
        dec     c
        jr      nz,_insert_next_character
        jr      _m8
_m7:
        call    set_cursor_abs
        ld      a,(cursor_column)
        ld      c,a
        ld      a,(column_count)
        ld      b,a
        ld      a,(buffer_put_char)
        cp      b
        jr      nc,_err2
        sub     c
        jr      z,_err2
        ret     c
        ld      c,a
        ret
_err2:
        scf
        ret
ESC_10_output_blanks:
        call    set_cursor_abs
        ld      e,#' '
        ld      a,(buffer_put_char)
_output_chars:
        or      a
        ret     z
        ld      c,a
        ld      a,(column_count)
        ld      b,a
        ld      a,(cursor_column)
_m9:
        call    wait_flicker_free
        ld      (hl),e
        inc     hl
        inc     a
        cp      b
        jr      z,_m21
_m22:
        dec     c
        jr      nz,_m9
_m23:
        ld      (cursor_column),a
        ret
_m21:
        ld      d,#SCREEN_HEIGHT
        ld      a,(cursor_row)
        inc     a
        cp      d
        jr      z,_m24
        ld      (cursor_row),a
        xor     a
        jr      _m22
_m24:
        ld      a,b
        dec     a
        jr      _m23
esc_1d_outputs_characters:
        ld      a,(buffer_put_char)
        ld      (char_tmp),a
        jp      graphic_mode_on
function_more_0c12:
        call    set_cursor_abs
        ld      a,(buffer_put_char)
        ld      e,a
        ld      a,(char_tmp)
        ld      c,a
        jr      _output_chars
esc_53_select_screen_width:
        call    display_inhibit
switch_crt_mode:
        ld      hl,#cfg10_settings
        ld      a,(buffer_put_char)
        cp      #ESC_53_CRT40
        jr      z,_switch_crt40
        cp      #ESC_53_CRT80
        jr      z,_switch_crt80
        jr      _handle_1b53xx_end
_switch_crt40:
        res     0,(hl)                                  ;_CRT80=0
        set     5,(hl)                                  ;MUST_BE_ZERO=1
        ld      ix,#crt_table40
        jr      set_video_mode
_switch_crt80:
        set     0,(hl)                                  ;_CRT80=1
        ld      ix,#crt_table80
set_video_mode:
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
        xor     a
        ld      (0xe463),a                              
        call    chr_clear_screen
_handle_1b53xx_end:
        call    display_enable
        jp      input_mode_clear
crt_table40:
        .db     0x38,0x28,0x2f,0x34,0x1b,0x04,0x18,0x19 ;8(/4....
        .db     0x00,0x0a,0x49,0x0a,0x00,0x00,0x00,0x00 ;..I.....
; unchecked data source
        .db     0x00,0x00                               ;..
crt_table80:
        .db     0x71,0x50,0x5c,0x38,0x1b,0x04,0x18,0x19 ;qP\8....
        .db     0x00,0x0a,0x49,0x0a,0x00,0x00,0x00,0x00 ;..I.....
; unchecked data source
        .db     0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00 ;.. .....
        .db     0x00,0x00,0x00,0xc9,0x66,0x00,0x00,0xc9 ;...If..I
        .db     0x7a,0x00,0x00,0xc9,0x74,0x00,0x00,0xc9 ;z..It..I
        .db     0x20,0x00,0x00,0xc9,0x20,0x00,0x00,0xc9 ; ..I ..I
        .db     0x20,0x00,0x00,0xc9,0x6d,0x00,0x00,0xc9 ; ..Im..I
        .db     0x6f,0x00,0x00                          ;o..
bicom_clr_graphics:
        ld      a,#0x00                                 
        jr      bicom_scheduler
bicom_set_pixel:
        ld      a,#0x01                                 
        jr      bicom_scheduler
bicom_get_pixel:
        ld      a,#0x02                                 
        jr      bicom_scheduler
bicom_draw_line:
        ld      a,#0x03                                 
        jr      bicom_scheduler
bicom_prt_line:
        ld      a,#0x04                                 
        jr      bicom_scheduler
bicom_undoc1:
        ld      a,#0x05                                 
        jr      bicom_scheduler
; unchecked data source
        .db     0xc9,0x00,0x00,0x00,0xc9,0x00,0x00,0x00 ;I...I...
bicom_glp1_prt_gfx:
        .db     0x07,0x1b,0x41,0x05,0x1b,0x4b,0x40,0x01 ;..A..K@.
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
bicom_glp2_prt_2nd_line:
        .db     0x09,0x0d,0x0a,0x1b,0x41,0x06,0x1b,0x4b ;....A..K
        .db     0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x00 ;@.......
bicom_glp3_prt_crlf:
        .db     0x02,0x0d,0x0a,0x42,0x00,0x00,0x00,0x00 ;...B....
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
bicom_glp4_prt_ld:
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
bicom_glp5_prt_ld:
        .db     0x05,0x0d,0x0a,0x1b,0x41,0x0c,0x00,0x00 ;....A...
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
bicom_scheduler:
        call    rom_enable
        call    m_f157
monitor_inhibit:
        push    af
        ld      a,(cfg20_settings)
        set     3,a                                     ;MONINH=1
m_ef9c:
        ld      (cfg20_settings),a
        out     (CFG20),a
        pop     af
        ret
rom_enable:
        push    af
        ld      a,(cfg20_settings)
        res     3,a                                     ;MONINH=0
        set     6,a                                     ;ROM_PACK_EN=1
        jr      m_ef9c
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00                               ;..
wait_fdd_ready:
        in      a,(UPD765_STATE)
        bit     6,a                                     
        jr      nz,wait_fdd_ready
        ret
ENTRY:
        ld      sp,#stack_at_boot
        call    display_inhibit
        call    rom_enable
        call    m_f010
        jp      boot_strap
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00                          ;...
boot:
        ld      de,#boot_strap
        ld      hl,#boot_strap+0x1000
        ld      bc,#boot_rom_ends-boot_strap
        ldir
        jp      ENTRY
boot_rom_ends:
        .db     0x00,0x00                               ;..
boot_rom_extensions:
; unchecked data source
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
m_f010:
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
        and     #MASK_COUNTRY_SELECT
        ret     z
        rra
        rra
        and     #MASK_COUNTRY_BITS
        cp      #COUNTRY_DE
        call    z,set_german_ascii_range
        cp      #COUNTRY_US
        call    z,_patch_localization_us
        cp      #COUNTRY_FR
        call    z,_patch_localization_fr
        cp      #COUNTRY_UK
        call    z,_patch_localization_uk
        cp      #COUNTRY_IT
        call    z,_patch_localization_it
        cp      #COUNTRY_ES
        call    z,_patch_localization_es
        cp      #COUNTRY_07
        call    z,_patch_localization_07
        ld      de,#kbd_table_lookup_size
        ld      hl,#kbd_table_int
get_kbd_table_address:
        dec     a
        jr      z,copy_kbd_table
        add     hl,de
        jr      get_kbd_table_address
copy_kbd_table:
        ld      de,#kbd_table_lookup
        ld      bc,#kbd_table_lookup_size
        ldir
        ret
init_crt_param:
        in      a,(STATUS10)
        bit     6,a                                     ;_CRT_NTSC==0
        ret     z
        call    m_f505
        ld      hl,#crt_table_ntsc
        ld      de,#crt_table40
        ld      bc,#crt_table_ntsc_size
        ldir
        ret
init_pic:
        ld      a,#0x16                                 
        out     (PIC_ICW1),a
        ld      a,#0xef                                 
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
_m28:
        in      a,(UPD765_MAIN_STATUS)
        bit     7,a                                     ;RQM_Request_for_master==0
        jr      z,_m28
        pop     af
        out     (UPD765_DATA),a
        ret
fdc_read_byte:
        in      a,(UPD765_MAIN_STATUS)
        add     a,#0x40                                 
        jr      nc,fdc_read_byte
        in      a,(UPD765_DATA)
        ret
fdc_read_boot_sector:
        xor     a
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
_m29:
        ld      a,#FDC_CMD_SENSE_INTERRUPT_STATE
        call    fdc_write_byte
        call    fdc_read_byte
        cp      #0x80                                   
        jr      z,_m29
        call    fdc_read_byte
        ld      a,#0x44                                 
        out     (DMA_MODE_SET),a
        ld      c,#0x09                                 
_m2a:
        call    fdc_write_byte_ix
        dec     c
        jr      nz,_m2a
        call    dev_fdd_wait_ready
        call    fdc_read_byte
        and     #0xc0                                   
        jr      nz,fdc_read_boot_sector
        ld      c,#0x06                                 
_m2b:
        call    fdc_read_byte
        dec     c
        jr      nz,_m2b
        jp      ram_boot
kbd_adjust_keyboard_table:
        ld      hl,#kbc_cpm_control_keys
        ld      de,#kbd_table_lookup+KBD_POSITION_LEFT-1
        ld      bc,#kbc_cpm_control_keys_size
        ldir
        ld      de,#kbd_table_lookup+0x60+KBD_POSITION_LEFT-1
        ld      bc,#kbc_cpm_control_keys_shift_size
        ldir
        ld      hl,#cpm_special_character_mods
        ld      de,#asc_12
        ld      c,#cpm_special_character_mods_size
_m2c:
        ld      a,(hl)
        ld      (de),a
        inc     hl
        inc     de
        inc     de
        inc     de
        dec     c
        jr      nz,_m2c
        ret
set_german_ascii_range:
        push    af
        ld      a,#GERMAN_MAX_ASCII_CODE
        ld      (opcode_compare+1),a
        pop     af
        ret
_patch_localization_us:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
_patch_localization_fr:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
_patch_localization_uk:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
_patch_localization_it:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
_patch_localization_es:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
_patch_localization_07:
        ret
; unchecked data source
        .db     0x00,0x00                               ;..
m_f157:
        or      a
        jp      z,bicom_int_clr
        cp      #0x01                                   
        jr      z,bicom_int_set_pixel
        cp      #0x02                                   
        jr      z,bicom_int_get_pixel
        cp      #0x03                                   
        jp      z,bicom_int_draw_line
        cp      #0x04                                   
        jp      z,bicom_int_prt_line
        cp      #0x05                                   
        jp      z,m_f4e0
        ret
bicom_int_get_pixel:
        call    m_f1cc
        push    bc
        call    m_f1b0
        pop     hl
        ld      (hl),a
        ret
bicom_int_set_pixel:
        call    m_f1cc
        ld      (0xefb0),hl                             
        ld      (0xefb4),de                             
        ld      a,(bc)
        ld      (0xefba),a                              
m_f18b:
        call    m_f1f3
        jr      nc,m_f19a
        rla
        rla
        rla
        rla
        and     #0x70                                   
        ld      b,#0x07                                 
        jr      m_f19e
m_f19a:
        and     #0x07                                   
        ld      b,#0x70                                 
m_f19e:
        ld      c,a
m_f19f:
        in      a,(0x10)                                
        rla
        jr      c,m_f19f
m_f1a4:
        in      a,(0x10)                                
        rla
        jr      nc,m_f1a4
        in      a,(0x00)                                
        and     b
        or      c
        out     (0x00),a                                
        ret
m_f1b0:
        call    m_f1f3
        push    af
m_f1b4:
        in      a,(0x10)                                
        rla
        jr      c,m_f1b4
m_f1b9:
        in      a,(0x10)                                
        rla
        jr      nc,m_f1b9
        in      a,(0x00)                                
        ld      b,a
        pop     af
        ld      a,b
        jr      nc,m_f1c9
        rra
        rra
        rra
        rra
m_f1c9:
        and     #0x07                                   
        ret
m_f1cc:
        push    bc
        push    de
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        pop     hl
        push    de
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        ld      hl,#0x0107                              
        xor     a
        sbc     hl,de
        jr      nc,m_f1e1
        ld      de,#0x0107                              
m_f1e1:
        ex      de,hl
        pop     de
        push    hl
        ld      hl,#0x013f                              
        xor     a
        sbc     hl,de
        jr      nc,m_f1ef
        ld      de,#0x013f                              
m_f1ef:
        ex      de,hl
        pop     de
        pop     bc
        ret
m_f1f3:
        push    af
        push    hl
        ex      de,hl
        push    hl
        add     hl,hl
        add     hl,hl
        add     hl,hl
        push    hl
        add     hl,hl
        push    hl
        add     hl,hl
        pop     de
        add     hl,de
        pop     de
        add     hl,de
        pop     de
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        pop     bc
        inc     bc
        ld      a,b
        rra
        ld      a,c
        rra
        push    af
        ld      h,#0x00                                 
        ld      l,a
        add     hl,de
        ld      de,#0x1d92                              
        add     hl,de
        ld      a,h
        out     (0x02),a                                
        ld      a,l
        out     (0x01),a                                
        pop     af
        pop     bc
        ld      a,b
        ret
bicom_int_clr:
        xor     a
        out     (0x03),a                                
        ld      a,(hl)
        and     #0x07                                   
        ld      b,a
        add     a,a
        add     a,a
        add     a,a
        add     a,a
        add     a,b
        ld      d,a
        ld      hl,#0x1d92                              
        ld      bc,#BICOM_HEIGHT
m_f233:
        ld      e,#0xa2                                 
m_f235:
        ld      a,h
        out     (0x02),a                                
        ld      a,l
        out     (0x01),a                                
        ld      a,d
        out     (0x00),a                                
        inc     hl
        dec     e
        jr      nz,m_f235
        push    de
        ld      de,#0x0042                              
        add     hl,de
        pop     de
        dec     bc
        ld      a,b
        or      c
        jr      nz,m_f233
m_f24d:
        in      a,(STATUS30)
        bit     1,a                                     
        jr      nz,m_f24d
m_f253:
        in      a,(STATUS30)
        bit     1,a                                     ;_CRT_VSYNC_PERIOD==0
        jr      z,m_f253
        ld      a,#0x01                                 
        out     (0x03),a                                
        ret
bicom_int_draw_line:
        ld      a,(bc)
        and     #0x0f                                   
        ld      (0xefad),a                              
        xor     a
        ld      (0xefae),a                              
        ld      (0xefaf),a                              
        call    m_f1cc
        ld      (0xefb6),hl                             
        ex      de,hl
        ld      (0xefb8),hl                             
        push    hl
        ld      hl,(0xefb0)                             
        call    m_f337
        ld      (0xefbb),a                              
        pop     de
        push    hl
        ld      hl,(0xefb4)                             
        call    m_f337
        ld      (0xefbc),a                              
        ld      (0xefbd),hl                             
        pop     de
        ld      a,d
        or      e
        jp      z,m_f2e6
        call    m_f3a0
        ld      hl,#0x0000                              
        ld      a,(0xefbc)                              
        or      a
        jr      nz,m_f2a1
        ld      h,#0x80                                 
m_f2a1:
        ld      (0xefb2),hl                             
        ld      hl,(0xefb4)                             
        ld      (0xefbf),hl                             
m_f2aa:
        call    m_f343
        ld      hl,(0xefb4)                             
        ld      de,(0xefbf)                             
        ld      (0xefbf),hl                             
        xor     a
        sbc     hl,de
        jr      z,m_f2c3
        call    m_f37f
        ld      (0xefbf),de                             
m_f2c3:
        call    m_f2f2
        xor     a
        ld      hl,(0xefb0)                             
        ld      de,(0xefb6)                             
        sbc     hl,de
        ret     z
        ld      hl,(0xefb0)                             
        ld      a,(0xefbb)                              
        or      a
        jr      nz,m_f2dd
        dec     hl
        jr      m_f2de
m_f2dd:
        inc     hl
m_f2de:
        ld      (0xefb0),hl                             
        call    m_f343
        jr      m_f2aa
m_f2e6:
        ld      hl,(0xefb4)                             
        ld      (0xefbf),hl                             
        ld      hl,(0xefb8)                             
        ld      (0xefb4),hl                             
m_f2f2:
        ld      a,(0xefad)                              
        or      a
        jr      z,m_f316
        ld      b,a
        ld      a,(0xefae)                              
        cp      b
        jr      nz,m_f30c
        ld      a,(0xefaf)                              
        cpl
        ld      (0xefaf),a                              
        xor     a
        ld      (0xefae),a                              
        jr      m_f2f2
m_f30c:
        inc     a
        ld      (0xefae),a                              
        ld      a,(0xefaf)                              
        or      a
        jr      nz,m_f323
m_f316:
        ld      hl,(0xefb0)                             
        ld      de,(0xefbf)                             
        ld      a,(0xefba)                              
        call    m_f18b
m_f323:
        xor     a
        ld      de,(0xefbf)                             
        ld      hl,(0xefb4)                             
        sbc     hl,de
        ret     z
        call    m_f37f
        ld      (0xefbf),de                             
        jr      m_f2f2
m_f337:
        xor     a
        sbc     hl,de
        ret     nc
        ld      de,#0x0001                              
        ex      de,hl
        sbc     hl,de
        dec     a
        ret
m_f343:
        ld      hl,(0xefb2)                             
        ld      a,(0xefbc)                              
        or      a
        jr      nz,m_f365
        xor     a
        ld      de,(0xefc1)                             
        sbc     hl,de
        ld      (0xefb2),hl                             
        ld      hl,(0xefb4)                             
        ld      de,(0xefc3)                             
        sbc     hl,de
        ex      de,hl
        call    m_f386
        jr      m_f37a
m_f365:
        ld      de,(0xefc1)                             
        add     hl,de
        ld      (0xefb2),hl                             
        ld      hl,(0xefb4)                             
        ld      de,(0xefc3)                             
        adc     hl,de
        ex      de,hl
        call    m_f394
m_f37a:
        ld      (0xefb4),de                             
        ret
m_f37f:
        ld      a,(0xefbc)                              
        or      a
        jr      nz,m_f393
        dec     de
m_f386:
        bit     7,d                                     
        jr      nz,m_f39b
        xor     a
        ld      hl,(0xefb8)                             
        sbc     hl,de
        ret     c
        jr      m_f39b
m_f393:
        inc     de
m_f394:
        xor     a
        ld      hl,(0xefb8)                             
        sbc     hl,de
        ret     nc
m_f39b:
        ld      de,(0xefb8)                             
        ret
m_f3a0:
        ld      hl,#0x0000                              
        ld      (0xefbf),hl                             
        ld      (0xefc1),hl                             
        ld      (0xefc3),hl                             
        ld      c,#0x20                                 
m_f3ae:
        or      a
        ld      hl,(0xefbf)                             
        sbc     hl,de
        jr      nc,m_f3e3
        push    de
        ld      b,#0x00                                 
m_f3b9:
        ld      hl,(0xefc1)                             
        add     hl,hl
        ld      (0xefc1),hl                             
        ld      hl,(0xefc3)                             
        adc     hl,hl
        ld      (0xefc3),hl                             
        ld      a,(0xefc1)                              
        or      b
        ld      (0xefc1),a                              
        ld      hl,(0xefbd)                             
        add     hl,hl
        ld      (0xefbd),hl                             
        ld      hl,(0xefbf)                             
        adc     hl,hl
        ld      (0xefbf),hl                             
        pop     de
        dec     c
        jr      nz,m_f3ae
        ret
m_f3e3:
        ld      (0xefbf),hl                             
        push    de
        ld      b,#0x01                                 
        jr      m_f3b9
bicom_int_prt_line:
        ld      a,(hl)
        cp      #0x18                                   
        jr      c,m_f3f2
        ld      a,#0x17                                 
m_f3f2:
        ld      (0xefbd),a                              
        ld      b,a
        ld      a,#0x19                                 
        sub     b
        ld      b,a
        ld      a,(de)
        or      a
        ld      hl,#0xef80                              
        jp      z,m_f4d1
        cp      b
        jr      c,m_f407
        ld      a,b
        dec     a
m_f407:
        ld      (0xefbe),a                              
m_f40a:
        ld      hl,#0xef40                              
        call    m_f4d1
        ld      a,(0xefbd)                              
        ld      l,a
        ld      h,#0x00                                 
        push    hl
        add     hl,hl
        push    hl
        add     hl,hl
        add     hl,hl
        pop     de
        in      a,(0x10)                                
        bit     6,a                                     
        jr      nz,m_f423
        add     hl,de
m_f423:
        pop     de
        add     hl,de
        ex      de,hl
        ld      hl,#0x0000                              
m_f429:
        push    de
        in      a,(0x10)                                
        bit     6,a                                     
        ld      c,#0x04                                 
        jr      nz,m_f434
        ld      c,#0x06                                 
m_f434:
        call    m_f48f
        ld      de,#0x013f                              
        ex      de,hl
        xor     a
        sbc     hl,de
        jr      z,m_f445
        ex      de,hl
        inc     hl
        pop     de
        jr      m_f429
m_f445:
        ld      hl,#0xef50                              
        call    m_f4d1
        pop     de
        in      a,(0x10)                                
        bit     6,a                                     
        ld      hl,#0x0004                              
        jr      nz,m_f457
        ld      l,#0x06                                 
m_f457:
        add     hl,de
        ex      de,hl
        ld      hl,#0x0000                              
m_f45c:
        push    de
        ld      c,#0x05                                 
        call    m_f48f
        ld      de,#0x013f                              
        ex      de,hl
        xor     a
        sbc     hl,de
        jr      z,m_f470
        ex      de,hl
        inc     hl
        pop     de
        jr      m_f45c
m_f470:
        pop     de
        ld      a,(0xefbe)                              
        dec     a
        jr      z,m_f489
        ld      (0xefbe),a                              
        ld      hl,#0xef60                              
        call    m_f4d1
        ld      a,(0xefbd)                              
        inc     a
        ld      (0xefbd),a                              
        jr      m_f40a
m_f489:
        ld      hl,#0xef70                              
        jp      m_f4d1
m_f48f:
        xor     a
m_f490:
        ld      (0xefbf),a                              
        push    hl
        push    de
        push    bc
        call    m_f1b0
        ld      b,#0x00                                 
        or      a
        jr      z,m_f49f
        inc     b
m_f49f:
        ld      a,(0xefbf)                              
        add     a,a
        add     a,b
        pop     bc
        pop     de
        pop     hl
        inc     de
        dec     c
        jr      nz,m_f490
        ld      c,a
        ld      a,(0xefc5)                              
        or      a
        jr      z,m_f4c0
        ld      a,c
        ld      b,#0x08                                 
        ld      c,#0x00                                 
m_f4b7:
        rra
        ld      d,a
        ld      a,c
        rla
        ld      c,a
        ld      a,d
        dec     b
        jr      nz,m_f4b7
m_f4c0:
        push    hl
        call    dev_printer_write_byte
        ld      a,(0xefc6)                              
        or      a
        jr      z,m_f4cf
        ld      c,#0x00                                 
        call    dev_printer_write_byte
m_f4cf:
        pop     hl
        ret
m_f4d1:
        ld      a,(hl)
m_f4d2:
        or      a
        ret     z
        inc     hl
        ld      c,(hl)
        push    hl
        push    af
        call    dev_printer_write_byte
        pop     af
        pop     hl
        dec     a
        jr      m_f4d2
m_f4e0:
        ld      a,(hl)
        or      a
        jr      z,m_f4f9
        cp      #0x01                                   
        jr      z,m_f4fe
        cp      #0x02                                   
        jr      z,m_f505
        cp      #0x03                                   
        jr      z,m_f50c
        cp      #0x04                                   
        jr      z,m_f514
        cp      #0x05                                   
        jr      z,m_f51d
        ret
m_f4f9:
        ld      hl,(0xe437)                             
        jr      m_f501
m_f4fe:
        ld      hl,(0xe43d)                             
m_f501:
        ld      (0xe43a),hl                             
        ret
m_f505:
        xor     a
        ld      b,a
        ld      hl,#0xf53a                              
        jr      m_f523
m_f50c:
        xor     a
        ld      b,#0xff                                 
        ld      hl,#0xf5da                              
        jr      m_f523
m_f514:
        ld      a,#0xff                                 
        ld      b,#0x00                                 
        ld      hl,#0xf5da                              
        jr      m_f523
m_f51d:
        ld      a,#0xff                                 
        ld      b,a
        ld      hl,#0xf67a                              
m_f523:
        ld      (0xefc5),a                              
        ld      a,b
        ld      (0xefc6),a                              
        ld      de,#0xef40                              
        ld      bc,#0x0050                              
        in      a,(STATUS10)
        bit     6,a                                     
        jr      z,m_f537
        add     hl,bc
m_f537:
        ldir
        ret
; unchecked data source
        .db     0x07,0x1b,0x41,0x05,0x1b,0x4b,0x40,0x01 ;..A..K@.
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x09,0x0d,0x0a,0x1b,0x41,0x06,0x1b,0x4b ;....A..K
        .db     0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x00 ;@.......
        .db     0x02,0x0d,0x0a,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x05,0x0d,0x0a,0x1b,0x41,0x0c,0x00,0x00 ;....A...
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x07,0x1b,0x41,0x05,0x1b,0x4b,0x40,0x01 ;..A..K@.
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x09,0x0d,0x0a,0x1b,0x41,0x04,0x1b,0x4b ;....A..K
        .db     0x40,0x01,0x00,0x00,0x00,0x00,0x00,0x00 ;@.......
        .db     0x02,0x0d,0x0a,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x05,0x0d,0x0a,0x1b,0x41,0x0c,0x00,0x00 ;....A...
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
        .db     0x33,0x32,0x30,0x00,0x00,0x00,0x00,0x00 ;320.....
        .db     0x0c,0x0d,0x0a,0x1b,0x54,0x31,0x32,0x1b ;....T12.
        .db     0x53,0x30,0x33,0x32,0x30,0x00,0x00,0x00 ;S0320...
        .db     0x02,0x0d,0x0a,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x00 ;....T24.
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
        .db     0x33,0x32,0x30,0x00,0x00,0x00,0x00,0x00 ;320.....
        .db     0x0c,0x0d,0x0a,0x1b,0x54,0x30,0x38,0x1b ;....T08.
        .db     0x53,0x30,0x33,0x32,0x30,0x00,0x00,0x00 ;S0320...
        .db     0x02,0x0d,0x0a,0x09,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x20 ;....T24 
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
        .db     0x36,0x34,0x30,0x09,0x00,0x00,0x00,0x00 ;640.....
        .db     0x0c,0x0d,0x0a,0x1b,0x54,0x31,0x32,0x1b ;....T12.
        .db     0x53,0x30,0x36,0x34,0x30,0x0a,0x00,0x00 ;S0640...
        .db     0x02,0x0d,0x0a,0x30,0x00,0x00,0x00,0x00 ;...0....
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x37 ;....T247
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x0a,0x1b,0x54,0x31,0x30,0x1b,0x53,0x30 ;..T10.S0
        .db     0x36,0x34,0x30,0x20,0x00,0x00,0x00,0x00 ;640 ....
        .db     0x0c,0x0d,0x0a,0x1b,0x54,0x30,0x38,0x1b ;....T08.
        .db     0x53,0x30,0x36,0x34,0x30,0x20,0x00,0x00 ;S0640 ..
        .db     0x02,0x0d,0x0a,0x20,0x00,0x00,0x00,0x00 ;... ....
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x01,0x0d,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x06,0x0d,0x0a,0x1b,0x54,0x32,0x34,0x20 ;....T24 
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
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
        .db     0x38,0x28,0x2f,0x34,0x1c,0x01,0x18,0x19 ;8(/4....
        .db     0x00,0x08,0x48,0x09,0x00,0x00,0x00,0x00 ;..H.....
        .db     0x00,0x00,0x71,0x50,0x5c,0x38,0x1c,0x01 ;..qP\8..
        .db     0x18,0x19,0x00,0x08,0x48,0x09,0x00,0x00 ;....H...
        .db     0x00,0x00,0x00,0x00                     ;....
kbc_cpm_control_keys:
        .db     0x8b,0x82,0x08,0x89,0x84,0xff,0x7f,0x1b ;........
        .db     0xff,0x96,0xff,0x09,0x0d,0xdf,0x8f,0x03 ;....._..
        .db     0xff,0xff,0x8c,0x8a,0x88,0x87,0x86,0x85 ;........
kbc_cpm_control_keys_shift:
        .db     0xec,0xef,0xee,0xed,0x84,0xff,0x7f,0x1b ;lonm....
        .db     0xff,0x95,0xff,0x09,0x0d,0xdf,0x0c,0x03 ;....._..
        .db     0xff,0xff,0x80,0x94,0x93,0x92,0x91,0x90 ;........
cpm_special_character_mods:
        .db     0x95,0x82,0x08,0x89,0x8b,0x96,0x1c,0x12 ;........
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
; unchecked data source
        .db     0x48,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;H.......
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........
        .db     0x00,0x00,0x00,0x00,0x00                ;.....
version:
        .db     0x30,0x37,0x2e,0x30,0x39,0x2e,0x38,0x35 ;07.09.85
        .db     0x54,0x41,0x50,0x43,0x47,0x56,0x32,0x00 ;TAPCGV2.
; end of source

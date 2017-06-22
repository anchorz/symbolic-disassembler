;**********************************
;
; minefield.z80
;
; erstellt am: 2017-06-22 11:30:03
;
;**********************************
; memory layout
PRG_START       .equ 0x0100
INTERNAL_ARRAY  .equ 0x1400
LOG_BUFFER      .equ 0x2000
LOG_BUFFER_INIT .equ (LOG_BUFFER-1)
SIZE_64K        .equ 0xffff
BWS_ADR_POINTS  .equ 0xec39
BWS_ADR_MINES   .equ 0xec29
BWS_ADR_HINT    .equ 0xec62
BWS_ADR_BONUS_L .equ 0xee06
BWS_ADR_BONUS_R .equ 0xee19
BWS_A_SIE_HABEN .equ 0xed2a
BWS_A_PUNKTE_ER .equ 0xeda7
BWS_A_TOTAL_POI .equ 0xed6d
BWS_A_NOCH_EIN  .equ 0xee88
BWS_A_JA        .equ 0xeece
INT_ADR_BONUS_L .equ 0x1566
INT_ADR_BONUS_R .equ 0x1579
BWS             .equ 0xec00
BWS_LINE_WIDTH  .equ 32
BWS_SIZE        .equ 0x0400
up_inch         .equ 0xf20c ;monitor 2.02/brosig
KEY_UP       .equ 'G' ; G
KEY_LEFT     .equ 'P' ; P
KEY_RIGHT    .equ 'Q' ; Q
KEY_DOWN     .equ 'O' ; O
KEY_START    .equ 'S' ; O
KEY_QUIT     .equ 0x05 ; ^E
KEY_NEXT     .equ 0x0A ; ^J
CHR_VISITED  .equ 0xff
CHR_FREE     .equ ' '
CHR_BONUS    .equ 0xca
CHR_MAN      .equ 0x17
CHR_MINE     .equ 0xc9
RECORD_UP    .equ 0x01
RECORD_DOWN  .equ 0x02
RECORD_RIGHT .equ 0x03
RECORD_LEFT  .equ 0x04
RECORD_END   .equ 0x37
IS_FREE      .equ 0x00
IS_MINE      .equ 0x64
NO_MINE      .equ 0x00
RANDOM_INIT  .equ 0x0555
RANDOM_MASK  .equ >(BWS_SIZE-1)
REMOVE_OFFSET   .equ BWS+(START_ROW-2)*BWS_LINE_WIDTH-1
SET_TO_ZERO     .equ 0x0000
WAIT_750MS      .equ 0xea60; 2 MHz
WAIT_250MS      .equ 0x4e20; 2 MHz
WAIT_130MS      .equ 0x2710; 2 MHz
REC_DELAY_190MS .equ 0x3a98; 2 MHz
WAVE_LEN_285Hz  .equ 0x64; 2 MHz
WAVE_PERIODS    .equ 0x50; 2 MHz
QUIT_SOUND_P1   .equ 0x60
QUIT_SOUND_P2   .equ 0xe0
QUIT_SOUND_P3   .equ 0x01
QUIT_SOUND_P4   .equ 0xee
BLINK_COUNTER   .equ 10
TAPE_OUT        .equ 0x80
PIOB_DATA       .equ 0x02
START_ROW       .equ 30
START_COLUMN    .equ 15
END_ROW         .equ 5
END_COLUMN      .equ 15
MINEFIELD_WIDTH .equ BWS_LINE_WIDTH-2
PEBBLE          .equ 0x17
size_of_vorsicht_minen .equ 20
size_of_sie_haben      .equ 12
size_of_punkte_erreich .equ 18
size_of_noch_ein_spiel .equ 16

.area   CODE1   (ABS)
.org 0x0100
START:
        call show_title
wait_to_start:
        call up_inch
        cp #KEY_START
        jr nz,wait_to_start
new_game:
        ld hl,#RANDOM_INIT
        ld (ptr_random_buffer),hl
        call clear_data
        ld hl,#SET_TO_ZERO
        ld (points_count),hl
        ld hl,#50
        ld (mines_count),hl
start_level:
        ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
        ld (ptr_cursor),hl
        ld hl,#INTERNAL_ARRAY+(START_ROW-END_ROW)*BWS_LINE_WIDTH+START_COLUMN
        ld (ptr_internal_array),hl
        ld hl,#LOG_BUFFER_INIT
        ld (ptr_log_buffer),hl
        call clear_screen
        call show_empty_field
        ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
        ld a,#PEBBLE
        ld (hl),a
        ld hl,(points_count)
        ld de,#BWS_ADR_POINTS
        call hex2int
        ld hl,(mines_count)
        ld de,#BWS_ADR_MINES
        call hex2int
        call check_for_bonus
        call distribute_mines
main_loop:
        call up_inch
        cp #KEY_UP
        call z,do_up
        cp #KEY_DOWN
        call z,do_down
        cp #KEY_RIGHT
        call z,do_right
        cp #KEY_LEFT
        call z,do_left
        call click_sound
        cp #KEY_QUIT
        jp z,do_quit
        cp #KEY_NEXT
        jp z,do_skip_level
        ld bc,#WAIT_250MS
        call wait
        jp main_loop
do_up:
        call clear_status_line
        ld hl,(ptr_cursor)
        ld a,#CHR_VISITED
        ld (hl),a
        ld bc,#BWS_LINE_WIDTH
        sbc hl,bc
        ld a,(hl)
        cp #CHR_FREE
        jr z,test_end_up
        cp #CHR_VISITED
        jr z,test_end_up
        cp #CHR_BONUS
        jr z,add_bonus_up
        add hl,bc
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
add_bonus_up:
        call show_points_plus_100
test_end_up:
        ld bc,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
        sbc hl,bc
        jr nz,continue_up
        ld a,#KEY_NEXT
        ret
continue_up:
        add hl,bc
        ld bc,#BWS_LINE_WIDTH
        ld de,(ptr_internal_array)
        ex de,hl
        sbc hl,bc
        ex de,hl
        ld (ptr_internal_array),de
        ld a,(de)
        cp #IS_MINE
        jr nz,update_screen_up
        ld a,#KEY_QUIT
        ret
update_screen_up:
        call count_mines
        cp #NO_MINE
        call nz,print_mines_count
        ld a,#RECORD_UP
        call append_key
        ld (ptr_cursor),hl
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
count_mines:
        ex de,hl
        push de
        ld d,#SET_TO_ZERO
        ld bc,#BWS_LINE_WIDTH
        add hl,bc
        call test_inc_mine_count
        ld hl,(ptr_internal_array)
        dec hl
        call test_inc_mine_count
        ld hl,(ptr_internal_array)
        ld b,#BWS_LINE_WIDTH
$sub_line_width_up:
        dec hl
        djnz $sub_line_width_up
        call test_inc_mine_count
        ld hl,(ptr_internal_array)
        inc hl
        call test_inc_mine_count
        dec hl
        ld a,d
        pop de
        ex de,hl
        ret
test_inc_mine_count:
        ld a,(hl)
        cp #IS_MINE
        ret nz
        inc d
        ret
do_down:
        call clear_status_line
        ld hl,(ptr_cursor)
        ld a,#CHR_VISITED
        ld (hl),a
        ld bc,#BWS_LINE_WIDTH
        add hl,bc
        ld a,(hl)
        cp #CHR_FREE
        jr z,test_end_down
        cp #CHR_VISITED
        jr z,test_end_down
        cp #CHR_BONUS
        jr z,add_bonus_down
        ld b,#BWS_LINE_WIDTH
$sub_line_width_down:
        dec hl
        djnz $sub_line_width_down
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
add_bonus_down:
        call show_points_plus_100
test_end_down:
        ld de,(ptr_internal_array)
        ld bc,#BWS_LINE_WIDTH
        ex de,hl
        add hl,bc
        ex de,hl
        ld (ptr_internal_array),de
        ld a,(de)
        cp #IS_MINE
        jr nz,update_screen_down
        ld a,#KEY_QUIT
        ret
update_screen_down:
        call count_mines
        cp #NO_MINE
        call nz,print_mines_count
        ld a,#RECORD_DOWN
        call append_key
        ld (ptr_cursor),hl
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
do_right:
        call clear_status_line
        ld hl,(ptr_cursor)
        ld a,#CHR_VISITED
        ld (hl),a
        inc hl
        ld a,(hl)
        cp #CHR_FREE
        jr z,test_end_right
        cp #CHR_VISITED
        jr z,test_end_right
        cp #CHR_BONUS
        jr z,add_bonus_right
        dec hl
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
add_bonus_right:
        call show_points_plus_100
test_end_right:
        ld de,(ptr_internal_array)
        inc de
        ld (ptr_internal_array),de
        ld a,(de)
        cp #IS_MINE
        jr nz,update_screen_right
        ld a,#KEY_QUIT
        ret
update_screen_right:
        call count_mines
        cp #NO_MINE
        call nz,print_mines_count
        ld a,#RECORD_RIGHT
        call append_key
        ld (ptr_cursor),hl
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
do_left:
        call clear_status_line
        ld hl,(ptr_cursor)
        ld a,#CHR_VISITED
        ld (hl),a
        dec hl
        ld a,(hl)
        cp #CHR_FREE
        jr z,test_end_left
        cp #CHR_VISITED
        jr z,test_end_left
        cp #CHR_BONUS
        jr z,add_bonus_left
        inc hl
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
add_bonus_left:
        call show_points_plus_100
test_end_left:
        ld de,(ptr_internal_array)
        dec de
        ld (ptr_internal_array),de
        ld a,(de)
        cp #IS_MINE
        jr nz,update_screen_left
        ld a,#KEY_QUIT
        ret
update_screen_left:
        call count_mines
        cp #NO_MINE
        call nz,print_mines_count
        ld a,#RECORD_LEFT
        call append_key
        ld (ptr_cursor),hl
        ld a,#CHR_MAN
        ld (hl),a
        xor a
        ret
do_skip_level:
        ld a,#RECORD_END
        call append_key
        call clear_screen
        call show_empty_field
        call show_mine_field
        call show_recording_history
        ld hl,#(BWS+END_ROW*BWS_LINE_WIDTH+END_COLUMN)
        call show_win_animation
        call clear_data
        call clear_screen
        call points_plus_50
        call points_plus_25
        jp start_level
clear_screen:
        push hl
        push de
        push bc
        ld a,#' '
        ld hl,#BWS
        ld (hl),a
        ld de,#BWS+1
        ld bc,#BWS_SIZE-1
        ldir
        xor a
        pop bc
        pop de
        pop hl
        ret
show_win_animation:
        push de
        push bc
        ld a,(hl)
        ld c,a
        ld b,#BLINK_COUNTER
animate_end:
        ld a,#CHR_VISITED
        ld (hl),a
        ld de,#WAIT_250MS
animate$delay_visited:
        dec de
        xor a
        cp d
        jr nz,animate$delay_visited
        ld a,#CHR_FREE
        ld (hl),a
        ld de,#WAIT_250MS
animate$delay_free:
        dec de
        xor a
        cp d
        jr nz,animate$delay_free
        djnz animate_end
        ld a,c
        ld (hl),a
        pop bc
        pop de
        ret
show_empty_field:
        push hl
        push de
        push bc
        ld hl,#txt_empty_screen
        ld de,#BWS
        ld bc,#BWS_SIZE
        ldir
        pop bc
        pop de
        pop hl
        ret
show_mine_field:
        push hl
        push de
        push bc
        ld hl,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
        ld de,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
        ld c,#START_ROW-END_ROW-4; NET HEIGHT MINEFIELD
$show_new_line:
        ld b,#MINEFIELD_WIDTH
$get_character:
        inc hl
        inc de
        ld a,(hl)
        cp #IS_MINE
        jr nz,$draw_character
        ld a,#CHR_MINE
        ld (de),a
$draw_character:
        dec b
        jr nz,$get_character
        push bc
        ld bc,#WAIT_130MS
        call wait
        pop bc
        dec c
        jr nz,line_correction_ptr
        pop bc
        pop de
        pop hl
        ret
line_correction_ptr:
        ld b,#BWS_LINE_WIDTH-MINEFIELD_WIDTH
$correct_ptr:
        inc hl
        inc de
        djnz $correct_ptr
        jr $show_new_line
hex2int:
        xor a
        ld bc,#1000
        call convert_digit_to_ascii
        ld bc,#100
        call convert_digit_to_ascii
        ld bc,#10
        call convert_digit_to_ascii
        ld bc,#1
        call convert_digit_to_ascii
        ret
convert_digit_to_ascii:
        xor a
convert$sub_digit:
        sbc hl,bc
        jr c,convert$hex_to_ascii
        inc a
        jr convert$sub_digit
convert$hex_to_ascii:
        add hl,bc
        add #'0'
        ld (de),a
        inc de
        ret
wait:
        dec bc
        ld a,c
        or b
        jr nz,wait
        ret
clear_status_line:
        ld hl,#BWS_ADR_HINT
        ld de,#BWS_ADR_HINT+1
        ld bc,#BWS_LINE_WIDTH-6; length of field is W-5 - miss by 1
        ldir
        ret
append_key:
        push hl
        ld hl,(ptr_log_buffer)
        inc hl
        ld (hl),a
        ld (ptr_log_buffer),hl
        pop hl
        xor a
        ret
print_mines_count:
        push hl
        push de
        ld hl,#str_vorsicht_minen
        ld de,#BWS_ADR_HINT+1
        ld bc,#size_of_vorsicht_minen
        ldir
        ld hl,#BWS_ADR_HINT+13; '   VORSICHT '
        add #'0'
        ld (hl),a
        pop de
        pop hl
        ret
show_points_plus_100:
        push hl
        push bc
        push de
        ld bc,#100
        ld hl,(points_count)
        add hl,bc
        ld (points_count),hl
        ld de,#BWS_ADR_POINTS
        call hex2int
        pop de
        pop bc
        pop hl
        ret
        .db 0x00                                    ;.        <unchecked>
show_title:
        ld hl,#txt_title
        ld de,#BWS
        ld bc,#BWS_SIZE
        ldir
        ret
check_for_bonus:
        ld hl,(mines_count)
        ld bc,#100
        sbc hl,bc
        ret c
        ld a,#CHR_BONUS
        ld hl,#BWS_ADR_BONUS_L
        ld (hl),a
        ld hl,#BWS_ADR_BONUS_R
        ld (hl),a
        ld hl,#INT_ADR_BONUS_L
        ld (hl),a
        ld hl,#INT_ADR_BONUS_R
        ld (hl),a
        ret
clear_data:
        ld hl,#INTERNAL_ARRAY
        ld a,#IS_FREE
        ld (hl),a
        ld de,#INTERNAL_ARRAY+1
        ld bc,#BWS_LINE_WIDTH*(START_ROW-END_ROW+1)-1
        ldir
        ret
points_plus_50:
        ld hl,(points_count)
        ld bc,#50
        add hl,bc
        ld (points_count),hl
        ret
points_plus_25:
        ld hl,(mines_count)
        ld bc,#25
        add hl,bc
        ld (mines_count),hl
        ret
show_recording_history:
        ld hl,#(BWS+START_ROW*BWS_LINE_WIDTH+START_COLUMN)
        ld de,#LOG_BUFFER
        ld bc,#BWS_LINE_WIDTH
animate_recording:
        push bc
        ld bc,#REC_DELAY_190MS
recording$delay:
        dec bc
        xor a
        cp b
        jr nz,recording$delay
        pop bc
        ld a,(de)
        inc de
        cp #RECORD_UP
        call z,animate_up
        cp #RECORD_DOWN
        call z,animate_down
        cp #RECORD_RIGHT
        call z,animate_right
        cp #RECORD_LEFT
        call z,animate_left
        cp #RECORD_END
        ret z
        jr animate_recording
animate_up:
        ld a,#CHR_VISITED
        ld (hl),a
        ld a,#CHR_MAN
        sbc hl,bc
        ld (hl),a
        ret
animate_down:
        ld a,#CHR_VISITED
        ld (hl),a
        ld a,#CHR_MAN
        add hl,bc
        ld (hl),a
        ret
animate_right:
        ld a,#CHR_VISITED
        ld (hl),a
        ld a,#CHR_MAN
        inc hl
        ld (hl),a
        ret
animate_left:
        ld a,#CHR_VISITED
        ld (hl),a
        ld a,#CHR_MAN
        dec hl
        ld (hl),a
        ret
distribute_mines:
        ld bc,(mines_count)
$put_mine:
        push bc
$generate_random_offset:
        ld bc,(ptr_random_buffer)
        ld a,c
        and #RANDOM_MASK
        ld b,a
        ld a,r
        bit 7,c
        jr nz,$copy_bit_negate
        set 7,a
$copy_bit_negate:
        ld c,a
        ld hl,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
        add hl,bc
        ld (ptr_random_buffer),hl
        ld a,(hl)
        cp #IS_FREE
        jr nz,$generate_random_offset
        ld hl,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
        add hl,bc
        ld a,(hl)
        cp #CHR_FREE
        jr nz,$generate_random_offset
        ld de,#REMOVE_OFFSET
        ex de,hl
        sbc hl,de
        jr c,$generate_random_offset
        ld hl,(ptr_random_buffer)
        ld a,#IS_MINE
        ld (hl),a
        pop bc
        dec bc
        ld a,c
        or b
        jr nz,$put_mine
        ret
do_quit:
        ld a,#RECORD_END
        call append_key
        call quit_sound
        call clear_screen
        call show_empty_field
        call show_mine_field
        call show_recording_history
        call clear_data
        ld bc,#WAIT_750MS
        call wait
        call clear_screen
        jp go_next
go_next:
        ld de,#BWS_A_SIE_HABEN
        ld hl,#str_sie_haben
        ld bc,#size_of_sie_haben
        ldir
        ld de,#BWS_A_PUNKTE_ER
        ld hl,#str_punkte_erreicht
        ld bc,#size_of_punkte_erreich
        ldir
        ld hl,(points_count)
        ld de,#BWS_A_TOTAL_POI
        call hex2int
        ld de,#BWS_A_NOCH_EIN
        ld hl,#str_noch_ein_spiel
        ld bc,#size_of_noch_ein_spiel
        ldir
        ld hl,#BWS_A_JA
        ld a,#'J'
        ld (hl),a
        inc hl
        ld a,#'/'
        ld (hl),a
        inc hl
        ld a,#'N'
        ld (hl),a
        call up_inch
        cp #'J'
        jp z,new_game
        jp kill_all_and_halt
kill_all_and_halt:
        ld a,#SET_TO_ZERO
        ld hl,#PRG_START
        ld (hl),a
        ld de,#PRG_START+1
        ld bc,#SIZE_64K
        ldir
quit_sound:
        ld l,#QUIT_SOUND_P1
        ld d,#QUIT_SOUND_P2
        ld e,#QUIT_SOUND_P3
quit$play_effect1:
        ld c,e
quit$play_period1:
        xor #TAPE_OUT
        out (PIOB_DATA),a
        ld b,d
        nop
        cp #QUIT_SOUND_P4
        add b
        out (PIOB_DATA),a
        ld b,d
quit$play_half_wave1:
        djnz quit$play_half_wave1
        dec c
        jr nz,quit$play_period1
        dec d
        inc e
        dec l
        jr nz,quit$play_effect1
        ld l,#QUIT_SOUND_P1
quit$play_effect2:
        ld c,e
quit$play_period2:
        xor #TAPE_OUT
        out (PIOB_DATA),a
        ld b,d
        nop
        cp #QUIT_SOUND_P4
        add b
        out (PIOB_DATA),a
        ld b,d
quit$play_half_wave2:
        djnz quit$play_half_wave2
        dec c
        jr nz,quit$play_period2
        inc d
        dec e
        dec l
        jr nz,quit$play_effect2
        ret
click_sound:
        push af
        ld b,#WAVE_PERIODS
        xor a
$click_next_period:
        ld c,#WAVE_LEN_285Hz; 1-half wave has 3500 clock cycles
$click_keep_level:
        out (PIOB_DATA),a
        nop
        nop
        dec c
        jr nz,$click_keep_level
        xor #TAPE_OUT
        djnz $click_next_period
        pop af
        ret
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x7f,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00           ;......   <unchecked>
txt_empty_screen:
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x4d,0x49,0x4e,0x45,0x4e ;   MINEN
        .db 0x3a,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;:       
        .db 0x20,0x20,0x50,0x55,0x4e,0x4b,0x54,0x45 ;  PUNKTE
        .db 0x3a,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;:       
        .db 0xa8,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;(       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;        
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;        
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa9 ;       )
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa3,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;#       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa4,0xa0 ;      $ 
        .db 0xa4,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;$       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa5 ;       %
        .db 0xa3,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;#       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xaa,0x20 ;      * 
        .db 0xa7,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;'       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa5 ;       %
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;!       
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xa1 ;       !
        .db 0xa3,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;#       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa9,0x20 ;      ) 
        .db 0xa8,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;(       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa5 ;       %
        .db 0xa1,0x20,0x20,0x20,0x20,0x20,0x53,0x43 ;!     SC
        .db 0x49,0x20,0x20,0x20,0x20,0x20,0xa1,0x20 ;I     ! 
        .db 0xa1,0x20,0x20,0x20,0x20,0x47,0x41,0x4d ;!    GAM
        .db 0x45,0x53,0x20,0x20,0x20,0x20,0x20,0xa1 ;ES     !
        .db 0xa7,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;'       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa2,0xa0 ;      " 
        .db 0xa2,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0 ;"       
        .db 0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xa0,0xaa ;       *
ptr_cursor:
        .db 0xcf,0xef                               ;Oo
ptr_internal_array:
        .db 0x2f,0x17                               ;/.
points_count:
        .db 0x32,0x00                               ;2.
mines_count:
        .db 0x4b,0x00                               ;K.
ptr_log_buffer:
        .db 0xff,0x1f                               ;..
ptr_random_buffer:
        .db 0xbe,0x14                               ;>.
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00                     ;....     <unchecked>
str_vorsicht_minen:
        .db 0x20,0x20,0x20,0x56,0x4f,0x52,0x53,0x49 ;   VORSI
        .db 0x43,0x48,0x54,0x20,0x20,0x20,0x4d,0x49 ;CHT   MI
        .db 0x4e,0x45,0x2f,0x4e                     ;NE/N
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00                     ;....     <unchecked>
str_sie_haben:
        .db 0x53,0x49,0x45,0x20,0x20,0x20,0x20,0x48 ;SIE    H
        .db 0x41,0x42,0x45,0x4e                     ;ABEN
        .db 0x20,0x20,0x7f,0x00,0x00,0x00,0x00,0x00 ;  ...... <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00                     ;....     <unchecked>
str_punkte_erreicht:
        .db 0x50,0x55,0x4e,0x4b,0x54,0x45,0x20,0x20 ;PUNKTE  
        .db 0x20,0x20,0x45,0x52,0x52,0x45,0x49,0x43 ;  ERREIC
        .db 0x48,0x54                               ;HT
        .db 0x20,0x20,0x20,0x00,0x00,0x00,0x00,0x00 ;   ..... <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00           ;......   <unchecked>
str_noch_ein_spiel:
        .db 0x4e,0x4f,0x43,0x48,0x20,0x45,0x49,0x4e ;NOCH EIN
        .db 0x20,0x53,0x50,0x49,0x45,0x4c,0x20,0x3f ; SPIEL ?
        .db 0x20,0x20,0x20,0x00,0x00,0x00,0x00,0x00 ;   ..... <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x7f,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
txt_title:
        .db 0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
        .db 0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x8a,0x20 ;      . 
        .db 0x20,0x20,0x8a,0x8a,0x20,0x20,0x8a,0x20 ;  ..  . 
        .db 0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
        .db 0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
        .db 0x20,0x20,0x20,0x20,0x20,0x8a,0x20,0x8a ;     . .
        .db 0x92,0x93,0x9e,0x9e,0x96,0x95,0x8a,0x8a ;........
        .db 0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
        .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
        .db 0x20,0x20,0x20,0x20,0x20,0x8a,0x20,0x99 ;     . .
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x9b,0x20 ;      . 
        .db 0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
        .db 0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x98 ;       .
        .db 0x20,0xc9,0x20,0x20,0xc9,0x20,0x9c,0x20 ; I  I . 
        .db 0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
        .db 0xb6,0xb0,0xc0,0x20,0x92,0x93,0x9e,0x9e ;60@ ....
        .db 0x96,0x95,0x20,0x20,0x20,0x20,0x20,0x9f ;..     .
        .db 0x20,0x20,0x86,0x87,0x20,0x20,0xc0,0x20 ;  ..  @ 
        .db 0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
        .db 0x73,0x3a,0xc0,0x99,0x20,0x20,0x20,0x20 ;s:@.    
        .db 0x20,0x20,0x9b,0x20,0x20,0x20,0x20,0x9b ;  .    .
        .db 0x20,0x20,0x85,0x84,0x20,0x20,0x99,0x20 ;  ..  . 
        .db 0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
        .db 0xf8,0xf8,0xac,0x98,0x20,0xc9,0x20,0x20 ;xx,. I  
        .db 0xc9,0x20,0x9c,0x20,0x20,0x20,0x20,0x9c ;I .    .
        .db 0x20,0x86,0x92,0x95,0x87,0x20,0x98,0x20 ; .... . 
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x9f,0x20,0x20,0x86,0x87 ;   .  ..
        .db 0x20,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;  @     
        .db 0x96,0x95,0xf8,0xf8,0x92,0x93,0x20,0x20 ;..xx..  
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x9b,0x20,0x20,0x85,0x84 ;   .  ..
        .db 0x20,0x20,0x99,0x20,0x20,0x20,0x20,0x20 ;  .     
        .db 0x20,0x20,0x9f,0xc0,0x20,0x20,0x20,0x20 ;  .@    
        .db 0x20,0x4e,0x6f,0x77,0x20,0x79,0x6f,0x75 ; Now you
        .db 0x20,0x20,0x20,0x9c,0x20,0x85,0x95,0x92 ;   . ...
        .db 0x84,0x20,0x98,0x20,0x20,0x20,0x20,0x20 ;. .     
        .db 0x20,0xdf,0x9f,0xc0,0xdc,0x20,0x20,0x20 ; _.@\   
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x96,0x95,0xf8,0xf8 ;    ..xx
        .db 0x92,0x93,0x20,0x20,0x20,0x20,0x20,0x20 ;..      
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x61,0x72,0x65,0x20,0x68,0x61,0x70 ; are hap
        .db 0x70,0x79,0x20,0xdb,0xf8,0x90,0x20,0x20 ;py [x.  
        .db 0x9e,0x96,0xd8,0x20,0x20,0x20,0x62,0x75 ;..X   bu
        .db 0x74,0x20,0x62,0x65,0x20,0x20,0x20,0x20 ;t be    
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0xb7,0xff,0xff,0xb7,0x20,0x20,0x63 ; 7..7  c
        .db 0x61,0x72,0x65,0x66,0x75,0x6c,0x6c,0x21 ;arefull!
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0xb2,0x20,0xb2,0x20 ;    2 2 
        .db 0xb3,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;3       
        .db 0xb2,0xb3,0xb3,0x20,0x20,0x20,0xb2,0x20 ;233   2 
        .db 0x20,0x20,0xb3,0x20,0x20,0x20,0x20,0x20 ;  3     
        .db 0x20,0xb8,0x20,0x20,0xb5,0xb8,0xbd,0x20 ; 8  58= 
        .db 0xb3,0xb2,0xb2,0x20,0x20,0xb7,0xb3,0x20 ;322  73 
        .db 0xb4,0x20,0xb3,0x20,0xb7,0xb3,0xb5,0x20 ;4 3 735 
        .db 0xb2,0xb7,0xb4,0x20,0xb2,0xb0,0x20,0x20 ;274 20  
        .db 0x20,0xb2,0xb0,0x20,0xb5,0x20,0xb5,0x20 ; 20 5 5 
        .db 0xb4,0xb5,0xb0,0xb4,0xb5,0xb7,0xb9,0xb1 ;45045791
        .db 0xbc,0x20,0xb4,0xb5,0xb7,0xb9,0xb5,0x20 ;< 45795 
        .db 0xb4,0x20,0xb4,0x20,0xb8,0x20,0x20,0x20 ;4 4 8   
        .db 0x20,0xb0,0x20,0x20,0xb5,0x20,0xb5,0xb2 ; 0  5 52
        .db 0xbb,0xb5,0x20,0xbb,0xb1,0xb7,0xb7,0x20 ;;5 ;177 
        .db 0xb4,0xb2,0xbb,0xb1,0xb7,0xb7,0xb5,0xb3 ;42;17753
        .db 0xb8,0xb7,0xb4,0x20,0x20,0xb0,0x20,0x20 ;874  0  
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x53,0x20,0x2d,0x20,0x53,0x54 ;  S - ST
        .db 0x41,0x52,0x54,0x20,0x20,0x20,0x20,0x20 ;ART     
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x47,0x20,0x2d,0x20,0x41,0x55 ;  G - AU
        .db 0x46,0x57,0x41,0x45,0x52,0x54,0x53,0x20 ;FWAERTS 
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x4f,0x20,0x2d,0x20,0x41,0x42 ;  O - AB
        .db 0x57,0x41,0x45,0x52,0x54,0x53,0x20,0x20 ;WAERTS  
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x50,0x20,0x2d,0x20,0x20,0x4c ;  P -  L
        .db 0x49,0x4e,0x4b,0x53,0x20,0x20,0x20,0x20 ;INKS    
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x51,0x20,0x2d,0x20,0x52,0x45 ;  Q - RE
        .db 0x43,0x48,0x54,0x53,0x20,0x20,0x20,0x20 ;CHTS    
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x43,0x2d,0x31,0x39,0x38,0x37,0x20 ; C-1987 
        .db 0x53,0x4f,0x46,0x54,0x57,0x41,0x52,0x45 ;SOFTWARE
        .db 0x20,0x43,0x45,0x4e,0x54,0x45,0x52,0x20 ; CENTER 
        .db 0x49,0x4c,0x4d,0x45,0x4e,0x41,0x55,0x20 ;ILMENAU 
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x62 ;       b
        .db 0x79,0x20,0x44,0x49,0x52,0x4b,0x20,0x53 ;y DIRK S
        .db 0x54,0x52,0x45,0x48,0x4c,0x45,0x20,0x20 ;TREHLE  
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x7f,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x7f,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00 ;........ <unchecked>
        .db 0xff,0x00,0x01,0x00,0x1b,0x06,0x01,0xf5 ;.......u <unchecked>
        .db 0x00,0x00,0x00,0x00,0x00,0x43,0xd3,0xd3 ;.....CSS <unchecked>
        .db 0xd3,0x4c,0x41,0x53,0x54,0x20,0x43,0x48 ;SLAST CH <unchecked>
        .db 0x41,0x4e,0x43,0x45,0x20,0x49,0x49,0x49 ;ANCE III <unchecked>

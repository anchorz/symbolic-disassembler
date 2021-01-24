;**********************************
;
; minefield.z80
;
; erstellt am: 2017-06-22 11:30:03
;
;**********************************

        .module  minefield
        .include 'platform.s'
        
        .globl  _main

LOG_BUFFER_INIT        .equ (LOG_BUFFER-1)

BWS_ADR_MINES          .equ BWS+ofs_minen
BWS_ADR_POINTS         .equ BWS+ofs_points
BWS_ADR_HINT           .equ BWS+ofs_vorsicht

BWS_A_SIE_HABEN        .equ BWS+(END_SCREEN_CORRECTION*BWS_LINE_WIDTH+10)
BWS_A_TOTAL_POI        .equ BWS+((END_SCREEN_CORRECTION+2)*BWS_LINE_WIDTH+13)
BWS_A_PUNKTE_ER        .equ BWS+((END_SCREEN_CORRECTION+4)*BWS_LINE_WIDTH+7)
BWS_A_NOCH_EIN         .equ BWS+((END_SCREEN_CORRECTION+11)*BWS_LINE_WIDTH+8)
BWS_A_JA               .equ BWS+((END_SCREEN_CORRECTION+13)*BWS_LINE_WIDTH+14)

BWS_ADR_BONUS_L        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
BWS_ADR_BONUS_R        .equ BWS+((START_ROW-END_ROW)/2+END_ROW-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)
INT_ADR_BONUS_L        .equ INTERNAL_ARRAY+((START_ROW-END_ROW)/2-1)*BWS_LINE_WIDTH+(BWS_LINE_WIDTH/4-2)
INT_ADR_BONUS_R        .equ INTERNAL_ARRAY+((START_ROW-END_ROW)/2-1)*BWS_LINE_WIDTH+(3*BWS_LINE_WIDTH/4+1)

KEY_UP                 .equ 'G' ; G
KEY_LEFT               .equ 'P' ; P
KEY_RIGHT              .equ 'Q' ; Q
KEY_DOWN               .equ 'O' ; O
KEY_START              .equ 'S' ; S
KEY_QUIT               .equ 0x03 ; vorher ^E
KEY_NEXT               .equ 0x01 ; vorher ^J
RECORD_UP              .equ 0x01
RECORD_DOWN            .equ 0x02
RECORD_RIGHT           .equ 0x03
RECORD_LEFT            .equ 0x04
RECORD_END             .equ 0x37
IS_FREE                .equ 0x00
IS_MINE                .equ 0x64
NO_MINE                .equ 0x00
RANDOM_MASK            .equ 0x03
SET_TO_ZERO            .equ 0x0000
WAIT_750MS             .equ 0xea60; 2 MHz
WAIT_250MS             .equ 0x4e20; 2 MHz
WAIT_130MS             .equ 0x2710; 2 MHz
REC_DELAY_190MS        .equ 0x3a98; 2 MHz
WAVE_LEN_285Hz         .equ 0x64; 2 MHz
WAVE_PERIODS           .equ 0x50; 2 MHz
QUIT_SOUND_P1          .equ 0x60
QUIT_SOUND_P2          .equ 0xe0
QUIT_SOUND_P3          .equ 0x01
QUIT_SOUND_P4          .equ 0xee
BLINK_COUNTER          .equ 10
MINEFIELD_WIDTH        .equ BWS_LINE_WIDTH-2
MINEFIELD_ARRAY_HEIGHT .equ (START_ROW-END_ROW+1)
size_of_vorsicht_minen .equ 20
size_of_sie_haben      .equ 12
size_of_punkte_erreich .equ 18
size_of_noch_ein_spiel .equ 16

        .area  _CODE
_main:
        PROGRAM_HEADER
        JOYSTICK_INIT
        call show_title
wait_to_start:
        call up_inch
        cp #KEY_START
        jr nz,wait_to_start
new_game:
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
        ld a,#CHR_MAN
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
        call count_mines
        cp #NO_MINE
        call nz,print_mines_count
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
        call count_mines
        cp #NO_MINE
        call nz,print_mines_count
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
        ld c,#START_ROW-END_ROW-3; NET HEIGHT MINEFIELD
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
        ld a,#' '
        ld hl,#BWS_ADR_HINT
        ld (hl),a
        ld de,#BWS_ADR_HINT+1
        ld bc,#len_vorsicht_minen-1
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
        ld de,#BWS_ADR_HINT
        ld bc,#len_vorsicht_minen
        ldir
        ld hl,#BWS_ADR_HINT+9; 'VORSICHT '
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
show_title:
        ld hl,#txt_title
        ld de,#BWS
        ld bc,#BWS_SIZE
        ldir
        FILL_BACKGROUND_COLOR
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
distribute$new_number:
        call rand16
        ld a,h
        and #RANDOM_MASK ; bc <0x400
        ; while HL >= CUT_OFF call rand16
        ld h,a
        cp #>CUT_OFF   ; H>=HIGH(CUT_OFF)
        jr c,distribute$is_smaller
        jr nz,distribute$new_number
        ld a,l
        cp #<CUT_OFF
        jp p,distribute$new_number
distribute$is_smaller:
        ld bc,#INTERNAL_ARRAY+2*BWS_LINE_WIDTH
        ld e,l
        ld d,h
        add hl,bc
        ld a,(hl)
        cp #IS_FREE

        jr nz,distribute$new_number
        ld hl,#BWS+(END_ROW+2)*BWS_LINE_WIDTH
        add hl,de
        ld a,(hl)
        cp #CHR_FREE
        jr nz,distribute$new_number
        ;AZ check distribution
        ;ld a,#0x55
        ;ld (hl),a
        ex de,hl
        add hl,bc
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
        END_MESSAGE

quit_sound:
        QUIT_SOUND
        ret
click_sound:
        CLICK_SOUND
        ret
;
; Galois LFSRs
;
rand16:
        ld hl,(seed)
        ld a,r
        add h
        ld h,a
        xor a ; CF=0
        rr h
        rr l
        jr  nc,rand16$write_seed
        xor l
        ld l,a
        ld a,#0xB4
        xor h
        ld h,a
rand16$write_seed:
        ld (seed),hl
        ret
seed:
        .dw 0xace1

up_inch:
        call rand16
        INKEY
        cp #VK_UP; CURSOR UP
        jr nz,up_inch$test_down
up_inch$is_up:
        ld a,#'G'
        ret
up_inch$test_down:
        cp #VK_DOWN; CURSOR DOWN
        jr nz,up_inch$test_left
up_inch$is_down:
        ld a,#'O'
        ret
up_inch$test_left:
        cp #VK_LEFT; CURSOR LEFT
        jr nz,up_inch$test_right
up_inch$is_left:
        ld a,#'P'
        ret
up_inch$test_right:
        cp #VK_RIGHT; CURSOR RIGHT
        jr nz,up_inch$test_enter
up_inch$is_right:
        ld a,#'Q'
        ret
up_inch$test_enter:
        cp #0x0d; enter
        jr nz,up_inch$fire
up_inch$is_start:
        ld a,#'S'
        ret
up_inch$fire:
        cp #0x1b; joystick fire
        jr nz,up_inch$end
        jr up_inch$is_start
up_inch$end:
        ret
	JOYSTICK
txt_empty_screen:
        TXT_MINES
ofs_minen   .equ .-txt_empty_screen

        TXT_PUNKTE
ofs_points   .equ .-txt_empty_screen

        TXT_EMPTY_SCREEN

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
last_joystick:
        .db 0x00
str_vorsicht_minen:
        .ascii 'VORSICHT   MINE/N'
len_vorsicht_minen .equ .-str_vorsicht_minen
str_sie_haben:
        .ascii 'SIE    HABEN'
str_punkte_erreicht:
        .ascii 'PUNKTE    ERREICHT'
str_noch_ein_spiel:
        .ascii 'NOCH EIN SPIEL ?'
txt_title:
        TITLE_IMG_CONTENT
;
;
;
	.area _DATA 
INTERNAL_ARRAY:
        .ds BWS_LINE_WIDTH*MINEFIELD_ARRAY_HEIGHT
LOG_BUFFER:
        .ds 1

        .module jumping_jack
        .include 'platform.s'
; 
; constant
; 
ZERO                             = 0x00
HI_ZERO                          = 0x00
LEVEL_1                          = 0x01
VK_LEFT                          = 0x08
VK_RIGHT                         = 0x09
VK_CLS                           = 0x0c
VK_HEART                         = 0xcb
VK_PLAYER                        = 0xc4
CHR_MIDDLE_LINE                  = 0xa0
CHR_SMOKE                        = 0xcd
CHR_WALL                         = 0xc6
CHR_MAN_HEAD                     = 0xcc
CHR_MAN_STAY                     = 0xa1
CHR_MAN_WALK                     = 0x9d
TRANSITION_MAN_WALK_STAY         = 0x04
CHR_MAN_SLEEP                    = 0x97
CHR_MAN_SLEEP_HEAD               = 0xc9
CHR_ARROW_RIGHT_TOP              = 0x95
CHR_ARROW_RIGHT_BOTTOM           = 0x93
CHR_LINE_TOP                     = 0xf8
CHR_LINE_BOTTOM                  = 0x9e
CHR_MOVING_LINE                  = 0xee
SMALL_CAPITALS                   = 0x5f
CAPITALIZE                       = 0x20
INITIAL_LIVES                    = 0x06
INITIAL_LEVEL                    = 0x01
MAX_FAIL_COUNTER                 = 0x05
INITIAL_FAIL_COUNTER             = 0x02
INITIAL_DELAY_COUNTER            = 0x01
DELAY_COUNTER                    = 0x0b
DELAY_COUNTER2                   = 0x08
DELAY_COUNTER_JUMP               = 0x04
MOVE_2X_RIGHT                    = 0x02
MONSTER_WIDTH                    = 0x04
NUMBER_OF_LINES                  = 0x08
NUMBER_HIGHSCORE_ENTRIES         = 0x05
MAX_LEVEL                        = 0x08

BWS                              = 0xec00
TOP_IMAGE_size                   = 0x01ff
VERSION_INFO_size                = 0x0005
HINT_RIGHT_size                  = 0x000c
HINT_LEFT_size                   = 0x000c
HINT_JUMP_size                   = 0x000c
HINT_PLAY_size                   = 0x000c
HINT_EXIT_size                   = 0x000c
HINT_COPYRIGHT_size              = 0x001e
HINT_NAME_size                   = 0x000e
HINT_YEAR_size                   = 0x000e
LINE_BUFFER_size                 = 0x010f
OFFSET_HOLES_size                = 0x0005
OFFSET_HOLES_JUMP_PENALTY_size   = 0x0005
TXT_JUMP_size                    = 0x0010
TXT_GAME_OVER_size               = 0x000f
TXT_YOUR_SCORE_size              = 0x000c
TXT_HAZARD_size                  = 0x0009
TXT_NEW_HIGH_SCORE_size          = 0x0012
HIGH_SCORE_TABLE01_size          = 0x0002
HIGH_SCORE_TABLE02_size          = 0x0002
HIGH_SCORE_TABLE03_size          = 0x0002
HIGH_SCORE_TABLE04_size          = 0x0002
HIGH_SCORE_TABLE05_size          = 0x0002
HIGH_SCORE_TABLE_TMP_size        = 0x0002
INITIALS_size                    = 0x0002
MONSTER_PTR_size                 = 0x0038
MONSTER_IMG_size                 = 0x0038
;
;
;
        PROGRAM_START
        ;jp      no_lives
        CLRSCR
        ld      de,#BWS
        ld      hl,#TOP_IMAGE
        ld      bc,#TITLE_TOP_SIZE
        ldir
        ld      hl,#BWS+SCREEN_WIDTH*TOP_LINES
        ld      (hl),#VK_HEART
        ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+1
        ld      bc,#SCREEN_WIDTH-1
        ldir
        ld      de,#BWS+SCREEN_WIDTH*TOP_LINES+(SCREEN_WIDTH-8)
        ld      hl,#VERSION_INFO
        ld      bc,#VERSION_INFO_size
        ldir
        ld      de,#BWS+SCREEN_WIDTH*MENU_TOP+10+ALIGN_MIDDLE
        ld      hl,#HINT_RIGHT
        ld      bc,#HINT_RIGHT_size
        ldir
        ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#HINT_RIGHT_size
        ldir
        ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#HINT_RIGHT_size
        ldir
        ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#HINT_RIGHT_size
        ldir
        ld      c,#SCREEN_WIDTH-HINT_RIGHT_size
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#HINT_RIGHT_size
        ldir
        ld      de,#BWS+POS_COPYRIGHT
        ld      c,#HINT_COPYRIGHT_size
        ldir
        ld      c,#POSDIFF_NAME
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#HINT_NAME_size
        ldir
        ld      c,#POSDIFF_YEAR
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#HINT_YEAR_size+VERSION_INFO_size-1
        ldir
choose_menu:
        xor     a
        INCH
        cp      #SMALL_CAPITALS
        jr      c,capitalized
        sub     #CAPITALIZE
capitalized:
        cp      #'E'
        jp      z,exit_game
        cp      #'P'
        jr      nz,choose_menu
new_game:
        CLRSCR
        ld      hl,#LIVES
        ld      (hl),#INITIAL_LIVES
        ld      hl,#POINTS
        ld      (hl),#ZERO
        inc     hl
        ld      (hl),#ZERO
        ld      b,#INITIAL_LIVES
        ld      hl,#POS_LIVES
draw_player:
        ld      a,#MOVE_2X_RIGHT
        add     a,l
        ld      l,a
        ld      (hl),#VK_PLAYER
        djnz    draw_player
        ld      a,#INITIAL_LEVEL
        ld      (LEVEL),a
        ld      a,#INITIAL_FAIL_COUNTER
        ld      (cnt_fail_trap),a
        ld      (cnt_fail_jump),a
        ld      hl,#BWS
        ld      (hl),#' '
        ld      de,#BWS+1
        ld      bc,#(3+GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH-2
        ldir
        ld      hl,#POS_TOP_WALL
        ld      (hl),#CHR_WALL
        ld      de,#POS_TOP_WALL+1
        ld      bc,#SCREEN_WIDTH-1
        ldir
        ld      hl,#POS_TOP_WALL+2*SCREEN_WIDTH-8
        ld      (hl),#CHR_WALL
        dec     hl
        dec     hl
        ld      (hl),#CHR_ARROW_RIGHT_TOP
        dec     hl
        ld      (hl),#CHR_LINE_TOP
        ld      hl,#POS_TOP_WALL+3*SCREEN_WIDTH-8
        ld      (hl),#CHR_WALL
        dec     hl
        dec     hl
        ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
        dec     hl
        ld      (hl),#CHR_LINE_BOTTOM
        ld      hl,#TXT_JUMP
        ld      de,#POS_TOP_GAME
        ld      bc,#TXT_JUMP_size
        ldir
        ld      a,#INITIAL_DELAY_COUNTER
        ld      hl,#JUMP_DELAY
        ld      (hl),a
        ld      hl,#FAIL_DELAY
        ld      (hl),a
        inc     hl
        ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+14+ALIGN_MIDDLE
        ld      (MAN_HEAD),hl
        ld      (hl),#CHR_MAN_HEAD
        ld      de,#SCREEN_WIDTH
        add     hl,de
        ld      (hl),#CHR_MAN_STAY
animation_loop:
        call    animation_monster
        call    animation_lines
        call    animation_delay
        ld      a,(JUMP_DELAY)
        cp      #INITIAL_DELAY_COUNTER
        jr      nz,handle_jump_delay
        ld      a,(FAIL_DELAY)
        cp      #INITIAL_DELAY_COUNTER
        jr      nz,handle_fail_delay
        INKEY
        cp      #' '
        jp      z,action_jump
        cp      #VK_LEFT
        call    z,action_left
        cp      #VK_RIGHT
        call    z,action_right
.if z9001
        ;debugginh
        cp      #'U'
        jr      nz,handle_fail_delay
        ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+20
        ld      (hl),#CHR_MAN_HEAD
        ld      (MAN_HEAD),hl
.endif
handle_fail_delay:
        call    check_fall_through
handle_jump_delay:
        ld      a,(JUMP_DELAY)
        cp      #INITIAL_DELAY_COUNTER
        jr      z,jump_delay_counter_set
        dec     a
        ld      (JUMP_DELAY),a
jump_delay_counter_set:
        ld      a,(FAIL_DELAY)
        cp      #INITIAL_DELAY_COUNTER
        jr      z,player_activity
        dec     a
        ld      (FAIL_DELAY),a
        cp      #INITIAL_DELAY_COUNTER
        jr      nz,player_activity
        ld      hl,(MAN_HEAD)
        ; test for bottom line
        ld      de,#BWS+(GAME_START_Y+3*GAMES_LINES-2)*SCREEN_WIDTH
        and     a
        sbc     hl,de
        jr      c,player_wake_up
        ld      a,(LIVES)
        dec     a
        ld      (LIVES),a
        ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES+3)*SCREEN_WIDTH+2
        ld      d,#HI_ZERO
        add     a,a
        ld      e,a
        add     hl,de
        ld      (hl),#' '
        cp      #ZERO
        jp      z,no_lives
player_wake_up:
        ld      hl,(MAN_HEAD)
        ld      (hl),#CHR_MAN_HEAD
        dec     hl
        ld      a,#' '
        ld      (hl),a
        inc     hl
        inc     hl
        inc     hl
        ld      (hl),a
        dec     hl
        ld      de,#SCREEN_WIDTH
        add     hl,de
        ld      (hl),a
        inc     hl
        ld      (hl),a
        dec     hl
        dec     hl
        ld      (hl),#CHR_MAN_WALK
player_activity:
        call    check_level_finished
        jp      animation_loop
; unchecked data source
        .db     0x67,0x75,0x66,0x69                     ;gufi
animation_monster:
        ld      a,(LEVEL)
        ld      (counter),a
        cp      #LEVEL_1
        ret     z
        ld      bc,#MONSTER_PTR
        ld      de,#MONSTER_IMG
handle_one_monster:
        ld      a,(bc)
        ld      l,a
        inc     bc
        ld      a,(bc)
        ld      h,a
        call    handle_by_ptr
        ld      a,(counter)
        dec     a
        ld      (counter),a
        cp      #LEVEL_1
        ret     z
        jr      handle_one_monster
handle_by_ptr:
        push    bc
        ld      a,#MONSTER_WIDTH
        push    de
handle_by_column:
        ld      (hl),#' '
        ld      de,#SCREEN_WIDTH
        add     hl,de
        ld      (hl),#' '
        and     a
        sbc     hl,de
        dec     hl
        push    hl
        ex      af,af'
        ld      de,#BWS+(GAME_START_Y+4)*SCREEN_WIDTH-1
        and     a
        sbc     hl,de
        jr      c,correct_ptr
        push    bc
        ld      b,#GAMES_LINES
        ld      de,#3*SCREEN_WIDTH
get_column:
        and     a
        sbc     hl,de
        jr      c,test_column
        djnz    get_column
correct_ptr:
        ld      de,#SCREEN_WIDTH-1
        adc     hl,de
        jr      z,start_from_bottom
        pop     hl
        jr      update_pointers
start_from_bottom:
        pop     hl
        ld      de,#((GAMES_LINES-2)*3+1)*SCREEN_WIDTH
        add     hl,de
        jr      update_pointers
test_column:
        pop     bc
        ld      de,#SCREEN_WIDTH-1
        adc     hl,de
        jr      z,move_one_line_up
        pop     hl
        jr      update_pointers
move_one_line_up:
        pop     hl
        ld      de,#2*SCREEN_WIDTH
        and     a
        sbc     hl,de
update_pointers:
        dec     bc
        ld      a,l
        ld      (bc),a
        inc     bc
        ld      a,h
        ld      (bc),a
        inc     bc
        ld      a,(bc)
        ld      l,a
        inc     bc
        ld      a,(bc)
        ld      h,a
        ex      af,af'
        dec     a
        cp      #ZERO
        jr      z,draw_monster
        jr      handle_by_column
draw_monster:
        pop     de
        pop     bc
        dec     bc
        ld      a,#MONSTER_WIDTH
draw_monster_segment:
        ex      af,af'
        ld      a,(bc)
        ld      l,a
        inc     bc
        ld      a,(bc)
        ld      h,a
        inc     bc
        ld      a,(de)
        ld      (hl),a
        inc     de
        ld      a,(de)
        push    de
        ld      de,#SCREEN_WIDTH
        add     hl,de
        ld      (hl),a
        call    monster_check_crash
        pop     de
        inc     de
        ex      af,af'
        dec     a
        cp      #ZERO
        jr      nz,draw_monster_segment
        ret
monster_check_crash:
        and     a
        sbc     hl,de
        ex      de,hl
        ld      hl,(MAN_HEAD)
        and     a
        sbc     hl,de
        ex      de,hl
        ret     nz
        ld      de,#SCREEN_WIDTH
        add     hl,de
        inc     hl
        ld      (hl),#CHR_MAN_SLEEP
        inc     hl
        ld      (hl),#CHR_MAN_SLEEP_HEAD
        ld      a,#DELAY_COUNTER
        ld      (FAIL_DELAY),a
        ret
animation_lines:
        ld      a,#CHR_MOVING_LINE
        ld      hl,#LINE_BUFFER
        ld      (hl),a
        ld      de,#LINE_BUFFER+1
        ld      bc,#LINE_BUFFER_size-1
        ldir
        ld      a,(cnt_fail_trap)
        ld      de,#OFFSET_HOLES
        dec     de
loop_failed_penalty_holes:
        push    af
        inc     de
        ld      a,(de)
        inc     a
        ld      (de),a
        ld      c,a
        ld      b,#HI_ZERO
        ld      hl,#LINE_BUFFER
        add     hl,bc
        ld      (hl),#' '
        inc     hl
        ld      (hl),#' '
        inc     hl
        ld      (hl),#' '
        pop     af
        dec     a
        jr      nz,loop_failed_penalty_holes
        ld      a,(cnt_fail_jump)
        ld      de,#OFFSET_HOLES_JUMP_PENALTY
        dec     de
loop_jump_penalty_holes:
        push    af
        inc     de
        ld      a,(de)
        dec     a
        ld      (de),a
        ld      c,a
        ld      b,#HI_ZERO
        ld      hl,#LINE_BUFFER
        add     hl,bc
        ld      (hl),#' '
        inc     hl
        ld      (hl),#' '
        inc     hl
        ld      (hl),#' '
        pop     af
        dec     a
        jr      nz,loop_jump_penalty_holes
        ld      a,#GAMES_LINES
        ld      hl,#LINE_BUFFER
        ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+0
print_line:
        ld      bc,#SCREEN_WIDTH
        push    hl
        ex      de,hl
        add     hl,bc
        add     hl,bc
        ex      de,hl
        pop     hl
        ldir
        dec     a
        jr      nz,print_line
        ld      hl,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+0
        ld      de,#BWS+(2+GAME_START_Y+(GAMES_LINES*3))*SCREEN_WIDTH+1
        ld      bc,#SCREEN_WIDTH-1
        ld      (hl),#CHR_WALL
        ldir
        ret
animation_delay:
        ld      hl,#SLOW_DOWN_13066
        ld      de,#1
        and     a
delay_loop:
        dec     hl
        sbc     hl,de
        jr      nz,delay_loop
        ret
action_left:
        push    af
        ld      hl,(MAN_HEAD)
        ld      a,(hl)
        ld      (hl),#' '
        dec     hl
        ld      (MAN_HEAD),hl
        ld      (hl),a
        ld      de,#SCREEN_WIDTH
        add     hl,de
        inc     hl
        ld      a,(hl)
        ld      (hl),#' '
        cp      #CHR_MAN_WALK
        jr      z,transition_left_stay
        cp      #CHR_MAN_STAY
        jr      z,transition_left_walk
transition_left_stay:
        add     a,#TRANSITION_MAN_WALK_STAY
        jr      update_left
transition_left_walk:
        sub     #TRANSITION_MAN_WALK_STAY
update_left:
        dec     hl
        ld      (hl),a
        ld      a,#GAMES_LINES+1
        ld      bc,#BWS+(GAME_START_Y)*SCREEN_WIDTH-1
loop_left_border_check:
        push    bc
        ld      h,b
        ld      l,c
        ld      de,(MAN_HEAD)
        and     a
        sbc     hl,de
        jr      z,correct_left_border
left_border_next_adr:
        pop     bc
        ld      de,#3*SCREEN_WIDTH
        ld      h,b
        ld      l,c
        add     hl,de
        ld      b,h
        ld      c,l
        dec     a
        jr      nz,loop_left_border_check
        pop     af
        ret
correct_left_border:
        ld      hl,(MAN_HEAD)
        ld      de,#SCREEN_WIDTH
        ld      (hl),#CHR_WALL
        add     hl,de
        ld      (hl),#CHR_MAN_HEAD
        ld      (MAN_HEAD),hl
        add     hl,de
        ld      (hl),#CHR_MAN_WALK
        jp      left_border_next_adr
action_right:
        push    af
        ld      hl,(MAN_HEAD)
        ld      a,(hl)
        ld      (hl),#' '
        inc     hl
        ld      (MAN_HEAD),hl
        ld      (hl),a
        ld      de,#SCREEN_WIDTH
        add     hl,de
        dec     hl
        ld      a,(hl)
        ld      (hl),#' '
        cp      #CHR_MAN_WALK
        jr      z,transition_stay
        cp      #CHR_MAN_STAY
        jr      z,transition_walk
transition_stay:
        add     a,#TRANSITION_MAN_WALK_STAY
        jr      update_right
transition_walk:
        sub     #TRANSITION_MAN_WALK_STAY
update_right:
        inc     hl
        ld      (hl),a
        ld      a,#GAMES_LINES+1
        ld      bc,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH+0
loop_right_border_check:
        push    bc
        ld      h,b
        ld      l,c
        ld      de,(MAN_HEAD)
        and     a
        sbc     hl,de
        jr      z,correct_right_border
right_border_next_adr:
        pop     bc
        ld      de,#3*SCREEN_WIDTH
        ld      h,b
        ld      l,c
        add     hl,de
        ld      b,h
        ld      c,l
        dec     a
        jr      nz,loop_right_border_check
        pop     af
        ret
correct_right_border:
        ld      hl,(MAN_HEAD)
        ld      c,(hl)
        ld      (hl),#CHR_MAN_WALK
        ld      de,#SCREEN_WIDTH
        and     a
        sbc     hl,de
        ld      (hl),c
        ld      (MAN_HEAD),hl
        add     hl,de
        add     hl,de
        ld      (hl),#CHR_MOVING_LINE
        jr      right_border_next_adr
action_jump:
        ld      hl,(MAN_HEAD)
        ld      de,#SCREEN_WIDTH
        and     a
        sbc     hl,de
        ld      a,(hl)
        cp      #' '
        jr      z,jump_ok
        cp      #CHR_MOVING_LINE
        jr      z,jump_fail
        cp      #CHR_WALL
        jr      z,jump_fail
        jp      handle_fail_delay
jump_ok:
        exx
        call    add_10_points
        exx
        add     hl,de
        ld      (hl),#' '
        add     hl,de
        ld      (hl),#' '
        ld      e,#3*SCREEN_WIDTH
        and     a
        sbc     hl,de
        ld      (hl),#CHR_MAN_WALK
        ld      e,#SCREEN_WIDTH
        and     a
        sbc     hl,de
        ld      (hl),#CHR_MAN_HEAD
        ld      (MAN_HEAD),hl
        ld      a,#DELAY_COUNTER_JUMP
        ld      (JUMP_DELAY),a
        jp      handle_fail_delay
jump_fail:
        add     hl,de
        dec     hl
        ld      a,#CHR_SMOKE
        ld      (hl),a
        inc     hl
        inc     hl
        inc     hl
        ld      (hl),a
        dec     hl
        dec     hl
        ld      (hl),#' '
        add     hl,de
        ld      (hl),#CHR_MAN_SLEEP
        inc     hl
        ld      (hl),#CHR_MAN_SLEEP_HEAD
        ld      a,#DELAY_COUNTER
        ld      (FAIL_DELAY),a
        ld      a,(cnt_fail_jump)
        cp      #MAX_FAIL_COUNTER
        jp      z,handle_fail_delay
        inc     a
        ld      (cnt_fail_jump),a
        jp      handle_fail_delay
check_fall_through:
        ld      a,(JUMP_DELAY)
        cp      #INITIAL_DELAY_COUNTER
        ret     nz
check_for_trap:
        ld      hl,(MAN_HEAD)
        ld      de,#SCREEN_WIDTH
        add     hl,de
        add     hl,de
        ld      a,(hl)
        cp      #' '
        ret     nz
        ld      a,(FAIL_DELAY)
        cp      #INITIAL_DELAY_COUNTER
        jr      z,erase_player_fell_down
        ld      hl,(MAN_HEAD)
        ld      a,#' '
        dec     hl
        ld      (hl),a
        inc     hl
        inc     hl
        inc     hl
        ld      (hl),a
        dec     hl
        add     hl,de
        ld      (hl),a
        inc     hl
        ld      (hl),a
        dec     hl
        dec     hl
        ld      (hl),a
        jr      player_fell_down
erase_player_fell_down:
        ld      hl,(MAN_HEAD)
        ld      a,#' '
        ld      (hl),a
        add     hl,de
        ld      (hl),a
player_fell_down:
        add     hl,de
        add     hl,de
        ld      (MAN_HEAD),hl
        add     hl,de
        ld      (hl),#CHR_MAN_SLEEP
        inc     hl
        ld      (hl),#CHR_MAN_SLEEP_HEAD
        ld      a,#DELAY_COUNTER2
        ld      (FAIL_DELAY),a
        ld      a,(cnt_fail_trap)
        cp      #MAX_FAIL_COUNTER
        ret     z
        inc     a
        ld      (cnt_fail_trap),a
        ret
check_level_finished:
        ld      hl,(MAN_HEAD)
        ld      de,#BWS+(GAME_START_Y*SCREEN_WIDTH)+(SCREEN_WIDTH-9)
        and     a
        sbc     hl,de
        jr      nz,round_end
        ld      a,(LEVEL)
        cp      #MAX_LEVEL
        jr      z,new_level_set
        inc     a
new_level_set:
        ld      (LEVEL),a
        ld      hl,#BWS+(GAME_START_Y+3*GAMES_LINES)*SCREEN_WIDTH+(15+ALIGN_MIDDLE)
        ld      (MAN_HEAD),hl
        ld      a,#SCREEN_WIDTH
        ld      (hl),#CHR_MAN_HEAD
        add     a,l
        ld      l,a
        ld      (hl),#CHR_MAN_STAY
        ld      hl,#cnt_fail_trap
        ld      a,#INITIAL_FAIL_COUNTER
        ld      (hl),a
        ld      hl,#cnt_fail_jump
        ld      (hl),a
        ld      hl,#BWS+GAME_START_Y*SCREEN_WIDTH+(SCREEN_WIDTH-11)
        ld      (hl),#CHR_LINE_TOP
        inc     hl
        ld      (hl),#CHR_ARROW_RIGHT_TOP
        inc     hl
        ld      (hl),#' '
        ld      hl,#BWS+(GAME_START_Y+1)*SCREEN_WIDTH++(SCREEN_WIDTH-11)
        ld      (hl),#CHR_LINE_BOTTOM
        inc     hl
        ld      (hl),#CHR_ARROW_RIGHT_BOTTOM
        inc     hl
        ld      (hl),#' '
round_end:
        inc     de
        inc     de
        ld      hl,(MAN_HEAD)
        and     a
        sbc     hl,de
        ld      a,#DELAY_COUNTER
        ret     nz
        ld      (FAIL_DELAY),a
        inc     de
        ld      (MAN_HEAD),de
        ld      a,#' '
        dec     de
        ld      (de),a
        add     a,e
        ld      e,a
        ld      (de),a
        ld      l,a
        add     hl,de
        ld      (hl),#CHR_MAN_SLEEP
        inc     hl
        ld      (hl),#CHR_MAN_SLEEP_HEAD
        ret
add_10_points:
        SET_CURSOR_DE 0 23+POSDIFF_POINTS
        ld      hl,(POINTS)
        ld      de,#10
        add     hl,de
        ld      (POINTS),hl
        call    print_decimal
        ld      a,#' '
        ld      (BWS+0*SCREEN_WIDTH+23+POSDIFF_POINTS+5),a
        ret
print_decimal:
        push    hl
        ld      bc,#10000
        call    get_decimal_digit
        ld      bc,#1000
        call    get_decimal_digit
        ld      bc,#100
        call    get_decimal_digit
        ld      bc,#10
        call    get_decimal_digit
        ld      bc,#1
        call    get_decimal_digit
        REMOVE_CURSOR;
        pop     hl
        ret
get_decimal_digit:
        xor     a
decimal_loop:
        and     a
        sbc     hl,bc
        inc     a
        jp      nc,decimal_loop
        dec     a
        add     hl,bc
        add     a,#'0'
        OUTCH
        ret
no_lives::
        PRST7
        .db     0x0c,0xa0
        ld      hl,#TXT_GAME_OVER
        ld      de,#POS_GAME_OVER
        ld      bc,#TXT_GAME_OVER_size
        ldir
        ld      c,#3*SCREEN_WIDTH-TXT_GAME_OVER_size-1+POSDIFF_YOUR_SCORE
        ld      a,e
        add     a,c
        ld      e,a
        ld      c,#TXT_YOUR_SCORE_size
        ldir
        ld      c,#2*SCREEN_WIDTH-TXT_YOUR_SCORE_size+3
        ld      a,e
        add     a,c
        ld      e,a
        ld      c,#TXT_HAZARD_size
        ldir
        ld      hl,#BWS+15*SCREEN_WIDTH+0+(3*POSDIFF_YOUR_SCORE)
        ld      (hl),#CHR_MIDDLE_LINE
        ld      de,#BWS+15*SCREEN_WIDTH+1+(3*POSDIFF_YOUR_SCORE)
        ld      c,#SCREEN_WIDTH-1
        ldir
        ld      hl,(POINTS)
        SET_CURSOR_DE (5-POSDIFF_YOUR_SCORE_DY) (21+ALIGN_MIDDLE)
        call    print_decimal
        ld      a,(LEVEL)
        add     a,#'0'-1
        ld      (BWS+7*SCREEN_WIDTH+23+ALIGN_MIDDLE+3*POSDIFF_YOUR_SCORE),a
        ld      de,(HIGH_SCORE_TABLE01.points)
        and     a
        sbc     hl,de
        call    nc,draw_new_highscore_box
        SET_CURSOR_HL (17-POSDIFF_YOUR_SCORE_DY) (3+ALIGN_MIDDLE)
        PRST7
        .ascis ' INPUT YOUR INITIALS: __ '
        ; remove 2xcursor
        ld      hl,#BWS+17*SCREEN_WIDTH+28
        ld      (hl),#' '
        ld      hl,#BWS+0*SCREEN_WIDTH+1
        ld      (hl),#' '
        ld      hl,#BWS+(17-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+25+ALIGN_MIDDLE
        CURSOR_DISABLE
        INCH
        ld      (hl),a
        ld      (INITIALS),a
        inc     hl
        INCH
        ld      (hl),a
        ld      (INITIALS+1),a
        ld      de,(POINTS)
        ld      b,#NUMBER_HIGHSCORE_ENTRIES
        ld      hl,(HIGH_SCORE_TABLE01.points)
        and     a
        sbc     hl,de
        jp      c,insert_score
        dec     b
        ld      hl,(HIGH_SCORE_TABLE02.points)
        and     a
        sbc     hl,de
        jp      c,insert_score
        dec     b
        ld      hl,(HIGH_SCORE_TABLE03.points)
        and     a
        sbc     hl,de
        jp      c,insert_score
        dec     b
        ld      hl,(HIGH_SCORE_TABLE04.points)
        and     a
        sbc     hl,de
        jp      c,insert_score
        dec     b
        ld      hl,(HIGH_SCORE_TABLE05.points)
        and     a
        sbc     hl,de
        jp      c,insert_score
print_highscore_table::
        ld      b,#NUMBER_HIGHSCORE_ENTRIES
        ld      de,#HIGH_SCORE_TABLE01
        ld      hl,#BWS+(20-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+6+ALIGN_MIDDLE
print_highscore_entry:
        ld      a,#'6'
        sub     b
        ld      (hl),a
        ld      a,(de)
        inc     hl
        inc     hl
        inc     hl
        ld      (hl),a
        inc     hl
        inc     de
        ld      a,(de)
        ld      (hl),a
        ld      a,#'.'
        inc     hl
        inc     hl
        ld      (hl),a
        inc     hl
        ld      (hl),a
        inc     hl
        ld      (hl),a
        inc     hl
        inc     hl
        SET_CURSOR
        inc     de
        ld      a,(de)
        ld      l,a
        inc     de
        ld      a,(de)
        ld      h,a
        inc     de
        push    bc
        push    de
        call    print_decimal
        pop     de
        pop     bc
        REMOVE_CURSOR
        inc     hl
        inc     hl
        inc     hl
        ld      (hl),#'0'
        inc     hl
        ld      a,(de)
        add     a,#'0'-1
        ld      (hl),a
        inc     de
        ld      a,#SCREEN_WIDTH-19
        add     a,l
        ld      l,a
        ld      a,#ZERO
        adc     a,h
        ld      h,a
        djnz    print_highscore_entry
        SET_CURSOR_HL (29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY) (9+ALIGN_MIDDLE)
        PRST7
        .ascii  'NEW GAME ? Y/N'
        .db     0xa0
        ld      hl,#BWS+(29-POSDIFF_YOUR_SCORE_DY-POSDIFF_HIGHSCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
        ld      (hl),#' '
        CURSOR_DISABLE
m_070a:
ask_exit_game:
        INCH
        cp      #'Y'
        jp      z,new_game
        cp      #'N'
        jr      nz,ask_exit_game
exit_game:
        PRST7
        .db     0x0c
        .ascii  'Jumping Jack'
        .db     0x0d,0x8d
        END_PROGRAM
insert_score:
        push    de
        ld      de,#HIGH_SCORE_TABLE_TMP
        ld      hl,#HIGH_SCORE_TABLE05
move_table_entry:
        push    bc
        ld      bc,#HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05
        ldir
        ex      de,hl
        ld      c,#2*(HIGH_SCORE_TABLE_TMP-HIGH_SCORE_TABLE05)
        and     a
        sbc     hl,bc
        ex      de,hl
        and     a
        sbc     hl,bc
        pop     bc
        djnz    move_table_entry
        ld      a,(INITIALS)
        ld      (de),a
        inc     de
        ld      a,(INITIALS+1)
        ld      (de),a
        ex      de,hl
        pop     de
        inc     hl
        ld      (hl),e
        inc     hl
        ld      (hl),d
        inc     hl
        ld      a,(LEVEL)
        ld      (hl),a
        jp      print_highscore_table
draw_new_highscore_box:
        ld      hl,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
        ld      (hl),#'*'
        ld      de,#BWS+(9-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+8+ALIGN_MIDDLE
        ld      bc,#TXT_NEW_HIGH_SCORE_size-1
        ldir
        ld      c,#4*SCREEN_WIDTH-TXT_NEW_HIGH_SCORE_size+1
        add     hl,bc
        ex      de,hl
        add     hl,bc
        ex      de,hl
        ld      c,#TXT_NEW_HIGH_SCORE_size-1
        ld      (hl),#'*'
        ldir
        ld      de,#BWS+(11-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
        ld      hl,#TXT_NEW_HIGH_SCORE
        ld      c,#TXT_NEW_HIGH_SCORE_size
        ldir
        ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
        ld      a,#'*'
        ld      (de),a
        ld      e,#BWS+(10-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
        ld      (de),a
        ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+7+ALIGN_MIDDLE
        ld      (de),a
        ld      e,#BWS+(12-POSDIFF_YOUR_SCORE_DY)*SCREEN_WIDTH+24+ALIGN_MIDDLE
        ld      (de),a
        ret
TOP_IMAGE:
        ; line 1
        SCREEN_POS
        .db     0xae,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e,0x9e ;........
        .db     0x9e,0x9e,0xad,0x20,0x20,0x20,0x20,0x20 ;..-     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        SCREEN_POS
        
        ; line 2
        SCREEN_POS
        .db     0x9f,0xb9,0xb6,0xb3,0xb2,0xb6,0xb8,0x20 ;.963268 
        .db     0xbd,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;=0@     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        SCREEN_POS

        ; line 3
        SCREEN_POS
        .db     0x9f,0xb8,0xb7,0x20,0xb5,0x20,0x20,0x20 ;.87 5   
        .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0xb5 ;       5
        .db     0x20,0x20,0x20,0x20,0xb7,0xb7,0x20,0x20 ;    77  
        SCREEN_POS

        ; line 4
        SCREEN_POS
        .db     0x9f,0xb3,0x20,0xb4,0xb5,0x20,0xb2,0x20 ;.3 45 2 
        .db     0xb5,0x20,0xc0,0x20,0x20,0x20,0x20,0x20 ;5 @     
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0xb6,0xb7,0x20,0xb9,0xb2,0xb2,0xb8,0x20 ;67 9228 
        SCREEN_POS

        ; line 5
        SCREEN_POS
        .db     0x9f,0xb1,0xb6,0x20,0x20,0xb6,0xb0,0x20 ;.16  60 
        .db     0xb6,0xb0,0xc0,0x20,0x20,0x20,0x20,0x20 ;60@     
        .db     0x20,0x20,0xb2,0xb3,0x20,0x20,0x20,0x20 ;  23    
        .db     0x20,0xba,0xa0,0xb4,0xb4,0xa0,0xb5,0x20 ; : 44 5 
        SCREEN_POS

        ; line 6
        SCREEN_POS
        .db     0x9f,0x70,0x72,0x65,0x73,0x65,0x6e,0x74 ;.present
        .db     0x73,0x3a,0xc0,0x20,0x20,0x20,0x20,0x20 ;s:@     
        .db     0x20,0xb2,0xb0,0xb1,0xb3,0x20,0x20,0xb7 ; 2013  7
        .db     0xb6,0xb1,0xb3,0xb8,0xb1,0xb1,0xb9,0x20 ;6138119 
        SCREEN_POS

        ; line 7
        SCREEN_POS
        .db     0xab,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8,0xf8 ;+xxxxxxx
        .db     0xf8,0xf8,0xac,0x20,0x20,0x20,0x20,0x20 ;xx,     
        .db     0x20,0xb0,0x20,0x20,0xb5,0xb7,0xb6,0x20 ; 0  576 
        .db     0x20,0x20,0xb1,0xb3,0xb6,0xbc,0x20,0x20 ;  136<  
        SCREEN_POS

        ; line 8
        SCREEN_POS
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0xb1,0xb6,0xb6,0xb6,0xb6,0x20,0x20,0x20 ;16666   
        .db     0x20,0x20,0x20,0xb1,0xb9,0x20,0x20,0x20 ;   19   
         SCREEN_POS

        ; line 9
        Z1013_LINE

        ; line 10
        Z1013_LINE

        ; line 11
        SCREEN_POS
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
         SCREEN_POS

        ; line 12
        SCREEN_POS
        .db     0x20,0x20,0x20,0xb4,0x20,0x20,0x20,0x20 ;   4    
        .db     0x20,0x20,0x20,0x20,0xb0,0x20,0x20,0x20 ;    0   
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0xb4,0x20 ;      4 
        .db     0x20,0x20,0x20,0x20,0xb4,0xb2,0x20,0x20 ;    42  
         SCREEN_POS

        ; line 13
        SCREEN_POS
        .db     0x20,0x20,0x20,0xb4,0xb4,0xb5,0xb5,0xbd ;   4455=
        .db     0xbd,0xb5,0xb6,0xb3,0xb4,0xbc,0xbd,0xb2 ;=5634<=2
        .db     0xb6,0xb3,0x20,0x20,0x20,0x20,0xb4,0xb1 ;63    41
        .db     0xb8,0xb2,0xb6,0xb3,0xbb,0xb0,0x20,0x20 ;8263;0  
         SCREEN_POS

        ; line 14
        SCREEN_POS
        .db     0x20,0xb3,0x20,0xb4,0xb4,0xb5,0xb5,0xb5 ; 3 44555
        .db     0xb5,0xb5,0xb7,0xb0,0xb4,0xb4,0xb5,0xb1 ;55704451
        .db     0xb7,0xb4,0x20,0x20,0xb3,0x20,0xb4,0xb9 ;74  3 49
        .db     0xbd,0xb5,0x20,0xb3,0xb4,0xb8,0x20,0x20 ;=5 348  
         SCREEN_POS

        ; line 15
        SCREEN_POS
        .db     0x20,0xb8,0xb7,0xb0,0xb1,0xb0,0xb1,0xb1 ; 8701011
        .db     0xb1,0xb5,0x20,0x20,0xb0,0xb0,0xb1,0xb1 ;15  0011
        .db     0xb7,0xb0,0x20,0x20,0xb8,0xb7,0xb0,0xb1 ;70  8701
        .db     0xb6,0x20,0xb6,0x20,0xb0,0x20,0xb0,0x20 ;6 6 0 0 
         SCREEN_POS

        ; line 16
        SCREEN_POS
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
        SCREEN_POS

HINT_RIGHT:
        .db     0x2d,0x3e,0x20,0x2e,0x2e,0x2e,0x20,0x52 ;-> ... R
        .db     0x69,0x67,0x68,0x74                     ;ight
HINT_LEFT:
        .db     0x3c,0x2d,0x20,0x2e,0x2e,0x2e,0x2e,0x20 ;<- .... 
        .db     0x4c,0x65,0x66,0x74                     ;Left
HINT_JUMP:
        .ascii  'SP .... Jump'
HINT_PLAY:
        .ascii  'P ..... Play'
HINT_EXIT:
        .ascii  'E ..... Exit'
HINT_COPYRIGHT:
        .ascii  'C 1986 Software Center Ilmenau'
HINT_NAME:
        .ascii  'G.Fischer & CO'
HINT_YEAR:
        .ascii  '  2020 Version'
VERSION_INFO:
        .db     0x20,0x31,0x2e,0x31,0x20                ; 1.1 
LINE_BUFFER:
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0x20,0x20,0x20,0xee,0xee,0xee,0xee,0xee ;   nnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0x20,0x20,0x20 ;nnnnn   
        .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0x20,0x20,0x20,0xee,0xee,0xee,0xee ;n   nnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0x20,0x20,0x20,0xee ;nnnn   n
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0x20 ;nnnnnnn 
        .db     0x20,0x20,0xee,0xee,0xee,0xee,0xee,0xee ;  nnnnnn
        .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0x20,0x20,0x20,0xee,0xee ;nnn   nn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0x20,0x20 ;nnnnnn  
        .db     0x20,0xee,0xee,0xee,0xee,0xee,0xee,0xee ; nnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee,0xee ;nnnnnnnn
        .db     0xee,0xee,0xee,0xee,0xee,0xee,0xee      ;nnnnnnn
; unchecked data source
        .db     0xee                                    ;n
OFFSET_HOLES:
        .db     0x58,0x7c,0x41,0x98,0x56                ;X|A.V
OFFSET_HOLES_JUMP_PENALTY:
        .db     0x8b,0xa2,0x68,0xc2,0xdd                ;."hB]
cnt_fail_trap:
        .db     5
cnt_fail_jump:
        .db     5
MAN_HEAD:
        .dw     BWS+(GAME_START_Y+(8-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14+ALIGN_MIDDLE
JUMP_DELAY:
        .db     1
FAIL_DELAY:
        .db     1
LIVES:
        .db     6
POINTS:
        .dw     0
LEVEL:
        .db     1
counter:
        .db     1
TXT_JUMP:
        .ascii  '* JUMPING JACK *'
MONSTER_PTR:
        .dw     BWS+(GAME_START_Y+3*3+1)*SCREEN_WIDTH-1
        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+0
        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2

        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13
        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+14
        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+15
        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+16

        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+1
        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+2
        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+3
        .dw     BWS+(GAME_START_Y+4*3)*SCREEN_WIDTH+4

        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+25
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+26
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+27
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+28

        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+10
        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+11
        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+12
        .dw     BWS+(GAME_START_Y+1*3)*SCREEN_WIDTH+13

        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+11
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+12
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+13
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+14

        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+21
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+22
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+23
        .dw     BWS+(GAME_START_Y+(7-2*MONSTER_CORRECTION)*3)*SCREEN_WIDTH+24
MONSTER_IMG:
        .db     0x94,0x90,0x8b,0x90,0x8b,0x91,0x97,0x91 ;........
        .db     0x19,0xb5,0x20,0xbe,0x20,0xbf,0x20,0xae ;.5 > ? .
        .db     0x92,0x96,0xa0,0xa0,0xa0,0xa0,0x88,0xc1 ;..    .A
        .db     0x20,0x95,0x20,0xb7,0x1e,0xff,0x20,0x92 ; . 7.. .
        .db     0x17,0x8c,0xf9,0x8c,0x1d,0x1f,0xfc,0x8c ;..y...|.
        .db     0x92,0x96,0x83,0x82,0x95,0x93,0x20,0x20 ;......  
        .db     0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20 ;        
HIGH_SCORE_TABLE01:
        .ascii '__'
HIGH_SCORE_TABLE01.points:
        .dw     0
HIGH_SCORE_TABLE01.level:
        .db     1
HIGH_SCORE_TABLE02:
        .ascii '__'
HIGH_SCORE_TABLE02.points:
        .dw     0
HIGH_SCORE_TABLE02.level:
        .db     1
HIGH_SCORE_TABLE03:
        .ascii '__'
HIGH_SCORE_TABLE03.points:
        .dw     0
HIGH_SCORE_TABLE03.level:
        .db     1
HIGH_SCORE_TABLE04:
        .ascii '__'
HIGH_SCORE_TABLE04.points:
        .dw     0
HIGH_SCORE_TABLE04.level:
        .db     1
HIGH_SCORE_TABLE05:
        .ascii '__'
HIGH_SCORE_TABLE05.points:
        .dw     0
HIGH_SCORE_TABLE05.level:
        .db     1
HIGH_SCORE_TABLE_TMP:
        .ascii '__'
HIGH_SCORE_TABLE_TMP.points:
        .dw     0
HIGH_SCORE_TABLE_TMP.level:
        .db     1
INITIALS:
        .ascii '__'
TXT_GAME_OVER:
        .ascii  '** GAME OVER **'
TXT_YOUR_SCORE:
        .ascii  'YOUR SCORE :'
TXT_HAZARD:
        .ascii  'HAZARDS :'
TXT_NEW_HIGH_SCORE:
        .ascii  '* NEW HIGH SCORE *'
; end of source

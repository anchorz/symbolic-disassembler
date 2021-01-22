;--------------------------------------------------------------------------
;  inkey.s
;
;  Copyright (C) 2020, Andreas Ziermann
;
;  This library is free software; you can redistribute it and/or modify it
;  under the terms of the GNU General Public License as published by the
;  Free Software Foundation; either version 2, or (at your option) any
;  later version.
;
;  This library is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this library; see the file COPYING. If not, write to the
;  Free Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
;   MA 02110-1301, USA.
;
;  As a special exception, if you link this library with other files,
;  some of which are compiled with SDCC, to produce an executable,
;  this library does not by itself cause the resulting executable to
;  be covered by the GNU General Public License. This exception does
;  not however invalidate any other reasons why the executable file
;   might be covered by the GNU General Public License.
;--------------------------------------------------------------------------
        .module inkey
        .include 'def_system.s'

        .globl  _inkey

; PORT 2A
M_SHIFT = 0x04
M_GRAPH = 0x20

        .area   _CODE
_inkey:
        ld      e,#0*8
        in      a,(IO_KEYBOARD+0)
        and     a
        jr      nz,pressed
        ld      e,#1*8
        in      a,(IO_KEYBOARD+1)
        and     a
        jr      nz,pressed
        ld      e,#2*8
        in      a,(IO_KEYBOARD+2)
        and     a
        jr      nz,pressed
        ld      e,#3*8
        in      a,(IO_KEYBOARD+3)
        and     a
        jr      nz,pressed
        ld      e,#4*8
        in      a,(IO_KEYBOARD+4)
        and     a
        jr      nz,pressed
        ld      e,#5*8
        in      a,(IO_KEYBOARD+5)
        and     a
        jr      nz,pressed
        ld      e,#6*8
        in      a,(IO_KEYBOARD+6)
        and     a
        jr      nz,pressed
        ld      e,#7*8
        in      a,(IO_KEYBOARD+7)
        and     a
        jr      nz,pressed
        ld      e,#8*8
        in      a,(IO_KEYBOARD+8)
        and     a
        jr      nz,pressed
        ld      e,#9*8
        in      a,(IO_KEYBOARD+9)
        and     #0xff-0x40-0x20                 ; CTRL SHIFT-L
        jr      nz,pressed
        ld      e,#10*8
        in      a,(IO_KEYBOARD+10)
        and     #0xff-M_GRAPH-M_SHIFT
        jr      nz,pressed
        ld      e,#11*8
        in      a,(IO_KEYBOARD+11)
        and     a
        jr      nz,pressed
        ld      l,a
        ret
pressed:
        ld      b,#8
bit_loop:
        rlca
        jr      c,bit_found
        inc     e
        djnz    bit_loop
bit_found:
        ld      hl,#kdb_table
        ld      d,#0
        add     hl,de
        in      a,(IO_KEYBOARD+10)
        and     a,#M_SHIFT
        jr      z,map_key_code
        ld      de,#kdb_table_size
        add     hl,de
map_key_code:
        ld      l,(hl)
        ret

kdb_table:
        .db '7','6','5','4','3','2','1','0'
        .db 0,'=','-','+',0,'.','9','8'
        .db 'g','f','e','d','c','b','a',0
        .db 'o','n','m','l','k','j','i','h'
        .db 'w','v','u','t','s','r','q','p'
        .db 0,0,0,0,0,'y','z','x'
        .db '7','6','5','4','3','2','1','0'
        .db '{','#','+','}',"'",'~','9','8'
        .db '|','-','.',',','<',' ',0,0
        .db 27,0,0,140,30,29,28,31
        .db 3,11,0,13,9,0,127,'0'
        .db 128,129,130,131,132,133,0,0
kdb_table_size = . - kdb_table
        ; shift
        .db '7','6','5','4','3','2','1','0'
        .db 0,'=','/','*',0,'.','9','8'
        .db 'G','F','E','D','C','B','A',0
        .db 'O','N','M','L','K','J','I','H'
        .db 'W','V','U','T','S','R','Q','P'
        .db 0,0,0,0,0,'Y','Z','X'
        .db '/','&','%','$','@','"','!','='
        .db '[','^','*',']',"`",'?',')','('
        .db '\','_',':',';','>',' ',0,0
        .db 27,0,0,140,30,29,28,31
        .db 3,11,0,13,9,0,127,'0'
        .db 134,135,136,137,138,139,0,0

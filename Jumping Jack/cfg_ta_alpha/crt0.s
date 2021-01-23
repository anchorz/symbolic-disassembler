;--------------------------------------------------------------------------
;  crt0.s - adapted for Triumph Adler Alphatronic PC
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
        .module crt0

        .globl  _main
        .globl  exit

        ; Ordering of segments for the linker.

        .area   _HOME
        .area   _CODE
        .area   _GSINIT
        .area   _GSFINAL
        .area   _INITIALIZER

        .area   _DATA                   ; get address for next segments
        .area   _INITIALIZED            ; initialized variabled
        .area   _BSS                    ; uninitialized variabled
        .area   _HEAP                   ; end of data, start of heap

        .area   _STACK                  ; get address for stack segment
top_of_stack:

        .area   _CODE
ENTRY:: 
        jp      init2                   ; ROM pack detection byte 'C3'
init2:
        ld      sp,#top_of_stack
        call    gsinit
        call    _main
        jp      exit

        .area   _GSINIT
gsinit:
        ld      hl,#s__INITIALIZER
        ld      de,#s__INITIALIZED
        ld      bc,#l__INITIALIZED
        ld      a,b
        or      c
        jr      z,skip
        ldir
skip:
        .area   _GSFINAL
        ret 
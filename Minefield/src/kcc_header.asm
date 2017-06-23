;--------------------------------------------------------------------------
;  kcc_header.asm
;
;  Copyright (C) 2016, Andreas Ziermann
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

; specific header to automatic generate KCC format 
; (which is used by simulator, disk, tape, USB, etc...)

        .module kcc_header_z9001

        .globl init
        .globl s_CODE
        .globl s_BSS

        .area   _HEADER (abs)
start_of_header:
        .ascii 'MINES'               ;name (placeholder 8 chars)
len_name .equ .-start_of_header
	.rept 8-len_name
	    .db 0x00
	.endm	
        .ascii 'COM'                 ; extension
        .db 0x00,0x00,0x00,0x00,0x00 ; reserved
        .db 0x02                     ; next block
        .dw s_CODE                   ; load address
        .dw s_BSS-1                  ; end address
        .dw init                     ; start address
LEN_HEADER .equ .-start_of_header
      .rept 128-LEN_HEADER
        .db 0x00 ; reserved
    .endm


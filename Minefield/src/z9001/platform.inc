start		.equ 0x300
BWS_LINE_WIDTH  .equ 40

.macro  INIT_JOYSTICK
.endm

.macro  CCP_HEADER
	jp START
	.ascii 'MINES   '
	.dw 0
.endm

.macro  LINE text,?start,?end
start:
	.ascii text
end:
	.rept (start-end+BWS_LINE_WIDTH)
	.db 0x33 
	.endm
.endm


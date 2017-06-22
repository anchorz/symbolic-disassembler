start		.equ 0x300
BWS_LINE_WIDTH  .equ 40
BWS_HEIGHT      .equ 24
BWS_SIZE        .equ 40*24

.macro  INIT_JOYSTICK
.endm

.macro  CCP_HEADER
	jp START
	.ascii 'MINES   '
	.dw 0
.endm

.macro  FILL_SPACES
	.rept (BWS_LINE_WIDTH-32)
	.db 0x20
	.endm
.endm


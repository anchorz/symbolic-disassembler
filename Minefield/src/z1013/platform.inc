start		.equ 0x100
BWS_LINE_WIDTH  .equ 32

.macro  INIT_JOYSTICK
	call joystick_init
.endm

.macro  CCP_HEADER
.endm

.macro  LINE text
	.ascii text
.endm

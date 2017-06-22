start		.equ 0x100
BWS_LINE_WIDTH  .equ 32
BWS_HEIGHT      .equ 32
BWS_SIZE        .equ 32*32

.macro  INIT_JOYSTICK
	call joystick_init
.endm

.macro  CCP_HEADER
.endm

.macro  FILL_SPACES
.endm


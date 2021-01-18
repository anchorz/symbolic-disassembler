LINK    = sdldz80
AS      = sdasz80
OBJCOPY = sdobjcopy

SDAS_OPT=-plowgff
SDLD_OPT=-mwxiu

OBJECTS = $(OUT)

all: $(addprefix obj/,$(TARGETS)) $(TARGETS)

include z9001.mk
include z1013.mk

obj/%:
	mkdir -p $@

clean:
	rm -rf obj





LINK    = sdldz80
AS      = sdasz80
OBJCOPY = sdobjcopy

#
# a - All user symbols made global
# w - Wide listing format for symbol table
SDAS_OPT=-plowgffa
SDLD_OPT=-mwxiu

OBJECTS = $(OUT)

all: $(TARGETS)

include z9001.mk
include z1013.mk


obj/%:
	mkdir -p $@

clean:
	rm -rf obj





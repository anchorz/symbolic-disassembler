LINK    = sdldz80
AS      = sdasz80
OBJCOPY = sdobjcopy

SDAS_OPT=-plowgff
SDLD_OPT=-mwxiu

OBJECTS = jumping

OUT=jumping

all: obj/z1013 obj/z1013/$(OUT).bin obj/z9001 obj/z9001/$(OUT).bin

obj/z1013:
	mkdir -p "$@"
	
obj/z9001:
	mkdir -p "$@"

obj/z1013/$(OUT).bin: $(addsuffix .rel,$(addprefix obj/z1013/,$(OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _CODE=0x0100 -i $(@:bin=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:bin=ihx) "$@"
	hexdump -C jumping_jack_1_1.original.bin >obj/z1013/original.txt 
	hexdump -C $@  >obj/z1013/neu.txt
	diff obj/z1013/original.txt obj/z1013/neu.txt
	
obj/z9001/$(OUT).bin: $(addsuffix .rel,$(addprefix obj/z9001/,$(OBJECTS))) obj/z9001/lib_compatibility.rel obj/z9001/div8.rel
	$(LINK) $(SDLD_OPT) -b _CODE=0x0300 -i $(@:bin=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:bin=ihx) "$@"

obj/z1013/%.rel:%.s cfg_z1013/platform.s
	$(AS) -Icfg_z1013 -plosgff "$@" "$<"

obj/z9001/%.rel:%.s cfg_z9001/platform.s 
	$(AS) -Icfg_z9001 -plosgff  "$@" "$<"

clean:
	rm -rf obj/*

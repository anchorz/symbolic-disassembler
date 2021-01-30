LINK    = sdldz80
AS      = sdasz80
OBJCOPY = sdobjcopy

#
# a - All user symbols made global
# w - Wide listing format for symbol table
SDAS_OPT=-plowgffa
SDLD_OPT=-mwxiu
all:	obj obj/boot.rom

obj/boot.rom: obj/rom.rel
	$(LINK) $(SDLD_OPT) -b _CODE=0xe000 -i $(@:rom=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:rom=ihx) "$@"
	hexdump -C src/tapcgv2_ic1038.bicom.bin >obj/boot_origin.bin.txt
	hexdump -C obj/boot.rom >obj/boot.rom.txt
	diff obj/boot_origin.bin.txt obj/boot.rom.txt
obj:
	mkdir obj

src/rom.s: src/rom.out.s
	sed 's/[ ]*;commentReference.*//g' "$^" >"$@"

obj/%.rel:src/%.s 
	$(AS) $(SDAS_OPT) "$@" "$<"	
	
clean:
	rm -rf obj

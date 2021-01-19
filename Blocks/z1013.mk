z1013: obj/z1013 obj/z1013/$(OUT).z80
	echo OUTPUT Z80



obj/z1013/$(OUT).z80: obj/z1013/z80_header.rel $(addsuffix .rel,$(addprefix obj/z1013/,$(OBJECTS))) obj/z1013/lib_compatibility.rel
	$(LINK) $(SDLD_OPT) -b _CODE=0x00e0 -i $(@:z80=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:z80=ihx) "$@"

obj/z1013/%.rel:%.s cfg_z1013/platform.s
	$(AS) -Icfg_z1013 -plosgff  "$@" "$<"

obj/z1013/%.rel:cfg_z1013/%.s cfg_z1013/platform.s 
	$(AS) -Icfg_z1013 -plosgff  "$@" "$<"


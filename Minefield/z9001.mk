z9001: obj/z9001 obj/z9001/$(OUT).kcc
	echo OUTPUT KCC



obj/z9001/$(OUT).kcc: obj/z9001/kcc_header.rel $(addsuffix .rel,$(addprefix obj/z9001/,$(OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _CODE=0x0280 -i $(@:bin=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:kcc=ihx) "$@"
	dd if="$@" of=obj/z9001/padded.tmp bs=128 conv=sync
	mv obj/z9001/padded.tmp "$@"

obj/z9001/%.rel:%.s cfg_z9001/platform.s
	$(AS) -Icfg_z9001 $(SDAS_OPT) "$@" "$<"

obj/z9001/%.rel:cfg_z9001/%.s cfg_z9001/platform.s 
	$(AS) -Icfg_z9001 $(SDAS_OPT) "$@" "$<"

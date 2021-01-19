z9001: obj/z9001 obj/z9001/$(OUT).kcc
	echo OUTPUT KCC
	hexdump -C obj/z9001/$(OUT).kcc >obj/blocks.z9001.txt
	hexdump -C blocks.kcc           >obj/blocks.kcc.txt
	diff obj/blocks.z9001.txt obj/blocks.kcc.txt

obj/z9001/$(OUT).kcc: obj/z9001/kcc_header.rel $(addsuffix .rel,$(addprefix obj/z9001/,$(OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _CODE=0x0280 -i $(@:bin=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:kcc=ihx) "$@"

obj/z9001/%.rel:%.s cfg_z9001/platform.s
	$(AS) -Icfg_z9001 $(SDAS_OPT) "$@" "$<"

obj/z9001/%.rel:cfg_z9001/%.s cfg_z9001/platform.s 
	$(AS) -Icfg_z9001 $(SDAS_OPT) "$@" "$<"

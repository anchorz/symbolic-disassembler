ta_alpha: obj/ta_alpha obj/ta_alpha/$(OUT).bin
	echo OUTPUT .bin

obj/ta_alpha/$(OUT).bin: obj/ta_alpha/crt0.rel $(addsuffix .rel,$(addprefix obj/ta_alpha/,$(OBJECTS))) obj/ta_alpha/inkey.rel obj/ta_alpha/lib_compatibility.rel
	#$(LINK) $(SDLD_OPT) -k cfg_ta_alpha -l ta_alpha  -l conio   -l commons -b _CODE=0xa000 -b _DATA=0x8000 -b _STACK=0xa000 -i $(@:bin=ihx) $^
	$(LINK) $(SDLD_OPT) -k cfg_ta_alpha -b _CODE=0xa000 -b _DATA=0x8000 -b _STACK=0xa000 -i $(@:bin=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:bin=ihx) "$@"
	#this time no data segment
	#dd if=$@ of=obj/ta_alpha/cut.bin bs=512 skip=16
	#mv obj/ta_alpha/cut.bin $@

obj/ta_alpha/%.rel:%.s cfg_ta_alpha/platform.s
	$(AS) -Icfg_ta_alpha $(SDAS_OPT) "$@" "$<"

obj/ta_alpha/%.rel:cfg_ta_alpha/%.s cfg_ta_alpha/platform.s 
	$(AS) -Icfg_ta_alpha $(SDAS_OPT) "$@" "$<"

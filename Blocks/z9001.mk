TARGET = z9001

$(TARGET): obj/$(TARGET)/$(OUT).kcc
	echo OUTPUT KCC
	hexdump -C $< >1
	diff 1 2

obj/$(TARGET)/$(OUT).kcc: $(addsuffix .rel,$(addprefix obj/$(TARGET)/,$(OBJECTS)))
	$(LINK) $(SDLD_OPT) -b _CODE=0x0280 -i $(@:bin=ihx) $^
	$(OBJCOPY) -Iihex -Obinary $(@:kcc=ihx) "$@"

obj/$(TARGET)/%.rel:%.s cfg_$(TARGET)/platform.s
	$(AS) -Icfg_$(TARGET) -plosgff  "$@" "$<"

obj/$(TARGET)/%.rel:cfg_$(TARGET)/%.s cfg_z9001/platform.s 
	$(AS) -Icfg_$(TARGET) -plosgff  "$@" "$<"

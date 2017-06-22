minefield: obj obj/z1013/minefield.bin obj/z9001/minefield.bin

obj:
	mkdir -p obj/z1013/
	mkdir -p obj/z9001/

obj/%.bin : obj/%.rel
	sdldz80 -mjwxi $(@:bin=ihx)  $<
	sdobjcopy -Iihex -Obinary  $(@:bin=ihx)  $@	

obj/z1013/%.rel : src/%.asm src/z1013/platform.inc
	sdasz80 -Isrc/z1013 -plosgff $@ $< 

obj/z9001/%.rel : src/%.asm src/z9001/platform.inc
	sdasz80 -Isrc/z9001 -plosgff $@ $< 

clean:
	rm -rf obj

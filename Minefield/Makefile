minefield: obj obj/z1013/minefield.z80 obj/z9001/minefield.kcc

obj:
	mkdir -p obj/z1013/
	mkdir -p obj/z9001/

obj/z9001/%.kcc : obj/z9001/kcc_header.rel obj/z9001/%.rel
	sdldz80 -mjwxi $(@:kcc=ihx)  -b _HEADER=0x280 -b CODE=0x300 $^
	sdobjcopy -Iihex -Obinary  $(@:kcc=ihx) $(@:kcc=kc_)
	dd if=$(@:kcc=kc_) of=$@ bs=128 conv=sync
	./tools/kcc2wav $@ Minefield_Z9001.wav
	gzip -fv --best Minefield_Z9001.wav

obj/z1013/%.z80 : obj/z1013/z80_header.rel obj/z1013/%.rel
	sdldz80 -mjwxi $(@:z80=ihx) -b _HEADER=0xe0 -b CODE=0x100 $^
	sdobjcopy -Iihex -Obinary  $(@:z80=ihx) $(@:z80=z8_)
	dd if=$(@:z80=z8_) of=$@ bs=32 conv=sync

obj/z1013/%.rel : src/%.asm src/z1013/platform.inc
	sdasz80 -Isrc/z1013 -plosgff $@ $< 

obj/z9001/%.rel : src/%.asm src/z9001/platform.inc
	sdasz80 -Isrc/z9001 -plosgff $@ $< 

clean:
	rm -rf obj
	rm -f Minefield_Z9001.wav


# This is not for building the egg, but for pulling
# the latest termbox source in.

termbox.h: temp/
	cp temp/src/*.c ./
	cp temp/src/*.h ./
	cp temp/src/*.inl ./
	cp temp/COPYING COPYING.termbox

temp/:
	git clone git@github.com:nsf/termbox.git temp

clean:
	rm -rf temp/
	rm -f *.c *.h *.inl
	rm -f COPYING.termbox

.PHONY: clean, all

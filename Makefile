# This is not for building the egg, but for pulling
# the latest termbox source in.

termbox/: temp/
	mkdir -p termbox
	cp temp/src/*.c ./termbox/
	cp temp/src/*.h ./termbox/
	cp temp/src/*.inl ./termbox/
	cp temp/COPYING ./termbox/COPYING

temp/:
	git clone git@github.com:nsf/termbox.git temp

clean:
	rm -rf temp
	rm -rf termbox

.PHONY: clean, all

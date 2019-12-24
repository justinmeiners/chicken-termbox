(import srfi-4)

(import (chicken process))
(import (chicken bitwise))


(import termbox)


(termbox-init)
(termbox-change-cell 4 4 #\子 tb/color/red tb/color/black)
(termbox-change-cell 0 0 #\C  tb/color/green tb/color/white)
(termbox-change-cell 4 8 #\A  (bitwise-ior tb/color/green tb/attrib/underline) tb/color/default)
(termbox-change-cell 5 8 #\B  (bitwise-ior tb/color/yellow tb/attrib/bold) tb/color/default)




(termbox-present)
(process-sleep 3)
(termbox-clear)


(termbox-blit 5 5 8 8 
  (make-u32vector 64 (char->integer #\_))
  (make-u32vector 64 tb/color/cyan)
  (make-u32vector 64 tb/color/black))

(termbox-present)
(display (termbox-poll-event))

(termbox-shutdown)



; Test is UI, so cannot be easily automated

(import srfi-4)
(import (chicken process))
(import (chicken bitwise))
(import termbox)

(define (display-note text)
     (define msg (list->u32vector
            (map char->integer
                (string->list text))))

    (termbox-copy-buffer
        msg
        (make-u32vector (u32vector-length msg) tb/color/white)
        (make-u32vector (u32vector-length msg) tb/color/default)
        (u32vector-length msg)))

   


(termbox-init)


(display-note "Testing Unicode & Attributes")

(termbox-change-cell 4 2 #\子 tb/color/red tb/color/black)
(termbox-change-cell 5 2 #\&  tb/color/green tb/color/white)
(termbox-change-cell 6 2 #\A  (bitwise-ior tb/color/green tb/attrib/underline) tb/color/default)
(termbox-change-cell 7 2 #\B  (bitwise-ior tb/color/yellow tb/attrib/bold) tb/color/default)
(termbox-change-cell 8 2 #\C  (bitwise-ior tb/color/magenta tb/attrib/underline) tb/color/default)


(termbox-present)
(termbox-peek-event 2000)
(termbox-clear)


(display-note "Text Blit")

(termbox-blit 2 2 8 8 
  (make-u32vector 64 (char->integer #\8))
  (make-u32vector 64 tb/color/cyan)
  (make-u32vector 64 tb/color/black))

(termbox-blit 11 3 8 16
  (make-u32vector 128 (char->integer #\7))
  (make-u32vector 128 tb/color/blue)
  (make-u32vector 128 tb/color/black))

(termbox-present)
(termbox-peek-event 2000)
(termbox-clear)

(termbox-shutdown)

(termbox-init "/dev/tty")

(display-note "Press any key")

(termbox-present)
(termbox-poll-event)

(termbox-shutdown)



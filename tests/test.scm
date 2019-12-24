(import srfi-4)

(import termbox)

(termbox-init)


;(display (termbox-width))

(termbox-change-cell 4 4 #\子 TB_RED TB_BLACK)
(termbox-change-cell 0 0 #\C  TB_GREEN TB_WHITE)


(termbox-blit 5 5 8 8 
    (make-u32vector 64 (char->integer #\_))
    (make-u32vector 64 TB_CYAN)
    (make-u32vector 64 TB_BLACK))


(termbox-present)

;(termbox-set-cursor 20 20)

(define x (termbox-poll-event))

(termbox-shutdown)

(display x)


(import (chicken foreign))
(import srfi-4)

(foreign-declare "#include \"termbox.h\"")

(define TB_DEFAULT (foreign-value "TB_DEFAULT" unsigned-integer32))
(define TB_BLACK (foreign-value "TB_BLACK" unsigned-integer32))
(define TB_RED (foreign-value "TB_RED" unsigned-integer32))
(define TB_GREEN (foreign-value "TB_GREEN" unsigned-integer32))
(define TB_YELLOW (foreign-value "TB_YELLOW" unsigned-integer32))
(define TB_BLUE (foreign-value "TB_BLUE" unsigned-integer32))
(define TB_MAGENTA (foreign-value "TB_MAGENTA" unsigned-integer32))
(define TB_CYAN (foreign-value "TB_CYAN" unsigned-integer32))
(define TB_WHITE (foreign-value "TB_WHITE" unsigned-integer32))

(define TB_BOLD (foreign-value "TB_BOLD" unsigned-integer32))
(define TB_UNDERLINE (foreign-value "TB_UNDERLINE" unsigned-integer32))
(define TB_REVERSE (foreign-value "TB_REVERSE" unsigned-integer32))

(define termbox-init 
    (foreign-lambda int "tb_init"))

(define termbox-shutdown
    (foreign-lambda void "tb_shutdown"))

(define termbox-width
    (foreign-lambda int "tb_width"))

(define termbox-height
    (foreign-lambda int "tb_height"))

(define termbox-clear
    (foreign-lambda void "tb_clear"))

(define termbox-set-clear
    (foreign-lambda void "tb_set_clear_attributes" unsigned-short unsigned-short))

(define termbox-present
    (foreign-lambda void "tb_present"))

(define termbox-change-cell-raw
    (foreign-lambda void "tb_change_cell"
        int int unsigned-integer32 unsigned-short unsigned-short))

(define (termbox-change-cell
            x y c fg bg)
    (termbox-change-cell-raw x y (char->integer c) fg bg))

(define termbox-set-cursor
    (foreign-lambda void "tb_set_cursor" int int))

(define (termbox-poll-event)
    (get-event -1))

(define (termbox-peek-event milis)
    (get-event milis))

(define get-event
    (foreign-safe-lambda* scheme-object ((int timeout))
        "C_word *a, type, mod, key, ch, w, h, x, y, sym;"
        "struct tb_event evt;"

        "int res;"
        "if (timeout < 0) {"
        "   res = tb_peek_event(&evt, timeout);"
        "} else { "
        "   res = tb_poll_event(&evt);"
        "}"

        "if (res == -1) {"
        "   C_return(C_SCHEME_FALSE);"
        "}"

        "a = C_alloc(C_SIZEOF_PAIR * 8 + C_SIZEOF_INTERNED_SYMBOL(4) * 8 + C_SIZEOF_LIST(8));"
        "sym = C_intern2(&a, \"TYPE\");"
        "type = C_a_pair(&a, sym, C_fix(evt.type));"
 
        "sym = C_intern2(&a, \"MOD\");"
        "mod = C_a_pair(&a, sym, C_fix(evt.mod));"

        "sym = C_intern2(&a, \"KEY\");"
        "key = C_a_pair(&a, sym, C_fix(evt.key));"

        "sym = C_intern2(&a, \"CHAR\");"
        "ch = C_a_pair(&a, sym, C_make_character(evt.ch));"

        "sym = C_intern2(&a, \"W\");"
        "w = C_a_pair(&a, sym, C_fix(evt.w));"

        "sym = C_intern2(&a, \"H\");"
        "h = C_a_pair(&a, sym, C_fix(evt.h));"

        "sym = C_intern2(&a, \"X\");"
        "x = C_a_pair(&a, sym, C_fix(evt.x));"

        "sym = C_intern2(&a, \"Y\");"
        "y = C_a_pair(&a, sym, C_fix(evt.y));"

        "C_return(C_list(&a, 8, type, mod, key, ch, w, h, x, y));"
       ))

(define termbox-copy-buffer
    (foreign-lambda* void
        ((nonnull-u32vector characters)
        (nonnull-u32vector fg)
        (nonnull-u32vector bg)
        (int len))
        "int i;"
        "struct tb_cell *c = tb_cell_buffer();"
        "for (i = 0; i < len; ++i) {"
        "   c[i].ch = characters[i];"
        "   c[i].fg = fg[i];"
        "   c[i].bg = bg[i];"
        "}"))

(define termbox-blit
    (foreign-lambda* void
        ((int x) (int y)
         (int w) (int h)
         (nonnull-u32vector characters)
         (nonnull-u32vector fg)
         (nonnull-u32vector bg))

        "int i = 0; int cols_per_row = tb_width();"
        "size_t offset = x + y * cols_per_row;"
        "struct tb_cell *c = tb_cell_buffer() + offset;"

        "int row, col;"  
        "for (col = 0; col < w; ++col) { "
         "   for (row = 0; row < h; ++row) {"
         "      c->ch = characters[i];"
         "      c->fg = fg[i];"
         "      c->bg = bg[i];"
         "      ++c; ++i;"
         "   }"
         "   c += cols_per_row - w;"
        "}"))


(define TB_INPUT_CURRENT (foreign-value "TB_INPUT_CURRENT" int))
(define TB_INPUT_ESC (foreign-value "TB_INPUT_ESC" int))
(define TB_INPUT_ALT (foreign-value "TB_INPUT_ALT" int))
(define TB_INPUT_MOUSE (foreign-value "TB_INPUT_MOUSE" int))

(define termbox-select-input-mode
    (foreign-lambda int "tb_select_input_mode" int))

(define TB_OUTPUT_CURRENT (foreign-value "TB_OUTPUT_CURRENT" int))
(define TB_OUTPUT_NORMAL (foreign-value "TB_OUTPUT_NORMAL" int))
(define TB_OUTPUT_256 (foreign-value "TB_OUTPUT_256" int))
(define TB_OUTPUT_GRAYSCALE (foreign-value "TB_OUTPUT_GRAYSCALE" int))

(define termbox-select-output-mode
    (foreign-lambda int "tb_select_output_mode" int))





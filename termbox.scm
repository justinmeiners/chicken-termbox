(module termbox
    *
  (import scheme
          (chicken foreign)
          (only (chicken base) error)
          srfi-4)

  (foreign-declare "#include \"termbox/termbox.c\"")
  (foreign-declare "#include \"termbox/utf8.c\"")


  (define tb/key/f1 (foreign-value "TB_KEY_F1" unsigned-integer32))
  (define tb/key/f2 (foreign-value "TB_KEY_F2" unsigned-integer32))
  (define tb/key/f3 (foreign-value "TB_KEY_F3" unsigned-integer32))
  (define tb/key/f4 (foreign-value "TB_KEY_F4" unsigned-integer32))
  (define tb/key/f5 (foreign-value "TB_KEY_F5" unsigned-integer32))
  (define tb/key/f6 (foreign-value "TB_KEY_F6" unsigned-integer32))
  (define tb/key/f7 (foreign-value "TB_KEY_F7" unsigned-integer32))
  (define tb/key/f8 (foreign-value "TB_KEY_F8" unsigned-integer32))
  (define tb/key/f9 (foreign-value "TB_KEY_F9" unsigned-integer32))
  (define tb/key/f10 (foreign-value "TB_KEY_F10" unsigned-integer32))
  (define tb/key/f11 (foreign-value "TB_KEY_F11" unsigned-integer32))
  (define tb/key/f12 (foreign-value "TB_KEY_F12" unsigned-integer32))
  (define tb/key/insert (foreign-value "TB_KEY_INSERT" unsigned-integer32))
  (define tb/key/delete (foreign-value "TB_KEY_DELETE" unsigned-integer32))
  (define tb/key/home (foreign-value "TB_KEY_HOME" unsigned-integer32))
  (define tb/key/end (foreign-value "TB_KEY_END" unsigned-integer32))
  (define tb/key/pgup (foreign-value "TB_KEY_PGUP" unsigned-integer32))
  (define tb/key/pgdn (foreign-value "TB_KEY_PGDN" unsigned-integer32))
  (define tb/key/arrowup (foreign-value "TB_KEY_ARROW_UP" unsigned-integer32))
  (define tb/key/arrowdown (foreign-value "TB_KEY_ARROW_DOWN" unsigned-integer32))
  (define tb/key/arrowleft (foreign-value "TB_KEY_ARROW_LEFT" unsigned-integer32))
  (define tb/key/arrowright (foreign-value "TB_KEY_ARROW_RIGHT" unsigned-integer32))
  (define tb/key/mouseleft (foreign-value "TB_KEY_MOUSE_LEFT" unsigned-integer32))
  (define tb/key/mouseright (foreign-value "TB_KEY_MOUSE_RIGHT" unsigned-integer32))
  (define tb/key/mousemiddle (foreign-value "TB_KEY_MOUSE_MIDDLE" unsigned-integer32))
  (define tb/key/mouserelease (foreign-value "TB_KEY_MOUSE_RELEASE" unsigned-integer32))
  (define tb/key/mousewheelup (foreign-value "TB_KEY_MOUSE_WHEEL_UP" unsigned-integer32))
  (define tb/key/mousewheeldown (foreign-value "TB_KEY_MOUSE_WHEEL_DOWN" unsigned-integer32))
  (define tb/key/ctrltilde (foreign-value "TB_KEY_CTRL_TILDE" unsigned-integer32))
  (define tb/key/ctrl2 (foreign-value "TB_KEY_CTRL_2" unsigned-integer32))
  (define tb/key/ctrla (foreign-value "TB_KEY_CTRL_A" unsigned-integer32))
  (define tb/key/ctrlb (foreign-value "TB_KEY_CTRL_B" unsigned-integer32))
  (define tb/key/ctrlc (foreign-value "TB_KEY_CTRL_C" unsigned-integer32))
  (define tb/key/ctrld (foreign-value "TB_KEY_CTRL_D" unsigned-integer32))
  (define tb/key/ctrle (foreign-value "TB_KEY_CTRL_E" unsigned-integer32))
  (define tb/key/ctrlf (foreign-value "TB_KEY_CTRL_F" unsigned-integer32))
  (define tb/key/ctrlg (foreign-value "TB_KEY_CTRL_G" unsigned-integer32))
  (define tb/key/backspace (foreign-value "TB_KEY_BACKSPACE" unsigned-integer32))
  (define tb/key/ctrlh (foreign-value "TB_KEY_CTRL_H" unsigned-integer32))
  (define tb/key/tab (foreign-value "TB_KEY_TAB" unsigned-integer32))
  (define tb/key/ctrli (foreign-value "TB_KEY_CTRL_I" unsigned-integer32))
  (define tb/key/ctrlj (foreign-value "TB_KEY_CTRL_J" unsigned-integer32))
  (define tb/key/ctrlk (foreign-value "TB_KEY_CTRL_K" unsigned-integer32))
  (define tb/key/ctrll (foreign-value "TB_KEY_CTRL_L" unsigned-integer32))
  (define tb/key/enter (foreign-value "TB_KEY_ENTER" unsigned-integer32))
  (define tb/key/ctrlm (foreign-value "TB_KEY_CTRL_M" unsigned-integer32))
  (define tb/key/ctrln (foreign-value "TB_KEY_CTRL_N" unsigned-integer32))
  (define tb/key/ctrlo (foreign-value "TB_KEY_CTRL_O" unsigned-integer32))
  (define tb/key/ctrlp (foreign-value "TB_KEY_CTRL_P" unsigned-integer32))
  (define tb/key/ctrlq (foreign-value "TB_KEY_CTRL_Q" unsigned-integer32))
  (define tb/key/ctrlr (foreign-value "TB_KEY_CTRL_R" unsigned-integer32))
  (define tb/key/ctrls (foreign-value "TB_KEY_CTRL_S" unsigned-integer32))
  (define tb/key/ctrlt (foreign-value "TB_KEY_CTRL_T" unsigned-integer32))
  (define tb/key/ctrlu (foreign-value "TB_KEY_CTRL_U" unsigned-integer32))
  (define tb/key/ctrlv (foreign-value "TB_KEY_CTRL_V" unsigned-integer32))
  (define tb/key/ctrlw (foreign-value "TB_KEY_CTRL_W" unsigned-integer32))
  (define tb/key/ctrlx (foreign-value "TB_KEY_CTRL_X" unsigned-integer32))
  (define tb/key/ctrly (foreign-value "TB_KEY_CTRL_Y" unsigned-integer32))
  (define tb/key/ctrlz (foreign-value "TB_KEY_CTRL_Z" unsigned-integer32))
  (define tb/key/esc (foreign-value "TB_KEY_ESC" unsigned-integer32))
  (define tb/key/ctrllsqbracket (foreign-value "TB_KEY_CTRL_LSQ_BRACKET" unsigned-integer32))
  (define tb/key/ctrl3 (foreign-value "TB_KEY_CTRL_3" unsigned-integer32))
  (define tb/key/ctrl4 (foreign-value "TB_KEY_CTRL_4" unsigned-integer32))
  (define tb/key/ctrlbackslash (foreign-value "TB_KEY_CTRL_BACKSLASH" unsigned-integer32))
  (define tb/key/ctrl5 (foreign-value "TB_KEY_CTRL_5" unsigned-integer32))
  (define tb/key/ctrlrsqbracket (foreign-value "TB_KEY_CTRL_RSQ_BRACKET" unsigned-integer32))
  (define tb/key/ctrl6 (foreign-value "TB_KEY_CTRL_6" unsigned-integer32))
  (define tb/key/ctrl7 (foreign-value "TB_KEY_CTRL_7" unsigned-integer32))
  (define tb/key/ctrlslash (foreign-value "TB_KEY_CTRL_SLASH" unsigned-integer32))
  (define tb/key/ctrlunderscore (foreign-value "TB_KEY_CTRL_UNDERSCORE" unsigned-integer32))
  (define tb/key/space (foreign-value "TB_KEY_SPACE" unsigned-integer32))
  (define tb/key/backspace2 (foreign-value "TB_KEY_BACKSPACE2" unsigned-integer32))
  (define tb/key/ctrl8 (foreign-value "TB_KEY_BACKSPACE2" unsigned-integer32))

  (define tb/mod/alt (foreign-value "TB_MOD_ALT" unsigned-integer32))
  (define tb/mod/motion (foreign-value "TB_MOD_MOTION" unsigned-integer32))


  (define tb/color/default (foreign-value "TB_DEFAULT" unsigned-integer32))
  (define tb/color/black (foreign-value "TB_BLACK" unsigned-integer32))
  (define tb/color/red (foreign-value "TB_RED" unsigned-integer32))
  (define tb/color/green (foreign-value "TB_GREEN" unsigned-integer32))
  (define tb/color/yellow (foreign-value "TB_YELLOW" unsigned-integer32))
  (define tb/color/blue (foreign-value "TB_BLUE" unsigned-integer32))
  (define tb/color/magenta (foreign-value "TB_MAGENTA" unsigned-integer32))
  (define tb/color/cyan (foreign-value "TB_CYAN" unsigned-integer32))
  (define tb/color/white (foreign-value "TB_WHITE" unsigned-integer32))

  (define tb/attrib/bold (foreign-value "TB_BOLD" unsigned-integer32))
  (define tb/attrib/underline (foreign-value "TB_UNDERLINE" unsigned-integer32))
  (define tb/attrib/reverse (foreign-value "TB_REVERSE" unsigned-integer32))

  (define tb/event/key (foreign-value "TB_EVENT_KEY" unsigned-integer32))
  (define tb/event/resize (foreign-value "TB_EVENT_RESIZE" unsigned-integer32))
  (define tb/event/mouse (foreign-value "TB_EVENT_MOUSE" unsigned-integer32))

  (define priv-termbox-init (foreign-lambda int "tb_init"))
  (define priv-termbox-init-file (foreign-lambda int "tb_init_file" c-string))
  (define priv-termbox-init-fd (foreign-lambda int "tb_init_fd" integer))

  (define (termbox-init . args)
    (cond ((null? args) (priv-termbox-init))
          ((string? (car args)) (priv-termbox-init-file (car args)))
          ((number? (car args)) (priv-termbox-init-fd (car args)))
          (else (error "bad argument type"))))

  (define termbox-shutdown
    (foreign-lambda void "tb_shutdown"))

  (define (termbox-run thunk)
    (dynamic-wind 
      termbox-init
      thunk
      termbox-shutdown))

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

  (define termbox-hide-cursor
    (termbox-set-cursor -1 -1))

  (define (termbox-poll-event)
    (priv-termbox-get-event -1))

  (define (termbox-peek-event milis)
    (priv-termbox-get-event milis))

  (define priv-termbox-get-event
    (foreign-safe-lambda* scheme-object ((int timeout))
      "C_word *a, type, mod, key, ch, w, h, x, y, sym;"
      "struct tb_event evt;"

      "int res;"
      "if (timeout >= 0) {"
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
      "for (row = 0; row < h; ++row) { "
      "   for (col = 0; col < w; ++col) {"
      "      c->ch = characters[i];"
      "      c->fg = fg[i];"
      "      c->bg = bg[i];"
      "      ++c; ++i;"
      "   }"
      "   c += cols_per_row - w;"
      "}"))


  (define tb/input/current (foreign-value "TB_INPUT_CURRENT" int))
  (define tb/input/esc (foreign-value "TB_INPUT_ESC" int))
  (define tb/input/alt (foreign-value "TB_INPUT_ALT" int))
  (define tb/input/mouse (foreign-value "TB_INPUT_MOUSE" int))

  (define termbox-select-input-mode
    (foreign-lambda int "tb_select_input_mode" int))

  (define tb/output/current (foreign-value "TB_OUTPUT_CURRENT" int))
  (define tb/output/normal (foreign-value "TB_OUTPUT_NORMAL" int))
  (define tb/output/256 (foreign-value "TB_OUTPUT_256" int))
  (define tb/output/grayscale (foreign-value "TB_OUTPUT_GRAYSCALE" int))

  (define termbox-select-output-mode
    (foreign-lambda int "tb_select_output_mode" int)))





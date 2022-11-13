.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_inopts(3x) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `PORTABILITY <#PORTABILITY>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_inopts(3X)                                          curs_inopts(3X)

NAME
-------------------------------------------------

::

          cbreak, nocbreak, echo, noecho, halfdelay, intrflush, keypad,
          meta, nl, nonl, nodelay, notimeout, raw, noraw, qiflush,
          noqiflush, timeout, wtimeout, typeahead - curses input options


---------------------------------------------------------

::

          #include <curses.h>

          int cbreak(void);
          int nocbreak(void);

          int echo(void);
          int noecho(void);

          int intrflush(WINDOW *win, bool bf);
          int keypad(WINDOW *win, bool bf);
          int meta(WINDOW *win, bool bf);
          int nodelay(WINDOW *win, bool bf);
          int notimeout(WINDOW *win, bool bf);

          int nl(void);
          int nonl(void);

          int raw(void);
          int noraw(void);

          void qiflush(void);
          void noqiflush(void);

          int halfdelay(int tenths);
          void timeout(int delay);
          void wtimeout(WINDOW *win, int delay);

          int typeahead(int fd);


---------------------------------------------------------------

::

          The ncurses library provides several functions which let an
          application change the way input from the terminal is handled.
          Some are global, applying to all windows.  Others apply only to a
          specific window.  Window-specific settings are not automatically
          applied to new or derived windows.  An application must apply
          these to each window, if the same behavior is needed.

      cbreak/nocbreak
          Normally, the tty driver buffers typed characters until a newline
          or carriage return is typed.  The cbreak routine disables line
          buffering and erase/kill character-processing (interrupt and flow
          control characters are unaffected), making characters typed by
          the user immediately available to the program.  The nocbreak
          routine returns the terminal to normal (cooked) mode.

          Initially the terminal may or may not be in cbreak mode, as the
          mode is inherited; therefore, a program should call cbreak or
          nocbreak explicitly.  Most interactive programs using curses set
          the cbreak mode.  Note that cbreak overrides raw.  [See
          curs_getch(3X) for a discussion of how these routines interact
          with echo and noecho.]

      echo/noecho
          The echo and noecho routines control whether characters typed by
          the user are echoed by getch(3X) as they are typed.  Echoing by
          the tty driver is always disabled, but initially getch is in echo
          mode, so characters typed are echoed.  Authors of most
          interactive programs prefer to do their own echoing in a
          controlled area of the screen, or not to echo at all, so they
          disable echoing by calling noecho.  [See curs_getch(3X) for a
          discussion of how these routines interact with cbreak and
          nocbreak.]

      halfdelay
          The halfdelay routine is used for half-delay mode, which is
          similar to cbreak mode in that characters typed by the user are
          immediately available to the program.  However, after blocking
          for tenths tenths of seconds, ERR is returned if nothing has been
          typed.  The value of tenths must be a number between 1 and 255.
          Use nocbreak to leave half-delay mode.

      intrflush
          If the intrflush option is enabled (bf is TRUE), and an interrupt
          key is pressed on the keyboard (interrupt, break, quit), all
          output in the tty driver queue will be flushed, giving the effect
          of faster response to the interrupt, but causing curses to have
          the wrong idea of what is on the screen.  Disabling the option
          (bf is FALSE) prevents the flush.  The default for the option is
          inherited from the tty driver settings.  The window argument is
          ignored.

      keypad
          The keypad option enables the keypad of the user's terminal.  If
          enabled (bf is TRUE), the user can press a function key (such as
          an arrow key) and wgetch(3X) returns a single value representing
          the function key, as in KEY_LEFT.  If disabled (bf is FALSE),
          curses does not treat function keys specially and the program has
          to interpret the escape sequences itself.  If the keypad in the
          terminal can be turned on (made to transmit) and off (made to
          work locally), turning on this option causes the terminal keypad
          to be turned on when wgetch(3X) is called.  The default value for
          keypad is FALSE.

      meta
          Initially, whether the terminal returns 7 or 8 significant bits
          on input depends on the control mode of the tty driver [see
          termios(3)].  To force 8 bits to be returned, invoke meta(win,
          TRUE); this is equivalent, under POSIX, to setting the CS8 flag
          on the terminal.  To force 7 bits to be returned, invoke
          meta(win, FALSE); this is equivalent, under POSIX, to setting the
          CS7 flag on the terminal.  The window argument, win, is always
          ignored.  If the terminfo capabilities smm (meta_on) and rmm
          (meta_off) are defined for the terminal, smm is sent to the
          terminal when meta(win, TRUE) is called and rmm is sent when
          meta(win, FALSE) is called.

      nl/nonl
          The nl and nonl routines control whether the underlying display
          device translates the return key into newline on input.

      nodelay
          The nodelay option causes getch to be a non-blocking call.  If no
          input is ready, getch returns ERR.  If disabled (bf is FALSE),
          getch waits until a key is pressed.

      notimeout
          When interpreting an escape sequence, wgetch(3X) sets a timer
          while waiting for the next character.  If notimeout(win, TRUE) is
          called, then wgetch does not set a timer.  The purpose of the
          timeout is to differentiate between sequences received from a
          function key and those typed by a user.

      raw/noraw
          The raw and noraw routines place the terminal into or out of raw
          mode.  Raw mode is similar to cbreak mode, in that characters
          typed are immediately passed through to the user program.  The
          differences are that in raw mode, the interrupt, quit, suspend,
          and flow control characters are all passed through uninterpreted,
          instead of generating a signal.  The behavior of the BREAK key
          depends on other bits in the tty driver that are not set by
          curses.

      qiflush/noqiflush
          When the noqiflush routine is used, normal flush of input and
          output queues associated with the INTR, QUIT and SUSP characters
          will not be done [see termios(3)].  When qiflush is called, the
          queues will be flushed when these control characters are read.
          You may want to call noqiflush in a signal handler if you want
          output to continue as though the interrupt had not occurred,
          after the handler exits.

      timeout/wtimeout
          The timeout and wtimeout routines set blocking or non-blocking
          read for a given window.  If delay is negative, blocking read is
          used (i.e., waits indefinitely for input).  If delay is zero,
          then non-blocking read is used (i.e., read returns ERR if no
          input is waiting).  If delay is positive, then read blocks for
          delay milliseconds, and returns ERR if there is still no input.
          Hence, these routines provide the same functionality as nodelay,
          plus the additional capability of being able to block for only
          delay milliseconds (where delay is positive).

      typeahead
          The curses library does “line-breakout optimization” by looking
          for typeahead periodically while updating the screen.  If input
          is found, and it is coming from a tty, the current update is
          postponed until refresh(3X) or doupdate is called again.  This
          allows faster response to commands typed in advance.  Normally,
          the input FILE pointer passed to newterm, or stdin in the case
          that initscr was used, will be used to do this typeahead
          checking.  The typeahead routine specifies that the file
          descriptor fd is to be used to check for typeahead instead.  If
          fd is -1, then no typeahead checking is done.


-----------------------------------------------------------------

::

          All routines that return an integer return ERR upon failure and
          OK (SVr4 specifies only “an integer value other than ERR”) upon
          successful completion, unless otherwise noted in the preceding
          routine descriptions.

          X/Open does not define any error conditions.  In this
          implementation, functions with a window parameter will return an
          error if it is null.  Any function will also return an error if
          the terminal was not initialized.  Also,

                 halfdelay
                      returns an error if its parameter is outside the
                      range 1..255.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.

          The ncurses library obeys the XPG4 standard and the historical
          practice of the AT&T curses implementations, in that the echo bit
          is cleared when curses initializes the terminal state.  BSD
          curses differed from this slightly; it left the echo bit on at
          initialization, but the BSD raw call turned it off as a side-
          effect.  For best portability, set echo or noecho explicitly just
          after initialization, even if your program remains in cooked
          mode.

          The XSI Curses standard is ambiguous on the question of whether
          raw should disable the CRLF translations controlled by nl and
          nonl.  BSD curses did turn off these translations; AT&T curses
          (at least as late as SVr1) did not.  We chose to do so, on the
          theory that a programmer requesting raw input wants a clean
          (ideally 8-bit clean) connection that the operating system will
          not alter.

          When keypad is first enabled, ncurses loads the key-definitions
          for the current terminal description.  If the terminal
          description includes extended string capabilities, e.g., from
          using the -x option of @TIC@, then ncurses also defines keys for
          the capabilities whose names begin with “k”.  The corresponding
          keycodes are generated and (depending on previous loads of
          terminal descriptions) may differ from one execution of a program
          to the next.  The generated keycodes are recognized by the
          keyname function (which will then return a name beginning with
          “k” denoting the terminfo capability name rather than “K”, used
          for curses key-names).  On the other hand, an application can use
          define_key to establish a specific keycode for a given string.
          This makes it possible for an application to check for an
          extended capability's presence with tigetstr, and reassign the
          keycode to match its own needs.

          Low-level applications can use tigetstr to obtain the definition
          of any particular string capability.  Higher-level applications
          which use the curses wgetch and similar functions to return
          keycodes rely upon the order in which the strings are loaded.  If
          more than one key definition has the same string value, then
          wgetch can return only one keycode.  Most curses implementations
          (including ncurses) load key definitions in the order defined by
          the array of string capability names.  The last key to be loaded
          determines the keycode which will be returned.  In ncurses, you
          may also have extended capabilities interpreted as key
          definitions.  These are loaded after the predefined keys, and if
          a capability's value is the same as a previously-loaded key
          definition, the later definition is the one used.


---------------------------------------------------

::

          Note that echo, noecho, halfdelay, intrflush, meta, nl, nonl,
          nodelay, notimeout, noqiflush, qiflush, timeout, and wtimeout may
          be macros.

          The noraw and nocbreak calls follow historical practice in that
          they attempt to restore to normal (“cooked”) mode from raw and
          cbreak modes respectively.  Mixing raw/noraw and cbreak/nocbreak
          calls leads to tty driver control states that are hard to predict
          or understand; it is not recommended.


---------------------------------------------------------

::

          curses(3X), curs_getch(3X), curs_initscr(3X), curs_util(3X),
          define_key(3X), termios(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the ncurses (new curses) project.
          Information about the project can be found at 
          ⟨https://www.gnu.org/software/ncurses/ncurses.html⟩.  If you have
          a bug report for this manual page, send it to
          bug-ncurses-request@gnu.org.  This page was obtained from the
          project's upstream Git mirror of the CVS repository
          ⟨git://ncurses.scripts.mit.edu/ncurses.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-05-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                            curs_inopts(3X)

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/

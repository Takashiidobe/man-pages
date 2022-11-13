.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_get_wch(3x) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_get_wch(3X)                                        curs_get_wch(3X)

NAME
-------------------------------------------------

::

          get_wch, wget_wch, mvget_wch, mvwget_wch, unget_wch - get (or
          push back) a wide character from curses terminal keyboard


---------------------------------------------------------

::

          #include <curses.h>

          int get_wch(wint_t *wch);
          int wget_wch(WINDOW *win, wint_t *wch);
          int mvget_wch(int y, int x, wint_t *wch);
          int mvwget_wch(WINDOW *win, int y, int x, wint_t *wch);

          int unget_wch(const wchar_t wch);


---------------------------------------------------------------

::

      wget_wch
          The get_wch, wget_wch, mvget_wch, and mvwget_wch functions read a
          character from the terminal associated with the current or
          specified window.  In no-delay mode, if no input is waiting, the
          value ERR is returned.  In delay mode, the program waits until
          the system passes text through to the program.  Depending on the
          setting of cbreak, this is after one character (cbreak mode), or
          after the first newline (nocbreak mode).  In half-delay mode, the
          program waits until the user types a character or the specified
          timeout interval has elapsed.

          Unless noecho has been set, these routines echo the character
          into the designated window.

          If the window is not a pad and has been moved or modified since
          the last call to wrefresh, wrefresh will be called before another
          character is read.

          If keypad is enabled, these functions respond to the pressing of
          a function key by setting the object pointed to by wch to the
          keycode assigned to the function key, and returning KEY_CODE_YES.
          If a character (such as escape) that could be the beginning of a
          function key is received, curses sets a timer.  If the remainder
          of the sequence does arrive within the designated time, curses
          passes through the character; otherwise, curses returns the
          function key value.  For this reason, many terminals experience a
          delay between the time a user presses the escape key and the time
          the escape is returned to the program.

          The keycodes returned by these functions are the same as those
          returned by wgetch:

          •   The predefined function keys are listed in <curses.h> as
              macros with values outside the range of 8-bit characters.
              Their names begin with KEY_.

          •   Other (user-defined) function keys which may be defined using
              define_key(3X) have no names, but also are expected to have
              values outside the range of 8-bit characters.

      unget_wch
          The unget_wch function pushes the wide character wch back onto
          the head of the input queue, so the wide character is returned by
          the next call to get_wch.  The pushback of one character is
          guaranteed.  If the program calls unget_wch too many times
          without an intervening call to get_wch, the operation may fail.

          Unlike ungetch and wgetch, unget_wch cannot distinguish special
          characters returned by wget_wch from ordinary characters.  An
          application can push special keys which it may read via wget_wch
          by checking for the KEY_CODE_YES result, and using ungetch for
          those special keys.


---------------------------------------------------

::

          The header file <curses.h> automatically includes the header file
          <stdio.h>.

          Applications should not define the escape key by itself as a
          single-character function.

          When using get_wch, wget_wch, mvget_wch, or mvwget_wch,
          applications should not use nocbreak mode and echo mode at the
          same time.  Depending on the state of the tty driver when each
          character is typed, the program may produce undesirable results.

          All functions except wget_wch and unget_wch may be macros.


-----------------------------------------------------------------

::

          When get_wch, wget_wch, mvget_wch, and mvwget_wch functions
          successfully report the pressing of a function key, they return
          KEY_CODE_YES.  When they successfully report a wide character,
          they return OK.  Otherwise, they return ERR.

          Upon successful completion, unget_wch returns OK.  Otherwise, the
          function returns ERR.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------------

::

          curses(3X), curs_getch(3X), curs_ins_wch(3X), curs_inopts(3X),
          curs_move(3X), curs_refresh(3X)

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

                                                           curs_get_wch(3X)

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

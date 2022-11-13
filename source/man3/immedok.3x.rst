.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_outopts(3x) — Linux manual page
====================================

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

   curs_outopts(3X)                                        curs_outopts(3X)

NAME
-------------------------------------------------

::

          clearok, idlok, idcok, immedok, leaveok, setscrreg, wsetscrreg,
          scrollok - curses output options


---------------------------------------------------------

::

          #include <curses.h>

          int clearok(WINDOW *win, bool bf);
          int idlok(WINDOW *win, bool bf);
          void idcok(WINDOW *win, bool bf);
          void immedok(WINDOW *win, bool bf);
          int leaveok(WINDOW *win, bool bf);
          int scrollok(WINDOW *win, bool bf);

          int setscrreg(int top, int bot);
          int wsetscrreg(WINDOW *win, int top, int bot);


---------------------------------------------------------------

::

          These routines set options that change the style of output within
          curses.  All options are initially FALSE, unless otherwise
          stated.  It is not necessary to turn these options off before
          calling endwin(3X).

      clearok
          If clearok is called with TRUE as argument, the next call to
          wrefresh with this window will clear the screen completely and
          redraw the entire screen from scratch.  This is useful when the
          contents of the screen are uncertain, or in some cases for a more
          pleasing visual effect.  If the win argument to clearok is the
          global variable curscr, the next call to wrefresh with any window
          causes the screen to be cleared and repainted from scratch.

      idlok
          If idlok is called with TRUE as second argument, curses considers
          using the hardware insert/delete line feature of terminals so
          equipped.  Calling idlok with FALSE as second argument disables
          use of line insertion and deletion.  This option should be
          enabled only if the application needs insert/delete line, for
          example, for a screen editor.  It is disabled by default because
          insert/delete line tends to be visually annoying when used in
          applications where it is not really needed.  If insert/delete
          line cannot be used, curses redraws the changed portions of all
          lines.

      idcok
          If idcok is called with FALSE as second argument, curses no
          longer considers using the hardware insert/delete character
          feature of terminals so equipped.  Use of character insert/delete
          is enabled by default.  Calling idcok with TRUE as second
          argument re-enables use of character insertion and deletion.

      immedok
          If immedok is called with TRUE as argument, any change in the
          window image, such as the ones caused by waddch, wclrtobot,
          wscrl, etc., automatically cause a call to wrefresh.  However, it
          may degrade performance considerably, due to repeated calls to
          wrefresh.  It is disabled by default.

      leaveok
          Normally, the hardware cursor is left at the location of the
          window cursor being refreshed.  The leaveok option allows the
          cursor to be left wherever the update happens to leave it.  It is
          useful for applications where the cursor is not used, since it
          reduces the need for cursor motions.

      scrollok
          The scrollok option controls what happens when the cursor of a
          window is moved off the edge of the window or scrolling region,
          either as a result of a newline action on the bottom line, or
          typing the last character of the last line.  If disabled, (bf is
          FALSE), the cursor is left on the bottom line.  If enabled, (bf
          is TRUE), the window is scrolled up one line (Note that to get
          the physical scrolling effect on the terminal, it is also
          necessary to call idlok).

      setscrreg/wsetscrreg
          The setscrreg and wsetscrreg routines allow the application
          programmer to set a software scrolling region in a window.  The
          top and bot parameters are the line numbers of the top and bottom
          margin of the scrolling region.  (Line 0 is the top line of the
          window.)  If this option and scrollok are enabled, an attempt to
          move off the bottom margin line causes all lines in the scrolling
          region to scroll one line in the direction of the first line.
          Only the text of the window is scrolled.  (Note that this has
          nothing to do with the use of a physical scrolling region
          capability in the terminal, like that in the VT100.  If idlok is
          enabled and the terminal has either a scrolling region or
          insert/delete line capability, they will probably be used by the
          output routines.)


-----------------------------------------------------------------

::

          The functions setscrreg and wsetscrreg return OK upon success and
          ERR upon failure.  All other routines that return an integer
          always return OK.

          X/Open Curses does not define any error conditions.

          In this implementation,

          •   those functions that have a window pointer will return an
              error if the window pointer is null

          •   wsetscrreg returns an error if the scrolling region limits
              extend outside the window.

          X/Open does not define any error conditions.  This implementation
          returns an error if the window pointer is null.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.

          From the outset, ncurses used nl/nonl to control the conversion
          of newlines to carriage return/line-feed on output as well as
          input.  XSI Curses documents only the use of these functions for
          input.  This difference arose from converting the pcurses source
          (which used ioctl calls with the sgttyb structure) to termios
          (i.e., the POSIX terminal interface).  In the former, both input
          and output were controlled via a single option CRMOD, while the
          latter separates these features.  Because that conversion
          interferes with output optimization, nl/nonl were amended after
          ncurses 6.2 to eliminate their effect on output.

          Some historic curses implementations had, as an undocumented
          feature, the ability to do the equivalent of clearok(..., 1) by
          saying touchwin(stdscr) or clear(stdscr).  This will not work
          under ncurses.

          Earlier System V curses implementations specified that with
          scrollok enabled, any window modification triggering a scroll
          also forced a physical refresh.  XSI Curses does not require
          this, and ncurses avoids doing it to perform better vertical-
          motion optimization at wrefresh time.

          The XSI Curses standard does not mention that the cursor should
          be made invisible as a side-effect of leaveok.  SVr4 curses
          documentation does this, but the code does not.  Use curs_set to
          make the cursor invisible.


---------------------------------------------------

::

          Note that clearok, leaveok, scrollok, idcok, and setscrreg may be
          macros.

          The immedok routine is useful for windows that are used as
          terminal emulators.


---------------------------------------------------------

::

          curses(3X), curs_addch(3X), curs_clear(3X), curs_initscr(3X),
          curs_scroll(3X), curs_refresh(3X), curs_variables(3X).

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

                                                           curs_outopts(3X)

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

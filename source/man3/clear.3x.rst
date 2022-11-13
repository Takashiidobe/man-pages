.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_clear(3x) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_clear(3X)                                            curs_clear(3X)

NAME
-------------------------------------------------

::

          erase, werase, clear, wclear, clrtobot, wclrtobot, clrtoeol,
          wclrtoeol - clear all or part of a curses window


---------------------------------------------------------

::

          #include <curses.h>

          int erase(void);
          int werase(WINDOW *win);

          int clear(void);
          int wclear(WINDOW *win);

          int clrtobot(void);
          int wclrtobot(WINDOW *win);

          int clrtoeol(void);
          int wclrtoeol(WINDOW *win);


---------------------------------------------------------------

::

          The erase and werase routines copy blanks to every position in
          the window, clearing the screen.

          The clear and wclear routines are like erase and werase, but they
          also call clearok, so that the screen is cleared completely on
          the next call to wrefresh for that window and repainted from
          scratch.

          The clrtobot and wclrtobot routines erase from the cursor to the
          end of screen.  That is, they erase all lines below the cursor in
          the window.  Also, the current line to the right of the cursor,
          inclusive, is erased.

          The clrtoeol and wclrtoeol routines erase the current line to the
          right of the cursor, inclusive, to the end of the current line.

          Blanks created by erasure have the current background rendition
          (as set by wbkgdset) merged into them.


-----------------------------------------------------------------

::

          All routines return the integer OK on success and ERR on failure.

          X/Open defines no error conditions.  In this implementation,

          •   functions using a window pointer parameter return an error if
              it is null

          •   wclrtoeol returns an error if the cursor position is about to
              wrap.


---------------------------------------------------

::

          Note that erase, werase, clear, wclear, clrtobot, and clrtoeol
          may be macros.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.  The standard specifies that they return ERR on failure, but
          specifies no error conditions.

          The SVr4.0 manual says that these functions could return "a non-
          negative integer if immedok is set", referring to the return-
          value of wrefresh.  In that implementation, wrefresh would return
          a count of the number of characters written to the terminal.

          Some historic curses implementations had, as an undocumented
          feature, the ability to do the equivalent of clearok(..., 1) by
          saying touchwin(stdscr) or clear(stdscr).  This will not work
          under ncurses.

          This implementation, and others such as Solaris, sets the current
          position to 0,0 after erasing via werase and wclear.  That fact
          is not documented in other implementations, and may not be true
          of implementations which were not derived from SVr4 source.

          Not obvious from the description, most implementations clear the
          screen after wclear even for a subwindow or derived window.  If
          you do not want to clear the screen during the next wrefresh, use
          werase instead.


---------------------------------------------------------

::

          curses(3X), curs_outopts(3X), curs_refresh(3X),
          curs_variables(3X)

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

                                                             curs_clear(3X)

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

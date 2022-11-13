.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_border(3x) — Linux manual page
===================================

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

   curs_border(3X)                                          curs_border(3X)

NAME
-------------------------------------------------

::

          border, wborder, box, hline, whline, vline, wvline, mvhline,
          mvwhline, mvvline, mvwvline - create curses borders, horizontal
          and vertical lines


---------------------------------------------------------

::

          #include <curses.h>

          int border(chtype ls, chtype rs, chtype ts, chtype bs,
                     chtype tl, chtype tr, chtype bl, chtype br);
          int wborder(WINDOW *win, chtype ls, chtype rs,
                      chtype ts, chtype bs, chtype tl, chtype tr,
                      chtype bl, chtype br);

          int box(WINDOW *win, chtype verch, chtype horch);

          int hline(chtype ch, int n);
          int whline(WINDOW *win, chtype ch, int n);
          int vline(chtype ch, int n);
          int wvline(WINDOW *win, chtype ch, int n);

          int mvhline(int y, int x, chtype ch, int n);
          int mvwhline(WINDOW *win, int y, int x, chtype ch, int n);
          int mvvline(int y, int x, chtype ch, int n);
          int mvwvline(WINDOW *win, int y, int x, chtype ch, int n);


---------------------------------------------------------------

::

          The border, wborder and box routines draw a box around the edges
          of a window.  Other than the window, each argument is a character
          with attributes:

                 ls - left side,
                 rs - right side,
                 ts - top side,
                 bs - bottom side,
                 tl - top left-hand corner,
                 tr - top right-hand corner,
                 bl - bottom left-hand corner, and
                 br - bottom right-hand corner.

          If any of these arguments is zero, then the corresponding default
          values (defined in curses.h) are used instead:

                 ACS_VLINE,
                 ACS_VLINE,
                 ACS_HLINE,
                 ACS_HLINE,
                 ACS_ULCORNER,
                 ACS_URCORNER,
                 ACS_LLCORNER,
                 ACS_LRCORNER.

          box(win, verch, horch) is a shorthand for the following call:
          wborder(win, verch, verch, horch, horch, 0, 0, 0, 0).

          The hline and whline functions draw a horizontal (left to right)
          line using ch starting at the current cursor position in the
          window.  The current cursor position is not changed.  The line is
          at most n characters long, or as many as fit into the window.

          The vline and wvline functions draw a vertical (top to bottom)
          line using ch starting at the current cursor position in the
          window.  The current cursor position is not changed.  The line is
          at most n characters long, or as many as fit into the window.


-----------------------------------------------------------------

::

          All routines return the integer OK.  The SVr4.0 manual says "or a
          non-negative integer if immedok is set", but this appears to be
          an error.

          X/Open does not define any error conditions.  This implementation
          returns an error if the window pointer is null.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------

::

          The borders generated by these functions are inside borders (this
          is also true of SVr4 curses, though the fact is not documented).

          Note that border and box may be macros.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.  The standard specifies that they return ERR on failure, but
          specifies no error conditions.


---------------------------------------------------------

::

          curses(3X), curs_outopts(3X).

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

                                                            curs_border(3X)

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

.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_border_set(3x) — Linux manual page
=======================================

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

   curs_border_set(3X)                                  curs_border_set(3X)

NAME
-------------------------------------------------

::

          border_set, wborder_set, box_set, hline_set, whline_set,
          mvhline_set, mvwhline_set, vline_set, wvline_set, mvvline_set,
          mvwvline_set - create curses borders or lines using complex
          characters and renditions


---------------------------------------------------------

::

          #include <curses.h>

          int border_set(
             const cchar_t *ls, const cchar_t *rs,
             const cchar_t *ts, const cchar_t *bs,
             const cchar_t *tl, const cchar_t *tr,
             const cchar_t *bl, const cchar_t *br );
          int wborder_set(
             WINDOW *win,
             const cchar_t *ls, const cchar_t *rs,
             const cchar_t *ts, const cchar_t *bs,
             const cchar_t *tl, const cchar_t *tr,
             const cchar_t *bl, const cchar_t *br);
          int box_set(
             WINDOW *win,
             const cchar_t *verch,
             const cchar_t *horch);
          int hline_set(
             const cchar_t *wch, int n);
          int whline_set(
             WINDOW *win,
             const cchar_t *wch, int n);
          int mvhline_set(
             int y, int x,
             const cchar_t *wch, int n);
          int mvwhline_set(
             WINDOW *win,
             int y, int x,
             const cchar_t *wch, int n);
          int vline_set(
             const cchar_t *wch, int n);
          int wvline_set(
             WINDOW *win,
             const cchar_t *wch, int n);
          int mvvline_set(
             int y, int x,
             const cchar_t *wch, int n);
          int mvwvline_set(
             WINDOW *win,
             int y, int x,
             const cchar_t *wch, int n);


---------------------------------------------------------------

::

          The border_set and wborder_set functions draw a border around the
          edges of the current or specified window.  These functions do not
          change the cursor position, and do not wrap.

          Other than the window, each argument is a complex character with
          attributes:
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
                 WACS_VLINE,
                 WACS_VLINE,
                 WACS_HLINE,
                 WACS_HLINE,
                 WACS_ULCORNER,
                 WACS_URCORNER,
                 WACS_LLCORNER, and
                 WACS_LRCORNER.

          box_set(win, verch, horch); is a shorthand for the following
          call:

          wborder_set(win, verch, verch,
              horch, horch, NULL, NULL, NULL, NULL);

          The *line_set functions use wch to draw a line starting at the
          current cursor position in the window.  The line is at most n
          characters long or as many as fit into the window.  The current
          cursor position is not changed.

          The hline_set, mvhline_set, mvwhline_set, and whline_set
          functions draw a line proceeding toward the last column of the
          same line.

          The vline_set, mvvline_set, mvwvline_set, and wvline_set
          functions draw a line proceeding toward the last line of the
          window.


---------------------------------------------------

::

          Note that border_set, hline_set, mvhline_set, mvvline_set,
          mvwhline_set, mvwvline_set, and vline_set may be macros.


-----------------------------------------------------------------

::

          Upon successful completion, these functions return OK.
          Otherwise, they return ERR.

          Functions using a window parameter return an error if it is null.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------------

::

          ncurses(3X), curs_add_wch(3X), curs_border(3X), curs_outopts(3X)

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

                                                        curs_border_set(3X)

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

.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_in_wchstr(3x) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `PORTABILITY <#PORTABILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_in_wchstr(3X)                                    curs_in_wchstr(3X)

NAME
-------------------------------------------------

::

          in_wchstr, in_wchnstr, win_wchstr, win_wchnstr, mvin_wchstr,
          mvin_wchnstr, mvwin_wchstr, mvwin_wchnstr - get an array of
          complex characters and renditions from a curses window


---------------------------------------------------------

::

          #include <curses.h>

          int in_wchstr(cchar_t *wchstr);
          int in_wchnstr(cchar_t *wchstr, int n);
          int win_wchstr(WINDOW *win, cchar_t *wchstr);
          int win_wchnstr(WINDOW *win, cchar_t *wchstr, int n);

          int mvin_wchstr(int y, int x, cchar_t *wchstr);
          int mvin_wchnstr(int y, int x, cchar_t *wchstr, int n);
          int mvwin_wchstr(WINDOW *win, int y, int x, cchar_t *wchstr);
          int mvwin_wchnstr(WINDOW *win, int y, int x, cchar_t *wchstr, int n);


---------------------------------------------------------------

::

          These functions return an array of complex characters in wchstr,
          starting at the current cursor position in the named window.
          Attributes (rendition) are stored with the characters.

          The in_wchnstr, mvin_wchnstr, mvwin_wchnstr and win_wchnstr fill
          the array with at most n cchar_t elements.


---------------------------------------------------

::

          Note that all routines except win_wchnstr may be macros.

          Reading a line that overflows the array pointed to by wchstr with
          in_wchstr, mvin_wchstr, mvwin_wchstr or win_wchstr causes
          undefined results.  Therefore, the use of in_wchnstr,
          mvin_wchnstr, mvwin_wchnstr, or win_wchnstr is recommended.


-----------------------------------------------------------------

::

          Upon successful completion, these functions return OK.
          Otherwise, they return ERR.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------------------

::

          The XSI Curses defines no error conditions.  This implementation
          checks for null pointers, returning ERR in that case.


---------------------------------------------------------

::

          Functions: curses(3X), curs_in_wch(3X), curs_instr(3X),
          curs_inwstr(3X) curs_inchstr(3X)

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

                                                         curs_in_wchstr(3X)

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

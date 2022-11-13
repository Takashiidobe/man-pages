.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_inwstr(3x) — Linux manual page
===================================

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

   curs_inwstr(3X)                                          curs_inwstr(3X)

NAME
-------------------------------------------------

::

          inwstr, innwstr, winwstr, winnwstr, mvinwstr, mvinnwstr,
          mvwinwstr, mvwinnwstr - get a string of wchar_t characters from a
          curses window


---------------------------------------------------------

::

          #include <curses.h>

          int inwstr(wchar_t *wstr);
          int innwstr(wchar_t *wstr, int n);
          int winwstr(WINDOW *win, wchar_t *wstr);
          int winnwstr(WINDOW *win, wchar_t *wstr, int n);

          int mvinwstr(int y, int x, wchar_t *wstr);
          int mvinnwstr(int y, int x, wchar_t *wstr, int n);
          int mvwinwstr(WINDOW *win, int y, int x, wchar_t *wstr);
          int mvwinnwstr(WINDOW *win, int y, int x, wchar_t *wstr, int n);


---------------------------------------------------------------

::

          These routines return a string of wchar_t wide characters in
          wstr, extracted starting at the current cursor position in the
          named window.

          The four functions with n as the last argument return a leading
          substring at most n characters long (exclusive of the trailing
          NUL).  Transfer stops at the end of the current line, or when n
          characters have been stored at the location referenced by wstr.

          If the size n is not large enough to store a complete complex
          character, an error is generated.


---------------------------------------------------

::

          All routines except winnwstr may be macros.

          Each cell in the window holds a complex character (i.e., base-
          and combining-characters) together with attributes and color.
          These functions store only the wide characters, ignoring
          attributes and color.  Use in_wchstr to return the complex
          characters from a window.


-----------------------------------------------------------------

::

          All routines return ERR upon failure.  Upon successful
          completion, the *inwstr routines return OK, and the *innwstr
          routines return the number of characters read into the string.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------------

::

          curses(3X), curs_instr(3X), curs_in_wchstr(3X)

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

                                                            curs_inwstr(3X)

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

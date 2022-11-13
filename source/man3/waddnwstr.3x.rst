.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_addwstr(3x) — Linux manual page
====================================

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

   curs_addwstr(3X)                                        curs_addwstr(3X)

NAME
-------------------------------------------------

::

          addwstr, addnwstr, waddwstr, waddnwstr, mvaddwstr, mvaddnwstr,
          mvwaddwstr, mvwaddnwstr - add a string of wide characters to a
          curses window and advance cursor


---------------------------------------------------------

::

          #include <curses.h>

          int addwstr(const wchar_t *wstr);
          int addnwstr(const wchar_t *wstr, int n);
          int waddwstr(WINDOW *win, const wchar_t *wstr);
          int waddnwstr(WINDOW *win, const wchar_t *wstr, int n);

          int mvaddwstr(int y, int x, const wchar_t *wstr);
          int mvaddnwstr(int y, int x, const wchar_t *wstr, int n);
          int mvwaddwstr(WINDOW *win, int y, int x, const wchar_t *wstr);
          int mvwaddnwstr(WINDOW *win, int y, int x, const wchar_t *wstr, int n);


---------------------------------------------------------------

::

          These functions write the characters of the (null-terminated)
          wchar_t character string wstr on the given window.  It is similar
          to constructing a cchar_t for each wchar_t in the string, then
          calling wadd_wch for the resulting cchar_t.

          The mv functions perform cursor movement once, before writing any
          characters.  Thereafter, the cursor is advanced as a side-effect
          of writing to the window.

          The four functions with n as the last argument write at most n
          wchar_t characters, or until a terminating null is reached.  If n
          is -1, then the entire string will be added.


-----------------------------------------------------------------

::

          All functions return the integer ERR upon failure and OK on
          success.

          X/Open does not define any error conditions.  This implementation
          returns an error

          •   if the window pointer is null or

          •   if the string pointer is null or

          •   if the corresponding calls to wadd_wch return an error.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------

::

          All of these functions except waddnwstr may be macros.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.


---------------------------------------------------------

::

          curses(3X), curs_add_wch(3X)

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

                                                           curs_addwstr(3X)

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

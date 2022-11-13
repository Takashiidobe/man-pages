.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_ins_wstr(3x) — Linux manual page
=====================================

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

   curs_ins_wstr(3X)                                      curs_ins_wstr(3X)

NAME
-------------------------------------------------

::

          ins_wstr, ins_nwstr, wins_wstr, wins_nwstr, mvins_wstr,
          mvins_nwstr, mvwins_wstr, mvwins_nwstr - insert a wide-character
          string into a curses window


---------------------------------------------------------

::

          #include <curses.h>

          int ins_wstr(const wchar_t *wstr);
          int ins_nwstr(const wchar_t *wstr, int n);
          int wins_wstr(WINDOW *win, const wchar_t *wstr);
          int wins_nwstr(WINDOW *win, const wchar_t *wstr, int n);

          int mvins_wstr(int y, int x, const wchar_t *wstr);
          int mvins_nwstr(int y, int x, const wchar_t *wstr, int n);
          int mvwins_wstr(WINDOW *win, int y, int x, const wchar_t *wstr);
          int mvwins_nwstr(WINDOW *win, int y, int x, const wchar_t *wstr, int n);


---------------------------------------------------------------

::

          These routines insert a wchar_t character string (as many
          characters as will fit on the line) before the character under
          the cursor.  All characters to the right of the cursor are
          shifted right, with the possibility of the rightmost characters
          on the line being lost.  No wrapping is performed.  The cursor
          position does not change (after moving to y, x, if specified).
          The four routines with n as the last argument insert a leading
          substring of at most n wchar_t characters.  If n is less than 1,
          the entire string is inserted.

          If a character in wstr is a tab, newline, carriage return or
          backspace, the cursor is moved appropriately within the window.
          A newline also does a clrtoeol before moving.  Tabs are
          considered to be at every eighth column.  If a character in wstr
          is another control character, it is drawn in the ^X notation.
          Calling win_wch after adding a control character (and moving to
          it, if necessary) does not return the control character, but
          instead returns a character in the ^-representation of the
          control character.


---------------------------------------------------

::

          Note that all but wins_nwstr may be macros.

          If the first character in the string is a nonspacing character,
          these functions will fail.  XSI does not define what will happen
          if a nonspacing character follows a control character.


-----------------------------------------------------------------

::

          Upon successful completion, these functions return OK.
          Otherwise, they return ERR.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------------

::

          curses(3X), curs_insstr(3X), curs_in_wch(3X), curs_ins_wch(3X).

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

                                                          curs_ins_wstr(3X)

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

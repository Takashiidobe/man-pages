.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_addchstr(3x) — Linux manual page
=====================================

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

   curs_addchstr(3X)                                      curs_addchstr(3X)

NAME
-------------------------------------------------

::

          addchstr, addchnstr, waddchstr, waddchnstr, mvaddchstr,
          mvaddchnstr, mvwaddchstr, mvwaddchnstr - add a string of
          characters (and attributes) to a curses window


---------------------------------------------------------

::

          #include <curses.h>

          int addchstr(const chtype *chstr);
          int addchnstr(const chtype *chstr, int n);
          int waddchstr(WINDOW *win, const chtype *chstr);
          int waddchnstr(WINDOW *win, const chtype *chstr, int n);

          int mvaddchstr(int y, int x, const chtype *chstr);
          int mvaddchnstr(int y, int x, const chtype *chstr, int n);
          int mvwaddchstr(WINDOW *win, int y, int x, const chtype *chstr);
          int mvwaddchnstr(WINDOW *win, int y, int x, const chtype *chstr, int n);


---------------------------------------------------------------

::

          These functions copy the (null-terminated) chstr array into the
          window image structure starting at the current cursor position.
          The four functions with n as the last argument copy at most n
          elements, but no more than will fit on the line.  If n=-1 then
          the whole array is copied, to the maximum number of characters
          that will fit on the line.

          The window cursor is not advanced.  These functions work faster
          than waddnstr.  On the other hand:

          •   they do not perform checking (such as for the newline,
              backspace, or carriage return characters),

          •   they do not advance the current cursor position,

          •   they do not expand other control characters to ^-escapes, and

          •   they truncate the string if it crosses the right margin,
              rather than wrapping it around to the new line.


-----------------------------------------------------------------

::

          All functions return the integer ERR upon failure and OK on
          success.

          X/Open does not define any error conditions.  This implementation
          returns an error if the window pointer is null.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------

::

          All functions except waddchnstr may be macros.


---------------------------------------------------------------

::

          These entry points are described in the XSI Curses standard,
          Issue 4.


---------------------------------------------------------

::

          curses(3X), curs_addstr(3X).

          Comparable functions in the wide-character (ncursesw) library are
          described in curs_add_wchstr(3X).

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

                                                          curs_addchstr(3X)

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

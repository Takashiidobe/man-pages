.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_insstr(3x) — Linux manual page
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

   curs_insstr(3X)                                          curs_insstr(3X)

NAME
-------------------------------------------------

::

          insstr, insnstr, winsstr, winsnstr, mvinsstr, mvinsnstr,
          mvwinsstr, mvwinsnstr - insert string before cursor in a curses
          window


---------------------------------------------------------

::

          #include <curses.h>
          int insstr(const char *str);
          int insnstr(const char *str, int n);
          int winsstr(WINDOW *win, const char *str);
          int winsnstr(WINDOW *win, const char *str, int n);

          int mvinsstr(int y, int x, const char *str);
          int mvinsnstr(int y, int x, const char *str, int n);
          int mvwinsstr(WINDOW *win, int y, int x, const char *str);
          int mvwinsnstr(WINDOW *win, int y, int x, const char *str, int
          n);


---------------------------------------------------------------

::

          These routines insert a character string (as many characters as
          will fit on the line) before the character under the cursor.  All
          characters to the right of the cursor are shifted right with the
          possibility of the rightmost characters on the line being lost.
          The cursor position does not change (after moving to y, x, if
          specified).  The functions with n as the last argument insert a
          leading substring of at most n characters.  If n<=0, then the
          entire string is inserted.

          Special characters are handled as in addch.


-----------------------------------------------------------------

::

          All routines that return an integer return ERR upon failure and
          OK (SVr4 specifies only "an integer value other than ERR") upon
          successful completion, unless otherwise noted in the preceding
          routine descriptions.

          X/Open defines no error conditions.  In this implementation, if
          the window parameter is null or the str parameter is null, an
          error is returned.

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------

::

          Note that all but winsnstr may be macros.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4, which adds const qualifiers to the arguments.

          The Single Unix Specification, Version 2 states that insnstr and
          winsnstr perform wrapping.  This is probably an error, since it
          makes this group of functions inconsistent.  Also, no
          implementation of curses documents this inconsistency.


---------------------------------------------------------

::

          curses(3X), curs_util(3X), curs_clear(3X), curs_inch(3X).

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

                                                            curs_insstr(3X)

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

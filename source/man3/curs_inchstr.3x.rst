.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_inchstr(3x) — Linux manual page
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

   curs_inchstr(3X)                                        curs_inchstr(3X)

NAME
-------------------------------------------------

::

          inchstr, inchnstr, winchstr, winchnstr, mvinchstr, mvinchnstr,
          mvwinchstr, mvwinchnstr - get a string of characters (and
          attributes) from a curses window


---------------------------------------------------------

::

          #include <curses.h>

          int inchstr(chtype *chstr);
          int inchnstr(chtype *chstr, int n);
          int winchstr(WINDOW *win, chtype *chstr);
          int winchnstr(WINDOW *win, chtype *chstr, int n);

          int mvinchstr(int y, int x, chtype *chstr);
          int mvinchnstr(int y, int x, chtype *chstr, int n);
          int mvwinchstr(WINDOW *win, int y, int x, chtype *chstr);
          int mvwinchnstr(WINDOW *win, int y, int x, chtype *chstr, int n);


---------------------------------------------------------------

::

          These routines return a NULL-terminated array of chtype
          quantities, starting at the current cursor position in the named
          window and ending at the right margin of the window.  The four
          functions with n as the last argument, return a leading substring
          at most n characters long (exclusive of the trailing (chtype)0).
          Constants defined in <curses.h> can be used with the & (logical
          AND) operator to extract the character or the attribute alone
          from any position in the chstr [see curs_inch(3X)].


-----------------------------------------------------------------

::

          All routines return the integer ERR upon failure and an integer
          value other than ERR upon successful completion (the number of
          characters retrieved, exclusive of the trailing 0).

          X/Open Curses defines no error conditions.  In this
          implementation:

          •   If the win parameter is null, an error is returned,

          •   If the chstr parameter is null, an error is returned,

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.


---------------------------------------------------

::

          Note that all routines except winchnstr may be macros.  SVr4 does
          not document whether the result string is zero-terminated; it
          does not document whether a length limit argument includes any
          trailing 0; and it does not document the meaning of the return
          value.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.  It is no more specific than the SVr4 documentation on the
          trailing 0.  It does specify that the successful return of the
          functions is OK.


---------------------------------------------------------

::

          curses(3X), curs_inch(3X).

          Comparable functions in the wide-character (ncursesw) library are
          described in curs_in_wchstr(3X).

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

                                                           curs_inchstr(3X)

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

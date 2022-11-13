.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_touch(3x) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `PORTABILITY <#PORTABILITY>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_touch(3X)                                            curs_touch(3X)

NAME
-------------------------------------------------

::

          touchwin, touchline, untouchwin, wtouchln, is_linetouched,
          is_wintouched - curses refresh control routines


---------------------------------------------------------

::

          #include <curses.h>

          int touchline(WINDOW *win, int start, int count);

          int touchwin(WINDOW *win);
          int wtouchln(WINDOW *win, int y, int n, int changed);

          int untouchwin(WINDOW *win);

          bool is_linetouched(WINDOW *win, int line);
          bool is_wintouched(WINDOW *win);


---------------------------------------------------------------

::

          The touchwin and touchline routines throw away all optimization
          information about which parts of the window have been touched, by
          pretending that the entire window has been drawn on.  This is
          sometimes necessary when using overlapping windows, since a
          change to one window affects the other window, but the records of
          which lines have been changed in the other window do not reflect
          the change.  The routine touchline only pretends that count lines
          have been changed, beginning with line start.

          The untouchwin routine marks all lines in the window as unchanged
          since the last call to wrefresh.

          The wtouchln routine makes n lines in the window, starting at
          line y, look as if they have (changed=1) or have not (changed=0)
          been changed since the last call to wrefresh.

          The is_linetouched and is_wintouched routines return TRUE if the
          specified line/window was modified since the last call to
          wrefresh; otherwise they return FALSE.  In addition,
          is_linetouched returns ERR if line is not valid for the given
          window.


-----------------------------------------------------------------

::

          All routines return the integer ERR upon failure and an integer
          value other than ERR upon successful completion, unless otherwise
          noted in the preceding routine descriptions.

          X/Open does not define any error conditions.  In this
          implementation

             is_linetouched
                  returns an error if the window pointer is null, or if the
                  line number is outside the window.

                  The constant ERR is distinct from TRUE and FALSE, which
                  are the normal return values of this function.  Because
                  the function returns a bool, returning ERR (which is
                  neither TRUE nor FALSE) may not be supported by the
                  compiler.

                  To provide error-checking and also match the X/Open
                  function prototype, the ERR is provided by a macro named
                  is_linetouched.  The actual function returns FALSE when
                  it detects an error.

             wtouchln
                  returns an error if the window pointer is null, or if the
                  line number is outside the window.


---------------------------------------------------------------

::

          These functions were introduced by SVr4.  The Solaris curses
          header file, for instance, defines both an actual function and
          macro for each.  The macros give the same result as the actual
          functions.  SVr4 curses does not check the window parameter win
          to ensure that it is not NULL; otherwise this implementation
          behaves the same as SVr4.

          The XSI Curses standard, Issue 4 describes these functions, but
          defines no error conditions.


---------------------------------------------------

::

          All of these routines except wtouchln may be macros.


---------------------------------------------------------

::

          curses(3X), curs_refresh(3X), curs_variables(3X).

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

                                                             curs_touch(3X)

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

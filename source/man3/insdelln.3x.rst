.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_deleteln(3x) — Linux manual page
=====================================

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

   curs_deleteln(3X)                                      curs_deleteln(3X)

NAME
-------------------------------------------------

::

          deleteln, wdeleteln, insdelln, winsdelln, insertln, winsertln -
          delete and insert lines in a curses window


---------------------------------------------------------

::

          #include <curses.h>

          int deleteln(void);
          int wdeleteln(WINDOW *win);

          int insdelln(int n);
          int winsdelln(WINDOW *win, int n);

          int insertln(void);
          int winsertln(WINDOW *win);


---------------------------------------------------------------

::

          The deleteln and wdeleteln routines delete the line under the
          cursor in the window; all lines below the current line are moved
          up one line.  The bottom line of the window is cleared.  The
          cursor position does not change.

          The insdelln and winsdelln routines, for positive n, insert n
          lines into the specified window above the current line.  The n
          bottom lines are lost.  For negative n, delete n lines (starting
          with the one under the cursor), and move the remaining lines up.
          The bottom n lines are cleared.  The current cursor position
          remains the same.

          The insertln and winsertln routines insert a blank line above the
          current line and the bottom line is lost.


-----------------------------------------------------------------

::

          All routines return the integer ERR upon failure and an OK (SVr4
          specifies only "an integer value other than ERR") upon successful
          completion.

          X/Open defines no error conditions.  In this implementation, if
          the window parameter is null, an error is returned.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.  The standard specifies that they return ERR on failure, but
          specifies no error conditions.


---------------------------------------------------

::

          Note that all but winsdelln may be macros.

          These routines do not require a hardware line delete or insert
          feature in the terminal.  In fact, they will not use hardware
          line delete/insert unless idlok(..., TRUE) has been set on the
          current window.


---------------------------------------------------------

::

          curses(3X)

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

                                                          curs_deleteln(3X)

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

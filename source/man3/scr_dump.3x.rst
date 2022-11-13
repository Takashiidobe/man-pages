.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_scr_dump(3x) — Linux manual page
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

   curs_scr_dump(3X)                                      curs_scr_dump(3X)

NAME
-------------------------------------------------

::

          scr_dump, scr_restore, scr_init, scr_set - read (write) a curses
          screen from (to) a file


---------------------------------------------------------

::

          #include <curses.h>

          int scr_dump(const char *filename);
          int scr_restore(const char *filename);
          int scr_init(const char *filename);
          int scr_set(const char *filename);


---------------------------------------------------------------

::

          The scr_dump routine dumps the current contents of the virtual
          screen to the file filename.

          The scr_restore routine sets the virtual screen to the contents
          of filename, which must have been written using scr_dump.  The
          next call to doupdate restores the physical screen to the way it
          looked in the dump file.

          The scr_init routine reads in the contents of filename and uses
          them to initialize the curses data structures about what the
          terminal currently has on its screen.  If the data is determined
          to be valid, curses bases its next update of the screen on this
          information rather than clearing the screen and starting from
          scratch.  scr_init is used after initscr or a system call to
          share the screen with another process which has done a scr_dump
          after its endwin(3X) call.  The data is declared invalid

          •   if the terminfo capabilities rmcup and nrrmc exist, also

          •   if the terminal has been written to since the preceding
              scr_dump call.

          The scr_set routine is a combination of scr_restore and scr_init.
          It tells the program that the information in filename is what is
          currently on the screen, and also what the program wants on the
          screen.  This can be thought of as a screen inheritance function.

          To read (write) a window from (to) a file, use the getwin and
          putwin routines [see curs_util(3X)].


-----------------------------------------------------------------

::

          All routines return the integer ERR upon failure and OK upon
          success.

          X/Open defines no error conditions.  In this implementation, each
          will return an error if the file cannot be opened.


---------------------------------------------------

::

          Note that scr_init, scr_set, and scr_restore may be macros.


---------------------------------------------------------------

::

          The XSI Curses standard, Issue 4, describes these functions
          (adding the const qualifiers).

          The SVr4 docs merely say under scr_init that the dump data is
          also considered invalid "if the time-stamp of the tty is old" but
          do not define “old”.


---------------------------------------------------------

::

          curses(3X), curs_initscr(3X), curs_refresh(3X), curs_util(3X),
          scr_dump(5), system(3)

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

                                                          curs_scr_dump(3X)

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

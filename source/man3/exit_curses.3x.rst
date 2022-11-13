.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_memleaks(3x) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `PORTABILITY <#PORTABILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_memleaks(3X)                                      curs_memleaks(3X)

NAME
-------------------------------------------------

::

          exit_curses, exit_terminfo - curses memory-leak checking


---------------------------------------------------------

::

          #include <curses.h>
          void exit_curses(int code);

          #include <term.h>
          void exit_terminfo(int code);

          /* deprecated (intentionally not declared in curses.h or term.h)
          */
          void _nc_freeall(void);
          void _nc_free_and_exit(int code);
          void _nc_free_tinfo(int code);


---------------------------------------------------------------

::

          These functions are used to simplify analysis of memory leaks in
          the ncurses library.

          Any implementation of curses must not free the memory associated
          with a screen, since (even after calling endwin(3X)), it must be
          available for use in the next call to refresh(3X).  There are
          also chunks of memory held for performance reasons.  That makes
          it hard to analyze curses applications for memory leaks.  When
          using the specially configured debugging version of the ncurses
          library, applications can call functions which free those chunks
          of memory, simplifying the process of memory-leak checking.

          Some of the functions are named with a “_nc_” prefix because they
          are not intended for use in the non-debugging library:

          _nc_freeall
               This frees (almost) all of the memory allocated by ncurses.

          _nc_free_and_exit
               This frees the memory allocated by ncurses (like
               _nc_freeall), and exits the program.  It is preferred over
               _nc_freeall since some of that memory may be required to
               keep the application running.  Simply exiting (with the
               given exit-code) is safer.

          _nc_free_tinfo
               Use this function if only the low-level terminfo functions
               (and corresponding library) are used.  Like
               _nc_free_and_exit, it exits the program after freeing
               memory.

          The functions prefixed “_nc” are normally not available; they
          must be configured into the library at build time using the
          --disable-leaks option.  That compiles-in code that frees memory
          that normally would not be freed.

          The exit_curses and exit_terminfo functions call
          _nc_free_and_exit and _nc_free_tinfo if the library is configured
          to support memory-leak checking.  If the library is not
          configured to support memory-leak checking, they simply call
          exit.


-----------------------------------------------------------------

::

          These functions do not return a value.


---------------------------------------------------------------

::

          These functions are not part of X/Open Curses; nor do other
          implementations of curses provide a similar feature.


---------------------------------------------------------

::

          curses(3X).

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

                                                          curs_memleaks(3X)

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

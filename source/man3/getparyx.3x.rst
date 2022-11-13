.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_getyx(3x) — Linux manual page
==================================

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

   curs_getyx(3X)                                            curs_getyx(3X)

NAME
-------------------------------------------------

::

          getyx, getparyx, getbegyx, getmaxyx - get curses cursor and
          window coordinates


---------------------------------------------------------

::

          #include <curses.h>

          void getyx(WINDOW *win, int y, int x);
          void getparyx(WINDOW *win, int y, int x);
          void getbegyx(WINDOW *win, int y, int x);
          void getmaxyx(WINDOW *win, int y, int x);


---------------------------------------------------------------

::

          The getyx macro places the current cursor position of the given
          window in the two integer variables y and x.

          If win is a subwindow, the getparyx macro places the beginning
          coordinates of the subwindow relative to the parent window into
          two integer variables y and x.  Otherwise, -1 is placed into y
          and x.

          Like getyx, the getbegyx and getmaxyx macros store the current
          beginning coordinates and size of the specified window.


-----------------------------------------------------------------

::

          The return values of these macros are undefined (i.e., they
          should not be used as the right-hand side of assignment
          statements).


---------------------------------------------------

::

          All of these interfaces are macros.  A "&" is not necessary
          before the variables y and x.


---------------------------------------------------------------

::

          The getyx, getparyx, getbegyx and getmaxyx macros are described
          in the XSI Curses standard, Issue 4.

          This implementation also provides functions getbegx, getbegy,
          getcurx, getcury, getmaxx, getmaxy, getparx and getpary for
          compatibility with older versions of curses.

          Although X/Open Curses does not address this, many
          implementations provide members of the WINDOW structure
          containing values corresponding to these macros.  For best
          portability, do not rely on using the data in WINDOW, since some
          implementations make WINDOW opaque (do not allow direct use of
          its members).

          Besides the problem of opaque structures, the data stored in
          like-named members may not have like-values in different
          implementations.  For example, the WINDOW._maxx and WINDOW._maxy
          values in ncurses have (at least since release 1.8.1) differed by
          one from some other implementations.  The difference is hidden by
          means of the macro getmaxyx.


---------------------------------------------------------

::

          curses(3X), curs_legacy(3X), curs_opaque(3X)

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

                                                             curs_getyx(3X)

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

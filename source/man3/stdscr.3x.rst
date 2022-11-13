.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_variables(3x) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_variables(3X)                                    curs_variables(3X)

NAME
-------------------------------------------------

::

          COLORS, COLOR_PAIRS, COLS, ESCDELAY, LINES, TABSIZE, curscr,
          newscr, stdscr - curses global variables


---------------------------------------------------------

::

          #include <curses.h>

          int COLOR_PAIRS;
          int COLORS;
          int COLS;
          int ESCDELAY;
          int LINES;
          int TABSIZE;
          WINDOW * curscr;
          WINDOW * newscr;
          WINDOW * stdscr;


---------------------------------------------------------------

::

          This page summarizes variables provided by the curses library.  A
          more complete description is given in the curses(3X) manual page.

          Depending on the configuration, these may be actual variables, or
          macros (see curs_threads(3X) and curs_opaque(3X)) which provide
          read-only access to curses's state.  In either case, applications
          should treat them as read-only to avoid confusing the library.

      COLOR_PAIRS
          After initializing curses, this variable contains the number of
          color pairs which the terminal can support.  Usually the number
          of color pairs will be the product COLORS*COLORS, however this is
          not always true:

          •   a few terminals use HLS colors, which do not follow this rule

          •   terminals supporting a large number of colors are limited by
              the number of color pairs that can be represented in a signed
              short value.

      COLORS
          After initializing curses, this variable contains the number of
          colors which the terminal can support.

      COLS
          After initializing curses, this variable contains the width of
          the screen, i.e., the number of columns.

      ESCDELAY
          This variable holds the number of milliseconds to wait after
          reading an escape character, to distinguish between an individual
          escape character entered on the keyboard from escape sequences
          sent by cursor- and function-keys (see curses(3X)).

      LINES
          After initializing curses, this variable contains the height of
          the screen, i.e., the number of lines.

      TABSIZE
          This variable holds the number of columns used by the curses
          library when converting a tab character to spaces as it adds the
          tab to a window (see curs_addch(3X).

      The Current Screen
          This implementation of curses uses a special window curscr to
          record its updates to the terminal screen.

          This is referred to as the “physical screen” in the
          curs_refresh(3X) and curs_outopts(3X) manual pages.

      The New Screen
          This implementation of curses uses a special window newscr to
          hold updates to the terminal screen before applying them to
          curscr.

          This is referred to as the “virtual screen” in the
          curs_kernel(3X), curs_refresh(3X) and curs_outopts(3X) manual
          pages.

      The Standard Screen
          Upon initializing curses, a default window called stdscr, which
          is the size of the terminal screen, is created.  Many curses
          functions use this window.


---------------------------------------------------

::

          The curses library is initialized using either initscr(3X), or
          newterm(3X).

          If curses is configured to use separate curses/terminfo
          libraries, most of these variables reside in the curses library.


---------------------------------------------------------------

::

          TABSIZE is a feature of SVr4 curses which is not documented by
          X/Open curses.

          •   In SVr4 curses, TABSIZE is initially set from the terminal
              description's init_tabs capability.  After that, it can be
              altered by the applications using SVr4 curses.

              SVr4 curses uses the current value of TABSIZE to compute the
              position of tabstops for updating both the virtual screen
              with addch(3X) as well as the physical screen with mvcur(3X).

          •   This implementation uses the current value of TABSIZE only
              for updating the virtual screen.  It uses the terminal
              description's it (init_tabs) capability for computing
              hardware tabs (i.e., tab stops on the physical screen).

          •   Other implementations differ.  For instance, NetBSD curses
              allows TABSIZE to be set through an environment variable.
              This implementation does not.

              NetBSD curses does not support hardware tabs; it uses the
              init_tabs capability and the TABSIZE variable only for
              updating the virtual screen.

          ESCDELAY is an extension in AIX curses:

          •   In AIX, the units for ESCDELAY are fifths of a millisecond.

          •   The default value for AIX's ESCDELAY is 0.1 seconds.

          •   AIX also enforces a limit of 10,000 seconds for ESCDELAY;
              this implementation currently has no upper limit.

          This implementation has long used ESCDELAY with units of
          milliseconds, making it impossible to be completely compatible
          with AIX.  Likewise, most users have either decided to override
          the value, or rely upon its default value.


---------------------------------------------------------

::

          curses(3X), curs_opaque(3X), curs_terminfo(3X), curs_threads(3X),
          term_variables(3X), terminfo(5).

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

                                                         curs_variables(3X)

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

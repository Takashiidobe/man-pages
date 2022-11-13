.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_legacy(3x) — Linux manual page
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

   curs_legacy(3X)                                          curs_legacy(3X)

NAME
-------------------------------------------------

::

          curs_legacy - get curses cursor and window coordinates,
          attributes


---------------------------------------------------------

::

          #include <curses.h>

          int getattrs(const WINDOW *win);

          int getbegx(const WINDOW *win);
          int getbegy(const WINDOW *win);

          int getcurx(const WINDOW *win);
          int getcury(const WINDOW *win);

          int getmaxx(const WINDOW *win);
          int getmaxy(const WINDOW *win);

          int getparx(const WINDOW *win);
          int getpary(const WINDOW *win);


---------------------------------------------------------------

::

          These legacy functions are simpler to use than the X/Open Curses
          functions:

          •   The getattrs function returns the same attribute data as
              wattr_get.

              However, getattrs returns an integer (actually a chtype),
              while wattr_get returns the current color pair in a separate
              parameter.  In the wide-character library configuration,
              color pairs may not fit into a chtype, so wattr_get is the
              only way to obtain the color information.

              Because getattrs returns the attributes in a single
              parameter, it would not be possible for an application to
              distinguish that from ERR (a -1).  If the window parameter is
              null, getattrs returns A_NORMAL (zero).

          •   The getbegy and getbegx functions return the same data as
              getbegyx.

          •   The getcury and getcurx functions return the same data as
              getyx.

          •   The getmaxy and getmaxx functions return the same data as
              getmaxyx.

          •   The getpary and getparx functions return the same data as
              getparyx.


-----------------------------------------------------------------

::

          Except as noted, these functions return an integer, or ERR if the
          window parameter is null.


---------------------------------------------------

::

          All of these interfaces are provided as macros and functions.
          The macros are suppressed (and only the functions provided) when
          NCURSES_OPAQUE is defined.  The standard forms such as getyx must
          be implemented as macros, and (in this implementation) are
          defined in terms of the functions described here, to avoid
          reliance on internal details of the WINDOW structure.


---------------------------------------------------------------

::

          These functions were supported on Version 7, BSD or System V
          implementations.  None of those implementations checked the
          window parameter.

          The getattrs function and macro are defined to return a (signed)
          integer for compatibility with those implementations although an
          unsigned type would have been more appropriate.


---------------------------------------------------------

::

          curses(3X), curs_getyx(3X), curs_opaque(3X)

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

                                                            curs_legacy(3X)

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

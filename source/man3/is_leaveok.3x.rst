.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_opaque(3x) — Linux manual page
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

   curs_opaque(3X)                                          curs_opaque(3X)

NAME
-------------------------------------------------

::

          is_cleared, is_idlok, is_idcok, is_immedok, is_keypad,
          is_leaveok, is_nodelay, is_notimeout, is_pad, is_scrollok,
          is_subwin, is_syncok, wgetdelay, wgetparent, wgetscrreg - curses
          window properties


---------------------------------------------------------

::

          #include <curses.h>

          bool is_cleared(const WINDOW *win);
          bool is_idcok(const WINDOW *win);
          bool is_idlok(const WINDOW *win);
          bool is_immedok(const WINDOW *win);
          bool is_keypad(const WINDOW *win);
          bool is_leaveok(const WINDOW *win);
          bool is_nodelay(const WINDOW *win);
          bool is_notimeout(const WINDOW *win);
          bool is_pad(const WINDOW *win);
          bool is_scrollok(const WINDOW *win);
          bool is_subwin(const WINDOW *win);
          bool is_syncok(const WINDOW *win);
          WINDOW * wgetparent(const WINDOW *win);
          int wgetdelay(const WINDOW *win);
          int wgetscrreg(const WINDOW *win, int *top, int *bottom);


---------------------------------------------------------------

::

          This implementation provides functions which return properties
          set in the WINDOW structure, allowing it to be “opaque” if the
          symbol NCURSES_OPAQUE is defined:

          is_cleared
               returns the value set in clearok

          is_idcok
               returns the value set in idcok

          is_idlok
               returns the value set in idlok

          is_immedok
               returns the value set in immedok

          is_keypad
               returns the value set in keypad

          is_leaveok
               returns the value set in leaveok

          is_nodelay
               returns the value set in nodelay

          is_notimeout
               returns the value set in notimeout

          is_pad
               returns TRUE if the window is a pad i.e., created by newpad

          is_scrollok
               returns the value set in scrollok

          is_subwin
               returns TRUE if the window is a subwindow, i.e., created by
               subwin or derwin

          is_syncok
               returns the value set in syncok

          wgetdelay
               returns the delay timeout as set in wtimeout.

          wgetparent
               returns the parent WINDOW pointer for subwindows, or NULL
               for windows having no parent.

          wgetscrreg
               returns the top and bottom rows for the scrolling margin as
               set in wsetscrreg.


-----------------------------------------------------------------

::

          These functions all return TRUE or FALSE, except as noted.


---------------------------------------------------

::

          Both a macro and a function are provided for each name.


---------------------------------------------------------------

::

          These routines are specific to ncurses.  They were not supported
          on Version 7, BSD or System V implementations.  It is recommended
          that any code depending on ncurses extensions be conditioned
          using NCURSES_VERSION.


---------------------------------------------------------

::

          curses(3X), curs_inopts(3X), curs_outopts(3X), curs_window(3X)

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

                                                            curs_opaque(3X)

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

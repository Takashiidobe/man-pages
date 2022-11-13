.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_overlay(3x) — Linux manual page
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

   curs_overlay(3X)                                        curs_overlay(3X)

NAME
-------------------------------------------------

::

          overlay, overwrite, copywin - overlay and manipulate overlapped
          curses windows


---------------------------------------------------------

::

          #include <curses.h>

          int overlay(const WINDOW *srcwin, WINDOW *dstwin);
          int overwrite(const WINDOW *srcwin, WINDOW *dstwin);
          int copywin(const WINDOW *srcwin, WINDOW *dstwin, int sminrow,
                int smincol, int dminrow, int dmincol, int dmaxrow,
                int dmaxcol, int overlay);


---------------------------------------------------------------

::

      overlay, overwrite
          The overlay and overwrite routines overlay srcwin on top of
          dstwin.  scrwin and dstwin are not required to be the same size;
          only text where the two windows overlap is copied.  The
          difference is that overlay is non-destructive (blanks are not
          copied) whereas overwrite is destructive.

      copywin
          The copywin routine provides a finer granularity of control over
          the overlay and overwrite routines.  As in the prefresh routine,
          a rectangle is specified in the destination window, (dminrow,
          dmincol) and (dmaxrow, dmaxcol), and the upper-left-corner
          coordinates of the source window, (sminrow, smincol).  If the
          argument overlay is true, then copying is non-destructive, as in
          overlay.


-----------------------------------------------------------------

::

          Routines that return an integer return ERR upon failure, and OK
          (SVr4 only specifies "an integer value other than ERR") upon
          successful completion.

          X/Open defines no error conditions.  In this implementation,
          copywin, overlay and overwrite return an error if either of the
          window pointers are null, or if some part of the window would be
          placed off-screen.


---------------------------------------------------

::

          Note that overlay and overwrite may be macros.


---------------------------------------------------------------

::

          The XSI Curses standard, Issue 4 describes these functions
          (adding the const qualifiers).  It further specifies their
          behavior in the presence of characters with multibyte renditions
          (not yet supported in this implementation).


---------------------------------------------------------

::

          curses(3X), curs_pad(3X), curs_refresh(3X)

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

                                                           curs_overlay(3X)

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

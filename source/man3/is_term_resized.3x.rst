.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

resizeterm(3x) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   resizeterm(3X)                                            resizeterm(3X)

NAME
-------------------------------------------------

::

          is_term_resized, resize_term, resizeterm - change the curses
          terminal size


---------------------------------------------------------

::

          #include <curses.h>

          bool is_term_resized(int lines, int columns);
          int resize_term(int lines, int columns);
          int resizeterm(int lines, int columns);


---------------------------------------------------------------

::

          This is an extension to the curses library.  It provides callers
          with a hook into the ncurses data to resize windows, primarily
          for use by programs running in an X Window terminal (e.g.,
          xterm).

      resizeterm
          The function resizeterm resizes the standard and current windows
          to the specified dimensions, and adjusts other bookkeeping data
          used by the ncurses library that record the window dimensions
          such as the LINES and COLS variables.

      resize_term
          Most of the work is done by the inner function resize_term.  The
          outer function resizeterm adds bookkeeping for the SIGWINCH
          handler, as well as repainting the soft-key area (see
          slk_touch(3X)).

          When resizing the windows, resize_term blank-fills the areas that
          are extended.  The calling application should fill in these areas
          with appropriate data.

          The resize_term function attempts to resize all windows.
          However, due to the calling convention of pads, it is not
          possible to resize these without additional interaction with the
          application.

          When resizing windows, resize_term recursively adjusts
          subwindows, keeping them within the updated parent window's
          limits.  If a top-level window happens to extend to the screen's
          limits, then on resizing the window, resize_term will keep the
          window extending to the corresponding limit, regardless of
          whether the screen has shrunk or grown.

      is_term_resized
          A support function is_term_resized is provided so that
          applications can check if the resize_term function would modify
          the window structures.  It returns TRUE if the windows would be
          modified, and FALSE otherwise.


-----------------------------------------------------------------

::

          Except as noted, these functions return the integer ERR upon
          failure and OK on success.  They will fail if either of the
          dimensions are less than or equal to zero, or if an error occurs
          while (re)allocating memory for the windows.


---------------------------------------------------

::

          While these functions are intended to be used to support a signal
          handler (i.e., for SIGWINCH), care should be taken to avoid
          invoking them in a context where malloc or realloc may have been
          interrupted, since it uses those functions.

          If ncurses is configured to supply its own SIGWINCH handler,

          •   on receipt of a SIGWINCH, the handler sets a flag

          •   which is tested in wgetch(3X) and doupdate,

          •   in turn, calling the resizeterm function,

          •   which ungetch's a KEY_RESIZE which will be read on the next
              call to wgetch.

              The KEY_RESIZE alerts an application that the screen size has
              changed, and that it should repaint special features such as
              pads that cannot be done automatically.

              Calling resizeterm or resize_term directly from a signal
              handler is unsafe.  This indirect method is used to provide a
              safe way to resize the ncurses data structures.

          If the environment variables LINES or COLUMNS are set, this
          overrides the library's use of the window size obtained from the
          operating system.  Thus, even if a SIGWINCH is received, no
          screen size change may be recorded.


---------------------------------------------------------------

::

          It is possible to resize the screen with SVr4 curses, by

          •   exiting curses with endwin(3X) and

          •   resuming using refresh(3X).

          Doing that clears the screen and is visually distracting.

          This extension of ncurses was introduced in mid-1995.  It was
          adopted in NetBSD curses (2001) and PDCurses (2003).


---------------------------------------------------------

::

          curs_getch(3X), curs_variables(3X), wresize(3X).


-----------------------------------------------------

::

          Thomas Dickey (from an equivalent function written in 1988 for
          BSD curses).

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

                                                             resizeterm(3X)

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

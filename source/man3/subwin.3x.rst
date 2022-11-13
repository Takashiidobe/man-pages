.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_window(3x) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_window(3X)                                          curs_window(3X)

NAME
-------------------------------------------------

::

          newwin, delwin, mvwin, subwin, derwin, mvderwin, dupwin, wsyncup,
          syncok, wcursyncup, wsyncdown - create curses windows


---------------------------------------------------------

::

          #include <curses.h>

          WINDOW *newwin(
                int nlines, int ncols,
                int begin_y, int begin_x);
          int delwin(WINDOW *win);
          int mvwin(WINDOW *win, int y, int x);
          WINDOW *subwin(WINDOW *orig,
                int nlines, int ncols,
                int begin_y, int begin_x);
          WINDOW *derwin(WINDOW *orig,
                int nlines, int ncols,
                int begin_y, int begin_x);
          int mvderwin(WINDOW *win, int par_y, int par_x);
          WINDOW *dupwin(WINDOW *win);
          void wsyncup(WINDOW *win);
          int syncok(WINDOW *win, bool bf);
          void wcursyncup(WINDOW *win);
          void wsyncdown(WINDOW *win);


---------------------------------------------------------------

::

      newwin
          Calling newwin creates and returns a pointer to a new window with
          the given number of lines and columns.  The upper left-hand
          corner of the window is at
                 line begin_y,
                 column begin_x

          If either nlines or ncols is zero, they default to
                 LINES - begin_y and
                 COLS - begin_x.

          A new full-screen window is created by calling newwin(0,0,0,0).

          Regardless of the function used for creating a new window (e.g.,
          newwin, subwin, derwin, newpad), rather than a duplicate (with
          dupwin), all of the window modes are initialized to the default
          values.  These functions set window modes after a window is
          created:

                 idcok, idlok, immedok, keypad, leaveok, nodelay, scrollok,
                 setscrreg, syncok, wbkgdset, wbkgrndset, and wtimeout

      delwin
          Calling delwin deletes the named window, freeing all memory
          associated with it (it does not actually erase the window's
          screen image).  Subwindows must be deleted before the main window
          can be deleted.

      mvwin
          Calling mvwin moves the window so that the upper left-hand corner
          is at position (x, y).  If the move would cause the window to be
          off the screen, it is an error and the window is not moved.
          Moving subwindows is allowed, but should be avoided.

      subwin
          Calling subwin creates and returns a pointer to a new window with
          the given number of lines, nlines, and columns, ncols.  The
          window is at position (begin_y, begin_x) on the screen.  The
          subwindow shares memory with the window orig, so that changes
          made to one window will affect both windows.  When using this
          routine, it is necessary to call touchwin or touchline on orig
          before calling wrefresh on the subwindow.

      derwin
          Calling derwin is the same as calling subwin, except that begin_y
          and begin_x are relative to the origin of the window orig rather
          than the screen.  There is no difference between the subwindows
          and the derived windows.

          Calling mvderwin moves a derived window (or subwindow) inside its
          parent window.  The screen-relative parameters of the window are
          not changed.  This routine is used to display different parts of
          the parent window at the same physical position on the screen.

      dupwin
          Calling dupwin creates an exact duplicate of the window win.

      wsyncup
          Calling wsyncup touches all locations in ancestors of win that
          are changed in win.  If syncok is called with second argument
          TRUE then wsyncup is called automatically whenever there is a
          change in the window.

      wsyncdown
          The wsyncdown routine touches each location in win that has been
          touched in any of its ancestor windows.  This routine is called
          by wrefresh, so it should almost never be necessary to call it
          manually.

      wcursyncup
          The routine wcursyncup updates the current cursor position of all
          the ancestors of the window to reflect the current cursor
          position of the window.


-----------------------------------------------------------------

::

          Routines that return an integer return the integer ERR upon
          failure and OK (SVr4 only specifies "an integer value other than
          ERR") upon successful completion.

          Routines that return pointers return NULL on error.

          X/Open defines no error conditions.  In this implementation

          delwin
               returns an error if the window pointer is null, or if the
               window is the parent of another window.

          derwin
               returns an error if the parent window pointer is null, or if
               any of its ordinates or dimensions is negative, or if the
               resulting window does not fit inside the parent window.

          dupwin
               returns an error if the window pointer is null.

               This implementation also maintains a list of windows, and
               checks that the pointer passed to delwin is one that it
               created, returning an error if it was not..

          mvderwin
               returns an error if the window pointer is null, or if some
               part of the window would be placed off-screen.

          mvwin
               returns an error if the window pointer is null, or if the
               window is really a pad, or if some part of the window would
               be placed off-screen.

          newwin
               will fail if either of its beginning ordinates is negative,
               or if either the number of lines or columns is negative.

          syncok
               returns an error if the window pointer is null.

          subwin
               returns an error if the parent window pointer is null, or if
               any of its ordinates or dimensions is negative, or if the
               resulting window does not fit inside the parent window.

          The functions which return a window pointer may also fail if
          there is insufficient memory for its data structures.  Any of
          these functions will fail if the screen has not been initialized,
          i.e., with initscr or newterm.


---------------------------------------------------

::

          If many small changes are made to the window, the wsyncup option
          could degrade performance.

          Note that syncok may be a macro.


-------------------------------------------------

::

          The subwindow functions (subwin, derwin, mvderwin, wsyncup,
          wsyncdown, wcursyncup, syncok) are flaky, incompletely
          implemented, and not well tested.

          The System V curses documentation is very unclear about what
          wsyncup and wsyncdown actually do.  It seems to imply that they
          are only supposed to touch exactly those lines that are affected
          by ancestor changes.  The language here, and the behavior of the
          curses implementation, is patterned on the XPG4 curses standard.
          The weaker XPG4 spec may result in slower updates.


---------------------------------------------------------------

::

          The XSI Curses standard, Issue 4 describes these functions.


---------------------------------------------------------

::

          curses(3X), curs_refresh(3X), curs_touch(3X), curs_variables(3X)

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

                                                            curs_window(3X)

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

.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_termattrs(3x) — Linux manual page
======================================

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

   curs_termattrs(3X)                                    curs_termattrs(3X)

NAME
-------------------------------------------------

::

          baudrate, erasechar, erasewchar, has_ic, has_il, killchar,
          killwchar, longname, term_attrs, termattrs, termname - curses
          environment query routines


---------------------------------------------------------

::

          #include <curses.h>

          int baudrate(void);
          char erasechar(void);
          int erasewchar(wchar_t *ch);
          bool has_ic(void);
          bool has_il(void);
          char killchar(void);
          int killwchar(wchar_t *ch);
          char *longname(void);
          attr_t term_attrs(void);
          chtype termattrs(void);
          char *termname(void);


---------------------------------------------------------------

::

      baudrate
          The baudrate routine returns the output speed of the terminal.
          The number returned is in bits per second, for example 9600, and
          is an integer.

      erasechar, erasewchar
          The erasechar routine returns the user's current erase character.

          The erasewchar routine stores the current erase character in the
          location referenced by ch.  If no erase character has been
          defined, the routine fails and the location referenced by ch is
          not changed.

      has_is, has_il
          The has_ic routine is true if the terminal has insert- and
          delete- character capabilities.

          The has_il routine is true if the terminal has insert- and
          delete-line capabilities, or can simulate them using scrolling
          regions.  This might be used to determine if it would be
          appropriate to turn on physical scrolling using scrollok.

      killchar, killwchar
          The killchar routine returns the user's current line kill
          character.

          The killwchar routine stores the current line-kill character in
          the location referenced by ch.  If no line-kill character has
          been defined, the routine fails and the location referenced by ch
          is not changed.

      longname
          The longname routine returns a pointer to a static area
          containing a verbose description of the current terminal.  The
          maximum length of a verbose description is 128 characters.  It is
          defined only after the call to initscr or newterm.  The area is
          overwritten by each call to newterm and is not restored by
          set_term, so the value should be saved between calls to newterm
          if longname is going to be used with multiple terminals.

      termattrs, term_attrs
          If a given terminal does not support a video attribute that an
          application program is trying to use, curses may substitute a
          different video attribute for it.  The termattrs and term_attrs
          functions return a logical OR of all video attributes supported
          by the terminal using A_ and WA_ constants respectively.  This
          information is useful when a curses program needs complete
          control over the appearance of the screen.

      termname
          The termname routine returns the terminal name used by setupterm.


-----------------------------------------------------------------

::

          longname and termname return NULL on error.

          Routines that return an integer return ERR upon failure and OK
          (SVr4 only specifies "an integer value other than ERR") upon
          successful completion.


---------------------------------------------------

::

          Note that termattrs may be a macro.


---------------------------------------------------------------

::

          The XSI Curses standard, Issue 4 describes these functions.  It
          changes the return type of termattrs to the new type attr_t.
          Most versions of curses truncate the result returned by termname
          to 14 characters.


---------------------------------------------------------

::

          curses(3X), curs_initscr(3X), curs_outopts(3X)

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

                                                         curs_termattrs(3X)

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

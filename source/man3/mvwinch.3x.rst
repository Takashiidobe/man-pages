.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_inch(3x) — Linux manual page
=================================

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

   curs_inch(3X)                                              curs_inch(3X)

NAME
-------------------------------------------------

::

          inch, winch, mvinch, mvwinch - get a character and attributes
          from a curses window


---------------------------------------------------------

::

          #include <curses.h>

          chtype inch(void);
          chtype winch(WINDOW *win);

          chtype mvinch(int y, int x);
          chtype mvwinch(WINDOW *win, int y, int x);


---------------------------------------------------------------

::

          These routines return the character, of type chtype, at the
          current position in the named window.  If any attributes are set
          for that position, their values are OR'ed into the value
          returned.  Constants defined in <curses.h> can be used with the &
          (logical AND) operator to extract the character or attributes
          alone.

      Attributes
          The following bit-masks may be AND-ed with characters returned by
          winch.

          A_CHARTEXT     Bit-mask to extract character
          A_ATTRIBUTES   Bit-mask to extract attributes
          A_COLOR        Bit-mask to extract color-pair field information


-----------------------------------------------------------------

::

          Functions with a “mv” prefix first perform a cursor movement
          using wmove, and return an error if the position is outside the
          window, or if the window pointer is null.

          The winch function does not return an error if the window
          contains characters larger than 8-bits (255).  Only the low-order
          8 bits of the character are used by winch.


---------------------------------------------------

::

          Note that all of these routines may be macros.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue
          4.

          Very old systems (before standardization) provide a different
          function with the same name:

          •   The winch function was part of the original BSD curses
              library, which stored a 7-bit character combined with the
              standout attribute.

              In BSD curses, winch returned only the character (as an
              integer) with the standout attribute removed.

          •   System V curses added support for several video attributes
              which could be combined with characters in the window.

              Reflecting this improvement, the function was altered to
              return the character combined with all video attributes in a
              chtype value.

          X/Open Curses does not specify the size and layout of attributes,
          color and character values in chtype; it is implementation-
          dependent.  This implementation uses 8 bits for character values.
          An application using more bits, e.g., a Unicode value, should use
          the wide-character equivalents to these functions.


---------------------------------------------------------

::

          curses(3X)
               gives an overview of the WINDOW and chtype data types.

          curs_attr(3X)
               goes into more detail, pointing out portability problems and
               constraints on the use of chtype for returning window
               information.

          curs_in_wch(3X)
               describes comparable functions for the wide-character
               (ncursesw) library.

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

                                                              curs_inch(3X)

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

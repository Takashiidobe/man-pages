.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_bkgrnd(3x) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `PORTABILITY <#PORTABILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_bkgrnd(3X)                                          curs_bkgrnd(3X)

NAME
-------------------------------------------------

::

          bkgrnd, wbkgrnd, bkgrndset, wbkgrndset, getbkgrnd, wgetbkgrnd -
          curses window complex background manipulation routines


---------------------------------------------------------

::

          #include <curses.h>

          int bkgrnd( const cchar_t *wch);
          int wbkgrnd( WINDOW *win, const cchar_t *wch);

          void bkgrndset(const cchar_t *wch );
          void wbkgrndset(WINDOW *win, const cchar_t *wch);

          int getbkgrnd(cchar_t *wch);
          int wgetbkgrnd(WINDOW *win, cchar_t *wch);


---------------------------------------------------------------

::

      bkgrndset
          The bkgrndset and wbkgrndset routines manipulate the background
          of the named window.  The window background is a cchar_t
          consisting of any combination of attributes (i.e., rendition) and
          a complex character.  The attribute part of the background is
          combined (OR'ed) with all non-blank characters that are written
          into the window with waddch.  Both the character and attribute
          parts of the background are combined with the blank characters.
          The background becomes a property of the character and moves with
          the character through any scrolling and insert/delete
          line/character operations.

          To the extent possible on a particular terminal, the attribute
          part of the background is displayed as the graphic rendition of
          the character put on the screen.

      bkgrnd
          The bkgrnd and wbkgrnd functions set the background property of
          the current or specified window and then apply this setting to
          every character position in that window:

          •   The rendition of every character on the screen is changed to
              the new background rendition.

          •   Wherever the former background character appears, it is
              changed to the new background character.

      getbkgrnd
          The getbkgrnd function returns the given window's current
          background character/attribute pair via the wch pointer.  If the
          given window pointer is null, the character is not updated (but
          no error returned).


---------------------------------------------------

::

          Note that bkgrnd, bkgrndset, and getbkgrnd may be macros.

          X/Open Curses does not provide details on how the rendition is
          changed.  This implementation follows the approach used in SVr4
          curses, which is explained in the manual page for wbkgd.


-----------------------------------------------------------------

::

          The bkgrndset and wbkgrndset routines do not return a value.

          Upon successful completion, the other functions return OK.
          Otherwise, they return ERR:

          •   A null window pointer is treated as an error.

          •   A null character pointer is treated as an error.


---------------------------------------------------------------

::

          These functions are described in the XSI Curses standard, Issue 4
          (X/Open Curses).


---------------------------------------------------------

::

          curses(3X), curs_bkgd(3X)

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

                                                            curs_bkgrnd(3X)

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

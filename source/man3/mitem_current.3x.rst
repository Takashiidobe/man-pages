.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mitem_current(3x) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   mitem_current(3X)                                      mitem_current(3X)

NAME
-------------------------------------------------

::

          mitem_current - set and get current_menu_item


---------------------------------------------------------

::

          #include <menu.h>

          int set_current_item(MENU *menu, ITEM *item);
          ITEM *current_item(const MENU *menu);

          int set_top_row(MENU *menu, int row);
          int top_row(const MENU *menu);

          int item_index(const ITEM *item);


---------------------------------------------------------------

::

          The function set_current_item sets the current item (the item on
          which the menu cursor is positioned).  current_item returns a
          pointer to the current item in the given menu.

          The function set_top_row sets the top row of the menu to show the
          given row (the top row is initially 0, and is reset to this value
          whenever the O_ROWMAJOR option is toggled).  The item leftmost on
          the given row becomes current.  The function top_row returns the
          number of the top menu row being displayed.

          The function item_index returns the (zero-origin) index of item
          in the menu's item pointer list.


-----------------------------------------------------------------

::

          current_item returns a pointer (which may be NULL).  It does not
          set errno.

          top_row and item_index return ERR (the general curses error
          value) if their menu parameter is NULL.

          set_current_item and set_top_row return one of the following:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_BAD_STATE
               Routine was called from an initialization or termination
               function.

          E_NOT_CONNECTED
               No items are connected to the menu.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).


---------------------------------------------------------

::

          curses(3X), menu(3X).


---------------------------------------------------

::

          The header file <menu.h> automatically includes the header file
          <curses.h>.


---------------------------------------------------------------

::

          These routines emulate the System V menu library.  They were not
          supported on Version 7 or BSD versions.

          The SVr4 menu library documentation specifies the top_row and
          index_item error value as -1 (which is the value of ERR).


-------------------------------------------------------

::

          Juergen Pfeifer.  Manual pages and adaptation for new curses by
          Eric S. Raymond.

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

                                                          mitem_current(3X)

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

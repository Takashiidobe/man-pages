.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

menu_attributes(3x) — Linux manual page
=======================================

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

   menu_attributes(3X)                                  menu_attributes(3X)

NAME
-------------------------------------------------

::

          menu_back, menu_fore, menu_grey, menu_pad, set_menu_back,
          set_menu_fore, set_menu_grey, set_menu_pad - color and attribute
          control for menus


---------------------------------------------------------

::

          #include <menu.h>

          int set_menu_fore(MENU *menu, chtype attr);
          chtype menu_fore(const MENU *menu);

          int set_menu_back(MENU *menu, chtype attr);
          chtype menu_back(const MENU *menu);

          int set_menu_grey(MENU *menu, chtype attr);
          chtype menu_grey(const MENU *menu);

          int set_menu_pad(MENU *menu, int pad);
          int menu_pad(const MENU *menu);


---------------------------------------------------------------

::

          The function set_menu_fore sets the foreground attribute of menu.
          This is the highlight used for selected menu items.  menu_fore
          returns the foreground attribute.  The default is A_REVERSE.

          The function set_menu_back sets the background attribute of menu.
          This is the highlight used for selectable (but not currently
          selected) menu items.  The function menu_back returns the
          background attribute.  The default is A_NORMAL.

          The function set_menu_grey sets the grey attribute of menu. This
          is the highlight used for un-selectable menu items in menus that
          permit more than one selection.  The function menu_grey returns
          the grey attribute.  The default is A_UNDERLINE.

          The function set_menu_pad sets the character used to fill the
          space between the name and description parts of a menu item.
          menu_pad returns the given menu's pad character.  The default is
          a blank.


-----------------------------------------------------------------

::

          These routines return one of the following:

          E_OK The routine succeeded.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.


---------------------------------------------------------

::

          curses(3X) and related pages whose names begin “menu_” for
          detailed descriptions of the entry points.


---------------------------------------------------

::

          The header file <menu.h> automatically includes the header file
          <curses.h>.


---------------------------------------------------------------

::

          These routines emulate the System V menu library.  They were not
          supported on Version 7 or BSD versions.


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

                                                        menu_attributes(3X)

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

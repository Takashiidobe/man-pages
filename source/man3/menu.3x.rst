.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

menu(3x) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   menu(3X)                                                        menu(3X)

NAME
-------------------------------------------------

::

          menu - curses extension for programming menus


---------------------------------------------------------

::

          #include <menu.h>


---------------------------------------------------------------

::

          The menu library provides terminal-independent facilities for
          composing menu systems on character-cell terminals.  The library
          includes: item routines, which create and modify menu items; and
          menu routines, which group items into menus, display menus on the
          screen, and handle interaction with the user.

          The menu library uses the curses libraries, and a curses
          initialization routine such as initscr must be called before
          using any of these functions.  To use the menu library, link with
          the options -lmenu -lcurses.

      Current Default Values for Item Attributes
          The menu library maintains a default value for item attributes.
          You can get or set this default by calling the appropriate get_
          or set_ routine with a NULL item pointer.  Changing this default
          with a set_ function affects future item creations, but does not
          change the rendering of items already created.

      Routine Name Index
          The following table lists each menu routine and the name of the
          manual page on which it is described.

          curses Routine Name    Manual Page Name
          ────────────────────────────────────────────
          current_item           mitem_current(3X)
          free_item              mitem_new(3X)
          free_menu              menu_new(3X)
          item_count             menu_items(3X)
          item_description       mitem_name(3X)
          item_index             mitem_current(3X)
          item_init              menu_hook(3X)
          item_name              mitem_name(3X)
          item_opts              mitem_opts(3X)
          item_opts_off          mitem_opts(3X)
          item_opts_on           mitem_opts(3X)
          item_term              menu_hook(3X)
          item_userptr           mitem_userptr(3X)
          item_value             mitem_value(3X)
          item_visible           mitem_visible(3X)
          menu_back              menu_attributes(3X)
          menu_driver            menu_driver(3X)
          menu_fore              menu_attributes(3X)
          menu_format            menu_format(3X)
          menu_grey              menu_attributes(3X)
          menu_init              menu_hook(3X)
          menu_items             menu_items(3X)
          menu_mark              menu_mark(3X)
          menu_opts              menu_opts(3X)
          menu_opts_off          menu_opts(3X)
          menu_opts_on           menu_opts(3X)
          menu_pad               menu_attributes(3X)
          menu_pattern           menu_pattern(3X)
          menu_request_by_name   menu_requestname(3X)
          menu_request_name      menu_requestname(3X)

          menu_spacing           menu_spacing(3X)
          menu_sub               menu_win(3X)
          menu_term              menu_hook(3X)
          menu_userptr           menu_userptr(3X)
          menu_win               menu_win(3X)
          new_item               mitem_new(3X)
          new_menu               menu_new(3X)
          pos_menu_cursor        menu_cursor(3X)
          post_menu              menu_post(3X)
          scale_menu             menu_win(3X)
          set_current_item       mitem_current(3X)
          set_item_init          menu_hook(3X)
          set_item_opts          mitem_opts(3X)
          set_item_term          menu_hook(3X)
          set_item_userptr       mitem_userptr(3X)
          set_item_value         mitem_value(3X)
          set_menu_back          menu_attributes(3X)
          set_menu_fore          menu_attributes(3X)
          set_menu_format        menu_format(3X)
          set_menu_grey          menu_attributes(3X)
          set_menu_init          menu_hook(3X)
          set_menu_items         menu_items(3X)
          set_menu_mark          menu_mark(3X)
          set_menu_opts          mitem_opts(3X)
          set_menu_pad           menu_attributes(3X)
          set_menu_pattern       menu_pattern(3X)
          set_menu_spacing       menu_spacing(3X)
          set_menu_sub           menu_win(3X)
          set_menu_term          menu_hook(3X)
          set_menu_userptr       menu_userptr(3X)
          set_menu_win           menu_win(3X)
          set_top_row            mitem_current(3X)
          top_row                mitem_current(3X)
          unpost_menu            menu_post(3X)


-----------------------------------------------------------------

::

          Routines that return pointers return NULL on error.  Routines
          that return an integer return one of the following error codes:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_BAD_STATE
               Routine was called from an initialization or termination
               function.

          E_NO_MATCH
               Character failed to match.

          E_NO_ROOM
               Menu is too large for its window.

          E_NOT_CONNECTED
               No items are connected to the menu.

          E_NOT_POSTED
               The menu has not been posted.

          E_NOT_SELECTABLE
               The designated item cannot be selected.

          E_POSTED
               The menu is already posted.

          E_REQUEST_DENIED
               The menu driver could not process the request.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).

          E_UNKNOWN_COMMAND
               The menu driver code saw an unknown request code.


---------------------------------------------------

::

          The header file <menu.h> automatically includes the header files
          <curses.h> and <eti.h>.

          In your library list, libmenu.a should be before libncurses.a;
          that is, you should say “-lmenu -lncurses”, not the other way
          around (which would give a link-error when using static
          libraries).


---------------------------------------------------------------

::

          These routines emulate the System V menu library.  They were not
          supported on Version 7 or BSD versions.

          The menu facility was documented in SVr4.2 in Character User
          Interface Programming (UNIX SVR4.2).

          It is not part of X/Open Curses.

          Aside from ncurses, there are few implementations:

          •   systems based on SVr4 source code, e.g., Solaris.

          •   NetBSD curses.


-------------------------------------------------------

::

          Juergen Pfeifer.  Manual pages and adaptation for ncurses by Eric
          S. Raymond.


---------------------------------------------------------

::

          curses(3X) and related pages whose names begin “menu_” for
          detailed descriptions of the entry points.

          This describes ncurses version @NCURSES_MAJOR@.@NCURSES_MINOR@
          (patch @NCURSES_PATCH@).

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

                                                                   menu(3X)

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

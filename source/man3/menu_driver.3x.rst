.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

menu_driver(3x) — Linux manual page
===================================

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

   menu_driver(3X)                                          menu_driver(3X)

NAME
-------------------------------------------------

::

          menu_driver - command-processing loop of the menu system


---------------------------------------------------------

::

          #include <menu.h>

          int menu_driver(MENU *menu, int c);


---------------------------------------------------------------

::

          Once a menu has been posted (displayed), you should funnel input
          events to it through menu_driver.  This routine has three major
          input cases:

          •   The input is a form navigation request.  Navigation request
              codes are constants defined in <form.h>, which are distinct
              from the key- and character codes returned by wgetch(3X).

          •   The input is a printable character.  Printable characters
              (which must be positive, less than 256) are checked according
              to the program's locale settings.

          •   The input is the KEY_MOUSE special key associated with an
              mouse event.

          The menu driver requests are as follows:

          REQ_LEFT_ITEM
               Move left to an item.

          REQ_RIGHT_ITEM
               Move right to an item.

          REQ_UP_ITEM
               Move up to an item.

          REQ_DOWN_ITEM
               Move down to an item.

          REQ_SCR_ULINE
               Scroll up a line.

          REQ_SCR_DLINE
               Scroll down a line.

          REQ_SCR_DPAGE
               Scroll down a page.

          REQ_SCR_UPAGE
               Scroll up a page.

          REQ_FIRST_ITEM
               Move to the first item.

          REQ_LAST_ITEM
               Move to the last item.

          REQ_NEXT_ITEM
               Move to the next item.

          REQ_PREV_ITEM
               Move to the previous item.

          REQ_TOGGLE_ITEM
               Select/deselect an item.

          REQ_CLEAR_PATTERN
               Clear the menu pattern buffer.

          REQ_BACK_PATTERN
               Delete the previous character from the pattern buffer.

          REQ_NEXT_MATCH
               Move to the next item matching the pattern match.

          REQ_PREV_MATCH
               Move to the previous item matching the pattern match.

          If the second argument is a printable character, the code appends
          it to the pattern buffer and attempts to move to the next item
          matching the new pattern.  If there is no such match, menu_driver
          returns E_NO_MATCH and deletes the appended character from the
          buffer.

          If the second argument is one of the above pre-defined requests,
          the corresponding action is performed.

      MOUSE HANDLING
          If the second argument is the KEY_MOUSE special key, the
          associated mouse event is translated into one of the above pre-
          defined requests.  Currently only clicks in the user window
          (e.g., inside the menu display area or the decoration window) are
          handled.

          If you click above the display region of the menu:

          •   a REQ_SCR_ULINE is generated for a single click,

          •   a REQ_SCR_UPAGE is generated for a double-click and

          •   a REQ_FIRST_ITEM is generated for a triple-click.

          If you click below the display region of the menu:

          •   a REQ_SCR_DLINE is generated for a single click,

          •   a REQ_SCR_DPAGE is generated for a double-click and

          •   a REQ_LAST_ITEM is generated for a triple-click.

          If you click at an item inside the display area of the menu:

          •   the menu cursor is positioned to that item.

          •   If you double-click an item a REQ_TOGGLE_ITEM is generated
              and E_UNKNOWN_COMMAND is returned.  This return value makes
              sense, because a double click usually means that an item-
              specific action should be returned.  It is exactly the
              purpose of this return value to signal that an application
              specific command should be executed.

          •   If a translation into a request was done, menu_driver returns
              the result of this request.

          If you clicked outside the user window or the mouse event could
          not be translated into a menu request an E_REQUEST_DENIED is
          returned.

      APPLICATION-DEFINED COMMANDS
          If the second argument is neither printable nor one of the above
          pre-defined menu requests or KEY_MOUSE, the drive assumes it is
          an application-specific command and returns E_UNKNOWN_COMMAND.
          Application-defined commands should be defined relative to
          MAX_COMMAND, the maximum value of these pre-defined requests.


-----------------------------------------------------------------

::

          menu_driver return one of the following error codes:

          E_OK The routine succeeded.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_BAD_STATE
               Routine was called from an initialization or termination
               function.

          E_NOT_POSTED
               The menu has not been posted.

          E_UNKNOWN_COMMAND
               The menu driver code saw an unknown request code.

          E_NO_MATCH
               Character failed to match.

          E_REQUEST_DENIED
               The menu driver could not process the request.


---------------------------------------------------------

::

          curses(3X), getch(3X), menu(3X).


---------------------------------------------------

::

          The header file <menu.h> automatically includes the header files
          <curses.h>.


---------------------------------------------------------------

::

          These routines emulate the System V menu library.  They were not
          supported on Version 7 or BSD versions.  The support for mouse
          events is ncurses specific.


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

                                                            menu_driver(3X)

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

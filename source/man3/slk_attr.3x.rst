.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curs_slk(3x) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `HISTORY <#HISTORY>`__ \|      |                                   |
| `EXTENSIONS <#EXTENSIONS>`__ \|   |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `PORTABILITY <#PORTABILITY>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curs_slk(3X)                                                curs_slk(3X)

NAME
-------------------------------------------------

::

          slk_init, slk_set, slk_wset, slk_refresh, slk_noutrefresh,
          slk_label, slk_clear, slk_restore, slk_touch, slk_attron,
          slk_attrset, slk_attroff, slk_attr_on, slk_attr_set,
          slk_attr_off, slk_attr, slk_color, extended_slk_color - curses
          soft label routines


---------------------------------------------------------

::

          #include <curses.h>

          int slk_init(int fmt);

          int slk_set(int labnum, const char *label, int fmt);
          /* extension */
          int slk_wset(int labnum, const wchar_t *label, int fmt);

          char *slk_label(int labnum);

          int slk_refresh(void);
          int slk_noutrefresh(void);
          int slk_clear(void);
          int slk_restore(void);
          int slk_touch(void);

          int slk_attron(const chtype attrs);
          int slk_attroff(const chtype attrs);
          int slk_attrset(const chtype attrs);
          int slk_attr_on(attr_t attrs, void* opts);
          int slk_attr_off(const attr_t attrs, void * opts);
          int slk_attr_set(const attr_t attrs, short pair, void* opts);

          attr_t slk_attr(void);

          int slk_color(short pair);
          /* extension */
          int extended_slk_color(int pair);


---------------------------------------------------------------

::

          The slk* functions manipulate the set of soft function-key labels
          that exist on many terminals.  For those terminals that do not
          have soft labels, curses takes over the bottom line of stdscr,
          reducing the size of stdscr and the variable LINES.  curses
          standardizes on eight labels of up to eight characters each.  In
          addition to this, the ncurses implementation supports a mode
          where it simulates 12 labels of up to five characters each.  This
          is useful for PC-like enduser devices.  ncurses simulates this
          mode by taking over up to two lines at the bottom of the screen;
          it does not try to use any hardware support for this mode.

      Initialization
          The slk_init routine must be called before initscr or newterm is
          called.  If initscr eventually uses a line from stdscr to emulate
          the soft labels, then fmt determines how the labels are arranged
          on the screen:

             0  indicates a 3-2-3 arrangement of the labels.

             1  indicates a 4-4 arrangement

             2  indicates the PC-like 4-4-4 mode.

             3  is again the PC-like 4-4-4 mode, but in addition an index
                line is generated, helping the user to identify the key
                numbers easily.

      Labels
          The slk_set routine (and the slk_wset routine for the wide-
          character library) has three parameters:

             labnum
                  is the label number, from 1 to 8 (12 for fmt in slk_init
                  is 2 or 3);

             label
                  is be the string to put on the label, up to eight (five
                  for fmt in slk_init is 2 or 3) characters in length.  A
                  null string or a null pointer sets up a blank label.

             fmt  is either 0, 1, or 2, indicating whether the label is to
                  be left-justified, centered, or right-justified,
                  respectively, within the label.

          The slk_label routine returns the current label for label number
          labnum, with leading and trailing blanks stripped.

      Screen updates
          The slk_refresh and slk_noutrefresh routines correspond to the
          wrefresh and wnoutrefresh routines.

          The slk_clear routine clears the soft labels from the screen.

          The slk_restore routine restores the soft labels to the screen
          after a slk_clear has been performed.

          The slk_touch routine forces all the soft labels to be output the
          next time a slk_noutrefresh is performed.

      Video attributes
          The slk_attron, slk_attrset, slk_attroff and slk_attr routines
          correspond to attron, attrset, attroff and attr_get,
          respectively.  They have an effect only if soft labels are
          simulated on the bottom line of the screen.  The default
          highlight for soft keys is A_STANDOUT (as in System V curses,
          which does not document this fact).

      Colors
          The slk_color routine corresponds to color_set.  It has an effect
          only if soft labels are simulated on the bottom line of the
          screen.

          Because slk_color accepts only short (signed 16-bit integer)
          values, this implementation provides extended_slk_color which
          accepts an integer value, e.g., 32-bits.


-----------------------------------------------------------------

::

          These routines return ERR upon failure and OK (SVr4 specifies
          only "an integer value other than ERR") upon successful
          completion.

          X/Open defines no error conditions.  In this implementation

             slk_attr
                  returns the attribute used for the soft keys.

             slk_attroff, slk_attron, slk_clear, slk_noutrefresh,
             slk_refresh, slk_touch
                  return an error if the terminal or the softkeys were not
                  initialized.

             slk_attrset
                  returns an error if the terminal or the softkeys were not
                  initialized.

             slk_attr_set
                  returns an error if the terminal or the softkeys were not
                  initialized, or the color pair is outside the range
                  0..COLOR_PAIRS-1.

             slk_color
                  returns an error if the terminal or the softkeys were not
                  initialized, or the color pair is outside the range
                  0..COLOR_PAIRS-1.

             slk_init
                  returns an error if the format parameter is outside the
                  range 0..3.

             slk_label
                  returns NULL on error.

             slk_set
                  returns an error if the terminal or the softkeys were not
                  initialized, or the labnum parameter is outside the range
                  of label counts, or if the format parameter is outside
                  the range 0..2, or if memory for the labels cannot be
                  allocated.


-------------------------------------------------------

::

          SVr3 introduced these functions:
            slk_clear
            slk_init
            slk_label
            slk_noutrefresh
            slk_refresh
            slk_restore
            slk_set
            slk_touch

          SVr4 added these functions:
            slk_attroff
            slk_attron
            slk_attrset
            slk_start

          X/Open Curses added these:
            slk_attr_off
            slk_attr_on
            slk_attr_set
            slk_color
            slk_wset


-------------------------------------------------------------

::

          X/Open Curses documents the opts argument as reserved for future
          use, saying that it must be null.  This implementation uses that
          parameter in ABI 6 for the functions which have a color-pair
          parameter to support extended color pairs.

          For  functions  which modify the color, e.g., slk_attr_set, if
          opts is set it is treated as a pointer to int, and used to  set
          the  color pair instead of the short pair parameter.


---------------------------------------------------

::

          Most applications would use slk_noutrefresh because a wrefresh is
          likely to follow soon.


---------------------------------------------------------------

::

          The XSI Curses standard, Issue 4, described the soft-key
          functions, with some differences from SVr4 curses:

          •   It added functions like the SVr4 attribute-manipulation
              functions slk_attron, slk_attroff, slk_attrset, but which use
              attr_t parameters (rather than chtype), along with a reserved
              opts parameter.

              Two of these new functions (unlike the SVr4 functions) have
              no provision for color: slk_attr_on and slk_attr_off.

              The third function (slk_attr_set) has a color-pair parameter.

          •   It added const qualifiers to parameters (unnecessarily), and

          •   It added slk_color.

          The format codes 2 and 3 for slk_init and the function slk_attr
          are specific to ncurses.

          X/Open Curses does not specify a limit for the number of colors
          and color pairs which a terminal can support.  However, in its
          use of short for the parameters, it carries over SVr4's
          implementation detail for the compiled terminfo database, which
          uses signed 16-bit numbers.  This implementation provides
          extended versions of those functions which use short parameters,
          allowing applications to use larger color- and pair-numbers.


---------------------------------------------------------

::

          curses(3X), curs_attr(3X), curs_initscr(3X), curs_refresh(3X),
          curs_variables(3X).

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

                                                               curs_slk(3X)

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

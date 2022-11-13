.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

form_field_opts(3x) — Linux manual page
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

   form_field_opts(3X)                                  form_field_opts(3X)

NAME
-------------------------------------------------

::

          set_field_opts, field_opts_on, field_opts_off, field_opts - set
          and get field options


---------------------------------------------------------

::

          #include <form.h>

          int set_field_opts(FIELD *field, Field_Options opts);
          Field_Options field_opts(const FIELD *field);

          int field_opts_on(FIELD *field, Field_Options opts);
          int field_opts_off(FIELD *field, Field_Options opts);


---------------------------------------------------------------

::

          The function set_field_opts sets all the given field's option
          bits (field option bits may be logically-OR'ed together).

          The function field_opts_on turns on the given option bits, and
          leaves others alone.

          The function field_opts_off turns off the given option bits, and
          leaves others alone.

          The function field_opts returns the field's current option bits.

          The following standard options are defined (all are on by
          default):

          O_ACTIVE
               The field is visited during processing.  If this option is
               off, the field will not be reachable by navigation keys.
               Please notice that an invisible field appears to be inactive
               also.

          O_AUTOSKIP
               Skip to the next field when this one fills.

          O_BLANK
               The field is cleared whenever a character is entered at the
               first position.

          O_EDIT
               The field can be edited.

          O_NULLOK
               Allow a blank field.

          O_PASSOK
               Validate field only if modified by user.

          O_PUBLIC
               The field contents are displayed as data is entered.

          O_STATIC
               Field buffers are fixed to field's original size.  Turn this
               option off to create a dynamic field.

          O_VISIBLE
               The field is displayed.  If this option is off, display of
               the field is suppressed.

          O_WRAP
               Words that do not fit on a line are wrapped to the next
               line.  Words are blank-separated.

          These extension options are defined (extensions are off by
          default):

          O_DYNAMIC_JUSTIFY
               Permit dynamic fields to be justified, like static fields.

          O_NO_LEFT_STRIP
               Preserve leading whitespace in the field buffer, which is
               normally discarded.

          O_EDGE_INSERT_STAY
               When inserting into a field up to the boundary position,
               optionally delay the scrolling, so that the last inserted
               character remains visible, but advance the cursor to reflect
               the insertion.  This allows the form library to display the
               inserted character in one-character fields as well as
               allowing the library to maintain consistent state.

          O_INPUT_FIELD
               The set_max_field function checks for this extension, which
               allows a dynamic field to shrink if the new limit is smaller
               than the current field size.


-----------------------------------------------------------------

::

          Except for field_opts, each routine returns one of the following:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_CURRENT
               The field is the current field.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).


---------------------------------------------------------

::

          curses(3X), form(3X).  form_field_just(3X).


---------------------------------------------------

::

          The header file <form.h> automatically includes the header file
          <curses.h>.


---------------------------------------------------------------

::

          These routines emulate the System V forms library.  They were not
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

                                                        form_field_opts(3X)

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

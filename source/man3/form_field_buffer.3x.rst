.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

form_field_buffer(3x) — Linux manual page
=========================================

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

   form_field_buffer(3X)                              form_field_buffer(3X)

NAME
-------------------------------------------------

::

          form_field_buffer - field buffer control


---------------------------------------------------------

::

          #include <form.h>

          int set_field_buffer(FIELD *field, int buf, const char *value);
          char *field_buffer(const FIELD *field, int buffer);

          int set_field_status(FIELD *field, bool status);
          bool field_status(const FIELD *field);

          int set_max_field(FIELD *field, int max);


---------------------------------------------------------------

::

          The function set_field_buffer sets the numbered buffer of the
          given field to contain a given string:

             •   Buffer 0 is the displayed value of the field.

             •   Other numbered buffers may be allocated by applications
                 through the nbuf argument of (see form_field_new(3X)) but
                 are not manipulated by the forms library.

          The function field_buffer returns a pointer to the contents of
          the given numbered buffer:

             •   The buffer contents always have the same length, and are
                 padded with trailing spaces as needed to ensure this
                 length is the same.

             •   The buffer may contain leading spaces, depending on how it
                 was set.

             •   The buffer contents are set with set_field_buffer, or as a
                 side effect of any editing operations on the corresponding
                 field.

             •   Editing operations are based on the window which displays
                 the field, rather than a string.  The window contains only
                 printable characters, and is filled with blanks.  If you
                 want the raw data, you must write your own routine that
                 copies the value out of the buffer and removes the leading
                 and trailing spaces.

             •   Because editing operations change the content of the
                 buffer to correspond to the window, you should not rely on
                 using buffers for long-term storage of form data.

          The function set_field_status sets the associated status flag of
          field; field_status gets the current value.  The status flag is
          set to a nonzero value whenever the field changes.

          The function set_max_field sets the maximum size for a dynamic
          field.  An argument of 0 turns off any maximum size threshold for
          that field.


-----------------------------------------------------------------

::

          The field_buffer function returns NULL on error.  It sets errno
          according to their success:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          The field_status function returns TRUE or FALSE.

          The remaining routines return one of the following:

          E_OK The routine succeeded.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.


---------------------------------------------------------

::

          curses(3X) and related pages whose names begin “form_” for
          detailed descriptions of the entry points.


---------------------------------------------------

::

          The header file <form.h> automatically includes the header file

          When configured for wide characters, field_buffer returns a
          pointer to temporary storage (allocated and freed by the
          library).  The application should not attempt to modify the data.
          It will be freed on the next call to field_buffer to return the
          same buffer.  <curses.h>.


---------------------------------------------------------------

::

          These routines emulate the System V forms library.  They were not
          supported on Version 7 or BSD versions.

          The set_max_field function checks for an ncurses extension
          O_INPUT_FIELD which allows a dynamic field to shrink if the new
          limit is smaller than the current field size.


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

                                                      form_field_buffer(3X)

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

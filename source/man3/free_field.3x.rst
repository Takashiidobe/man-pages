.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

form_field_new(3x) — Linux manual page
======================================

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

   form_field_new(3X)                                    form_field_new(3X)

NAME
-------------------------------------------------

::

          new_field, dup_field, link_field, free_field - create and destroy
          form fields


---------------------------------------------------------

::

          #include <form.h>

          FIELD *new_field(int height, int width,
                           int toprow, int leftcol,
                           int offscreen, int nbuffers);
          FIELD *dup_field(FIELD *field, int toprow, int leftcol);
          FIELD *link_field(FIELD *field, int toprow, int leftcol);
          int free_field(FIELD *field);


---------------------------------------------------------------

::

          The function new_field allocates a new field and initializes it
          from the parameters given: height, width, row of upper-left
          corner, column of upper-left corner, number off-screen rows, and
          number of additional working buffers.

          The function dup_field duplicates a field at a new location.
          Most attributes (including current contents, size, validation
          type, buffer count, growth threshold, justification, foreground,
          background, pad character, options, and user pointer) are copied.
          Field status and the field page bit are not copied.

          The function link_field acts like dup_field, but the new field
          shares buffers with its parent.  Attribute data is separate.

          The function free_field de-allocates storage associated with a
          field.


-----------------------------------------------------------------

::

          The functions new_field, dup_field, link_field return NULL on
          error.  They set errno according to their success:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_SYSTEM_ERROR
               System error occurred, e.g., malloc failure.

          The function free_field returns one of the following:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_CONNECTED
               field is connected.


---------------------------------------------------------

::

          curses(3X), form(3X).


---------------------------------------------------

::

          The header file <form.h> automatically includes the header file
          <curses.h>.


---------------------------------------------------------------

::

          These routines emulate the System V forms library.  They were not
          supported on Version 7 or BSD versions.

          It may be unwise to count on the set of attributes copied by
          dup_field being portable; the System V forms library documents
          are not very explicit about what gets copied and what does not.


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

                                                         form_field_new(3X)

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

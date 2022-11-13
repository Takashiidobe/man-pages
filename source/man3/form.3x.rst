.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

form(3x) — Linux manual page
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

   form(3X)                                                        form(3X)

NAME
-------------------------------------------------

::

          form - curses extension for programming forms


---------------------------------------------------------

::

          #include <form.h>


---------------------------------------------------------------

::

          The form library provides terminal-independent facilities for
          composing form screens on character-cell terminals.  The library
          includes: field routines, which create and modify form fields;
          and form routines, which group fields into forms, display forms
          on the screen, and handle interaction with the user.

          The form library uses the curses libraries.  To use the form
          library, link with the options -lform -lcurses.

          Your program should set up the locale, e.g.,

               setlocale(LC_ALL, "");

          so that input/output processing will work.

          A curses initialization routine such as initscr must be called
          before using any of these functions.

      Current Default Values for Field Attributes
          The form library maintains a default value for field attributes.
          You can get or set this default by calling the appropriate set_
          or retrieval routine with a NULL field pointer.  Changing this
          default with a set_ function affects future field creations, but
          does not change the rendering of fields already created.

      Routine Name Index
          The following table lists each form routine and the name of the
          manual page on which it is described.  Routines flagged with “*”
          are ncurses-specific, not present in SVr4.

          curses Routine Name     Manual Page Name
          ──────────────────────────────────────────────────
          current_field           form_page(3X)
          data_ahead              form_data(3X)
          data_behind             form_data(3X)
          dup_field               form_field_new(3X)
          dynamic_field_info      form_field_info(3X)
          field_arg               form_field_validation(3X)
          field_back              form_field_attributes(3X)
          field_buffer            form_field_buffer(3X)
          field_count             form_field(3X)
          field_fore              form_field_attributes(3X)
          field_index             form_page(3X)
          field_info              form_field_info(3X)
          field_init              form_hook(3X)
          field_just              form_field_just(3X)
          field_opts              form_field_opts(3X)
          field_opts_off          form_field_opts(3X)
          field_opts_on           form_field_opts(3X)
          field_pad               form_field_attributes(3X)
          field_status            form_field_buffer(3X)
          field_term              form_hook(3X)
          field_type              form_field_validation(3X)
          field_userptr           form_field_userptr(3X)

          form_driver             form_driver(3X)
          form_driver_w           form_driver(3X)*
          form_fields             form_field(3X)
          form_init               form_hook(3X)
          form_opts               form_opts(3X)
          form_opts_off           form_opts(3X)
          form_opts_on            form_opts(3X)
          form_page               form_page(3X)
          form_request_by_name    form_requestname(3X)*
          form_request_name       form_requestname(3X)*
          form_sub                form_win(3X)
          form_term               form_hook(3X)
          form_userptr            form_userptr(3X)
          form_win                form_win(3X)
          free_field              form_field_new(3X)
          free_fieldtype          form_fieldtype(3X)
          free_form               form_new(3X)
          link_field              form_field_new(3X)
          link_fieldtype          form_fieldtype(3X)
          move_field              form_field(3X)
          new_field               form_field_new(3X)
          new_fieldtype           form_fieldtype(3X)
          new_form                form_new(3X)
          new_page                form_new_page(3X)
          pos_form_cursor         form_cursor(3X)
          post_form               form_post(3X)
          scale_form              form_win(3X)
          set_current_field       form_page(3X)
          set_field_back          form_field_attributes(3X)
          set_field_buffer        form_field_buffer(3X)
          set_field_fore          form_field_attributes(3X)
          set_field_init          form_hook(3X)
          set_field_just          form_field_just(3X)
          set_field_opts          form_field_opts(3X)
          set_field_pad           form_field_attributes(3X)
          set_field_status        form_field_buffer(3X)
          set_field_term          form_hook(3X)
          set_field_type          form_field_validation(3X)
          set_field_userptr       form_field_userptr(3X)
          set_fieldtype_arg       form_fieldtype(3X)
          set_fieldtype_choice    form_fieldtype(3X)
          set_form_fields         form_field(3X)
          set_form_init           form_hook(3X)
          set_form_opts           form_field_opts(3X)
          set_form_page           form_page(3X)
          set_form_sub            form_win(3X)
          set_form_term           form_hook(3X)
          set_form_userptr        form_userptr(3X)
          set_form_win            form_win(3X)
          set_max_field           form_field_buffer(3X)
          set_new_page            form_new_page(3X)
          unfocus_current_field   form_page(3X)*
          unpost_form             form_post(3X)


-----------------------------------------------------------------

::

          Routines that return pointers return NULL on error, and set errno
          to the corresponding error-code returned by functions returning
          an integer.  Routines that return an integer return one of the
          following error codes:

          E_OK The routine succeeded.

          E_BAD_ARGUMENT
               Routine detected an incorrect or out-of-range argument.

          E_BAD_STATE
               Routine was called from an initialization or termination
               function.

          E_CONNECTED
               The field is already connected to a form.

          E_INVALID_FIELD
               Contents of a field are not valid.

          E_NOT_CONNECTED
               No fields are connected to the form.

          E_NOT_POSTED
               The form has not been posted.

          E_NO_ROOM
               Form is too large for its window.

          E_POSTED
               The form is already posted.

          E_REQUEST_DENIED
               The form driver could not process the request.

          E_SYSTEM_ERROR
               System error occurred (see errno(3)).

          E_UNKNOWN_COMMAND
               The form driver code saw an unknown request code.


---------------------------------------------------

::

          The header file <form.h> automatically includes the header files
          <curses.h> and <eti.h>.

          In your library list, libform.a should be before libncurses.a;
          that is, you want to say “-lform -lncurses”, not the other way
          around (which would give you a link error when using static
          libraries).


---------------------------------------------------------------

::

          These routines emulate the System V forms library.  They were not
          supported on Version 7 or BSD versions.

          The menu facility was documented in SVr4.2 in Character User
          Interface Programming (UNIX SVR4.2).

          It is not part of X/Open Curses.

          Aside from ncurses, there are few implementations:

          •   systems based on SVr4 source code, e.g., Solaris.

          •   NetBSD curses.

          A few functions in this implementation are extensions added for
          ncurses, but not provided by other implementations, e.g.,
          form_driver_w, unfocus_current_field.


-------------------------------------------------------

::

          Juergen Pfeifer.  Manual pages and adaptation for ncurses by Eric
          S. Raymond.


---------------------------------------------------------

::

          curses(3X) and related pages whose names begin “form_” for
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

                                                                   form(3X)

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

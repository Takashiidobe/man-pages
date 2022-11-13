.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

context_new(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   context_new(3)          SELinux API documentation         context_new(3)

NAME
-------------------------------------------------

::

          context_new, context_str, context_free, context_type_get,
          context_type_set, context_range_get,
          context_range_set,context_role_get, context_role_set,
          context_user_get, context_user_set - Routines to manipulate
          SELinux security contexts


---------------------------------------------------------

::

          #include <selinux/context.h>

          context_t context_new(const char *context_str);

          const char * context_str(context_t con);

          void context_free(context_t con);

          const char * context_type_get(context_t con);

          const char * context_range_get(context_t con);

          const char * context_role_get(context_t con);

          const char * context_user_get(context_t con);

          int context_type_set(context_t con, const char *type);

          int context_range_set(context_t con, const char *range);

          int context_role_set(context_t con, const char *role);

          int context_user_set(context_t con, const char *user);


---------------------------------------------------------------

::

          These functions allow an application to manipulate the fields of
          a security context string without requiring it to know the format
          of the string.

          context_new() returns a new context initialized to a context
          string.

          context_str() returns a pointer to the string value of the
          context_t, valid until the next call to context_str() or
          context_free() for the same context_t*.

          context_free() frees the storage used by a context.

          context_type_get(), context_range_get(), context_role_get(),
          context_user_get() get a pointer to the string value of a context
          component.

          Note: Values returned by the get functions are only valid until
          the next call to a set function or context_free() for the same
          context_t structure.

          context_type_set(), context_range_set(), context_role_set(),
          context_user_set() set a context component.


-----------------------------------------------------------------

::

          On failure context_*_set() functions return non-zero and 0 on
          success.

          The other functions return NULL on failure and non-NULL on
          success.

          On failure errno is set appropriately.


---------------------------------------------------------

::

          selinux(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   dwalsh@redhat.com           20 December 2011              context_new(3)

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

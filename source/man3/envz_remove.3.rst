.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

envz_add(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ENVZ_ADD(3)             Linux Programmer's Manual            ENVZ_ADD(3)

NAME
-------------------------------------------------

::

          envz_add, envz_entry, envz_get, envz_merge, envz_remove,
          envz_strip - environment string support


---------------------------------------------------------

::

          #include <envz.h>

          error_t envz_add(char **restrict envz, size_t *restrict envz_len,
                         const char *restrict name, const char *restrict value);

          char *envz_entry(const char *restrict envz, size_t envz_len,
                         const char *restrict name);

          char *envz_get(const char *restrict envz, size_t envz_len,
                         const char *restrict name);

          error_t envz_merge(char **restrict envz, size_t *restrict envz_len,
                         const char *restrict envz2, size_t envz2_len,
                         int override);

          void envz_remove(char **restrict envz, size_t *restrict envz_len,
                         const char *restrict name);

          void envz_strip(char **restrict envz, size_t *restrict envz_len);


---------------------------------------------------------------

::

          These functions are glibc-specific.

          An argz vector is a pointer to a character buffer together with a
          length, see argz_add(3).  An envz vector is a special argz
          vector, namely one where the strings have the form "name=value".
          Everything after the first '=' is considered to be the value.  If
          there is no '=', the value is taken to be NULL.  (While the value
          in case of a trailing '=' is the empty string "".)

          These functions are for handling envz vectors.

          envz_add() adds the string "name=value" (in case value is non-
          NULL) or "name" (in case value is NULL) to the envz vector
          (*envz, *envz_len) and updates *envz and *envz_len.  If an entry
          with the same name existed, it is removed.

          envz_entry() looks for name in the envz vector (envz, envz_len)
          and returns the entry if found, or NULL if not.

          envz_get() looks for name in the envz vector (envz, envz_len) and
          returns the value if found, or NULL if not.  (Note that the value
          can also be NULL, namely when there is an entry for name without
          '=' sign.)

          envz_merge() adds each entry in envz2 to *envz, as if with
          envz_add().  If override is true, then values in envz2 will
          supersede those with the same name in *envz, otherwise not.

          envz_remove() removes the entry for name from (*envz, *envz_len)
          if there was one.

          envz_strip() removes all entries with value NULL.


-----------------------------------------------------------------

::

          All envz functions that do memory allocation have a return type
          of error_t (an integer type), and return 0 for success, and
          ENOMEM if an allocation error occurs.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │envz_add(), envz_entry(), envz_get(), │ Thread safety │ MT-Safe │
          │envz_merge(), envz_remove(),          │               │         │
          │envz_strip()                          │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are a GNU extension.


---------------------------------------------------------

::

          #include <stdio.h>
          #include <stdlib.h>
          #include <envz.h>

          int
          main(int argc, char *argv[], char *envp[])
          {
              int e_len = 0;
              char *str;

              for (int i = 0; envp[i] != NULL; i++)
                  e_len += strlen(envp[i]) + 1;

              str = envz_entry(*envp, e_len, "HOME");
              printf("%s\n", str);
              str = envz_get(*envp, e_len, "HOME");
              printf("%s\n", str);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          argz_add(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                    ENVZ_ADD(3)

--------------

Pages that refer to this page: `argz_add(3) <../man3/argz_add.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/envz_add.3.license.html>`__

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

.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strdup(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRDUP(3)               Linux Programmer's Manual              STRDUP(3)

NAME
-------------------------------------------------

::

          strdup, strndup, strdupa, strndupa - duplicate a string


---------------------------------------------------------

::

          #include <string.h>

          char *strdup(const char *s);

          char *strndup(const char *s, size_t n);
          char *strdupa(const char *s);
          char *strndupa(const char *s, size_t n);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          strdup():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          strndup():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE

          strdupa(), strndupa():
              _GNU_SOURCE


---------------------------------------------------------------

::

          The strdup() function returns a pointer to a new string which is
          a duplicate of the string s.  Memory for the new string is
          obtained with malloc(3), and can be freed with free(3).

          The strndup() function is similar, but copies at most n bytes.
          If s is longer than n, only n bytes are copied, and a terminating
          null byte ('\0') is added.

          strdupa() and strndupa() are similar, but use alloca(3) to
          allocate the buffer.  They are available only when using the GNU
          GCC suite, and suffer from the same limitations described in
          alloca(3).


-----------------------------------------------------------------

::

          On success, the strdup() function returns a pointer to the
          duplicated string.  It returns NULL if insufficient memory was
          available, with errno set to indicate the error.


-----------------------------------------------------

::

          ENOMEM Insufficient memory available to allocate duplicate
                 string.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │strdup(), strndup(), strdupa(),       │ Thread safety │ MT-Safe │
          │strndupa()                            │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          strdup() conforms to SVr4, 4.3BSD, POSIX.1-2001.  strndup()
          conforms to POSIX.1-2008.  strdupa() and strndupa() are GNU
          extensions.


---------------------------------------------------------

::

          alloca(3), calloc(3), free(3), malloc(3), realloc(3), string(3),
          wcsdup(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STRDUP(3)

--------------

Pages that refer to this page:
`ldap_memory(3) <../man3/ldap_memory.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmfault(3) <../man3/pmfault.3.html>`__, 
`pmtraversepmns(3) <../man3/pmtraversepmns.3.html>`__, 
`strcpy(3) <../man3/strcpy.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`wcsdup(3) <../man3/wcsdup.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/strdup.3.license.html>`__

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

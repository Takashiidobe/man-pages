.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strstr(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRSTR(3)               Linux Programmer's Manual              STRSTR(3)

NAME
-------------------------------------------------

::

          strstr, strcasestr - locate a substring


---------------------------------------------------------

::

          #include <string.h>

          char *strstr(const char *haystack, const char *needle);

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <string.h>

          char *strcasestr(const char *haystack, const char *needle);


---------------------------------------------------------------

::

          The strstr() function finds the first occurrence of the substring
          needle in the string haystack.  The terminating null bytes ('\0')
          are not compared.

          The strcasestr() function is like strstr(), but ignores the case
          of both arguments.


-----------------------------------------------------------------

::

          These functions return a pointer to the beginning of the located
          substring, or NULL if the substring is not found.

          If needle is the empty string, the return value is always
          haystack itself.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │strstr()                       │ Thread safety │ MT-Safe        │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │strcasestr()                   │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          strstr(): POSIX.1-2001, POSIX.1-2008, C89, C99.

          The strcasestr() function is a nonstandard extension.


---------------------------------------------------------

::

          index(3), memchr(3), memmem(3), rindex(3), strcasecmp(3),
          strchr(3), string(3), strpbrk(3), strsep(3), strspn(3),
          strtok(3), wcsstr(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-08-27                      STRSTR(3)

--------------

Pages that refer to this page: `index(3) <../man3/index.3.html>`__, 
`memchr(3) <../man3/memchr.3.html>`__, 
`memmem(3) <../man3/memmem.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__, 
`wcsstr(3) <../man3/wcsstr.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strstr.3.license.html>`__

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

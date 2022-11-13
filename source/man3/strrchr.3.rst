.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strchr(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRCHR(3)               Linux Programmer's Manual              STRCHR(3)

NAME
-------------------------------------------------

::

          strchr, strrchr, strchrnul - locate character in string


---------------------------------------------------------

::

          #include <string.h>

          char *strchr(const char *s, int c);
          char *strrchr(const char *s, int c);

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <string.h>

          char *strchrnul(const char *s, int c);


---------------------------------------------------------------

::

          The strchr() function returns a pointer to the first occurrence
          of the character c in the string s.

          The strrchr() function returns a pointer to the last occurrence
          of the character c in the string s.

          The strchrnul() function is like strchr() except that if c is not
          found in s, then it returns a pointer to the null byte at the end
          of s, rather than NULL.

          Here "character" means "byte"; these functions do not work with
          wide or multibyte characters.


-----------------------------------------------------------------

::

          The strchr() and strrchr() functions return a pointer to the
          matched character or NULL if the character is not found.  The
          terminating null byte is considered part of the string, so that
          if c is specified as '\0', these functions return a pointer to
          the terminator.

          The strchrnul() function returns a pointer to the matched
          character, or a pointer to the null byte at the end of s (i.e.,
          s+strlen(s)) if the character is not found.


---------------------------------------------------------

::

          strchrnul() first appeared in glibc in version 2.1.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │strchr(), strrchr(), strchrnul()      │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          strchr(), strrchr(): POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4,
          4.3BSD.

          strchrnul() is a GNU extension.


---------------------------------------------------------

::

          index(3), memchr(3), rindex(3), string(3), strlen(3), strpbrk(3),
          strsep(3), strspn(3), strstr(3), strtok(3), wcschr(3), wcsrchr(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      STRCHR(3)

--------------

Pages that refer to this page: `index(3) <../man3/index.3.html>`__, 
`memchr(3) <../man3/memchr.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__, 
`wcschr(3) <../man3/wcschr.3.html>`__, 
`wcsrchr(3) <../man3/wcsrchr.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strchr.3.license.html>`__

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

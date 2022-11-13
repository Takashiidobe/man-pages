.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

index(3) — Linux manual page
============================

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

   INDEX(3)                Linux Programmer's Manual               INDEX(3)

NAME
-------------------------------------------------

::

          index, rindex - locate character in string


---------------------------------------------------------

::

          #include <strings.h>

          char *index(const char *s, int c);
          char *rindex(const char *s, int c);


---------------------------------------------------------------

::

          The index() function returns a pointer to the first occurrence of
          the character c in the string s.

          The rindex() function returns a pointer to the last occurrence of
          the character c in the string s.

          The terminating null byte ('\0') is considered to be a part of
          the strings.


-----------------------------------------------------------------

::

          The index() and rindex() functions return a pointer to the
          matched character or NULL if the character is not found.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │index(), rindex()                     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.3BSD; marked as LEGACY in POSIX.1-2001.  POSIX.1-2008 removes
          the specifications of index() and rindex(), recommending
          strchr(3) and strrchr(3) instead.


---------------------------------------------------------

::

          memchr(3), strchr(3), string(3), strpbrk(3), strrchr(3),
          strsep(3), strspn(3), strstr(3), strtok(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       INDEX(3)

--------------

Pages that refer to this page: `memchr(3) <../man3/memchr.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/index.3.license.html>`__

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

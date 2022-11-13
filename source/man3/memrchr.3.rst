.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

memchr(3) — Linux manual page
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

   MEMCHR(3)               Linux Programmer's Manual              MEMCHR(3)

NAME
-------------------------------------------------

::

          memchr, memrchr, rawmemchr - scan memory for a character


---------------------------------------------------------

::

          #include <string.h>

          void *memchr(const void *s, int c, size_t n);
          void *memrchr(const void *s, int c, size_t n);
          void *rawmemchr(const void *s, int c);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          memrchr(), rawmemchr():
              _GNU_SOURCE


---------------------------------------------------------------

::

          The memchr() function scans the initial n bytes of the memory
          area pointed to by s for the first instance of c.  Both c and the
          bytes of the memory area pointed to by s are interpreted as
          unsigned char.

          The memrchr() function is like the memchr() function, except that
          it searches backward from the end of the n bytes pointed to by s
          instead of forward from the beginning.

          The rawmemchr() function is similar to memchr(): it assumes
          (i.e., the programmer knows for certain) that an instance of c
          lies somewhere in the memory area starting at the location
          pointed to by s, and so performs an optimized search for c (i.e.,
          no use of a count argument to limit the range of the search).  If
          an instance of c is not found, the results are unpredictable.
          The following call is a fast means of locating a string's
          terminating null byte:

              char *p = rawmemchr(s, '\0');


-----------------------------------------------------------------

::

          The memchr() and memrchr() functions return a pointer to the
          matching byte or NULL if the character does not occur in the
          given memory area.

          The rawmemchr() function returns a pointer to the matching byte,
          if one is found.  If no matching byte is found, the result is
          unspecified.


---------------------------------------------------------

::

          rawmemchr() first appeared in glibc in version 2.1.

          memrchr() first appeared in glibc in version 2.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │memchr(), memrchr(), rawmemchr()      │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          memchr(): POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.

          The memrchr() function is a GNU extension, available since glibc
          2.1.91.

          The rawmemchr() function is a GNU extension, available since
          glibc 2.1.


---------------------------------------------------------

::

          bstring(3), ffs(3), index(3), memmem(3), rindex(3), strchr(3),
          strpbrk(3), strrchr(3), strsep(3), strspn(3), strstr(3),
          wmemchr(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      MEMCHR(3)

--------------

Pages that refer to this page: `bstring(3) <../man3/bstring.3.html>`__, 
`ffs(3) <../man3/ffs.3.html>`__,  `index(3) <../man3/index.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__, 
`wmemchr(3) <../man3/wmemchr.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/memchr.3.license.html>`__

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

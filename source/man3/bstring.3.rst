.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bstring(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BSTRING(3)              Linux Programmer's Manual             BSTRING(3)

NAME
-------------------------------------------------

::

          bcmp, bcopy, bzero, memccpy, memchr, memcmp, memcpy, memfrob,
          memmem, memmove, memset - byte string operations


---------------------------------------------------------

::

          #include <string.h>

          int bcmp(const void *s1, const void *s2, size_t n);

          void bcopy(const void *src, void *dest, size_t n);

          void bzero(void *s, size_t n);

          void *memccpy(void *dest, const void *src, int c, size_t n);

          void *memchr(const void *s, int c, size_t n);

          int memcmp(const void *s1, const void *s2, size_t n);

          void *memcpy(void *dest, const void *src, size_t n);

          void *memfrob(void *s, size_t n);

          void *memmem(const void *haystack, size_t haystacklen,
                       const void *needle, size_t needlelen);

          void *memmove(void *dest, const void *src, size_t n);

          void *memset(void *s, int c, size_t n);


---------------------------------------------------------------

::

          The byte string functions perform operations on strings (byte
          arrays) that are not necessarily null-terminated.  See the
          individual man pages for descriptions of each function.


---------------------------------------------------

::

          The functions bcmp(), bcopy(), and bzero() are obsolete.  Use
          memcmp(), memcpy(), and memset() instead.


---------------------------------------------------------

::

          bcmp(3), bcopy(3), bzero(3), memccpy(3), memchr(3), memcmp(3),
          memcpy(3), memfrob(3), memmem(3), memmove(3), memset(3),
          string(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     BSTRING(3)

--------------

Pages that refer to this page: `bcmp(3) <../man3/bcmp.3.html>`__, 
`bcopy(3) <../man3/bcopy.3.html>`__, 
`bzero(3) <../man3/bzero.3.html>`__, 
`memccpy(3) <../man3/memccpy.3.html>`__, 
`memchr(3) <../man3/memchr.3.html>`__, 
`memcmp(3) <../man3/memcmp.3.html>`__, 
`memcpy(3) <../man3/memcpy.3.html>`__, 
`memfrob(3) <../man3/memfrob.3.html>`__, 
`memmem(3) <../man3/memmem.3.html>`__, 
`memmove(3) <../man3/memmove.3.html>`__, 
`memset(3) <../man3/memset.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`swab(3) <../man3/swab.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/bstring.3.license.html>`__

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

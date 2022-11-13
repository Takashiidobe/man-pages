.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

memcpy(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MEMCPY(3)               Linux Programmer's Manual              MEMCPY(3)

NAME
-------------------------------------------------

::

          memcpy - copy memory area


---------------------------------------------------------

::

          #include <string.h>

          void *memcpy(void *restrict dest, const void *restrict src, size_t n);


---------------------------------------------------------------

::

          The memcpy() function copies n bytes from memory area src to
          memory area dest.  The memory areas must not overlap.  Use
          memmove(3) if the memory areas do overlap.


-----------------------------------------------------------------

::

          The memcpy() function returns a pointer to dest.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │memcpy()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          Failure to observe the requirement that the memory areas do not
          overlap has been the source of significant bugs.  (POSIX and the
          C standards are explicit that employing memcpy() with overlapping
          areas produces undefined behavior.)  Most notably, in glibc 2.13
          a performance optimization of memcpy() on some platforms
          (including x86-64) included changing the order in which bytes
          were copied from src to dest.

          This change revealed breakages in a number of applications that
          performed copying with overlapping areas.  Under the previous
          implementation, the order in which the bytes were copied had
          fortuitously hidden the bug, which was revealed when the copying
          order was reversed.  In glibc 2.14, a versioned symbol was added
          so that old binaries (i.e., those linked against glibc versions
          earlier than 2.14) employed a memcpy() implementation that safely
          handles the overlapping buffers case (by providing an "older"
          memcpy() implementation that was aliased to memmove(3)).


---------------------------------------------------------

::

          bcopy(3), bstring(3), memccpy(3), memmove(3), mempcpy(3),
          strcpy(3), strncpy(3), wmemcpy(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      MEMCPY(3)

--------------

Pages that refer to this page: `bcopy(3) <../man3/bcopy.3.html>`__, 
`bstring(3) <../man3/bstring.3.html>`__, 
`cmsg(3) <../man3/cmsg.3.html>`__, 
`CPU_SET(3) <../man3/CPU_SET.3.html>`__, 
`memccpy(3) <../man3/memccpy.3.html>`__, 
`memmove(3) <../man3/memmove.3.html>`__, 
`mempcpy(3) <../man3/mempcpy.3.html>`__, 
`stpcpy(3) <../man3/stpcpy.3.html>`__, 
`strcat(3) <../man3/strcat.3.html>`__, 
`strcpy(3) <../man3/strcpy.3.html>`__, 
`wmemcpy(3) <../man3/wmemcpy.3.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/memcpy.3.license.html>`__

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

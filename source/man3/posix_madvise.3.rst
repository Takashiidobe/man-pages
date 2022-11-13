.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_madvise(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   POSIX_MADVISE(3)        Linux Programmer's Manual       POSIX_MADVISE(3)

NAME
-------------------------------------------------

::

          posix_madvise - give advice about patterns of memory usage


---------------------------------------------------------

::

          #include <sys/mman.h>

          int posix_madvise(void *addr, size_t len, int advice);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          posix_madvise():
              _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The posix_madvise() function allows an application to advise the
          system about its expected patterns of usage of memory in the
          address range starting at addr and continuing for len bytes.  The
          system is free to use this advice in order to improve the
          performance of memory accesses (or to ignore the advice
          altogether), but calling posix_madvise() shall not affect the
          semantics of access to memory in the specified range.

          The advice argument is one of the following:

          POSIX_MADV_NORMAL
                 The application has no special advice regarding its memory
                 usage patterns for the specified address range.  This is
                 the default behavior.

          POSIX_MADV_SEQUENTIAL
                 The application expects to access the specified address
                 range sequentially, running from lower addresses to higher
                 addresses.  Hence, pages in this region can be
                 aggressively read ahead, and may be freed soon after they
                 are accessed.

          POSIX_MADV_RANDOM
                 The application expects to access the specified address
                 range randomly.  Thus, read ahead may be less useful than
                 normally.

          POSIX_MADV_WILLNEED
                 The application expects to access the specified address
                 range in the near future.  Thus, read ahead may be
                 beneficial.

          POSIX_MADV_DONTNEED
                 The application expects that it will not access the
                 specified address range in the near future.


-----------------------------------------------------------------

::

          On success, posix_madvise() returns 0.  On failure, it returns a
          positive error number.


-----------------------------------------------------

::

          EINVAL addr is not a multiple of the system page size or len is
                 negative.

          EINVAL advice is invalid.

          ENOMEM Addresses in the specified range are partially or
                 completely outside the caller's address space.


---------------------------------------------------------

::

          Support for posix_madvise() first appeared in glibc version 2.2.


-------------------------------------------------------------------

::

          POSIX.1-2001.


---------------------------------------------------

::

          POSIX.1 permits an implementation to generate an error if len is
          0.  On Linux, specifying len as 0 is permitted (as a successful
          no-op).

          In glibc, this function is implemented using madvise(2).
          However, since glibc 2.6, POSIX_MADV_DONTNEED is treated as a no-
          op, because the corresponding madvise(2) value, MADV_DONTNEED,
          has destructive semantics.


---------------------------------------------------------

::

          madvise(2), posix_fadvise(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               POSIX_MADVISE(3)

--------------

Pages that refer to this page: `madvise(2) <../man2/madvise.2.html>`__, 
`mincore(2) <../man2/mincore.2.html>`__, 
`posix_fadvise(2) <../man2/posix_fadvise.2.html>`__

--------------

`Copyright and license for this manual
page <../man3/posix_madvise.3.license.html>`__

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

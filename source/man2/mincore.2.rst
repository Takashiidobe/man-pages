.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mincore(2) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MINCORE(2)              Linux Programmer's Manual             MINCORE(2)

NAME
-------------------------------------------------

::

          mincore - determine whether pages are resident in memory


---------------------------------------------------------

::

          #include <sys/mman.h>

          int mincore(void *addr, size_t length, unsigned char *vec);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          mincore():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          mincore() returns a vector that indicates whether pages of the
          calling process's virtual memory are resident in core (RAM), and
          so will not cause a disk access (page fault) if referenced.  The
          kernel returns residency information about the pages starting at
          the address addr, and continuing for length bytes.

          The addr argument must be a multiple of the system page size.
          The length argument need not be a multiple of the page size, but
          since residency information is returned for whole pages, length
          is effectively rounded up to the next multiple of the page size.
          One may obtain the page size (PAGE_SIZE) using
          sysconf(_SC_PAGESIZE).

          The vec argument must point to an array containing at least
          (length+PAGE_SIZE-1) / PAGE_SIZE bytes.  On return, the least
          significant bit of each byte will be set if the corresponding
          page is currently resident in memory, and be clear otherwise.
          (The settings of the other bits in each byte are undefined; these
          bits are reserved for possible later use.)  Of course the
          information returned in vec is only a snapshot: pages that are
          not locked in memory can come and go at any moment, and the
          contents of vec may already be stale by the time this call
          returns.


-----------------------------------------------------------------

::

          On success, mincore() returns zero.  On error, -1 is returned,
          and errno is set to indicate the error.


-----------------------------------------------------

::

          EAGAIN kernel is temporarily out of resources.

          EFAULT vec points to an invalid address.

          EINVAL addr is not a multiple of the page size.

          ENOMEM length is greater than (TASK_SIZE - addr).  (This could
                 occur if a negative value is specified for length, since
                 that value will be interpreted as a large unsigned
                 integer.)  In Linux 2.6.11 and earlier, the error EINVAL
                 was returned for this condition.

          ENOMEM addr to addr + length contained unmapped memory.


---------------------------------------------------------

::

          Available since Linux 2.3.99pre1 and glibc 2.2.


-------------------------------------------------------------------

::

          mincore() is not specified in POSIX.1, and it is not available on
          all UNIX implementations.


-------------------------------------------------

::

          Before kernel 2.6.21, mincore() did not return correct
          information for MAP_PRIVATE mappings, or for nonlinear mappings
          (established using remap_file_pages(2)).


---------------------------------------------------------

::

          fincore(1), madvise(2), mlock(2), mmap(2), posix_fadvise(2),
          posix_madvise(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     MINCORE(2)

--------------

Pages that refer to this page: `fincore(1) <../man1/fincore.1.html>`__, 
`madvise(2) <../man2/madvise.2.html>`__, 
`mlock(2) <../man2/mlock.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`posix_fadvise(2) <../man2/posix_fadvise.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/mincore.2.license.html>`__

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

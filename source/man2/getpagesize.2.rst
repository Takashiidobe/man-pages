.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpagesize(2) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPAGESIZE(2)          Linux Programmer's Manual         GETPAGESIZE(2)

NAME
-------------------------------------------------

::

          getpagesize - get memory page size


---------------------------------------------------------

::

          #include <unistd.h>

          int getpagesize(void);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getpagesize():
              Since glibc 2.20:
                  _DEFAULT_SOURCE || ! (_POSIX_C_SOURCE >= 200112L)
              Glibc 2.12 to 2.19:
                  _BSD_SOURCE || ! (_POSIX_C_SOURCE >= 200112L)
              Before glibc 2.12:
                  _BSD_SOURCE || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          The function getpagesize() returns the number of bytes in a
          memory page, where "page" is a fixed-length block, the unit for
          memory allocation and file mapping performed by mmap(2).


-------------------------------------------------------------------

::

          SVr4, 4.4BSD, SUSv2.  In SUSv2 the getpagesize() call is labeled
          LEGACY, and in POSIX.1-2001 it has been dropped; HP-UX does not
          have this call.


---------------------------------------------------

::

          Portable applications should employ sysconf(_SC_PAGESIZE) instead
          of getpagesize():

              #include <unistd.h>
              long sz = sysconf(_SC_PAGESIZE);

          (Most systems allow the synonym _SC_PAGE_SIZE for _SC_PAGESIZE.)

          Whether getpagesize() is present as a Linux system call depends
          on the architecture.  If it is, it returns the kernel symbol
          PAGE_SIZE, whose value depends on the architecture and machine
          model.  Generally, one uses binaries that are dependent on the
          architecture but not on the machine model, in order to have a
          single binary distribution per architecture.  This means that a
          user program should not find PAGE_SIZE at compile time from a
          header file, but use an actual system call, at least for those
          architectures (like sun4) where this dependency exists.  Here
          glibc 2.0 fails because its getpagesize() returns a statically
          derived value, and does not use a system call.  Things are OK in
          glibc 2.1.


---------------------------------------------------------

::

          mmap(2), sysconf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 GETPAGESIZE(2)

--------------

Pages that refer to this page: `fincore(1) <../man1/fincore.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`mmap2(2) <../man2/mmap2.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`mremap(2) <../man2/mremap.2.html>`__, 
`remap_file_pages(2) <../man2/remap_file_pages.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`numa(3) <../man3/numa.3.html>`__, 
`posix_memalign(3) <../man3/posix_memalign.3.html>`__

--------------

`Copyright and license for this manual
page <../man2/getpagesize.2.license.html>`__

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

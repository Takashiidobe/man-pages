.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

alloc_hugepages(2) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ALLOC_HUGEPAGES(2)      Linux Programmer's Manual     ALLOC_HUGEPAGES(2)

NAME
-------------------------------------------------

::

          alloc_hugepages, free_hugepages - allocate or free huge pages


---------------------------------------------------------

::

          void *syscall(SYS_alloc_hugepages, int key, void *addr, size_t len,
                        int prot, int flag);
          int syscall(SYS_free_hugepages, void *addr);

          Note: glibc provides no wrappers for these system calls,
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          The system calls alloc_hugepages() and free_hugepages() were
          introduced in Linux 2.5.36 and removed again in 2.5.54.  They
          existed only on i386 and ia64 (when built with
          CONFIG_HUGETLB_PAGE).  In Linux 2.4.20, the syscall numbers
          exist, but the calls fail with the error ENOSYS.

          On i386 the memory management hardware knows about ordinary pages
          (4 KiB) and huge pages (2 or 4 MiB).  Similarly ia64 knows about
          huge pages of several sizes.  These system calls serve to map
          huge pages into the process's memory or to free them again.  Huge
          pages are locked into memory, and are not swapped.

          The key argument is an identifier.  When zero the pages are
          private, and not inherited by children.  When positive the pages
          are shared with other applications using the same key, and
          inherited by child processes.

          The addr argument of free_hugepages() tells which page is being
          freed: it was the return value of a call to alloc_hugepages().
          (The memory is first actually freed when all users have released
          it.)  The addr argument of alloc_hugepages() is a hint, that the
          kernel may or may not follow.  Addresses must be properly
          aligned.

          The len argument is the length of the required segment.  It must
          be a multiple of the huge page size.

          The prot argument specifies the memory protection of the segment.
          It is one of PROT_READ, PROT_WRITE, PROT_EXEC.

          The flag argument is ignored, unless key is positive.  In that
          case, if flag is IPC_CREAT, then a new huge page segment is
          created when none with the given key existed.  If this flag is
          not set, then ENOENT is returned when no segment with the given
          key exists.


-----------------------------------------------------------------

::

          On success, alloc_hugepages() returns the allocated virtual
          address, and free_hugepages() returns zero.  On error, -1 is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          ENOSYS The system call is not supported on this kernel.


---------------------------------------------------

::

          /proc/sys/vm/nr_hugepages
                 Number of configured hugetlb pages.  This can be read and
                 written.

          /proc/meminfo
                 Gives info on the number of configured hugetlb pages and
                 on their size in the three variables HugePages_Total,
                 HugePages_Free, Hugepagesize.


-------------------------------------------------------------------

::

          These extinct system calls were specific to Linux on Intel
          processors.


---------------------------------------------------

::

          These system calls are gone; they existed only in Linux 2.5.36
          through to 2.5.54.  Now the hugetlbfs filesystem can be used
          instead.  Memory backed by huge pages (if the CPU supports them)
          is obtained by using mmap(2) to map files in this virtual
          filesystem.

          The maximal number of huge pages can be specified using the
          hugepages= boot parameter.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22             ALLOC_HUGEPAGES(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/alloc_hugepages.2.license.html>`__

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

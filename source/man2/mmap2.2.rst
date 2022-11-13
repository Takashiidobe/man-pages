.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mmap2(2) — Linux manual page
============================

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

   MMAP2(2)                Linux Programmer's Manual               MMAP2(2)

NAME
-------------------------------------------------

::

          mmap2 - map files or devices into memory


---------------------------------------------------------

::

          #include <sys/mman.h>    /* Definition of MAP_* and PROT_* constants */
          #include <sys/syscall.h> /* Definition of SYS_* constants */
          #include <unistd.h>

          void *syscall(SYS_mmap2, unsigned long addr, unsigned long length,
                        unsigned long prot, unsigned long flags,
                        unsigned long fd, unsigned long pgoffset);


---------------------------------------------------------------

::

          This is probably not the system call that you are interested in;
          instead, see mmap(2), which describes the glibc wrapper function
          that invokes this system call.

          The mmap2() system call provides the same interface as mmap(2),
          except that the final argument specifies the offset into the file
          in 4096-byte units (instead of bytes, as is done by mmap(2)).
          This enables applications that use a 32-bit off_t to map large
          files (up to 2^44 bytes).


-----------------------------------------------------------------

::

          On success, mmap2() returns a pointer to the mapped area.  On
          error, -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT Problem with getting the data from user space.

          EINVAL (Various platforms where the page size is not 4096 bytes.)
                 offset * 4096 is not a multiple of the system page size.

          mmap2() can also return any of the errors described in mmap(2).


---------------------------------------------------------

::

          mmap2() is available since Linux 2.3.31.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          On architectures where this system call is present, the glibc
          mmap() wrapper function invokes this system call rather than the
          mmap(2) system call.

          This system call does not exist on x86-64.

          On ia64, the unit for offset is actually the system page size,
          rather than 4096 bytes.


---------------------------------------------------------

::

          getpagesize(2), mmap(2), mremap(2), msync(2), shm_open(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       MMAP2(2)

--------------

Pages that refer to this page: `mmap(2) <../man2/mmap.2.html>`__, 
`remap_file_pages(2) <../man2/remap_file_pages.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/mmap2.2.license.html>`__

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

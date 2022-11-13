.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readahead(2) — Linux manual page
================================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   READAHEAD(2)            Linux Programmer's Manual           READAHEAD(2)

NAME
-------------------------------------------------

::

          readahead - initiate file readahead into page cache


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <fcntl.h>

          ssize_t readahead(int fd, off64_t offset, size_t count);


---------------------------------------------------------------

::

          readahead() initiates readahead on a file so that subsequent
          reads from that file will be satisfied from the cache, and not
          block on disk I/O (assuming the readahead was initiated early
          enough and that other activity on the system did not in the
          meantime flush pages from the cache).

          The fd argument is a file descriptor identifying the file which
          is to be read.  The offset argument specifies the starting point
          from which data is to be read and count specifies the number of
          bytes to be read.  I/O is performed in whole pages, so that
          offset is effectively rounded down to a page boundary and bytes
          are read up to the next page boundary greater than or equal to
          (offset+count).  readahead() does not read beyond the end of the
          file.  The file offset of the open file description referred to
          by the file descriptor fd is left unchanged.


-----------------------------------------------------------------

::

          On success, readahead() returns 0; on failure, -1 is returned,
          with errno set to indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not a valid file descriptor or is not open for
                 reading.

          EINVAL fd does not refer to a file type to which readahead() can
                 be applied.


---------------------------------------------------------

::

          The readahead() system call appeared in Linux 2.4.13; glibc
          support has been provided since version 2.3.


-------------------------------------------------------------------

::

          The readahead() system call is Linux-specific, and its use should
          be avoided in portable applications.


---------------------------------------------------

::

          On some 32-bit architectures, the calling signature for this
          system call differs, for the reasons described in syscall(2).


-------------------------------------------------

::

          readahead() attempts to schedule the reads in the background and
          return immediately.  However, it may block while it reads the
          filesystem metadata needed to locate the requested blocks.  This
          occurs frequently with ext[234] on large files using indirect
          blocks instead of extents, giving the appearance that the call
          blocks until the requested data has been read.


---------------------------------------------------------

::

          lseek(2), madvise(2), mmap(2), posix_fadvise(2), read(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   READAHEAD(2)

--------------

Pages that refer to this page:
`posix_fadvise(2) <../man2/posix_fadvise.2.html>`__, 
`syscall(2) <../man2/syscall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/readahead.2.license.html>`__

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

.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

llseek(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LLSEEK(2)               Linux Programmer's Manual              LLSEEK(2)

NAME
-------------------------------------------------

::

          _llseek - reposition read/write file offset


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS__llseek, unsigned int fd, unsigned long offset_high,
                      unsigned long offset_low, loff_t *result,
                      unsigned int whence);

          Note: glibc provides no wrapper for _llseek(), necessitating the
          use of syscall(2).


---------------------------------------------------------------

::

          Note: for information about the llseek(3) library function, see
          lseek64(3).

          The _llseek() system call repositions the offset of the open file
          description associated with the file descriptor fd to the value

                 (offset_high << 32) | offset_low

          This new offset is a byte offset relative to the beginning of the
          file, the current file offset, or the end of the file, depending
          on whether whence is SEEK_SET, SEEK_CUR, or SEEK_END,
          respectively.

          The new file offset is returned in the argument result.  The
          type loff_t is a 64-bit signed type.

          This system call exists on various 32-bit platforms to support
          seeking to large file offsets.


-----------------------------------------------------------------

::

          Upon successful completion, _llseek() returns 0.  Otherwise, a
          value of -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not an open file descriptor.

          EFAULT Problem with copying results to user space.

          EINVAL whence is invalid.


-------------------------------------------------------------------

::

          This function is Linux-specific, and should not be used in
          programs intended to be portable.


---------------------------------------------------

::

          You probably want to use the lseek(2) wrapper function instead.


---------------------------------------------------------

::

          lseek(2), open(2), lseek64(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      LLSEEK(2)

--------------

Pages that refer to this page: `syscall(2) <../man2/syscall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`lseek64(3) <../man3/lseek64.3.html>`__

--------------

`Copyright and license for this manual
page <../man2/llseek.2.license.html>`__

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

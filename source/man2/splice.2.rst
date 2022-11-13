.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

splice(2) — Linux manual page
=============================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SPLICE(2)               Linux Programmer's Manual              SPLICE(2)

NAME
-------------------------------------------------

::

          splice - splice data to/from a pipe


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <fcntl.h>

          ssize_t splice(int fd_in, off64_t *off_in, int fd_out,
                         off64_t *off_out, size_t len, unsigned int flags);


---------------------------------------------------------------

::

          splice() moves data between two file descriptors without copying
          between kernel address space and user address space.  It
          transfers up to len bytes of data from the file descriptor fd_in
          to the file descriptor fd_out, where one of the file descriptors
          must refer to a pipe.

          The following semantics apply for fd_in and off_in:

          *  If fd_in refers to a pipe, then off_in must be NULL.

          *  If fd_in does not refer to a pipe and off_in is NULL, then
             bytes are read from fd_in starting from the file offset, and
             the file offset is adjusted appropriately.

          *  If fd_in does not refer to a pipe and off_in is not NULL, then
             off_in must point to a buffer which specifies the starting
             offset from which bytes will be read from fd_in; in this case,
             the file offset of fd_in is not changed.

          Analogous statements apply for fd_out and off_out.

          The flags argument is a bit mask that is composed by ORing
          together zero or more of the following values:

          SPLICE_F_MOVE
                 Attempt to move pages instead of copying.  This is only a
                 hint to the kernel: pages may still be copied if the
                 kernel cannot move the pages from the pipe, or if the pipe
                 buffers don't refer to full pages.  The initial
                 implementation of this flag was buggy: therefore starting
                 in Linux 2.6.21 it is a no-op (but is still permitted in a
                 splice() call); in the future, a correct implementation
                 may be restored.

          SPLICE_F_NONBLOCK
                 Do not block on I/O.  This makes the splice pipe
                 operations nonblocking, but splice() may nevertheless
                 block because the file descriptors that are spliced
                 to/from may block (unless they have the O_NONBLOCK flag
                 set).

          SPLICE_F_MORE
                 More data will be coming in a subsequent splice.  This is
                 a helpful hint when the fd_out refers to a socket (see
                 also the description of MSG_MORE in send(2), and the
                 description of TCP_CORK in tcp(7)).

          SPLICE_F_GIFT
                 Unused for splice(); see vmsplice(2).


-----------------------------------------------------------------

::

          Upon successful completion, splice() returns the number of bytes
          spliced to or from the pipe.

          A return value of 0 means end of input.  If fd_in refers to a
          pipe, then this means that there was no data to transfer, and it
          would not make sense to block because there are no writers
          connected to the write end of the pipe.

          On error, splice() returns -1 and errno is set to indicate the
          error.


-----------------------------------------------------

::

          EAGAIN SPLICE_F_NONBLOCK was specified in flags or one of the
                 file descriptors had been marked as nonblocking
                 (O_NONBLOCK), and the operation would block.

          EBADF  One or both file descriptors are not valid, or do not have
                 proper read-write mode.

          EINVAL The target filesystem doesn't support splicing.

          EINVAL The target file is opened in append mode.

          EINVAL Neither of the file descriptors refers to a pipe.

          EINVAL An offset was given for nonseekable device (e.g., a pipe).

          EINVAL fd_in and fd_out refer to the same pipe.

          ENOMEM Out of memory.

          ESPIPE Either off_in or off_out was not NULL, but the
                 corresponding file descriptor refers to a pipe.


---------------------------------------------------------

::

          The splice() system call first appeared in Linux 2.6.17; library
          support was added to glibc in version 2.5.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          The three system calls splice(), vmsplice(2), and tee(2), provide
          user-space programs with full control over an arbitrary kernel
          buffer, implemented within the kernel using the same type of
          buffer that is used for a pipe.  In overview, these system calls
          perform the following tasks:

          • splice() moves data from the buffer to an arbitrary file
            descriptor, or vice versa, or from one buffer to another.

          • tee(2) "copies" the data from one buffer to another.

          • vmsplice(2) "copies" data from user space into the buffer.

          Though we talk of copying, actual copies are generally avoided.
          The kernel does this by implementing a pipe buffer as a set of
          reference-counted pointers to pages of kernel memory.  The kernel
          creates "copies" of pages in a buffer by creating new pointers
          (for the output buffer) referring to the pages, and increasing
          the reference counts for the pages: only pointers are copied, not
          the pages of the buffer.

          In Linux 2.6.30 and earlier, exactly one of fd_in and fd_out was
          required to be a pipe.  Since Linux 2.6.31, both arguments may
          refer to pipes.


---------------------------------------------------------

::

          See tee(2).


---------------------------------------------------------

::

          copy_file_range(2), sendfile(2), tee(2), vmsplice(2), pipe(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SPLICE(2)

--------------

Pages that refer to this page: `pv(1) <../man1/pv.1.html>`__, 
`copy_file_range(2) <../man2/copy_file_range.2.html>`__, 
`pipe(2) <../man2/pipe.2.html>`__, 
`sendfile(2) <../man2/sendfile.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`tee(2) <../man2/tee.2.html>`__, 
`vmsplice(2) <../man2/vmsplice.2.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/splice.2.license.html>`__

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

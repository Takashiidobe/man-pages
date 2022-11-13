.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vmsplice(2) — Linux manual page
===============================

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

   VMSPLICE(2)             Linux Programmer's Manual            VMSPLICE(2)

NAME
-------------------------------------------------

::

          vmsplice - splice user pages to/from a pipe


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <fcntl.h>

          ssize_t vmsplice(int fd, const struct iovec *iov,
                           size_t nr_segs, unsigned int flags);


---------------------------------------------------------------

::

          If fd is opened for writing, the vmsplice() system call maps
          nr_segs ranges of user memory described by iov into a pipe.  If
          fd is opened for reading, the vmsplice() system call fills
          nr_segs ranges of user memory described by iov from a pipe.  The
          file descriptor fd must refer to a pipe.

          The pointer iov points to an array of iovec structures as defined
          in <sys/uio.h>:

              struct iovec {
                  void  *iov_base;        /* Starting address */
                  size_t iov_len;         /* Number of bytes */
              };

          The flags argument is a bit mask that is composed by ORing
          together zero or more of the following values:

          SPLICE_F_MOVE
                 Unused for vmsplice(); see splice(2).

          SPLICE_F_NONBLOCK
                 Do not block on I/O; see splice(2) for further details.

          SPLICE_F_MORE
                 Currently has no effect for vmsplice(), but may be
                 implemented in the future; see splice(2).

          SPLICE_F_GIFT
                 The user pages are a gift to the kernel.  The application
                 may not modify this memory ever, otherwise the page cache
                 and on-disk data may differ.  Gifting pages to the kernel
                 means that a subsequent splice(2) SPLICE_F_MOVE can
                 successfully move the pages; if this flag is not
                 specified, then a subsequent splice(2) SPLICE_F_MOVE must
                 copy the pages.  Data must also be properly page aligned,
                 both in memory and length.


-----------------------------------------------------------------

::

          Upon successful completion, vmsplice() returns the number of
          bytes transferred to the pipe.  On error, vmsplice() returns -1
          and errno is set to indicate the error.


-----------------------------------------------------

::

          EAGAIN SPLICE_F_NONBLOCK was specified in flags, and the
                 operation would block.

          EBADF  fd either not valid, or doesn't refer to a pipe.

          EINVAL nr_segs is greater than IOV_MAX; or memory not aligned if
                 SPLICE_F_GIFT set.

          ENOMEM Out of memory.


---------------------------------------------------------

::

          The vmsplice() system call first appeared in Linux 2.6.17;
          library support was added to glibc in version 2.5.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          vmsplice() follows the other vectorized read/write type functions
          when it comes to limitations on the number of segments being
          passed in.  This limit is IOV_MAX as defined in <limits.h>.
          Currently, this limit is 1024.

          vmsplice() really supports true splicing only from user memory to
          a pipe.  In the opposite direction, it actually just copies the
          data to user space.  But this makes the interface nice and
          symmetric and enables people to build on vmsplice() with room for
          future improvement in performance.


---------------------------------------------------------

::

          splice(2), tee(2), pipe(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    VMSPLICE(2)

--------------

Pages that refer to this page: `pipe(2) <../man2/pipe.2.html>`__, 
`splice(2) <../man2/splice.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`tee(2) <../man2/tee.2.html>`__,  `pipe(7) <../man7/pipe.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/vmsplice.2.license.html>`__

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

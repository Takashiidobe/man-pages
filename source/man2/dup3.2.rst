.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dup(2) — Linux manual page
==========================

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

   DUP(2)                  Linux Programmer's Manual                 DUP(2)

NAME
-------------------------------------------------

::

          dup, dup2, dup3 - duplicate a file descriptor


---------------------------------------------------------

::

          #include <unistd.h>

          int dup(int oldfd);
          int dup2(int oldfd, int newfd);

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <fcntl.h>              /* Definition of O_* constants */
          #include <unistd.h>

          int dup3(int oldfd, int newfd, int flags);


---------------------------------------------------------------

::

          The dup() system call allocates a new file descriptor that refers
          to the same open file description as the descriptor oldfd.  (For
          an explanation of open file descriptions, see open(2).)  The new
          file descriptor number is guaranteed to be the lowest-numbered
          file descriptor that was unused in the calling process.

          After a successful return, the old and new file descriptors may
          be used interchangeably.  Since the two file descriptors refer to
          the same open file description, they share file offset and file
          status flags; for example, if the file offset is modified by
          using lseek(2) on one of the file descriptors, the offset is also
          changed for the other file descriptor.

          The two file descriptors do not share file descriptor flags (the
          close-on-exec flag).  The close-on-exec flag (FD_CLOEXEC; see
          fcntl(2)) for the duplicate descriptor is off.

      dup2()
          The dup2() system call performs the same task as dup(), but
          instead of using the lowest-numbered unused file descriptor, it
          uses the file descriptor number specified in newfd.  In other
          words, the file descriptor newfd is adjusted so that it now
          refers to the same open file description as oldfd.

          If the file descriptor newfd was previously open, it is closed
          before being reused; the close is performed silently (i.e., any
          errors during the close are not reported by dup2()).

          The steps of closing and reusing the file descriptor newfd are
          performed atomically.  This is important, because trying to
          implement equivalent functionality using close(2) and dup() would
          be subject to race conditions, whereby newfd might be reused
          between the two steps.  Such reuse could happen because the main
          program is interrupted by a signal handler that allocates a file
          descriptor, or because a parallel thread allocates a file
          descriptor.

          Note the following points:

          *  If oldfd is not a valid file descriptor, then the call fails,
             and newfd is not closed.

          *  If oldfd is a valid file descriptor, and newfd has the same
             value as oldfd, then dup2() does nothing, and returns newfd.

      dup3()
          dup3() is the same as dup2(), except that:

          *  The caller can force the close-on-exec flag to be set for the
             new file descriptor by specifying O_CLOEXEC in flags.  See the
             description of the same flag in open(2) for reasons why this
             may be useful.

          *  If oldfd equals newfd, then dup3() fails with the error
             EINVAL.


-----------------------------------------------------------------

::

          On success, these system calls return the new file descriptor.
          On error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  oldfd isn't an open file descriptor.

          EBADF  newfd is out of the allowed range for file descriptors
                 (see the discussion of RLIMIT_NOFILE in getrlimit(2)).

          EBUSY  (Linux only) This may be returned by dup2() or dup3()
                 during a race condition with open(2) and dup().

          EINTR  The dup2() or dup3() call was interrupted by a signal; see
                 signal(7).

          EINVAL (dup3()) flags contain an invalid value.

          EINVAL (dup3()) oldfd was equal to newfd.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached (see the discussion of
                 RLIMIT_NOFILE in getrlimit(2)).


---------------------------------------------------------

::

          dup3() was added to Linux in version 2.6.27; glibc support is
          available starting with version 2.9.


-------------------------------------------------------------------

::

          dup(), dup2(): POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.

          dup3() is Linux-specific.


---------------------------------------------------

::

          The error returned by dup2() is different from that returned by
          fcntl(..., F_DUPFD, ...)  when newfd is out of range.  On some
          systems, dup2() also sometimes returns EINVAL like F_DUPFD.

          If newfd was open, any errors that would have been reported at
          close(2) time are lost.  If this is of concern, then—unless the
          program is single-threaded and does not allocate file descriptors
          in signal handlers—the correct approach is not to close newfd
          before calling dup2(), because of the race condition described
          above.  Instead, code something like the following could be used:

              /* Obtain a duplicate of 'newfd' that can subsequently
                 be used to check for close() errors; an EBADF error
                 means that 'newfd' was not open. */

              tmpfd = dup(newfd);
              if (tmpfd == -1 && errno != EBADF) {
                  /* Handle unexpected dup() error. */
              }

              /* Atomically duplicate 'oldfd' on 'newfd'. */

              if (dup2(oldfd, newfd) == -1) {
                  /* Handle dup2() error. */
              }

              /* Now check for close() errors on the file originally
                 referred to by 'newfd'. */

              if (tmpfd != -1) {
                  if (close(tmpfd) == -1) {
                      /* Handle errors from close. */
                  }
              }


---------------------------------------------------------

::

          close(2), fcntl(2), open(2), pidfd_getfd(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                         DUP(2)

--------------

Pages that refer to this page: `bpf(2) <../man2/bpf.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`flock(2) <../man2/flock.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`kcmp(2) <../man2/kcmp.2.html>`__, 
`lseek(2) <../man2/lseek.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`pidfd_getfd(2) <../man2/pidfd_getfd.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`fileno(3) <../man3/fileno.3.html>`__, 
`getdtablesize(3) <../man3/getdtablesize.3.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`epoll(7) <../man7/epoll.7.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/dup.2.license.html>`__

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

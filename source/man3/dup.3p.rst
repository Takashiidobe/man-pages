.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dup(3p) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DUP(3P)                 POSIX Programmer's Manual                DUP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          dup, dup2 — duplicate an open file descriptor


---------------------------------------------------------

::

          #include <unistd.h>

          int dup(int fildes);
          int dup2(int fildes, int fildes2);


---------------------------------------------------------------

::

          The dup() function provides an alternative interface to the
          service provided by fcntl() using the F_DUPFD command. The call
          dup(fildes) shall be equivalent to:

              fcntl(fildes, F_DUPFD, 0);

          The dup2() function shall cause the file descriptor fildes2 to
          refer to the same open file description as the file descriptor
          fildes and to share any locks, and shall return fildes2.  If
          fildes2 is already a valid open file descriptor, it shall be
          closed first, unless fildes is equal to fildes2 in which case
          dup2() shall return fildes2 without closing it. If the close
          operation fails to close fildes2, dup2() shall return -1 without
          changing the open file description to which fildes2 refers. If
          fildes is not a valid file descriptor, dup2() shall return -1 and
          shall not close fildes2.  If fildes2 is less than 0 or greater
          than or equal to {OPEN_MAX}, dup2() shall return -1 with errno
          set to [EBADF].

          Upon successful completion, if fildes is not equal to fildes2,
          the FD_CLOEXEC flag associated with fildes2 shall be cleared. If
          fildes is equal to fildes2, the FD_CLOEXEC flag associated with
          fildes2 shall not be changed.

          If fildes refers to a typed memory object, the result of the
          dup2() function is unspecified.


-----------------------------------------------------------------

::

          Upon successful completion a non-negative integer, namely the
          file descriptor, shall be returned; otherwise, -1 shall be
          returned and errno set to indicate the error.


-----------------------------------------------------

::

          The dup() function shall fail if:

          EBADF  The fildes argument is not a valid open file descriptor.

          EMFILE All file descriptors available to the process are
                 currently open.

          The dup2() function shall fail if:

          EBADF  The fildes argument is not a valid open file descriptor or
                 the argument fildes2 is negative or greater than or equal
                 to {OPEN_MAX}.

          EINTR  The dup2() function was interrupted by a signal.

          The dup2() function may fail if:

          EIO    An I/O error occurred while attempting to close fildes2.

          The following sections are informative.


---------------------------------------------------------

::

      Redirecting Standard Output to a File S
          The following example closes standard output for the current
          processes, re-assigns standard output to go to the file
          referenced by pfd, and closes the original file descriptor to
          clean up.

              #include <unistd.h>
              ...
              int pfd;
              ...
              close(1);
              dup(pfd);
              close(pfd);
              ...

      Redirecting Error Messages
          The following example redirects messages from stderr to stdout.

              #include <unistd.h>
              ...
              dup2(1, 2);
              ...


---------------------------------------------------------------------------

::

          Implementations may use file descriptors that must be inherited
          into child processes for the child process to remain conforming,
          such as for message catalog or tracing purposes. Therefore, an
          application that calls dup2() with an arbitrary integer for
          fildes2 risks non-conforming behavior, and dup2() can only
          portably be used to overwrite file descriptor values that the
          application has obtained through explicit actions, or for the
          three file descriptors corresponding to the standard file
          streams. In order to avoid a race condition of leaking an
          unintended file descriptor into a child process, an application
          should consider opening all file descriptors with the FD_CLOEXEC
          bit set unless the file descriptor is intended to be inherited
          across exec.


-----------------------------------------------------------

::

          The dup() function is redundant. Its services are also provided
          by the fcntl() function. It has been included in this volume of
          POSIX.1‐2017 primarily for historical reasons, since many
          existing applications use it. On the other hand, the dup2()
          function provides unique services, as no other interface is able
          to atomically replace an existing file descriptor.

          The dup2() function is not marked obsolescent because it presents
          a type-safe version of functionality provided in a type-unsafe
          version by fcntl().  It is used in the POSIX Ada binding.

          The dup2() function is not intended for use in critical regions
          as a synchronization mechanism.

          In the description of [EBADF], the case of fildes being out of
          range is covered by the given case of fildes not being valid. The
          descriptions for fildes and fildes2 are different because the
          only kind of invalidity that is relevant for fildes2 is whether
          it is out of range; that is, it does not matter whether fildes2
          refers to an open file when the dup2() call is made.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          close(3p), fcntl(3p), open(3p)

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                           DUP(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`close(3p) <../man3/close.3p.html>`__, 
`fstatvfs(3p) <../man3/fstatvfs.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`posix_spawn_file_actions_addclose(3p) <../man3/posix_spawn_file_actions_addclose.3p.html>`__, 
`posix_spawn_file_actions_adddup2(3p) <../man3/posix_spawn_file_actions_adddup2.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__, 
`shm_open(3p) <../man3/shm_open.3p.html>`__, 
`write(3p) <../man3/write.3p.html>`__

--------------

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

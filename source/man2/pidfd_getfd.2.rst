.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pidfd_getfd(2) — Linux manual page
==================================

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

   PIDFD_GETFD(2)          Linux Programmer's Manual         PIDFD_GETFD(2)

NAME
-------------------------------------------------

::

          pidfd_getfd - obtain a duplicate of another process's file
          descriptor


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_pidfd_getfd, int pidfd, int targetfd,
                      unsigned int flags);

          Note: glibc provides no wrapper for pidfd_getfd(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          The pidfd_getfd() system call allocates a new file descriptor in
          the calling process.  This new file descriptor is a duplicate of
          an existing file descriptor, targetfd, in the process referred to
          by the PID file descriptor pidfd.

          The duplicate file descriptor refers to the same open file
          description (see open(2)) as the original file descriptor in the
          process referred to by pidfd.  The two file descriptors thus
          share file status flags and file offset.  Furthermore, operations
          on the underlying file object (for example, assigning an address
          to a socket object using bind(2)) can equally be performed via
          the duplicate file descriptor.

          The close-on-exec flag (FD_CLOEXEC; see fcntl(2)) is set on the
          file descriptor returned by pidfd_getfd().

          The flags argument is reserved for future use.  Currently, it
          must be specified as 0.

          Permission to duplicate another process's file descriptor is
          governed by a ptrace access mode PTRACE_MODE_ATTACH_REALCREDS
          check (see ptrace(2)).


-----------------------------------------------------------------

::

          On success, pidfd_getfd() returns a file descriptor (a
          nonnegative integer).  On error, -1 is returned and errno is set
          to indicate the error.


-----------------------------------------------------

::

          EBADF  pidfd is not a valid PID file descriptor.

          EBADF  targetfd is not an open file descriptor in the process
                 referred to by pidfd.

          EINVAL flags is not 0.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached (see the description of
                 RLIMIT_NOFILE in getrlimit(2)).

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          EPERM  The calling process did not have
                 PTRACE_MODE_ATTACH_REALCREDS permissions (see ptrace(2))
                 over the process referred to by pidfd.

          ESRCH  The process referred to by pidfd does not exist (i.e., it
                 has terminated and been waited on).


---------------------------------------------------------

::

          pidfd_getfd() first appeared in Linux 5.6.


-------------------------------------------------------------------

::

          pidfd_getfd() is Linux specific.


---------------------------------------------------

::

          For a description of PID file descriptors, see pidfd_open(2).

          The effect of pidfd_getfd() is similar to the use of SCM_RIGHTS
          messages described in unix(7), but differs in the following
          respects:

          • In order to pass a file descriptor using an SCM_RIGHTS message,
            the two processes must first establish a UNIX domain socket
            connection.

          • The use of SCM_RIGHTS requires cooperation on the part of the
            process whose file descriptor is being copied.  By contrast, no
            such cooperation is necessary when using pidfd_getfd().

          • The ability to use pidfd_getfd() is restricted by a
            PTRACE_MODE_ATTACH_REALCREDS ptrace  access  mode check.


---------------------------------------------------------

::

          clone3(2), dup(2), kcmp(2), pidfd_open(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 PIDFD_GETFD(2)

--------------

Pages that refer to this page: `dup(2) <../man2/dup.2.html>`__, 
`pidfd_open(2) <../man2/pidfd_open.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/pidfd_getfd.2.license.html>`__

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

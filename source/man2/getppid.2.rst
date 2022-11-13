.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpid(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPID(2)               Linux Programmer's Manual              GETPID(2)

NAME
-------------------------------------------------

::

          getpid, getppid - get process identification


---------------------------------------------------------

::

          #include <unistd.h>

          pid_t getpid(void);
          pid_t getppid(void);


---------------------------------------------------------------

::

          getpid() returns the process ID (PID) of the calling process.
          (This is often used by routines that generate unique temporary
          filenames.)

          getppid() returns the process ID of the parent of the calling
          process.  This will be either the ID of the process that created
          this process using fork(), or, if that process has already
          terminated, the ID of the process to which this process has been
          reparented (either init(1) or a "subreaper" process defined via
          the prctl(2) PR_SET_CHILD_SUBREAPER operation).


-----------------------------------------------------

::

          These functions are always successful.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD, SVr4.


---------------------------------------------------

::

          If the caller's parent is in a different PID namespace (see
          pid_namespaces(7)), getppid() returns 0.

          From a kernel perspective, the PID (which is shared by all of the
          threads in a multithreaded process) is sometimes also known as
          the thread group ID (TGID).  This contrasts with the kernel
          thread ID (TID), which is unique for each thread.  For further
          details, see gettid(2) and the discussion of the CLONE_THREAD
          flag in clone(2).

      C library/kernel differences
          From glibc version 2.3.4 up to and including version 2.24, the
          glibc wrapper function for getpid() cached PIDs, with the goal of
          avoiding additional system calls when a process calls getpid()
          repeatedly.  Normally this caching was invisible, but its correct
          operation relied on support in the wrapper functions for fork(2),
          vfork(2), and clone(2): if an application bypassed the glibc
          wrappers for these system calls by using syscall(2), then a call
          to getpid() in the child would return the wrong value (to be
          precise: it would return the PID of the parent process).  In
          addition, there were cases where getpid() could return the wrong
          value even when invoking clone(2) via the glibc wrapper function.
          (For a discussion of one such case, see BUGS in clone(2).)
          Furthermore, the complexity of the caching code had been the
          source of a few bugs within glibc over the years.

          Because of the aforementioned problems, since glibc version 2.25,
          the PID cache is removed: calls to getpid() always invoke the
          actual system call, rather than returning a cached value.

          On Alpha, instead of a pair of getpid() and getppid() system
          calls, a single getxpid() system call is provided, which returns
          a pair of PID and parent PID.  The glibc getpid() and getppid()
          wrapper functions transparently deal with this.  See syscall(2)
          for details regarding register mapping.


---------------------------------------------------------

::

          clone(2), fork(2), gettid(2), kill(2), exec(3), mkstemp(3),
          tempnam(3), tmpfile(3), tmpnam(3), credentials(7),
          pid_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETPID(2)

--------------

Pages that refer to this page: `gawk(1) <../man1/gawk.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`capget(2) <../man2/capget.2.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`gettid(2) <../man2/gettid.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
`pmnotifyerr(3) <../man3/pmnotifyerr.3.html>`__, 
`pmwebtimerregister(3) <../man3/pmwebtimerregister.3.html>`__, 
`raise(3) <../man3/raise.3.html>`__, 
`lloadd.conf(5) <../man5/lloadd.conf.5.html>`__, 
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`fanotify(7) <../man7/fanotify.7.html>`__, 
`pid_namespaces(7) <../man7/pid_namespaces.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`lloadd(8) <../man8/lloadd.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/getpid.2.license.html>`__

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

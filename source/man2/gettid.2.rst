.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gettid(2) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETTID(2)               Linux Programmer's Manual              GETTID(2)

NAME
-------------------------------------------------

::

          gettid - get thread identification


---------------------------------------------------------

::

          #define _GNU_SOURCE
          #include <unistd.h>

          pid_t gettid(void);


---------------------------------------------------------------

::

          gettid() returns the caller's thread ID (TID).  In a single-
          threaded process, the thread ID is equal to the process ID (PID,
          as returned by getpid(2)).  In a multithreaded process, all
          threads have the same PID, but each one has a unique TID.  For
          further details, see the discussion of CLONE_THREAD in clone(2).


-----------------------------------------------------------------

::

          On success, returns the thread ID of the calling thread.


-----------------------------------------------------

::

          This call is always successful.


---------------------------------------------------------

::

          The gettid() system call first appeared on Linux in kernel
          2.4.11.  Library support was added in glibc 2.30.  (Earlier glibc
          versions did not provide a wrapper for this system call,
          necessitating the use of syscall(2).)


-------------------------------------------------------------------

::

          gettid() is Linux-specific and should not be used in programs
          that are intended to be portable.


---------------------------------------------------

::

          The thread ID returned by this call is not the same thing as a
          POSIX thread ID (i.e., the opaque value returned by
          pthread_self(3)).

          In a new thread group created by a clone(2) call that does not
          specify the CLONE_THREAD flag (or, equivalently, a new process
          created by fork(2)), the new process is a thread group leader,
          and its thread group ID (the value returned by getpid(2)) is the
          same as its thread ID (the value returned by gettid()).


---------------------------------------------------------

::

          capget(2), clone(2), fcntl(2), fork(2), get_robust_list(2),
          getpid(2), ioprio_set(2), perf_event_open(2),
          sched_setaffinity(2), sched_setparam(2), sched_setscheduler(2),
          tgkill(2), timer_create(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETTID(2)

--------------

Pages that refer to this page: `kill(1) <../man1/kill.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`capget(2) <../man2/capget.2.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`futex(2) <../man2/futex.2.html>`__, 
`getpid(2) <../man2/getpid.2.html>`__, 
`get_robust_list(2) <../man2/get_robust_list.2.html>`__, 
`ioprio_set(2) <../man2/ioprio_set.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setparam(2) <../man2/sched_setparam.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`set_tid_address(2) <../man2/set_tid_address.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`tkill(2) <../man2/tkill.2.html>`__, 
`pthread_self(3) <../man3/pthread_self.3.html>`__, 
`sd_event_new(3) <../man3/sd_event_new.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`cgroups(7) <../man7/cgroups.7.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/gettid.2.license.html>`__

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

.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpriority(2) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   GETPRIORITY(2)          Linux Programmer's Manual         GETPRIORITY(2)

NAME
-------------------------------------------------

::

          getpriority, setpriority - get/set program scheduling priority


---------------------------------------------------------

::

          #include <sys/resource.h>

          int getpriority(int which, id_t who);
          int setpriority(int which, id_t who, int prio);


---------------------------------------------------------------

::

          The scheduling priority of the process, process group, or user,
          as indicated by which and who is obtained with the getpriority()
          call and set with the setpriority() call.  The process attribute
          dealt with by these system calls is the same attribute (also
          known as the "nice" value) that is dealt with by nice(2).

          The value which is one of PRIO_PROCESS, PRIO_PGRP, or PRIO_USER,
          and who is interpreted relative to which (a process identifier
          for PRIO_PROCESS, process group identifier for PRIO_PGRP, and a
          user ID for PRIO_USER).  A zero value for who denotes
          (respectively) the calling process, the process group of the
          calling process, or the real user ID of the calling process.

          The prio argument is a value in the range -20 to 19 (but see
          NOTES below), with -20 being the highest priority and 19 being
          the lowest priority.  Attempts to set a priority outside this
          range are silently clamped to the range.  The default priority is
          0; lower values give a process a higher scheduling priority.

          The getpriority() call returns the highest priority (lowest
          numerical value) enjoyed by any of the specified processes.  The
          setpriority() call sets the priorities of all of the specified
          processes to the specified value.

          Traditionally, only a privileged process could lower the nice
          value (i.e., set a higher priority).  However, since Linux
          2.6.12, an unprivileged process can decrease the nice value of a
          target process that has a suitable RLIMIT_NICE soft limit; see
          getrlimit(2) for details.


-----------------------------------------------------------------

::

          On success, getpriority() returns the calling thread's nice
          value, which may be a negative number.  On error, it returns -1
          and sets errno to indicate the error.

          Since a successful call to getpriority() can legitimately return
          the value -1, it is necessary to clear errno prior to the call,
          then check errno afterward to determine if -1 is an error or a
          legitimate value.

          setpriority() returns 0 on success.  On failure, it returns -1
          and sets errno to indicate the error.


-----------------------------------------------------

::

          EACCES The caller attempted to set a lower nice value (i.e., a
                 higher process priority), but did not have the required
                 privilege (on Linux: did not have the CAP_SYS_NICE
                 capability).

          EINVAL which was not one of PRIO_PROCESS, PRIO_PGRP, or
                 PRIO_USER.

          EPERM  A process was located, but its effective user ID did not
                 match either the effective or the real user ID of the
                 caller, and was not privileged (on Linux: did not have the
                 CAP_SYS_NICE capability).  But see NOTES below.

          ESRCH  No process was located using the which and who values
                 specified.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD (these interfaces first
          appeared in 4.2BSD).


---------------------------------------------------

::

          For further details on the nice value, see sched(7).

          Note: the addition of the "autogroup" feature in Linux 2.6.38
          means that the nice value no longer has its traditional effect in
          many circumstances.  For details, see sched(7).

          A child created by fork(2) inherits its parent's nice value.  The
          nice value is preserved across execve(2).

          The details on the condition for EPERM depend on the system.  The
          above description is what POSIX.1-2001 says, and seems to be
          followed on all System V-like systems.  Linux kernels before
          2.6.12 required the real or effective user ID of the caller to
          match the real user of the process who (instead of its effective
          user ID).  Linux 2.6.12 and later require the effective user ID
          of the caller to match the real or effective user ID of the
          process who.  All BSD-like systems (SunOS 4.1.3, Ultrix 4.2,
          4.3BSD, FreeBSD 4.3, OpenBSD-2.5, ...) behave in the same manner
          as Linux 2.6.12 and later.

      C library/kernel differences
          Within the kernel, nice values are actually represented using the
          range 40..1 (since negative numbers are error codes) and these
          are the values employed by the setpriority() and getpriority()
          system calls.  The glibc wrapper functions for these system calls
          handle the translations between the user-land and kernel
          representations of the nice value according to the formula
          unice = 20 - knice.  (Thus, the kernel's 40..1 range corresponds
          to the range -20..19 as seen by user space.)


-------------------------------------------------

::

          According to POSIX, the nice value is a per-process setting.
          However, under the current Linux/NPTL implementation of POSIX
          threads, the nice value is a per-thread attribute: different
          threads in the same process can have different nice values.
          Portable applications should avoid relying on the Linux behavior,
          which may be made standards conformant in the future.


---------------------------------------------------------

::

          nice(1), renice(1), fork(2), capabilities(7), sched(7)

          Documentation/scheduler/sched-nice-design.txt in the Linux kernel
          source tree (since Linux 2.6.23)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                 GETPRIORITY(2)

--------------

Pages that refer to this page: `renice(1) <../man1/renice.1.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`ioprio_set(2) <../man2/ioprio_set.2.html>`__, 
`nice(2) <../man2/nice.2.html>`__, 
`sched_rr_get_interval(2) <../man2/sched_rr_get_interval.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setparam(2) <../man2/sched_setparam.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`errno(3) <../man3/errno.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`pid_namespaces(7) <../man7/pid_namespaces.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`sched(7) <../man7/sched.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getpriority.2.license.html>`__

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

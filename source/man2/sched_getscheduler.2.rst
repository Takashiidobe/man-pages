.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched_setscheduler(2) — Linux manual page
=========================================

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

   SCHED_SETSCHEDULER(2)   Linux Programmer's Manual  SCHED_SETSCHEDULER(2)

NAME
-------------------------------------------------

::

          sched_setscheduler, sched_getscheduler - set and get scheduling
          policy/parameters


---------------------------------------------------------

::

          #include <sched.h>

          int sched_setscheduler(pid_t pid, int policy,
                                 const struct sched_param *param);
          int sched_getscheduler(pid_t pid);


---------------------------------------------------------------

::

          The sched_setscheduler() system call sets both the scheduling
          policy and parameters for the thread whose ID is specified in
          pid.  If pid equals zero, the scheduling policy and parameters of
          the calling thread will be set.

          The scheduling parameters are specified in the param argument,
          which is a pointer to a structure of the following form:

              struct sched_param {
                  ...
                  int sched_priority;
                  ...
              };

          In the current implementation, the structure contains only one
          field, sched_priority.  The interpretation of param depends on
          the selected policy.

          Currently, Linux supports the following "normal" (i.e., non-real-
          time) scheduling policies as values that may be specified in
          policy:

          SCHED_OTHER
                 the standard round-robin time-sharing policy;

          SCHED_BATCH
                 for "batch" style execution of processes; and

          SCHED_IDLE
                 for running very low priority background jobs.

          For each of the above policies, param->sched_priority must be 0.

          Various "real-time" policies are also supported, for special
          time-critical applications that need precise control over the way
          in which runnable threads are selected for execution.  For the
          rules governing when a process may use these policies, see
          sched(7).  The real-time policies that may be specified in policy
          are:

          SCHED_FIFO
                 a first-in, first-out policy; and

          SCHED_RR
                 a round-robin policy.

          For each of the above policies, param->sched_priority specifies a
          scheduling priority for the thread.  This is a number in the
          range returned by calling sched_get_priority_min(2) and
          sched_get_priority_max(2) with the specified policy.  On Linux,
          these system calls return, respectively, 1 and 99.

          Since Linux 2.6.32, the SCHED_RESET_ON_FORK flag can be ORed in
          policy when calling sched_setscheduler().  As a result of
          including this flag, children created by fork(2) do not inherit
          privileged scheduling policies.  See sched(7) for details.

          sched_getscheduler() returns the current scheduling policy of the
          thread identified by pid.  If pid equals zero, the policy of the
          calling thread will be retrieved.


-----------------------------------------------------------------

::

          On success, sched_setscheduler() returns zero.  On success,
          sched_getscheduler() returns the policy for the thread (a
          nonnegative integer).  On error, both calls return -1, and errno
          is set to indicate the error.


-----------------------------------------------------

::

          EINVAL Invalid arguments: pid is negative or param is NULL.

          EINVAL (sched_setscheduler()) policy is not one of the recognized
                 policies.

          EINVAL (sched_setscheduler()) param does not make sense for the
                 specified policy.

          EPERM  The calling thread does not have appropriate privileges.

          ESRCH  The thread whose ID is pid could not be found.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008 (but see BUGS below).  The SCHED_BATCH
          and SCHED_IDLE policies are Linux-specific.


---------------------------------------------------

::

          Further details of the semantics of all of the above "normal" and
          "real-time" scheduling policies can be found in the sched(7)
          manual page.  That page also describes an additional policy,
          SCHED_DEADLINE, which is settable only via sched_setattr(2).

          POSIX systems on which sched_setscheduler() and
          sched_getscheduler() are available define
          _POSIX_PRIORITY_SCHEDULING in <unistd.h>.

          POSIX.1 does not detail the permissions that an unprivileged
          thread requires in order to call sched_setscheduler(), and
          details vary across systems.  For example, the Solaris 7 manual
          page says that the real or effective user ID of the caller must
          match the real user ID or the save set-user-ID of the target.

          The scheduling policy and parameters are in fact per-thread
          attributes on Linux.  The value returned from a call to gettid(2)
          can be passed in the argument pid.  Specifying pid as 0 will
          operate on the attributes of the calling thread, and passing the
          value returned from a call to getpid(2) will operate on the
          attributes of the main thread of the thread group.  (If you are
          using the POSIX threads API, then use pthread_setschedparam(3),
          pthread_getschedparam(3), and pthread_setschedprio(3), instead of
          the sched_*(2) system calls.)


-------------------------------------------------

::

          POSIX.1 says that on success, sched_setscheduler() should return
          the previous scheduling policy.  Linux sched_setscheduler() does
          not conform to this requirement, since it always returns 0 on
          success.


---------------------------------------------------------

::

          chrt(1), nice(2), sched_get_priority_max(2),
          sched_get_priority_min(2), sched_getaffinity(2),
          sched_getattr(2), sched_getparam(2), sched_rr_get_interval(2),
          sched_setaffinity(2), sched_setattr(2), sched_setparam(2),
          sched_yield(2), setpriority(2), capabilities(7), cpuset(7),
          sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22          SCHED_SETSCHEDULER(2)

--------------

Pages that refer to this page: `chrt(1) <../man1/chrt.1.html>`__, 
`uclampset(1) <../man1/uclampset.1.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`gettid(2) <../man2/gettid.2.html>`__, 
`mlock(2) <../man2/mlock.2.html>`__, 
`nanosleep(2) <../man2/nanosleep.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`sched_get_priority_max(2) <../man2/sched_get_priority_max.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setparam(2) <../man2/sched_setparam.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`sched(7) <../man7/sched.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sched_setscheduler.2.license.html>`__

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

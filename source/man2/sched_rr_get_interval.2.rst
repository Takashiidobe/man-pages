.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched_rr_get_interval(2) — Linux manual page
============================================

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

   SCHED_RR_GET_INTERVAL(2)Linux Programmer's ManualCHED_RR_GET_INTERVAL(2)

NAME
-------------------------------------------------

::

          sched_rr_get_interval - get the SCHED_RR interval for the named
          process


---------------------------------------------------------

::

          #include <sched.h>

          int sched_rr_get_interval(pid_t pid, struct timespec *tp);


---------------------------------------------------------------

::

          sched_rr_get_interval() writes into the timespec structure
          pointed to by tp the round-robin time quantum for the process
          identified by pid.  The specified process should be running under
          the SCHED_RR scheduling policy.

          The timespec structure has the following form:

              struct timespec {
                  time_t tv_sec;    /* seconds */
                  long   tv_nsec;   /* nanoseconds */
              };

          If pid is zero, the time quantum for the calling process is
          written into *tp.


-----------------------------------------------------------------

::

          On success, sched_rr_get_interval() returns 0.  On error, -1 is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT Problem with copying information to user space.

          EINVAL Invalid pid.

          ENOSYS The system call is not yet implemented (only on rather old
                 kernels).

          ESRCH  Could not find a process with the ID pid.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          POSIX systems on which sched_rr_get_interval() is available
          define _POSIX_PRIORITY_SCHEDULING in <unistd.h>.

      Linux notes
          POSIX does not specify any mechanism for controlling the size of
          the round-robin time quantum.  Older Linux kernels provide a
          (nonportable) method of doing this.  The quantum can be
          controlled by adjusting the process's nice value (see
          setpriority(2)).  Assigning a negative (i.e., high) nice value
          results in a longer quantum; assigning a positive (i.e., low)
          nice value results in a shorter quantum.  The default quantum is
          0.1 seconds; the degree to which changing the nice value affects
          the quantum has varied somewhat across kernel versions.  This
          method of adjusting the quantum was removed starting with Linux
          2.6.24.

          Linux 3.9 added a new mechanism for adjusting (and viewing) the
          SCHED_RR quantum: the /proc/sys/kernel/sched_rr_timeslice_ms file
          exposes the quantum as a millisecond value, whose default is 100.
          Writing 0 to this file resets the quantum to the default value.


---------------------------------------------------------

::

          sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22       SCHED_RR_GET_INTERVAL(2)

--------------

Pages that refer to this page:
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `sched(7) <../man7/sched.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sched_rr_get_interval.2.license.html>`__

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
